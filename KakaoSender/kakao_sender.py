"""
KakaoTalk Auto Sender Module
카카오톡 자동화 모듈 - 이미지 전송
"""

import time
from typing import List, Callable, Optional

import pyautogui
import pyperclip
import pygetwindow as gw


# 채팅방 매핑
CHAT_ROOMS = {
    "재현하늘창": "재현 발주 카톡방",
    "우딘숲도어": "우딘 발주 카톡방",
}

# 지연 시간 설정 (초)
DELAYS = {
    "short": 0.3,
    "medium": 0.5,
    "long": 1.0,
    "file_dialog": 1.5,
}


def activate_kakao() -> bool:
    """
    카카오톡 창 활성화

    Returns:
        성공 여부
    """
    try:
        # 카카오톡 창 찾기
        kakao_windows = gw.getWindowsWithTitle("카카오톡")

        if not kakao_windows:
            print("[KakaoSender] 카카오톡 창을 찾을 수 없습니다.")
            return False

        # 첫 번째 카카오톡 창 활성화
        kakao_win = kakao_windows[0]

        # 최소화 상태면 복원
        if kakao_win.isMinimized:
            kakao_win.restore()
            time.sleep(DELAYS["medium"])

        # 창 활성화
        kakao_win.activate()
        time.sleep(DELAYS["medium"])

        print("[KakaoSender] 카카오톡 창 활성화 완료")
        return True

    except Exception as e:
        print(f"[KakaoSender] 카카오톡 활성화 오류: {e}")
        return False


def search_chat_room(room_name: str) -> bool:
    """
    채팅방 검색 및 열기

    Args:
        room_name: 채팅방 이름

    Returns:
        성공 여부
    """
    try:
        # Ctrl+F로 검색창 열기
        pyautogui.hotkey("ctrl", "f")
        time.sleep(DELAYS["medium"])

        # 기존 검색어 지우기
        pyautogui.hotkey("ctrl", "a")
        time.sleep(DELAYS["short"])

        # 채팅방 이름 입력 (클립보드 사용)
        pyperclip.copy(room_name)
        pyautogui.hotkey("ctrl", "v")
        time.sleep(DELAYS["medium"])

        # Enter로 채팅방 열기
        pyautogui.press("enter")
        time.sleep(DELAYS["long"])

        print(f"[KakaoSender] 채팅방 검색 완료: {room_name}")
        return True

    except Exception as e:
        print(f"[KakaoSender] 채팅방 검색 오류: {e}")
        return False


def send_image(image_path: str) -> bool:
    """
    이미지 전송

    Args:
        image_path: 이미지 파일 경로

    Returns:
        성공 여부
    """
    try:
        # Ctrl+T로 파일 첨부 대화상자 열기
        pyautogui.hotkey("ctrl", "t")
        time.sleep(DELAYS["file_dialog"])

        # 파일 경로 입력
        pyperclip.copy(image_path)
        pyautogui.hotkey("ctrl", "v")
        time.sleep(DELAYS["medium"])

        # Enter로 파일 선택
        pyautogui.press("enter")
        time.sleep(DELAYS["long"])

        # Enter로 전송
        pyautogui.press("enter")
        time.sleep(DELAYS["long"])

        print(f"[KakaoSender] 이미지 전송 완료: {image_path}")
        return True

    except Exception as e:
        print(f"[KakaoSender] 이미지 전송 오류: {e}")
        return False


def send_images_to_room(
    room_name: str,
    image_paths: List[str],
    progress_callback: Optional[Callable[[int, int, str], None]] = None
) -> bool:
    """
    특정 채팅방에 여러 이미지 전송

    Args:
        room_name: 채팅방 이름
        image_paths: 이미지 파일 경로 리스트
        progress_callback: 진행 상황 콜백 (current, total, message)

    Returns:
        성공 여부
    """
    if not image_paths:
        print("[KakaoSender] 전송할 이미지가 없습니다.")
        return False

    total = len(image_paths)

    # 카카오톡 활성화
    if progress_callback:
        progress_callback(0, total, "카카오톡 활성화 중...")
    if not activate_kakao():
        return False

    # 채팅방 검색
    if progress_callback:
        progress_callback(0, total, f"채팅방 검색 중: {room_name}")
    if not search_chat_room(room_name):
        return False

    # 이미지 전송
    for i, image_path in enumerate(image_paths):
        if progress_callback:
            progress_callback(i + 1, total, f"이미지 전송 중: {i + 1}/{total}")

        if not send_image(image_path):
            print(f"[KakaoSender] 이미지 전송 실패: {image_path}")
            return False

        # 이미지 간 대기
        time.sleep(DELAYS["medium"])

    if progress_callback:
        progress_callback(total, total, "전송 완료!")

    print(f"[KakaoSender] 총 {total}개 이미지 전송 완료")
    return True


def send_to_vendor(
    vendor: str,
    image_paths: List[str],
    progress_callback: Optional[Callable[[int, int, str], None]] = None
) -> bool:
    """
    발주처에 이미지 전송

    Args:
        vendor: 발주처 이름 ("재현하늘창" 또는 "우딘숲도어")
        image_paths: 이미지 파일 경로 리스트
        progress_callback: 진행 상황 콜백

    Returns:
        성공 여부
    """
    room_name = CHAT_ROOMS.get(vendor)
    if not room_name:
        print(f"[KakaoSender] 알 수 없는 발주처: {vendor}")
        return False

    print(f"[KakaoSender] 발주처: {vendor} -> 채팅방: {room_name}")
    return send_images_to_room(room_name, image_paths, progress_callback)


if __name__ == "__main__":
    # 테스트
    print("카카오톡 자동화 모듈 테스트")
    print(f"등록된 채팅방: {CHAT_ROOMS}")

    # 카카오톡 활성화 테스트
    if activate_kakao():
        print("카카오톡 활성화 성공!")
    else:
        print("카카오톡 활성화 실패!")
