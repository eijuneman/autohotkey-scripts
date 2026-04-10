#NoEnv
#SingleInstance, force
FormatTime, 오늘, , dd

{

;~ WinKill, ahk_exe JHIntex.exe
winkill, ahk_exe JedaeroM.exe
winkill, ahk_exe JHIntex.exe
Process, Close , Microsoft Excel
WinKill, ahk_exe msedge.exe
WinKill, ahk_exe EXCEL.EXE
}

FileDelete, %A_Desktop%\통합 문서1.xls
FileCopy, C:\참좋은소프트\제대로판매재고M\excel\내역2023-07-17.xls, %A_Desktop%\내역2023-07-17.xls, 1
FileCopy, C:\참좋은소프트\제대로판매재고M\excel\내역2023-07-17.xls, %A_Desktop%\내역2023-07-171.xls, 1


PATH1 = % A_Desktop "\내역2023-07-17.xls"
PATH2 = % A_Desktop "\우딘용 통합 문서1.xlsx"






Sleep, 1000

run, C:\Program Files (x86)\Jhintex_Cust\JHIntex.exe
Sleep, 100

	WinWait, 사용자 로그인,
	IfWinNotActive, 사용자 로그인, , WinActivate, 사용자 로그인,
	WinWaitActive, 사용자 로그인,

Sleep, 100
ControlSend, TEdit2, 64216, 사용자 로그인
Sleep, 100
ControlSend, TEdit1, 48342, 사용자 로그인
ControlClick, TButton2, 사용자 로그인

	WinWait, [재현인텍스 거래처관리],
	IfWinNotActive, [재현인텍스 거래처관리], , WinActivate, [재현인텍스 거래처관리],
	WinWaitActive, [재현인텍스 거래처관리],

Sleep, 1000
Send, {Esc}{Alt}{Enter}{Right}{Enter}
ControlSetText, TDateTimePicker1, , [재현인텍스 거래처관리]
ControlSend, TDateTimePicker2, {Right 2}%오늘%, [재현인텍스 거래처관리]
Sleep, 1000
ControlClick, TPanel3, [재현인텍스 거래처관리],,,,x47 y20
Sleep, 1500
ControlClick, TPanel3, [재현인텍스 거래처관리],,,,X140 y20
;;;;;;;;;;;;;;; 재현발주프로그램 ~ 엑셀 열기 까지


	WinWait, 통합 문서1 - Excel,
	IfWinNotActive, 통합 문서1 - Excel, , WinActivate, 통합 문서1 - Excel,
	WinWaitActive, 통합 문서1 - Excel,



Sleep, 1000

xl := ComObjActive("Excel.Application")  ; 1번 로우데이터
xl.Visible := true

Sleep, 3000

path2 := A_Desktop . "\내역2023-07-17.xls"   ;2번 올리기
xl2 := ComObjCreate("Excel.Application")
xl2.Workbooks.Open(path2)
xl2.Visible := true
xl.ActiveSheet.Range("1:500").select
xl.selection.Replace("0.00","")

행끝 := xl.ActiveSheet.UsedRange.Rows.Count
행시작 := 행끝
Sleep, 100

행끝 --
loop, %행끝%
{
공식 = ="재/"&B%행시작%&"("&D%행시작%&")"

공식셀 := % "A" 행시작
공식셀C := % "C" 행시작
xl.sheets("sheet1").Select
xl.sheets("sheet1").range(공식셀).formula := 공식
xl.sheets("sheet1").Range(공식셀C).value := "ea"
	행시작 --
}


copyRange := xl.sheets("sheet1").Range("A:A") ; 복사할 셀 선택   ; 복사할 범위를 수정하세요
copiedValue := copyRange.Value  ; 복사한 값 가져오기
pasteRange := xl.sheets("sheet1").Range("A:A") ; ; 붙여넣을 셀 선택     붙여넣을 범위를 수정하세요
pasteRange.Value := copiedValue  ; 값을 붙여넣기







xl.sheets("sheet1").Select


xl.sheets("sheet1").Range("E:E").select
xl.Selection.copy
xl.sheets("sheet1").Range("B:B").select
xl.Selection.pastespecial


xl.sheets("sheet1").Range("I:I").select
xl.Selection.copy
xl.sheets("sheet1").Range("D:D").select
xl.Selection.pastespecial


xl.sheets("sheet1").Range("H:H").select
xl.Selection.copy
xl.sheets("sheet1").Range("E:E").select
xl.Selection.pastespecial


xl.sheets("sheet1").Range("M:M").select
xl.Selection.copy
xl.sheets("sheet1").Range("H:H").select
xl.Selection.pastespecial




;;;;;;;;;;;;;;; 빈칸으로 만들기 시작
xl.sheets("sheet1").Range("Z:Z").select
xl.Selection.copy

xl.sheets("sheet1").Range("F:F").select
xl.Selection.pastespecial
xl.sheets("sheet1").Range("G:G").select
xl.Selection.pastespecial
xl.sheets("sheet1").Range("J:J").select
xl.Selection.pastespecial
xl.sheets("sheet1").Range("K:K").select
xl.Selection.pastespecial
xl.sheets("sheet1").Range("L:L").select
xl.Selection.pastespecial
xl.sheets("sheet1").Range("M:M").select
xl.Selection.pastespecial
xl.sheets("sheet1").Range("I:I").select
xl.Selection.pastespecial
;;;;;;;;;;;;;;; 빈칸으로 만들기 끝



xl.Sheets("sheet1").Range("A1").value := "상품명"
xl.Sheets("sheet1").Range("B1").value := "규격"
xl.Sheets("sheet1").Range("C1").value := "단위"
xl.Sheets("sheet1").Range("D1").value := "수량"
xl.Sheets("sheet1").Range("E1").value := "단가"
xl.Sheets("sheet1").Range("F1").value := "바코드"
xl.Sheets("sheet1").Range("G1").value := "관리코드"
xl.Sheets("sheet1").Range("H1").value := "비고"
xl.Sheets("sheet1").Range("I1").value := "상품코드"
xl.sheets("sheet1").Range("J:Z").DELETE
;~ return




xl2.Cells.Select
xl2.Selection.delete
xl.Cells.Select
xl.Selection.Copy
xl2.range("A1").Select
xl2.Sheets("sheet1").Select
xl2.ActiveSheet.Paste



    xl.ActiveWorkbook.SaveAs(A_ScriptDir "\재현\내역2024-05-11.xls", 56)   ; same folder, same name, .xls extension
    xl.ActiveWorkbook.Close
    xl.quit()


    xl2.ActiveWorkbook.Save   ; same folder, same name, .xls extension
    xl2.ActiveWorkbook.Close
    xl2.quit()
    ;~ xl2.quit := ""










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
ControlSend, TRzEdit6, 재현인{Enter}, ahk_class TfmChitBuy
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
Clipboard = % A_Desktop "\오토핫키2\재현\재현올리기.xls"
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
ControlSend, TRzEdit2, 재현인{Enter}, ahk_class TfmEstimate2
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
ControlSetText, TRzDBEdit9, 매장입고, ahk_class TfmEstimate2
Sleep,100
ControlSetText, TRzDBEdit4, 07시 착, ahk_class TfmEstimate2
Sleep,100

ControlClick, TAdvToolBar1, ahk_class TfmEstimate2,,,,x269 y12
Sleep, 2000

ControlClick, TAdvToolBar1, ahk_class TfmEstimate2,,,,x350 y12
Sleep, 2000









Loop, 3
{

;~ WinKill, ahk_exe JHIntex.exe
winkill, ahk_exe JedaeroM.exe
winkill, ahk_exe JHIntex.exe
Process, Close , Microsoft Excel
WinKill, ahk_exe msedge.exe
WinKill, ahk_exe EXCEL.EXE
}
;~ return



ExitApp

return