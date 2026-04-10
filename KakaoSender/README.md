# 카카오톡 PDF 전송 프로그램

PDF 파일을 페이지별 이미지로 변환하여 카카오톡 채팅방으로 자동 전송하는 프로그램입니다.

## 요구 사항

- **Windows 10/11**
- **Python 3.8 이상**
- **카카오톡 PC 버전** (설치 및 로그인 필요)

---

## 설치 방법

### 1단계: Python 설치 확인

명령 프롬프트(cmd)에서 Python이 설치되어 있는지 확인합니다:

```cmd
python --version
```

Python이 설치되어 있지 않다면 [Python 공식 사이트](https://www.python.org/downloads/)에서 다운로드하세요.

> **중요**: 설치 시 "Add Python to PATH" 옵션을 반드시 체크하세요!

### 2단계: 프로그램 폴더 복사

`KakaoSender` 폴더 전체를 원하는 위치에 복사합니다.

예: `C:\Users\{사용자명}\Desktop\KakaoSender\`

### 3단계: 의존성 설치

`install.bat` 파일을 더블클릭하여 실행합니다.

또는 명령 프롬프트에서:

```cmd
cd C:\Users\{사용자명}\Desktop\KakaoSender
pip install -r requirements.txt
```

설치되는 패키지:
- **PyMuPDF** - PDF를 이미지로 변환
- **Pillow** - 이미지 처리
- **pyautogui** - 마우스/키보드 자동화
- **pyperclip** - 클립보드 제어
- **pygetwindow** - 윈도우 창 제어

### 4단계: 프로토콜 핸들러 등록 (선택사항)

웹앱에서 PDF 다운로드 시 자동 실행을 원하면 프로토콜 핸들러를 등록합니다.

1. `register.bat` 파일을 **마우스 오른쪽 버튼**으로 클릭
2. **"관리자 권한으로 실행"** 선택
3. UAC 팝업에서 **"예"** 클릭

> 등록 해제: `unregister.bat`을 관리자 권한으로 실행

---

## 사용 방법

### 수동 실행

1. `run.bat` 더블클릭 또는 명령 프롬프트에서:
   ```cmd
   python main.py
   ```

2. **PDF 선택** 버튼 클릭 → PDF 파일 선택

3. 페이지 리스트에서 전송할 페이지 선택 (Ctrl+클릭으로 다중 선택)

4. **재현하늘창 전송** 또는 **우딘숲도어 전송** 버튼 클릭

5. 카카오톡이 자동으로 활성화되고 이미지가 전송됨

### 자동 실행 (웹앱 연동)

프로토콜 핸들러 등록 후, 웹앱에서 PDF 다운로드 시 자동으로 프로그램이 실행됩니다.

---

## 채팅방 설정

기본 채팅방 매핑:

| 발주처 | 채팅방 이름 |
|--------|------------|
| 재현하늘창 | 재현 발주 카톡방 |
| 우딘숲도어 | 우딘 발주 카톡방 |

### 채팅방 이름 변경

`kakao_sender.py` 파일을 메모장으로 열고 `CHAT_ROOMS` 부분을 수정합니다:

```python
CHAT_ROOMS = {
    "재현하늘창": "실제 채팅방 이름",
    "우딘숲도어": "실제 채팅방 이름",
}
```

---

## 문제 해결

### "Python이 설치되어 있지 않습니다" 오류

1. Python 설치 여부 확인: `python --version`
2. PATH 환경변수에 Python이 등록되어 있는지 확인
3. Python 재설치 시 "Add Python to PATH" 체크

### "카카오톡 창을 찾을 수 없습니다" 오류

1. 카카오톡 PC 버전이 실행 중인지 확인
2. 카카오톡이 최소화되어 있어도 됨
3. 카카오톡 창 제목이 "카카오톡"인지 확인

### "채팅방을 찾을 수 없습니다" 오류

1. 채팅방 이름이 정확한지 확인
2. `kakao_sender.py`의 `CHAT_ROOMS` 설정 확인
3. 해당 채팅방이 채팅 목록에 있는지 확인

### 이미지가 전송되지 않음

1. 카카오톡에서 파일 전송이 가능한 상태인지 확인
2. 전송 속도가 너무 빠르면 `kakao_sender.py`의 `DELAYS` 값을 늘림:
   ```python
   DELAYS = {
       "short": 0.5,    # 0.3에서 증가
       "medium": 0.8,   # 0.5에서 증가
       "long": 1.5,     # 1.0에서 증가
       "file_dialog": 2.0,  # 1.5에서 증가
   }
   ```

### 프로토콜 핸들러가 작동하지 않음

1. 관리자 권한으로 `register.bat` 실행했는지 확인
2. 브라우저에서 `shwoodorder://test` 입력하여 테스트
3. 브라우저 재시작 후 다시 시도

---

## 파일 구조

```
KakaoSender/
├── main.py              # 메인 프로그램
├── gui.py               # GUI (tkinter)
├── pdf_converter.py     # PDF → 이미지 변환
├── kakao_sender.py      # 카카오톡 자동화
├── register_protocol.py # 프로토콜 핸들러 등록
├── requirements.txt     # Python 의존성
├── install.bat          # 설치 스크립트
├── run.bat              # 실행 스크립트
├── register.bat         # 프로토콜 등록 (관리자)
├── unregister.bat       # 프로토콜 해제 (관리자)
├── images/              # 임시 이미지 저장 폴더
└── README.md            # 이 문서
```

---

## 다운로드 경로 설정 (웹앱 연동 시)

웹앱에서 PDF 다운로드 후 자동 실행 시, 프로그램은 기본 다운로드 폴더에서 PDF를 찾습니다.

현재 설정된 경로: `C:\Users\shwoodnew\Downloads\`

다른 사용자의 경우 `usePdfDownload.ts` 파일에서 사용자명을 수정해야 합니다:

```typescript
const username = 'shwoodnew' // ← 여기를 실제 Windows 사용자명으로 변경
```

---

## 라이선스

내부 사용 목적으로 제작되었습니다.
