"""
카카오톡 PDF 전송 프로그램
PDF 파일을 이미지로 변환하여 카카오톡 채팅방으로 전송

사용법:
    python main.py                              # GUI 실행
    python main.py <PDF파일경로>                 # PDF 파일과 함께 GUI 실행
    python main.py shwoodorder://open?pdf=...   # 프로토콜 URL로 실행
"""

import os
import sys
from urllib.parse import urlparse, parse_qs, unquote
from typing import Optional


def parse_protocol_url(url: str) -> Optional[str]:
    """
    프로토콜 URL에서 PDF 경로 추출

    Args:
        url: shwoodorder://open?pdf=경로 형식의 URL

    Returns:
        PDF 파일 경로 또는 None
    """
    try:
        # URL 파싱
        parsed = urlparse(url)

        # 스키마 확인
        if parsed.scheme != "shwoodorder":
            return None

        # 쿼리 파라미터에서 pdf 경로 추출
        query = parse_qs(parsed.query)
        pdf_paths = query.get("pdf", [])

        if pdf_paths:
            # URL 디코딩
            pdf_path = unquote(pdf_paths[0])
            return pdf_path

        return None

    except Exception as e:
        print(f"[Main] URL 파싱 오류: {e}")
        return None


def get_pdf_from_args() -> Optional[str]:
    """
    명령행 인수에서 PDF 경로 추출

    Returns:
        PDF 파일 경로 또는 None
    """
    if len(sys.argv) < 2:
        return None

    arg = sys.argv[1]

    # 프로토콜 URL인 경우
    if arg.startswith("shwoodorder://"):
        pdf_path = parse_protocol_url(arg)
        if pdf_path:
            print(f"[Main] 프로토콜 URL에서 PDF 경로 추출: {pdf_path}")
            return pdf_path

    # 일반 파일 경로인 경우
    if os.path.exists(arg) and arg.lower().endswith(".pdf"):
        print(f"[Main] PDF 파일 경로: {arg}")
        return arg

    print(f"[Main] 유효하지 않은 인수: {arg}")
    return None


def main():
    """메인 함수"""
    print("=" * 50)
    print("  카카오톡 PDF 전송 프로그램")
    print("=" * 50)

    # PDF 경로 가져오기
    pdf_path = get_pdf_from_args()

    if pdf_path:
        print(f"[Main] PDF 파일로 시작: {pdf_path}")
    else:
        print("[Main] PDF 파일 없이 시작")

    # GUI 실행
    from gui import run_gui
    run_gui(initial_pdf=pdf_path)


if __name__ == "__main__":
    main()
