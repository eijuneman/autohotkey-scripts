#NoEnv
#SingleInstance, FORCE

SetTitleMatchMode, 1
SetTitleMatchMode, slow
#Include, screencapture.ahk

SetTitleMatchMode, 3
SetTitleMatchMode, slow
WINTITLE=홈텍스로그인
Gui, 1:Destroy
Gui, 1:+alwaysontop
Gui, 1:Default
Gui, 1:ADD, TEXT, , %WINTITLE%
;~ wlqndwlqnqweqweedddssddddddd
Gui, 1:Show, x1787 y965 , %WINTITLE%


받는분 = 김태준
;~ 받는분 = 신흥목재알림

/*
Loop,10
{
	Process, close, EXCEL.EXE
	Sleep, 1
}

;~ WinMinimizeAll
WinShow, 카카오톡
Sleep,50
wake("카카오톡")
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
wake("카카오톡")
ControlSetText, Edit2, , 카카오톡
Sleep, 50
ControlSetText, Edit2, %받는분%, 카카오톡
Sleep, 500
controlsend, EVA_Window2, {Enter}, 카카오톡
Sleep, 500

*/


Run, chrome.exe "https://www.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/pp/index_pp.xml&vatPage=Y"
WinMove, ahk_exe chrome.exe, , 5, 5
WinMaximize, ahk_exe chrome.exe
Sleep, 1000




wake("ahk_exe chrome.exe")
imagefind1("1_1")

if(구분="1"){ ; 못찾음, 로그인 안됨
}else{ ; 찾음, 로그인 됨 , 로그아웃 해야 함
	wake("ahk_exe chrome.exe")
	imagefind2("1")
	Sleep, 2000
	Send, {Enter}
	Run, chrome.exe "https://www.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/pp/index_pp.xml&vatPage=Y"
Sleep, 1000
}
구분=

	wake("ahk_exe chrome.exe")
	imagefind2("2")


	wake("ahk_exe chrome.exe")
	imagefind2("3")




	wake("ahk_exe chrome.exe")
	Sleep, 1000
Clipboard=b5716129!@
	ControlSend, , {Down}, ahk_exe chrome.exe
	Sleep, 1000
	ControlSend, , {Tab 6}, ahk_exe chrome.exe
	Sleep, 1000
	;~ ControlSend, , b5716129, ahk_exe chrome.exe
	;~ Send, b5716129
	;~ Sleep, 1000
	;~ ControlSend, , !, ahk_exe chrome.exe
	;~ Send, !
	;~ Sleep, 1000
	;~ ControlSend, , @, ahk_exe chrome.exe
	;~ Send, @
	Send, {Ctrl Down}v{Ctrl Up}
	Sleep, 1000
	ControlSend, , {Enter}, ahk_exe chrome.exe
;~ Sleep, 2000

MsgBox, , 로그인 완료, 로그인 됐습니다, 1

ExitApp

wake("ahk_exe chrome.exe")
imagefind2("3_1")

;~ Sleep, 2000

wake("ahk_exe chrome.exe")
imagefind2("4")

MsgBox, 응

;~ Sleep, 2000
wake("ahk_exe chrome.exe")
imagefind2("5")

Sleep, 2000
wake("ahk_exe chrome.exe")    ;;;; 찾기 찾기
imagefind2("6")
;~ Sleep, 2000
wake("ahk_exe chrome.exe")    ;;;; 찾기 찾기
imagefind1("6_1")

if(구분="1"){ ; 못찾음, 로그인 안됨
}else{ ; 찾음, 로그인 됨 , 로그아웃 해야 함
Sleep, 2000
wake("ahk_exe chrome.exe")
imagefind2("6_2")
Sleep, 1000
MsgBox, 오늘 세금 계산서 발행 없음
	WinKill, ahk_exe chrome.exe
	ExitApp                                           ; 끝
}
;~ Sleep, 2000


구분=

wake("ahk_exe chrome.exe")
imagefind2("7")


;~ Sleep, 2000


wake("ahk_exe chrome.exe")
imagefind2("8")

Sleep, 2000
Send, {Enter}


Sleep, 2000

{

	Loop, C:\Users\shwoodnew\Downloads\*.xls, 0, 1
	{
		날짜파일이름 := A_LoopFileName
		날짜파일이름 := StrReplace(날짜파일이름, "(" , "_")
		날짜파일이름 := StrReplace(날짜파일이름, ")" , "_")
		RegExMatch(날짜파일이름, "매출전자세금계산서목록_(.*)_.xls", 날짜파일이름)

		if(날짜파일이름1!=""){
			;~ path:= "매출전자세금계산서목록(" 날짜파일이름 ").xls"
			;~ MsgBox, % path
			path:=A_LoopFileFullPath
			;~ MsgBox, % A_LoopFileFullPath
			break
		}
		else{
		}
	}



	X1 := ComObjCreate( "Excel.Application" )
	X1.workbooks.open(path)
	X1.Visible:=true
	Sleep, 100


	X1.Sheets("세금계산서").Range("5:5").Select
	X1.Selection.delete

	X1.Sheets("세금계산서").Select
	;~ X1.Sheets("세금계산서").Range("A:BB").Select
	;~ X1.Selection.EntireColumn.Hidden := False

	총액 := X1.sheets("세금계산서").range("B3").value

	;~ X1.Sheets("세금계산서").Range("L:L").Select
	;~ return





	행끝 := X1.ActiveSheet.UsedRange.Rows.Count
	행시작 := 행끝
	Sleep, 100


	loop, %행끝%
	{
	공식 := % "=SUM(AE" 행시작 ":AF" 행시작 ")"
	공식셀 = % "C" 행시작
	X1.sheets("세금계산서").Select
	X1.sheets("세금계산서").range(공식셀).formula := 공식

	공식값 := X1.sheets("세금계산서").Range(공식셀).value
		;~ if (공식값 = 0)
		;~ {
			;~ X1.sheets("세금계산서").Range(행시작 ":" 행시작).select
			;~ X1.Selection.delete
		;~ }
		;~ else
		;~ {
		;~ }
		행시작 --
	}
	Sleep, 100


	;~ X1.sheets("세금계산서").Range("A1").select

	;~ X1.sheets("세금계산서").Select

	X1.sheets("세금계산서").Range("L:L").select
	;~ X1.sheets("세금계산서").Range("L:L").select
	X1.Selection.copy
	;~ MsgBox, % 공식
	X1.sheets("세금계산서").Range("B:B").select
	X1.Selection.pastespecial
	;~ MsgBox, % 공식

	X1.sheets("세금계산서").Range("C:C").select
	X1.Selection.copy
	X1.sheets("세금계산서").Range("C:C").select
	X1.Selection.pastespecial(-4163)


	;~ MsgBox, % 공식


	X1.sheets("세금계산서").Range("D:BB").select


	X1.Selection.delete

	X1.sheets("세금계산서").Range("1:2").select

	X1.Selection.delete
	x1.selection.horizontalAlignment := -4108
	X1.Selection.Font.Bold := 1

	X1.Selection.Font.size := 15

	FormatTime, e1, , ▶ yyyy년 MM월 dd일 dddd  계산서 발행한 것 ◀
	X1.sheets("세금계산서").Range("C1").value := ""
	X1.sheets("세금계산서").Range("B1").value := ""

	X1.sheets("세금계산서").Range("A1:C1").select
	X1.Selection.merge

	X1.sheets("세금계산서").Range("A1").value := e1

	X1.sheets("세금계산서").Range("A2:B2").select
	X1.Selection.merge
	x1.selection.horizontalAlignment := -4108
	X1.Selection.Font.Bold := 1

	X1.sheets("세금계산서").Range("C3").value := "총금액"
	X1.sheets("세금계산서").Range("C2").value := 총액
	X1.sheets("세금계산서").Range("A2").value := "총발행금액"

	;~ MsgBox, % 공식
	열끝 := X1.Sheets("세금계산서").UsedRange.Columns.Count
	행끝 := X1.Sheets("세금계산서").UsedRange.Rows.Count
	좌표 = A1:C%행끝%


	X1.Sheets("세금계산서").range(좌표).currentRegion.Select

	X1.Sheets("세금계산서").Range(좌표).borders().linestyle := 6
	X1.Sheets("세금계산서").Range(좌표).borders().weight := 2
	X1.Sheets("세금계산서").Range(좌표).select

	;~ X1.Sheets("세금계산서").Range("A3:E3").interior.colorindex := 6


	X1.Sheets("세금계산서").Range("A1:C1").interior.colorindex := 4
	X1.Sheets("세금계산서").Range("A1:C1").rows("1:1").RowHeight = 25

	;~ X1.Sheets("세금계산서").Range("A2:E2").interior.colorindex := 7


	X1.sheets("세금계산서").Range("A:C").select
	X1.Selection.Font.size := 15
	X1.Sheets("세금계산서").Columns("C:C").EntireColumn.AutoFit

	X1.Sheets("세금계산서").Columns("B:B").EntireColumn.AutoFit

	X1.Sheets("세금계산서").Columns("A:A").EntireColumn.AutoFit






	X1.sheets("세금계산서").Range(좌표).select
	X1.selection.copy



	Sleep, 200
	wake(받는분)
	Sleep, 200

	FormatTime, e1, , ▶ yyyy년 MM월 dd일 dddd  세금계산서 발행한 것 ◀

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

	X1.sheets("세금계산서").Range("A1").select


	X1.Activeworkbook.Close(false)
	X1.Quit
	X1 := ""
	Sleep, 1000
	FileDelete, % path

}
ExitApp
return


imagefind1(이미지이름){ ; 있는지 없는지 가늠자

	global
	경로 = %A_ScriptDir%\%이미지이름%.bmp
	Sleep, 100
		Loop, 10
		{
			ToolTip, % 이미지이름 . " x " . A_Index
			ImageSearch, x0, y0, 0, 0, 2560, 1440, *100 %경로%
			if (errorlevel = 1){
				sleep 50
				구분=1
			}
			else if (errorlevel = 2){ ; this has no matching if
				sleep 50
				구분=1
			}
			else if (errorlevel = 0){ ; this doesnt either
				구분=
				break
			}
			sleep 10
		}

Sleep, 100
return
}



imagefind2(이미지이름){

	global
	경로 = %A_ScriptDir%\%이미지이름%.bmp
	Sleep, 100
		Loop, 50
		{
			ToolTip, % 이미지이름 . " x " . A_Index
			ImageSearch, x10, y10, 0, 0, 2560, 1440, *100 %경로%
			if (errorlevel = 1){
				sleep 50
			}
			else if (errorlevel = 2){ ; this has no matching if
				msgbox, cant search
			}
			else if (errorlevel = 0){ ; this doesnt either
				MouseClick, , %x10%, %y10%, , 0
				Sleep, 10
				MouseClick, , %x10%, %y10%, , 0
				break
			}
			sleep 10
		}
Sleep, 100
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



guiclose:
ExitApp