@echo off
chcp 65001 >nul
echo ========================================
echo   카카오톡 PDF 전송 프로그램 설치
echo ========================================
echo.

REM Python 확인
python --version >nul 2>&1
if errorlevel 1 (
    echo [오류] Python이 설치되어 있지 않습니다.
    echo Python 3.x를 설치해주세요: https://www.python.org/downloads/
    pause
    exit /b 1
)

echo [1/2] Python 버전 확인...
python --version

echo.
echo [2/2] 필요한 패키지 설치 중...
pip install -r requirements.txt

echo.
echo ========================================
echo   설치 완료!
echo   run.bat을 실행하여 프로그램을 시작하세요.
echo ========================================
pause
