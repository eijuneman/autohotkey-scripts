"""
Protocol Handler Registration
Windows 레지스트리에 shwoodorder:// 프로토콜 핸들러 등록
"""

import os
import sys
import ctypes
import winreg
from pathlib import Path


# 프로토콜 설정
PROTOCOL_NAME = "shwoodorder"
PROTOCOL_DESCRIPTION = "ShWood Order Protocol"


def is_admin() -> bool:
    """관리자 권한 확인"""
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False


def get_program_path() -> str:
    """프로그램 실행 경로 반환"""
    # run.bat 또는 python main.py 경로
    script_dir = Path(__file__).parent
    run_bat = script_dir / "run.bat"

    if run_bat.exists():
        return str(run_bat)
    else:
        # python main.py 직접 실행
        python_exe = sys.executable
        main_py = script_dir / "main.py"
        return f'"{python_exe}" "{main_py}"'


def register_protocol():
    """프로토콜 핸들러 등록"""
    if not is_admin():
        print("[오류] 관리자 권한이 필요합니다.")
        print("register.bat을 관리자 권한으로 실행해주세요.")
        return False

    program_path = get_program_path()
    print(f"[등록] 프로토콜: {PROTOCOL_NAME}://")
    print(f"[등록] 프로그램: {program_path}")

    try:
        # HKEY_CLASSES_ROOT\shwoodorder 키 생성
        key_path = PROTOCOL_NAME

        # 메인 키 생성
        with winreg.CreateKey(winreg.HKEY_CLASSES_ROOT, key_path) as key:
            winreg.SetValue(key, "", winreg.REG_SZ, f"URL:{PROTOCOL_DESCRIPTION}")
            winreg.SetValueEx(key, "URL Protocol", 0, winreg.REG_SZ, "")

        # DefaultIcon 키 생성
        icon_path = f"{key_path}\\DefaultIcon"
        with winreg.CreateKey(winreg.HKEY_CLASSES_ROOT, icon_path) as key:
            # run.bat 아이콘 사용 (기본 cmd 아이콘)
            winreg.SetValue(key, "", winreg.REG_SZ, f"{program_path},0")

        # shell\open\command 키 생성
        command_path = f"{key_path}\\shell\\open\\command"
        with winreg.CreateKey(winreg.HKEY_CLASSES_ROOT, command_path) as key:
            # %1은 URL 전체를 전달
            command = f'"{program_path}" "%1"'
            winreg.SetValue(key, "", winreg.REG_SZ, command)

        print("[완료] 프로토콜 핸들러 등록 성공!")
        print(f"[테스트] 브라우저에서 {PROTOCOL_NAME}://test 를 입력해보세요.")
        return True

    except PermissionError:
        print("[오류] 레지스트리 쓰기 권한이 없습니다.")
        return False
    except Exception as e:
        print(f"[오류] 등록 실패: {e}")
        return False


def unregister_protocol():
    """프로토콜 핸들러 제거"""
    if not is_admin():
        print("[오류] 관리자 권한이 필요합니다.")
        return False

    try:
        # 하위 키부터 삭제
        sub_keys = [
            f"{PROTOCOL_NAME}\\shell\\open\\command",
            f"{PROTOCOL_NAME}\\shell\\open",
            f"{PROTOCOL_NAME}\\shell",
            f"{PROTOCOL_NAME}\\DefaultIcon",
            PROTOCOL_NAME,
        ]

        for key_path in sub_keys:
            try:
                winreg.DeleteKey(winreg.HKEY_CLASSES_ROOT, key_path)
                print(f"[삭제] {key_path}")
            except FileNotFoundError:
                pass

        print("[완료] 프로토콜 핸들러 제거 성공!")
        return True

    except Exception as e:
        print(f"[오류] 제거 실패: {e}")
        return False


def check_protocol():
    """프로토콜 핸들러 등록 상태 확인"""
    try:
        with winreg.OpenKey(winreg.HKEY_CLASSES_ROOT, PROTOCOL_NAME) as key:
            value, _ = winreg.QueryValueEx(key, "URL Protocol")
            print(f"[상태] {PROTOCOL_NAME}:// 프로토콜이 등록되어 있습니다.")

            # command 확인
            command_path = f"{PROTOCOL_NAME}\\shell\\open\\command"
            with winreg.OpenKey(winreg.HKEY_CLASSES_ROOT, command_path) as cmd_key:
                command, _ = winreg.QueryValue(cmd_key, "")
                print(f"[명령] {command}")

            return True

    except FileNotFoundError:
        print(f"[상태] {PROTOCOL_NAME}:// 프로토콜이 등록되어 있지 않습니다.")
        return False
    except Exception as e:
        print(f"[오류] 상태 확인 실패: {e}")
        return False


def main():
    """메인 함수"""
    print("=" * 50)
    print(f"  {PROTOCOL_NAME}:// 프로토콜 핸들러 관리")
    print("=" * 50)

    if len(sys.argv) > 1:
        command = sys.argv[1].lower()

        if command == "register":
            register_protocol()
        elif command == "unregister":
            unregister_protocol()
        elif command == "check":
            check_protocol()
        else:
            print(f"알 수 없는 명령: {command}")
            print("사용법: python register_protocol.py [register|unregister|check]")
    else:
        # 기본: 등록
        register_protocol()

    input("\n아무 키나 눌러 종료...")


if __name__ == "__main__":
    main()
