#NoEnv
SetBatchLines, -1
SetTitleMatchMode, 2

; XLS 파일을 서버에서 다운로드 (스크립트와 같은 폴더에 저장)
LocalXlsPath := A_ScriptDir . "\jedaero_import.xls"
UrlDownloadToFile, https://shwood.co.kr/api/product/jedaero-import/download, %LocalXlsPath%
if ErrorLevel {
    MsgBox, 48, 오류, XLS 파일 다운로드에 실패했습니다.
    ExitApp, 1
}

; 1. TfmChitSale 창에서 TRzBitBtn9 비활성 클릭
ControlClick, TRzBitBtn9, ahk_class TfmChitSale

; 2. TfmExcelChit 창 대기
WinWait, ahk_class TfmExcelChit,, 10
if ErrorLevel {
    MsgBox, 48, 오류, 엑셀 가져오기 창이 열리지 않았습니다.
    ExitApp, 1
}

; 3. TfmExcelChit에서 파일열기 버튼 비활성 클릭
ControlClick, TAdvToolBar1, ahk_class TfmExcelChit,, LEFT, 1, NA x148 y14

; 4. "열기" 다이얼로그 대기
WinWait, 열기,, 10
if ErrorLevel {
    MsgBox, 48, 오류, 파일 열기 창이 열리지 않았습니다.
    ExitApp, 1
}

; 5. Edit1에 파일 경로 입력 + Button2 클릭
ControlSetText, Edit1, %LocalXlsPath%, 열기
Sleep, 500
ControlClick, Button2, 열기

; 6. 데이터 입력 버튼 클릭
Sleep, 1000
ControlClick, TAdvToolBar1, ahk_class TfmExcelChit,, LEFT, 1, NA x240 y18

; 7. 완료 메시지 (2초 자동 닫힘)
MsgBox, 0, 합판다, 데이터 입력 완료, 2
ExitApp, 0
