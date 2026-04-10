
#NoEnv
#SingleInstance, FORCE
;~ #Include, ..\screencapture.ahk
SetBatchLines, -1
SetTitleMatchMode, 2
CoordMode, mouse, screen

; Variables
IBK_URL := "https://kiup.ibk.co.kr/uib/jsp/index.jsp"
AccountNumber := "489-059250-01-011"
Password := "2000"
CertPassword := "b5716129!@"

FormatTime, time1, yyyyMMdd ,yyyyMMdd
FormatTime, 오늘날짜, yyMMdd ,yy년 MM월 dd일

file1 = % "C:\Users\shwoodnew\Downloads\거래내역조회_입출식 예금" time1 ".xlsx"
FileDelete, % file1

SetTitleMatchMode, 3
SetTitleMatchMode, slow
WINTITLE=기업은행로그인
Gui, 1:Destroy
Gui, 1:+alwaysontop
Gui, 1:Default
Gui, 1:ADD, TEXT, , %WINTITLE%
Gui, 1:Show, x2087 y1165 , %WINTITLE%


;~ 받는분 = 김태준
받는분 = 큰누나
;~ 받는분 = 신흥목재알림
;~ 받는분 = 신흥목재 A.I. 홍이


;~ Loop,10
;~ {
;~ Process, close, EXCEL.EXE
;~ Sleep, 1
;~ }

;~ gosub, runkakaotalk1

Run, chrome.exe %IBK_URL%
WinMove, ahk_exe chrome.exe, , 5, 5
WinMaximize, ahk_exe chrome.exe
Sleep, 1000
	wake("ahk_exe chrome.exe")

	imagefind("1")


	wake("ahk_exe chrome.exe")
	imagefind("2")

	wake("전자 서명 작성")
	Sleep, 1000
;~ Clipboard:=CertPassword
	;~ ControlSend, , {Down}, ahk_exe chrome.exe
	;~ Sleep, 200
	;~ ControlSend, , {Tab 4}, 전자 서명 작성
	;~ Sleep, 200
	;~ ControlSend, , b5716129, ahk_exe chrome.exe

	;~ ControlFocus, QWidget34, 전자 서명 작성
	;~ Send, {down}
	;~ Sleep, 20
	ControlFocus, Edit1, 전자 서명 작성
	Sleep, 20
	Send, b
	Sleep, 20
	Send, 5
	Sleep, 20
	Send, 7
	Sleep, 20
	Send, 1
	Sleep, 20
	Send, 6
	Sleep, 20
	Send, 1
	Sleep, 20
	Send, 2
	Sleep, 20
	Send, 9
	Sleep, 20
	Send, {shift Down}1
	Sleep, 20
	Send, 2{shift Up}
	Sleep, 20
	Send, {Enter}
	;~ Sleep, 200




;~ wake("ahk_exe chrome.exe")
;~ imagefind("3")


;~ Sleep, 2000
SoundBeep, 800
SoundBeep, 400
SoundBeep, 500
;~ SoundBeep, 700
MsgBox, , 로그인 완료, 로그인 됐습니다, 1

ExitApp

wake("ahk_exe chrome.exe")
imagefind("4")


;~ Sleep, 2000
wake("ahk_exe chrome.exe")
imagefind("5")


;~ Sleep, 2000
wake("ahk_exe chrome.exe")
;~ imagefind("6")
imagefind("6")


;~ Sleep, 2000

wake("ahk_exe chrome.exe")
imagefind("7")

;~ MsgBox,

;~ Sleep, 2000

wake("ahk_exe chrome.exe")
imagefind("8")

;~ Sleep, 2000

wake("ahk_exe chrome.exe")
imagefind("9")


;~ Sleep, 2000
	WinKill, ahk_exe chrome.exe




Loop
{
	if FileExist(file1)
	{
		Sleep, 1000
		break
	}else{
	}
}


file1 = % "C:\Users\shwoodnew\Downloads\거래내역조회_입출식 예금" time1 ".xlsx"
;~ file1 = C:\Users\shwoodnew\Downloads\거래내역조회_입출식 예금%time1%.xlsx

FormatTime, time1, yyyyMMdd ,yyyyMMdd
FormatTime, 오늘날짜, yyMMdd ,yy년 MM월 dd일

file1 = % "C:\Users\shwoodnew\Downloads\거래내역조회_입출식 예금" time1 ".xlsx"
;~ file1 = C:\Users\shwoodnew\Downloads\거래내역조회_입출식 예금%time1%.xlsx



Global xl ; 중요함
xl := ComObjCreate("Excel.Application")
xl.Visible := true ; 엑셀 창을 표시하려면 true로 설정


xl.DisplayAlerts := false

xlWorkbook := xl.workbooks.open(file1)
xlWorksheet := xlWorkbook.Sheets("거래내역조회_입출식 예금") ; 첫 번째 시트 선택


xlWorksheet.Range("E:E").Copy ; 선택 시트의 A~Z열 복사
xlWorksheet.Range("D:D").PasteSpecial(-4163) ; 값만 붙여넣기

xlWorksheet.Range("A:A").Copy ; 선택 시트의 A~Z열 복사
xlWorksheet.Range("G:G").PasteSpecial(-4163) ; 값만 붙여넣기

xlWorksheet.Range("B:C").Copy ; 선택 시트의 A~Z열 복사
xlWorksheet.Range("E:F").PasteSpecial(-4163) ; 값만 붙여넣기

xlWorksheet.Range("A:C").delete
xlWorksheet.Range("A:C").insert
xlWorksheet.Range("H:AB").delete
;~ 엑셀03.Range("A2:I2000").Sort(xlWorksheet.Columns(8), 2)
;~ xlWorksheet.Range("A:G").Sort(xlWorksheet.Columns(4),1) ; 2는 내림차순을 의미합니다

barr:=["KB38027531", "785676855BC", "NH12135724", "SHC0075137", "롯데83934597", "삼성카드390", "우600478247", "하나96844968", "현330772446"]
barr2:=["매장카드결제입금 : 국민", "매장카드결제입금 : BC", "매장카드결제입금 : 농협", "매장카드결제입금 : SC은행", "매장카드결제입금 : 신한", "매장카드결제입금 : 삼성", "매장카드결제입금 : 우리", "매장카드결제입금 : 하나", "매장카드결제입금 : 현대"]
Loop, % barr.length()
{
	; 변경할 값 설정
	oldValue := barr[A_Index]
	newValue := barr2[A_Index]

	; UsedRange를 통해 시트의 모든 셀을 순회
	for cell in xlWorksheet.UsedRange
	{
		if (cell.Value = oldValue)
		{
			cell.Value := newValue
		}
	}
}


xlWorksheet.Range("A:G").Sort(xlWorksheet.Range("G:G"), 2, , , , , , 2) ; 2는 내림차순을 의미합니다

xlWorksheet.Range("1:1").insert


xlWorksheet.Range("A1").value := "계정분류"
xlWorksheet.Range("B1").value := "과목코드"
xlWorksheet.Range("C1").value := "계정분류"
xlWorksheet.Range("D1").value := "항목내용"
xlWorksheet.Range("E1").value := "지출금액"
xlWorksheet.Range("F1").value := "수입금액"
xlWorksheet.Range("G1").value := "입력날짜"
xlWorksheet.Range("1:1").insert

;~ Rows := xlWorksheet.UsedRange.Rows.Count


UsedRange	:=	xlWorksheet.UsedRange.Address

Rows := xlWorksheet.UsedRange.Rows.Count



xlWorksheet.Range(UsedRange).currentRegion.Select
xlWorksheet.Range(UsedRange).borders().linestyle := 6
xlWorksheet.Range(UsedRange).borders().weight := 2
xlWorksheet.Range("E:F").NumberFormat := "#,#0" ;"0.0
xlWorksheet.Range(UsedRange).Font.name := "맑은 고딕" ; 글꼴
xlWorksheet.Range("1:1").Font.size := 14 ; 글자 크기
xlWorksheet.Range("2:2").Font.size := 10 ; 글자 크기
xlWorksheet.Range("3:1000").Font.size := 10 ; 글자 크기
xlWorksheet.Range("1:2").Font.Bold := 1 ; 진하게
xlWorksheet.Range("E:F").HorizontalAlignment := -4152
xlWorksheet.Range("1:2").HorizontalAlignment := -4108
xlWorksheet.Range("D:D").HorizontalAlignment := -4131

xlWorksheet.Range("A1").value := 오늘날짜 . " 기업은행 입출금 내역"
xlWorksheet.Range("A1:G1").interior.colorindex := 43
xlWorksheet.Range("A1:G1").merge
xlWorksheet.Cells.Columns.AutoFit ; 열너비 자동 조정
xlWorksheet.Columns("A:C").ColumnWidth := 8.5 ; 열너비 조정
xlWorksheet.Rows("1:1").RowHeight := 33 ; 열너비 조정
xlWorksheet.Cells.rows.AutoFit ; 열너비 자동 조정
;~ xlWorksheet.Range("A2:E2").interior.colorindex := 6  ; 색상변경

Rows := Rows + 1
;~ xlWorksheet.selection.copy


Sleep, 200



gosub, runkakaotalk2



	;~ Sleep, 1000



	;~ Sleep, 1000






Global x2 ; 중요함
x2 := ComObjCreate("Excel.Application")
x2.Visible := true ; 엑셀 창을 표시하려면 true로 설정


x2.DisplayAlerts := false

x2Workbook := x2.workbooks.open(A_Desktop . "\오토핫키2\excel com\기업은행.xlsx")
x2Worksheet := x2Workbook.Sheets("거래내역조회_입출식 예금") ; 첫 번째 시트 선택





;;;;;;;


실세Rows := Rows - 2
A = 0


Loop, % 실세Rows
{


	횟수 := Rows - A
	;~ MsgBox, % 실세Rows "`n" Rows "`n" 횟수

	targetValue := xlWorksheet.Range("G" 횟수).Value
	foundCell := x2Worksheet.Columns("G").Find(targetValue, , , 1)




	if (foundCell){
		xlWorksheet.Range(횟수 ":" 횟수).delete
	}

	else{
	}
	A++
}


	변경점 := xlWorksheet.Range("G3").Value
	if(변경점=""){

		x2.Activeworkbook.save()
		x2.ActiveWorkbook.Close(1)
		x2.Quit
		x2 := ""

		xl.Activeworkbook.save()
		xl.ActiveWorkbook.Close(1)
		xl.Quit
		xl := ""
		gosub, runkakaotalk3
		Sleep, 1000

		ExitApp
		return
	}
	else{
	}


	xl.Activeworkbook.save()
	xl.ActiveWorkbook.Close(1)
	xl.Quit
	xl := ""




Sleep, 2000

Global xl ; 중요함
xl := ComObjCreate("Excel.Application")
xl.Visible := true ; 엑셀 창을 표시하려면 true로 설정


xl.DisplayAlerts := false

xlWorkbook := xl.workbooks.open(file1)
xlWorksheet := xlWorkbook.Sheets("거래내역조회_입출식 예금") ; 첫 번째 시트 선택



xlWorksheet.select
Rows3 := xlWorksheet.UsedRange.Rows.Count
Rows4 := x2Worksheet.UsedRange.Rows.Count
;~ MsgBox, % Rows3 "`n" Rows4
wake("기업은행.xlsx - Excel")
	x2Worksheet.Range("3:" Rows3).insert
;~ MsgBox, 파킹
	Rows2 := x2Worksheet.UsedRange.Rows.Count
	Rows2 := Rows2 + 1



	xlWorksheet.Range("A3:G" Rows).Copy
	x2Worksheet.Select
	x2Worksheet.Range("A3").Select

	;~ x2Worksheet.Range("A" Rows2).PasteSpecial(-4163)
	;~ x2Worksheet.PasteSpecial(-4163)
	x2Worksheet.Paste

x2Workbook.Application.CutCopyMode := False ; 복사모드 해제




;~ ex.Range("A:J").Copy ; A~J열 복사
;~ ex.Sheets("sh2").Select ; 시트 선택
;~ ex.Range("A1").Select ; A1셀 선택; ex.Range("A1:J10").Select ;붙일 범위선택
;~ ex.ActiveSheet.Paste ; 붙여넣기
;~ ex.Application.CutCopyMode := False ; 복사모드 해제





xlWorkbook.Close(false) ; 변경 내용을 저장하지 않고 닫기
xl.Quit()
xl := "" ; 변수 해제



xl.Application.CutCopyMode := 0
x2.Application.CutCopyMode := 0
	x2.Activeworkbook.save
	x2.ActiveWorkbook.Saveas(A_Desktop . "\오토핫키2\excel com\기업은행.xlsx")
	x2.ActiveWorkbook.Close(1)
	x2.Quit
	x2 := ""





	Sleep, 1000


ExitApp


return




imagefind(이미지이름){

	global
	CoordMode, pixel, screen
	경로 = %A_ScriptDir%\%이미지이름%.bmp
	Sleep, 100
	;~ Loop, 1000
	Loop, 1000
	{
		ToolTip, % 이미지이름 . " x " . A_Index
		ImageSearch, x0, y0, 0, 0, 1920, 1200, *50 %경로%
		if (errorlevel = 1){
			sleep 50
			;~ 구분=1
		}
		else if (errorlevel = 2){ ; this has no matching if
			msgbox, , , cant search, 0.1
			;~ 구분=1
		}
		else if (errorlevel = 0){ ; this doesnt either
			MouseClick, , %x0%, %y0%, , 0
			Sleep, 10
			MouseClick, , %x0%, %y0%, , 0
			break
			구분=
		}
		sleep 50
	}	;~ MouseMove, %x1%, %y1%, 0

;~ if(구분="1"){
			;~ MsgBox, 262160, 알림, □□□□□□□□□□□□□□□□□□□□□□□□`n□□□□□□□□□□□□□□□□□□□□□□□□`n□□□□□□□□□□□□□□□□□□□□□□□□`n`n`n`n`n기업은행 입출금 내역이 없습니다`n`n`n`n`n□□□□□□□□□□□□□□□□□□□□□□□□`n□□□□□□□□□□□□□□□□□□□□□□□□`n□□□□□□□□□□□□□□□□□□□□□□□□
	;~ ExitApp
;~ }
;~ else{
;~ }
;~ Sleep, 100
return
}





wake(x){
	global
	Sleep, 100
	WinWait, %x%,
	IfWinNotActive, %x%, , WinActivate, %x%,
	WinWaitActive, %x%,
	Sleep, 1000
	return
}


runkakaotalk1:
{

	;~ WinMinimizeAll
	WinShow, 카카오톡

	Sleep,50
	   WinWait, 카카오톡,
	IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	WinWaitActive, 카카오톡,

	Sleep,50
	Loop, 2
	{
		ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
		Sleep,10
		ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	}
		Sleep,100
	   ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	   Sleep,100
	   WinWait, 카카오톡,
	IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	WinWaitActive, 카카오톡,
	   ControlSetText, Edit2, , 카카오톡
	   Sleep, 50
	ControlSetText, Edit2, %받는분%, 카카오톡
	Sleep, 1000
	controlsend, EVA_Window2, {Enter}, 카카오톡

	Sleep, 2000
	return
}

runkakaotalk2:
{
	WinWait, %받는분%,
	IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	WinWaitActive, %받는분%,

	Sleep, 200

	FormatTime, e1, yyMMdd, ▶ yy년 MM월 dd일 기업은행 입출금 내역 ◀

	Sleep, 300
	ControlFocus, RICHEDIT50W1, %받는분%
	Sleep, 300
	Send, %e1%{Enter}
	Sleep, 200
	Send, {CtrlDown}a{CtrlUp}{BackSpace}
	Send, {CtrlDown}v{CtrlUp}{Enter}
	Sleep, 200
	Send, {UP 2}{Enter}
	Sleep, 200
	Send, {Enter}


	Sleep, 200
	Winkill, %받는분%
	Sleep,300
	ControlSetText, Edit2, , 카카오톡
	Sleep, 300
	WinMinimize, 카카오톡

	return
}

runkakaotalk3:
{
	WinWait, %받는분%,
	IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	WinWaitActive, %받는분%,

	Sleep, 200

	FormatTime, e1, yyMMdd, ▶ yy년 MM월 dd일 기업은행 입출금 내역 ◀

	Sleep, 300
	ControlFocus, RICHEDIT50W1, %받는분%
	Sleep, 300
	Send, %e1%{Enter}
	Sleep, 200
	Send, {CtrlDown}a{CtrlUp}{BackSpace}
	Send, 현재까지 기업은행 추가 입출금 내역 없습니다{Enter}
	Sleep, 200
	Send, {Enter}


	Sleep, 200
	Winkill, %받는분%
	Sleep,300
	ControlSetText, Edit2, , 카카오톡
	Sleep, 300
	WinMinimize, 카카오톡

	return
}


guiclose:
ExitApp