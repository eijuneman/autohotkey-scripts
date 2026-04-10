
	CoordMode, mouse, Screen
Clipboard=
(
안녕하세요 신흥목재입니다
여름휴가 일정 안내드립니다

휴가일정 : 08월 01일(목) ~ 08일 04일(일)
정상근무 : 08월 05일(월) ~

항상 이용해주셔서 감사합니다!
)

path=C:\Users\shwoodnew\Desktop\오토핫키2\스팸문자보내기\스팸매일.xlsx


xl := ComObjCreate("Excel.Application")
xl.Visible := true ; 엑셀 창을 표시하려면 true로 설정



xlWorkbook := xl.workbooks.open(path)
xlWorksheet := xlWorkbook.Sheets("Sheet1") ; 첫 번째 시트 선택


행끝 := xlWorksheet.UsedRange.Rows.Count
행시작 := 행끝
Sleep, 100

loop, %행끝%
{

	전화번호 := xlWorksheet.Range("C" 행시작).value

	행시작 --
	ToolTip, % 행시작 " x " 전화번호



	wake("휴대폰과 연결")
	Sleep, 300
	;~ Sleep, 100
		;~ Loop
		;~ {
			;~ ImageSearch, n42x, n42y,  -1200, -238, -500, 600, *30 C:\Users\shwoodnew\Documents\IMAGESEARCH\sms1.bmp
			;~ if (errorlevel = 1)
			;~ {
				;~ sleep 10
			;~ }
			;~ else if (errorlevel = 2) ; this has no matching if
			;~ {
				;~ msgbox, cant search
			;~ }
			;~ else
			;~ {
				;~ break
			;~ }
			;~ Sleep, 10
		;~ }
	;~ MouseGetPos, RX, RY

	MouseClick, l, -1120, 76, 3, 0
	;~ MouseMove, %RX%, %RY%
	;~ Sleep, 10
	;~ ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {tab 2}, 휴대폰과 연결
	Sleep, 1000
	ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, %전화번호%, 휴대폰과 연결
	Sleep, 1000
	ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Enter}, 휴대폰과 연결
	Sleep, 2000
	ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Tab 2}, 휴대폰과 연결
	Sleep, 2000
	ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Ctrl Down}v{Ctrl Up}, 휴대폰과 연결
	Sleep, 2000
	ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Tab 4}, 휴대폰과 연결
	Sleep, 2000
	ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Enter}, 휴대폰과 연결
	;~ ControlsetText, edit11, 	,  배송문자 시스템  -by shwood-

	;~ GuiControl, disable, 완료발송1

}

	Sleep, 100





return



wake(x){
	global
	Sleep, 100
	WinWait, %x%,
	IfWinNotActive, %x%, , WinActivate, %x%,
	WinWaitActive, %x%,
	Sleep, 1000
	return
}

