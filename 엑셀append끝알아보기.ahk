#Persistent
SetTitleMatchMode, 2

; 이미 활성화된 Excel 인스턴스 가져오기
try {
    xl := ComObjActive("Excel.Application")
} catch {
    MsgBox, Excel 인스턴스를 찾을 수 없습니다.
    ExitApp
}

wb := xl.ActiveWorkbook
ws := xl.ActiveSheet

; 초기 행 갯수 저장

; 타이머 설정 (1초 간격으로 체크)
;~ SetTimer, CheckExcelAppend, 1000
;~ return

CheckExcelAppend:
    ; 현재 행 갯수 확인

Loop
{
	initialRowCount := currentRowCount
	Sleep, 2000
    currentRowCount := ws.UsedRange.Rows.Count

    ; 행 갯수가 변경되었는지 확인
    if (currentRowCount = initialRowCount) {
        ; 행 갯수가 변경되었으면 메시지 박스 표시
        ToolTip, Append 작업이 완료되었습니다. 현재 행 갯수: %currentRowCount%
        ; 타이머 중지
        ;~ ToolTip, CheckExcelAppend, Off
		break

    }
	else
	{

        ToolTip, Append 작업중. 현재 행 갯수: %currentRowCount%

	}
}

;~ ; 스크립트 종료 시 Excel 종료 (필요에 따라)
;~ OnExit, ExitSub
;~ return

;~ ExitSub:
    ; Excel 인스턴스 종료 (필요에 따라)
	;~ xl.
    ;~ xl.Quit()
    ExitApp
return
