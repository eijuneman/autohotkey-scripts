#NoEnv
#SingleInstance, force
FormatTime, 오늘, , dd

Loop, 10
{

;~ WinKill, ahk_exe JHIntex.exe
winkill, ahk_exe JedaeroM.exe
Process, Close , Microsoft Excel
}

FileCopy, C:\참좋은소프트\제대로판매재고M\excel\내역2023-07-17.xls, %A_Desktop%\내역2023-07-17.xls, 1
FileCopy, C:\참좋은소프트\제대로판매재고M\excel\내역2023-07-17.xls, %A_Desktop%\내역2023-07-171.xls, 1


PATH1 = % A_Desktop "\내역2023-07-17.xls"
PATH2 = % A_Desktop "\우딘용 통합 문서1.xlsx"



WinWait, ahk_exe msedge.exe,
IfWinNotActive, ahk_exe msedge.exe, , WinActivate, ahk_exe msedge.exe,
WinWaitActive, ahk_exe msedge.exe,
Sleep, 500
CoordMode, Mouse, Screen
	Loop
	{
		ImageSearch, n32x, n32y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *50 C:\Users\shwoodnew\Documents\IMAGESEARCH\우1.png

		if (errorlevel = 1)
		{
			sleep 100
		}

		else if (errorlevel = 2) ; this has no matching if
		{
			msgbox, cant search
		}

		else
		{
			break
		}

		sleep 100
	}



MouseClick, l, %n32x%, %n32y%, , 0
Sleep, 1000




WinWait, ahk_exe msedge.exe,
IfWinNotActive, ahk_exe msedge.exe, , WinActivate, ahk_exe msedge.exe,
WinWaitActive, ahk_exe msedge.exe,
Sleep, 500
CoordMode, Mouse, Screen
	Loop
	{
		ImageSearch, n32x, n32y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *50 C:\Users\shwoodnew\Documents\IMAGESEARCH\우2.png

		if (errorlevel = 1)
		{
			sleep 100
		}

		else if (errorlevel = 2) ; this has no matching if
		{
			msgbox, cant search
		}

		else
		{
			break
		}

		sleep 100
	}



MouseClick, l, %n32x%, %n32y%, , 0

Sleep, 5000

;~ MsgBox, 잠깐

;~ Sleep, 2000
ControlSend, , {Ctrl Down}ac{Ctrl Up}, ahk_exe msedge.exe


ClipWait





path := A_Desktop . "\내역2023-07-171.xls"


XL := ComObjCreate("Excel.Application")
XL.Workbooks.Open(path)
XL.Visible := true


XL.sheets("Sheet1").Range("A1").select
Send, {Ctrl Down}v{Ctrl Up}

Sleep, 2000

찾는문자 := "이전"
;~ 시트이름 := XL.Page 1

범위 := XL.sheets("Sheet1").Range("1:500").Find(찾는문자)
행 := 범위.Row
행--

MsgBox, , 오호, %행%`n%찾는문자%`n%PATH1% , 1
XL.sheets("sheet1").Range("21:"행).select
XL.Selection.copy
XL.Sheets.Add
XL.sheets("sheet2").Range("1:1").select
XL.Selection.pastespecial


XL.sheets("sheet2").Range("3:3").Delete



행끝 := XL.sheets("sheet2").UsedRange.Rows.Count
행시작 := 행끝
Sleep, 100

행끝--
loop, %행끝%
{
공식 = ="우/"&D%행시작%&"("&E%행시작%&")"

공식셀 := % "A" 행시작
공식셀C := % "C" 행시작
XL.sheets("sheet2").Select
XL.sheets("sheet2").range(공식셀).formula := 공식
;~ XL.sheets("sheet1").Range(공식셀C).value := "ea"
	행시작 --
}


copyRange := XL.sheets("Sheet2").Range("A:A") ; 복사할 셀 선택   ; 복사할 범위를 수정하세요
copiedValue := copyRange.Value  ; 복사한 값 가져오기
pasteRange := XL.sheets("Sheet2").Range("A:A") ; ; 붙여넣을 셀 선택     붙여넣을 범위를 수정하세요
pasteRange.Value := copiedValue  ; 값을 붙여넣기



XL.sheets("Sheet2").Select



XL.sheets("Sheet2").Range("H:H").select
XL.Selection.copy
XL.sheets("Sheet2").Range("B:B").select
XL.Selection.pastespecial



XL.sheets("Sheet2").Range("I:I").select
XL.Selection.copy
XL.sheets("Sheet2").Range("C:C").select
XL.Selection.pastespecial



XL.sheets("Sheet2").Range("J:J").select
XL.Selection.copy
XL.sheets("Sheet2").Range("D:D").select
XL.Selection.pastespecial



XL.sheets("Sheet2").Range("M:M").select
XL.Selection.copy
XL.sheets("Sheet2").Range("E:E").select
XL.Selection.pastespecial



XL.sheets("Sheet2").Range("G:AA").DELETE



XL.sheets("Sheet2").Range("F:F").select
XL.Selection.copy
XL.sheets("Sheet2").Range("H:H").select
XL.Selection.pastespecial


XL.sheets("Sheet2").Range("Z:Z").select
XL.Selection.copy

XL.sheets("Sheet2").Range("F:F").select
XL.Selection.pastespecial



XL.Sheets("Sheet2").Range("A1").value := "상품명"
XL.Sheets("Sheet2").Range("B1").value := "규격"
XL.Sheets("Sheet2").Range("C1").value := "단위"
XL.Sheets("Sheet2").Range("D1").value := "수량"
XL.Sheets("Sheet2").Range("E1").value := "단가"
XL.Sheets("Sheet2").Range("F1").value := "바코드"
XL.Sheets("Sheet2").Range("G1").value := "관리코드"
XL.Sheets("Sheet2").Range("H1").value := "비고"
XL.Sheets("Sheet2").Range("I1").value := "상품코드"




;~ XL.sheets("Sheet1").DELETE
;~ Sleep, 2000
;~ Send, {Enter}

path2 := A_Desktop . "\내역2023-07-17.xls"



XL2 := ComObjCreate("Excel.Application")
XL2.Workbooks.Open(path2)
XL2.Visible := true
Sleep, 3000
XL.sheets("Sheet2").Range("2:50").select
XL.Selection.copy

XL2.sheets("Sheet1").Range("A2").select
Sleep, 1000

Send, {Ctrl Down}v{Ctrl Up}



;~ Sleep, 2000
;~ XL.ActiveWorkbook.Save
;~ XL2.ActiveWorkbook.SaveAs(path2)


행끝2 := XL2.ActiveSheet.UsedRange.Rows.Count



;~ XL2.sheets("Sheet1").cells("A2").Select
;~ MsgBox, % 행끝
행시작2 := 행끝2
Sleep, 100
MsgBox, %행시작2%`n%행끝2%

행끝2 --
loop, %행끝2%
{
공식값 = 우/()


;~ 비교값 := XL2.sheets("Sheet1").Range("1:100").Find(찾는문자)

비교셀 := "A" 행시작2
비교값 := XL2.sheets("Sheet1").Range(비교셀).value
MsgBox, %공식값%`n%비교값%
	if (공식값 = 비교값)
	{
	XL2.sheets("Sheet1").Range(행시작2 ":" 행시작2).select
	XL2.Selection.delete

	;~ MsgBox, %범위%`n일치합니다

	}
	else
	{
			;~ MsgBox, 틀립니다
	}
	행시작2 --
}


WinWait, ahk_exe EXCEL.EXE,
IfWinNotActive, ahk_exe EXCEL.EXE, , WinActivate, ahk_exe EXCEL.EXE,
WinWaitActive, ahk_exe EXCEL.EXE,
Sleep, 500

Send, {ctrl Down}s{Ctrl up}


Sleep, 1000

Send, {Enter}














Sleep,100


run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M
Sleep, 100
	WinWait, 로그인,
	IfWinNotActive, 로그인, , WinActivate, 로그인,
	WinWaitActive, 로그인,
Sleep, 100

ControlSetText, TRzEdit2, admin, 로그인
ControlSetText, TRzEdit1, kk0404, 로그인
ControlClick, TRzBitBtn3, 로그인

Sleep, 100
	WinWait, ahk_class TfmMain,
	IfWinNotActive, ahk_class TfmMain, , WinActivate, ahk_class TfmMain,
	WinWaitActive, ahk_class TfmMain,
WinMaximize, ahk_class TfmMain
Sleep, 500


Send, {Esc}{Alt}{Enter}{Right 3}{Down 3}{Enter}

Sleep, 100
	WinWait, ahk_class TfmChitBuy,
	IfWinNotActive, ahk_class TfmChitBuWy, , WinActivate, ahk_class TfmChitBuy,
	WinWaitActive, ahk_class TfmChitBuy,
Sleep, 500
ControlSend, TRzEdit6, 우딘{Enter}, ahk_class TfmChitBuy
Sleep, 500
ControlClick, TRzBitBtn4, ahk_class TfmChitBuy
Sleep, 100
	WinWait, ahk_class TfmExcelChit,
	IfWinNotActive, ahk_class TfmExcelChit, , WinActivate, ahk_class TfmExcelChit,
	WinWaitActive, ahk_class TfmExcelChit,
Sleep, 100
ControlClick, TAdvToolBar1, ahk_class TfmExcelChit,,,,x175 y12
Sleep, 100

Sleep, 500
Clipboard = % A_Desktop "\내역2023-07-17.xls"
ClipWait
Sleep, 100
	WinWait, 열기,
	IfWinNotActive, 열기, , WinActivate, 열기,
	WinWaitActive, 열기,
	Sleep, 100
ControlSend, Edit1, {Ctrl Down}v{Ctrl Up}, 열기
Sleep, 100
ControlSend, Edit1, {Enter}, 열기


;~ Send, {tab 2}{Enter}
;~ ControlClick, Button2, 열기

Sleep, 2000

ControlClick, TAdvToolBar1, ahk_class TfmExcelChit,,,,x287 y13

Sleep, 100
	WinWait, ahk_class TfmChitBuy,
	IfWinNotActive, ahk_class TfmChitBuy, , WinActivate, ahk_class TfmChitBuy,
	WinWaitActive, ahk_class TfmChitBuy,
Sleep, 100

ControlClick, TAdvToolBar1, ahk_class TfmChitBuy,,,,x269 y12
Sleep, 2000

ControlClick, TAdvToolBar1, ahk_class TfmChitBuy,,,,x350 y12
Sleep, 2000






Sleep, 3000



Send, {Esc}{Alt}{Enter}{Right 3}{Up}{Enter}

Sleep, 100
	WinWait, ahk_class TfmEstimate2,
	IfWinNotActive, ahk_class TfmEstimate2, , WinActivate, ahk_class TfmEstimate2,
	WinWaitActive, ahk_class TfmEstimate2,
Sleep, 100
ControlSend, TRzEdit2, 우딘{Enter}, ahk_class TfmEstimate2
Sleep, 500
ControlClick, TRzBitBtn5, ahk_class TfmEstimate2
Sleep, 100
	WinWait, ahk_class TfmEstiBuyInfo,
	IfWinNotActive, ahk_class TfmEstiBuyInfo, , WinActivate, ahk_class TfmEstiBuyInfo,
	WinWaitActive, ahk_class TfmEstiBuyInfo,
Sleep, 100



Control, Check ,, TRzGroupButton3, ahk_class TfmEstiBuyInfo

Sleep, 100



ControlClick, TAdvToolBar2, ahk_class TfmEstiBuyInfo,,,,x45 y14

Sleep, 100
	WinWait, ahk_class TfmEstimate2,
	IfWinNotActive, ahk_class TfmEstimate2, , WinActivate, ahk_class TfmEstimate2,
	WinWaitActive, ahk_class TfmEstimate2,
Sleep, 100




ControlSend, TRzDBDateTimeEdit1, {up}, ahk_class TfmEstimate2
Sleep,100
ControlSend, TRzDBDateTimeEdit3, {up}, ahk_class TfmEstimate2
Sleep,100
ControlSetText, TRzDBEdit8, 매장입고, ahk_class TfmEstimate2
Sleep,100
ControlSetText, TRzDBEdit3, 09시 착, ahk_class TfmEstimate2
Sleep,100

ControlClick, TAdvToolBar1, ahk_class TfmEstimate2,,,,x269 y12
Sleep, 2000

ControlClick, TAdvToolBar1, ahk_class TfmEstimate2,,,,x350 y12
Sleep, 2000









Loop, 3
{

;~ WinKill, ahk_exe JHIntex.exe
winkill, ahk_exe JedaeroM.exe
Process, Close , Microsoft Excel
}
return