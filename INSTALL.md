# s누르기2.ahk — 다른 컴퓨터 설치 가이드

다른 PC에서 `s누르기2.ahk` 를 동작시키기 위해 필요한 모든 설치·설정.

---

## 1. 폴더 위치

```
C:\Users\<USERNAME>\Desktop\오토핫키2\
├─ s누르기2.ahk              ← 메인 스크립트
├─ s누르기2_좌표.ini          ← 좌표 설정 (필수)
├─ MySQL.ahk                  ← include
├─ screencapture.ahk          ← include
├─ csv.ahk                    ← include
├─ Mushroom - Boo.ico         ← 트레이 아이콘
└─ IMAGESEARCH\               ← 이미지 검색용 BMP
   ├─ sms1.bmp
   └─ ...
```

> **주의**: 코드 내부에 `C:\Users\shwoodnew\` 절대경로가 일부 남아있을 수 있으니, 다른 사용자명이면 검색·치환 필요.

`%A_Desktop%\오토핫키2\` 기준으로 동작하므로 **반드시 바탕화면의 `오토핫키2` 폴더**에 두세요.

---

## 2. 필수 소프트웨어 설치

### 2-1. AutoHotkey (v1)
- 다운로드: https://www.autohotkey.com/download/ahk-install.exe
- **AutoHotkey v1.1.x 설치** (v2는 호환 안 됨)
- 설치 옵션: Unicode 32-bit 또는 64-bit (둘 다 가능. 단, 아래 ODBC 드라이버는 둘 다 깔아두면 안전)

### 2-2. Firebird ODBC 드라이버
- 다운로드 (32-bit + 64-bit 둘 다 권장):
  - 64-bit: https://sourceforge.net/projects/firebird/files/firebird-ODBC-driver/2.0.5-Release/Firebird_ODBC_2.0.5.156_x64.exe
  - 32-bit: https://sourceforge.net/projects/firebird/files/firebird-ODBC-driver/2.0.5-Release/Firebird_ODBC_2.0.5.156_Win32.exe
- 두 파일 모두 **관리자 권한으로 실행** → 기본 설정 그대로 설치
- 설치 후 확인 (PowerShell):
  ```powershell
  Get-OdbcDriver | Where-Object { $_.Name -like '*Firebird*' }
  ```
  → `Firebird/InterBase(r) driver` (32-bit, 64-bit) 두 줄 나와야 정상

### 2-3. MySQL Client (선택)
- 디버깅용. 스크립트 동작에는 불필요.

### 2-4. Python 3.13 (FCM 알림용)
- 다운로드: https://www.python.org/downloads/
- 설치 경로: `C:\Users\<USERNAME>\AppData\Local\Programs\Python\Python313\`
  (s누르기2.ahk가 이 경로로 PATH 환경변수 설정)
- 설치 시 **"Add Python to PATH" 체크**
- 패키지 설치:
  ```cmd
  pip install firebase-admin pymysql python-dotenv pytz pywin32
  ```

---

## 3. tms_new 프로젝트 (FCM Python 스크립트 + Firebase 자격증명)

s누르기2.ahk의 캘린더 4개가 `C:\Users\shwoodnew\tms_new\send_*.py` 를 호출합니다.

### 3-1. tms_new 클론
```cmd
cd C:\Users\shwoodnew\
git clone https://github.com/eijuneman/tms_app_0314.git tms_new
cd tms_new
```

> **주의**: 경로가 정확히 `C:\Users\shwoodnew\tms_new` 여야 함 (AHK 안에 하드코딩).
> 사용자명이 다르면 `s누르기2.ahk` 안의 4곳 `C:\Users\shwoodnew\tms_new\send_*.py` 와 `Python313` 경로를 일괄 치환.

### 3-2. `.env.local` 생성
`C:\Users\shwoodnew\tms_new\.env.local` 파일을 만들고 다음 내용 (필요한 키만):

```env
# Firebird
FIREBIRD_HOST=192.168.0.7
FIREBIRD_PORT=3050
FIREBIRD_DATABASE=jedaero_server
FIREBIRD_USER=SYSDBA
FIREBIRD_PASSWORD=masterkey

# MySQL
MYSQL_HOST=192.168.0.23
MYSQL_PORT=3306
MYSQL_USER=root
MYSQL_PASSWORD=tlsgmdahrwo12#
MYSQL_DATABASE=mydatabase

# Firebase 서비스 계정 키
FIREBASE_SERVICE_ACCOUNT_KEY_PATH=C:\Users\shwoodnew\tms_new\firebase-service-account.json
```

### 3-3. Firebase 서비스 계정 키 파일
- `firebase-service-account.json` 파일을 메인 PC에서 복사
- 위치: `C:\Users\shwoodnew\tms_new\firebase-service-account.json`
- ⚠️ 외부 공유 금지 (Firebase 알림 권한 전체)

---

## 4. 네트워크 / 방화벽

다음 IP·포트에 접속 가능해야 합니다:

| 대상 | IP:PORT | 용도 |
|---|---|---|
| MySQL 서버 | `192.168.0.23:3306` | tms / tms_2 / tms_list INSERT |
| Firebird 서버 | `192.168.0.7:3050` | CHITTOP / CHIT / ESTIMATETOP 직접 조회 |
| SMB 공유 | `\\192.168.0.1\hdd1\` | `readerspeaker.ahk`, sound mp3 등 |
| 카카오톡 PC | (로컬) | 메시지 발송 |
| Firebase Cloud Messaging | `fcm.googleapis.com:443` | FCM 푸시 알림 |

네트워크 환경에 따라 일부 IP가 다를 수 있으니, 메인 PC의 `s누르기2_좌표.ini` 와 `s누르기2.ahk` 안의 다음 값들을 검토:

- 라인 ~112: `host := "192.168.0.23"` (MySQL)
- FbConnect 함수: `DBNAME=192.168.0.7/3050:jedaero_server`
- `\\192.168.0.1\hdd1\...` 경로

---

## 5. 외부 의존 파일 (네트워크 드라이브)

`\\192.168.0.1\hdd1\일정표 최근\일정표220730\` 폴더에 다음 파일들이 있어야 함:

- `readerspeaker.ahk` — 캘린더 끝에서 실행 (TTS 알림)
- `readerspeaker2.ahk` — 방송하기 라벨에서 실행
- `sound\F1.mp3`, `sound\기록중.mp3` — 효과음

해당 SMB 공유에 접근 가능해야 합니다 (사용자 인증 필요할 수 있음 → `net use \\192.168.0.1\hdd1`).

---

## 6. 실행 / 자동시작

### 수동 실행
```cmd
"C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Users\<USERNAME>\Desktop\오토핫키2\s누르기2.ahk"
```

또는 그냥 `s누르기2.ahk` 더블클릭.

### 부팅 시 자동 실행
- `Win+R` → `shell:startup` → 열리는 폴더에 `s누르기2.ahk` 바로가기 복사
- 또는 작업 스케줄러로 등록

---

## 7. 설치 후 검증

### 7-1. AHK 로드 확인
- 실행 시 좌측 GUI 창이 뜨고 트레이에 🍄 아이콘
- 트레이 우클릭 → "Exit" 보이면 정상

### 7-2. MySQL 연결
- 매장에서 출고 거래 켜놓고 `!+5` (캘린더 핫키)
- "캘린더 완료" MsgBox 떠야 함 (CT_PK + 행수)
- 안 뜨면 → `MySQL connection error` 의심 → `C:\Users\<USERNAME>\Desktop\오토핫키2\` 폴더에 MySQL 라이브러리 (libmysql.dll 등) 있는지 확인

### 7-3. Firebird ODBC 연결
- 캘린더 실행 시 "Firebird 연결 실패" 에러 안 떠야 함
- 떴다면 → ODBC 드라이버 비트 매칭 (AHK 32 ↔ ODBC 32 / AHK 64 ↔ ODBC 64) 확인

### 7-4. FCM 알림
- 캘린더 완료 후 핸드폰에 알림 들어와야 함
- 안 오면 → 로그 확인:
  - 매출: `C:\Users\shwoodnew\tms_new\send_custom_fcm_log.txt`
  - 매입/발주: `C:\Users\shwoodnew\tms_new\send_purchase_fcm_log.txt`
- 로그에서 `[FCM] CLI argv[1]로 ID 받음` → `토큰 추가` → `메시지 전송 성공` 흐름 확인

---

## 8. 문제 해결

| 증상 | 원인 | 해결 |
|---|---|---|
| `Firebird 연결 실패` (0x80004005) | ODBC 드라이버 비트 불일치 | 32/64 둘 다 설치 |
| `Malformed string` Firebird 에러 | `CHARSET=NONE` 사용 시 한글 깨짐 | FbConnect()에 `CHARSET=UTF8` 확인 |
| Python 스크립트 즉시 종료 | `tms_new` 경로 다름 / Python 미설치 | 3-1, 2-4 재확인 |
| 캘린더 핫키 안 먹힘 | AHK 미실행 / 라이센스 충돌 | 트레이 확인, 관리자 권한 시도 |
| `readerspeaker.ahk not found` | SMB 공유 접속 불가 | `net use \\192.168.0.1\hdd1` 자격증명 |
| FCM 알림 안 옴 | Firebase 키 파일 없음 / 토큰 만료 | `.env.local`의 `FIREBASE_SERVICE_ACCOUNT_KEY_PATH` 확인 |
| `재고 확인` 다이얼로그가 안 닫힘 | 사용자가 직접 닫아야 함 | 정상. 60초 대기 |

---

## 9. 코드 안 하드코딩된 경로 (사용자명 다르면 치환 필요)

`s누르기2.ahk` 안에서 다음 경로들이 `shwoodnew` 사용자명으로 박혀있음:

```
C:\Users\shwoodnew\tms_new\send_purchase_fcm.py
C:\Users\shwoodnew\tms_new\send_custom_fcm.py
C:\Users\shwoodnew\AppData\Local\Programs\Python\Python313\
```

다른 사용자명이면 모든 발생 위치에서 일괄 치환 (편집기 검색·치환 기능).

---

## 10. 요약 체크리스트

- [ ] AutoHotkey v1 설치
- [ ] Firebird ODBC 32+64 비트 설치
- [ ] Python 3.13 설치 + pip 패키지 5개
- [ ] `C:\Users\<USERNAME>\Desktop\오토핫키2\` 폴더 통째로 복사
- [ ] `C:\Users\shwoodnew\tms_new\` git clone
- [ ] `.env.local` 생성 + `firebase-service-account.json` 복사
- [ ] 192.168.0.23 (MySQL), 192.168.0.7 (Firebird), \\192.168.0.1\hdd1 (SMB) 접근 가능
- [ ] 사용자명 다르면 `s누르기2.ahk` 안의 `shwoodnew` 경로 일괄 치환
- [ ] `s누르기2.ahk` 더블클릭 → 트레이 아이콘 확인
- [ ] `!+5` 핫키로 캘린더 테스트
