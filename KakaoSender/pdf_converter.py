"""
PDF to Image Converter Module
PDF 파일을 페이지별 PNG 이미지로 변환
"""

import os
import shutil
from pathlib import Path
from typing import List, Optional

import fitz  # PyMuPDF


# 이미지 저장 폴더 경로
IMAGES_DIR = Path(__file__).parent / "images"


def clear_images() -> None:
    """images/ 폴더의 모든 파일 삭제"""
    if IMAGES_DIR.exists():
        shutil.rmtree(IMAGES_DIR)
    IMAGES_DIR.mkdir(parents=True, exist_ok=True)
    print(f"[PDF Converter] 이미지 폴더 초기화: {IMAGES_DIR}")


def convert_pdf_to_images(
    pdf_path: str,
    dpi: int = 150,
    pages: Optional[List[int]] = None
) -> List[str]:
    """
    PDF 파일을 페이지별 PNG 이미지로 변환

    Args:
        pdf_path: PDF 파일 경로
        dpi: 이미지 해상도 (기본값: 150)
        pages: 변환할 페이지 번호 리스트 (0-indexed). None이면 전체 페이지

    Returns:
        생성된 이미지 파일 경로 리스트
    """
    # 이미지 폴더 초기화
    clear_images()

    # PDF 파일 열기
    pdf_path = Path(pdf_path)
    if not pdf_path.exists():
        raise FileNotFoundError(f"PDF 파일을 찾을 수 없습니다: {pdf_path}")

    doc = fitz.open(str(pdf_path))
    image_paths: List[str] = []

    # DPI를 zoom 비율로 변환 (72 DPI 기준)
    zoom = dpi / 72
    matrix = fitz.Matrix(zoom, zoom)

    # 변환할 페이지 결정
    if pages is None:
        page_numbers = range(doc.page_count)
    else:
        page_numbers = pages

    print(f"[PDF Converter] PDF 파일: {pdf_path.name}")
    print(f"[PDF Converter] 총 페이지: {doc.page_count}, 변환 대상: {len(list(page_numbers))}페이지")

    for page_num in page_numbers:
        if page_num < 0 or page_num >= doc.page_count:
            print(f"[PDF Converter] 경고: 페이지 {page_num + 1}은 존재하지 않습니다.")
            continue

        page = doc[page_num]

        # 페이지를 이미지로 렌더링
        pix = page.get_pixmap(matrix=matrix)

        # 이미지 파일 저장
        image_filename = f"page_{page_num + 1:03d}.png"
        image_path = IMAGES_DIR / image_filename
        pix.save(str(image_path))

        image_paths.append(str(image_path))
        print(f"[PDF Converter] 페이지 {page_num + 1} 변환 완료: {image_filename}")

    doc.close()

    print(f"[PDF Converter] 총 {len(image_paths)}개 이미지 생성 완료")
    return image_paths


def get_pdf_page_count(pdf_path: str) -> int:
    """PDF 파일의 총 페이지 수 반환"""
    doc = fitz.open(pdf_path)
    count = doc.page_count
    doc.close()
    return count


def get_page_thumbnail(pdf_path: str, page_num: int, max_size: int = 400) -> Optional[bytes]:
    """
    특정 페이지의 썸네일 이미지 반환 (바이트)

    Args:
        pdf_path: PDF 파일 경로
        page_num: 페이지 번호 (0-indexed)
        max_size: 최대 크기 (픽셀)

    Returns:
        PNG 이미지 바이트 데이터
    """
    try:
        doc = fitz.open(pdf_path)
        if page_num < 0 or page_num >= doc.page_count:
            doc.close()
            return None

        page = doc[page_num]

        # 썸네일 크기 계산
        rect = page.rect
        scale = min(max_size / rect.width, max_size / rect.height)
        matrix = fitz.Matrix(scale, scale)

        pix = page.get_pixmap(matrix=matrix)
        img_bytes = pix.tobytes("png")

        doc.close()
        return img_bytes
    except Exception as e:
        print(f"[PDF Converter] 썸네일 생성 오류: {e}")
        return None


if __name__ == "__main__":
    # 테스트
    import sys
    if len(sys.argv) > 1:
        pdf_file = sys.argv[1]
        images = convert_pdf_to_images(pdf_file)
        print(f"생성된 이미지: {images}")
    else:
        print("사용법: python pdf_converter.py <PDF파일경로>")
