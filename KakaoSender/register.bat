@echo off
chcp 65001 >nul
echo ========================================
echo   shwoodorder:// 프로토콜 핸들러 등록
echo   (관리자 권한으로 실행 필요)
echo ========================================
echo.

REM 관리자 권한 확인
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [오류] 관리자 권한이 필요합니다.
    echo 이 파일을 마우스 오른쪽 버튼으로 클릭하고
    echo "관리자 권한으로 실행"을 선택해주세요.
    echo.
    pause
    exit /b 1
)

cd /d "%~dp0"
python register_protocol.py register
pause
