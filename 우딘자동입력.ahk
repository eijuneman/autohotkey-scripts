#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include, csv.ahk
FormatTime, 오늘, yyyyMMdd, yyyy-MM-dd
FormatTime, 내일, yyyyMMdd, yyyyMMdd

SetTitleMatchMode, 3
SetTitleMatchMode, slow



내일 ++
;~ MsgBox, % 오늘 "`n" 내일
내일1 := SubStr(내일, 1, 4) "-" SubStr(내일, 5, 2) "-" SubStr(내일, 7, 2)


;~ 오늘 = 2024-12-03
;~ 내일 = 2024-11-20


FileDelete, % A_ScriptDir "\우딘\우딘.csv"
FileDelete, % A_ScriptDir "\우딘\내역2024-05-11.xls"



;    인위적으로 기록하기   □■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■
;~ 오늘 = 20240504         □■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■
;~ 내일1 = 20240504        □■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■


ExampleURL	:=	"http://woodinshop.com/"
ExampleURL2	:=	 "http://woodinshop.com/ordr1/ordr_take_master.php?s_e_date=" 오늘 "&s_s_date=" 오늘 "&mode=move"
;~ ExampleURL2	:=	 "http://1.201.154.148/woodin/ordr/ordr_pass_master.php?s_e_date=" 오늘 "&s_s_date=" 오늘 "&mode=move" ; 내일 입고
;~ ExampleURL2	:=	 "http://1.201.154.148/woodin/ordr/ordr_take_master.php?s_e_date=" 내일1 "&s_s_date=" 오늘 "&mode=move" ; 상차현황
;~ ExampleURL2	:=	 "http://1.201.154.148/woodin/ordr/ordr_take_master.php?s_e_date=20240511&s_s_date=20240510&mode=move"  ;  예제
pwb := pwbget() 			; ComObject를 컨트롤 하기 위해서 인터넷 익스플로러 어플리케이션 ComObject를 하나 땡겨옵니다.

pwb.Visible := True 		; 이것의 Visible 속성을 트루로 바꿔줍니다. 즉, 보이게끔 한다는 말이죠.

pwb.Navigate(ExampleURL) ; ExampleURL 사이트로 이동시킵니다.

While(pwb.busy) 			; pwb가 busy 인 속성일 때 동안 Sleep,200 을 해라 라는 의미에요.
	sleep,200




While (! Element:=pwb.document.getElementById("user_id")) ;Make sure element exists before moving forward
	Sleep, 50

pwb.document.getElementById("user_id").value := "신흥목재"
pwb.document.getElementById("user_pw").value := "48342"

pwb.document.getElementsByClassName("btn btn-login btn-lg")[0].Click()

IELoad(pwb) ; sleep

pwb.Navigate(ExampleURL2) ; ExampleURL 사이트로 이동시킵니다.
Sleep, 5000
;~ IELoad(pwb) ; sleep


loop, % Pwb.Document.All.Tags("TABLE").length ;get count of all tables on page
    Table_List.=A_index-1 "|" ;prep for dropdown list

;~ gui,DD:add, dropdownlist,w200 r10 vTable_Nb gSubmit_All, %Table_List%
;~ gui,DD:show
;~ return

Submit_all:
Gui,DD:Submit
Gui,DD:destroy

;***********now extract data*******************
Data:=[]
loop, % Pwb.Document.All.Tags("TABLE")["0"].Rows.Length {
	Row:=Pwb.Document.All.Tags("TABLE")["0"].Rows[A_Index-1]
	rows:="" ;clear out rows
	loop, % row.cells.length{
		rows.= row.cells[A_Index].innerTEXT a_tab
	}
	if(A_Index=1)
		Headers:=RegExReplace(rows,"\t","|")
	else
		Data.Push(StrSplit(rows,"	")) ;add rows to data object
}

Gui,Add,ListView,h900 w1200,%Headers%
for a,b in Data

	LV_Add("",b*) ;use variadic function to add columns
Loop,% LV_GetCount("Column")
	LV_ModifyCol(A_Index,"AutoHDR") ;adjust column width based on data
;~ gui, show
Table_List:=""



makefile:



	loop, % LV_GetCount() {

	RowNum := A_Index

	loop, 12
		LV_GetText(col%A_Index% , RowNum, a_index)

			Loop, 12{
			col%A_Index% := RegExReplace(col%A_Index%,"-",A_Space)
			col%A_Index% := RegExReplace(col%A_Index%,",","")
			}




	FileAppend, % col1 "," col2 "," col3 "," col4 "," col5 "," col6 "," col7 "," col8 "," col9 "," col10 "," col11 "," col12 ", `n", % A_ScriptDir "\우딘\우딘.csv"


    }
	if errorlevel = 1
	{
		Sleep, 200
		gosub, makefile
	}
	else
	{
		;~ Sleep, 500
	}
	Sleep, 1







Loop{

	if(FileExist(A_ScriptDir "\우딘\우딘.csv"))
	{
		global xl

		xl := ComObjCreate("Excel.Application")    ; 1번 로우데이터
		xl.Workbooks.Open(A_ScriptDir "\우딘\우딘.csv")
		xl.Visible := false
		;~ xl.Visible := true




		내용없음 := xl.sheets("우딘").range("A1").value
		if(내용없음=""){
		   xl.ActiveWorkbook.Save   ; same folder, same name, .xls extension
		   xl.ActiveWorkbook.Close
		   xl.quit()
			Loop, 10
			{
				;~ Process, close, EXCEL.EXE
				;~ winkill, ahk_class XLMAIN
				;~ WinKill, ahk_exe EXCEL.EXE
				;~ Process, close, JedaeroM.exe
				;~ winkill, ahk_exe JHIntex.exe
			}
			MsgBox, 262160, 알림, □□□□□□□□□□□□□□□□□□□□□□□□`n□□□□□□□□□□□□□□□□□□□□□□□□`n□□□□□□□□□□□□□□□□□□□□□□□□`n`n`n`n`n내일 우딘 입고 내역 없습니다`n`n`n`n`n□□□□□□□□□□□□□□□□□□□□□□□□`n□□□□□□□□□□□□□□□□□□□□□□□□`n□□□□□□□□□□□□□□□□□□□□□□□□
		   ExitApp
		}
		else
		{
		}






		global xl2

		xl2 := ComObjCreate("Excel.Application")    ; 2번 올리기
		xl2.Workbooks.Open(A_ScriptDir "\우딘\우딘올리기.xls")
		xl2.Visible := false
		;~ xl2.Visible := true

		;~ MsgBox, 일단1
		xl.ActiveSheet.Range("1:500").select
		xl.selection.Replace("0.00","")

		xl.sheets("우딘").Range("C:C").select
		xl.Selection.copy
		xl.sheets("우딘").Range("M:M").select
		xl.Selection.pastespecial


		xl.sheets("우딘").Range("D:D").select
		xl.Selection.copy
		xl.sheets("우딘").Range("N:N").select
		xl.Selection.pastespecial



		행끝 := xl.ActiveSheet.UsedRange.Rows.Count
		행끝 ++
		행시작 := 행끝
		Sleep, 100

		;~ MsgBox, 일단2
	;~ 행끝 ++
		loop, %행끝%
		{
			;~ 공식1 = ="우/"&M%행시작%&"/"&C%행시작%
			공식1 = ="우/"&M%행시작%&"/"&N%행시작%
			공식2 = =F%행시작%&"/"&G%행시작%

			공식셀A := % "A" 행시작
			공식셀B := % "B" 행시작
			xl.sheets("우딘").range(공식셀A).formula := 공식1
			xl.sheets("우딘").range(공식셀B).formula := 공식2
			행시작 --

		}
	xl.sheets("우딘").Range("A:B").select
	xl.Selection.copy
	xl.Selection.pastespecial(-4163)


	xl.sheets("우딘").Range("H:H").select ; 단위
	xl.Selection.copy
	xl.sheets("우딘").Range("C:C").select
	xl.Selection.pastespecial(-4163)


	xl.sheets("우딘").Range("J:J").select ; 수량
	xl.Selection.copy
	xl.sheets("우딘").Range("D:D").select
	xl.Selection.pastespecial(-4163)



	xl.sheets("우딘").Range("E:E").select ; 색상 > 비고
	xl.Selection.copy
	xl.sheets("우딘").Range("H:H").select
	xl.Selection.pastespecial(-4163)


		;~ MsgBox, 일단3
	xl.sheets("우딘").Range("L:L").select ; 단가
	xl.Selection.copy
	xl.sheets("우딘").Range("E:E").select
	xl.Selection.pastespecial(-4163)


	xl.sheets("우딘").Range("F:G").delete
	xl.sheets("우딘").Range("F:G").insert
	xl.sheets("우딘").Range("I:I").delete
	xl.sheets("우딘").Range("I:I").insert
	xl.sheets("우딘").Range("J:N").delete
	xl.sheets("우딘").Range("J:N").insert
	;~ xl.Selection.DELETE

		;~ MsgBox, 일단4



	행끝 := xl.ActiveSheet.UsedRange.Rows.Count
	행끝 ++
	행시작 := 행끝
	loop, %행끝%
	{
		공식셀C := % "A" 행시작
		공란 := xl.sheets("우딘").range(공식셀C).value
		if(공란="우//"){

			xl.sheets("우딘").Range(행시작 ":" 행시작).delete
		}

		행시작 --
	}


		;~ MsgBox, 일단51

	xl.sheets("우딘").Range("1:1").INSERT
	xl.sheets("우딘").range("A1").value := "상품명"
	xl.sheets("우딘").range("B1").value := "규격"
	xl.sheets("우딘").range("C1").value := "단위"
	xl.sheets("우딘").range("D1").value := "수량"
	xl.sheets("우딘").range("E1").value := "단가"
	xl.sheets("우딘").range("F1").value := "바코드"
	xl.sheets("우딘").range("G1").value := "관리코드"
	xl.sheets("우딘").range("H1").value := "비고"
	xl.sheets("우딘").range("I1").value := "상품코드"

		;~ MsgBox, 일단52

	xl.sheets("우딘").Range("A:I").select
	xl.Selection.copy
	xl.Selection.pastespecial(-4163)

		;~ MsgBox, 일단53
		행끝1 := xl.ActiveSheet.UsedRange.Rows.Count
행끝1 := 행끝1 + 1
	xl.sheets("우딘").Range(행끝1 ":" 행끝1).select
	xl.Selection.delete

		;~ MsgBox, 일단54
	;~ return

	break
	}
	else{
	}

}




xl2.Cells.Select
xl2.Selection.delete
xl.Cells.Select
xl.Selection.Copy
xl2.range("A1").Select
xl2.Sheets("sheet1").Select
xl2.ActiveSheet.Paste



    xl.ActiveWorkbook.SaveAs(A_ScriptDir "\우딘\내역2024-05-11.xls", 56)   ; same folder, same name, .xls extension
    xl.ActiveWorkbook.Close
    xl.quit()

    xl := ""

    xl2.ActiveWorkbook.Save   ; same folder, same name, .xls extension
    xl2.ActiveWorkbook.Close
    xl2.quit()
    xl2 := ""


Sleep, 1000
pwb.document.getElementsByClassName("bi bi-box-arrow-right")[0].Click() ; logout










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
ControlSend, TRzDBDateTimeEdit1, {up}, ahk_class TfmChitBuy
Sleep, 500
ControlClick, TRzBitBtn3, ahk_class TfmChitBuy
Sleep, 100
   WinWait, ahk_class TfmExcelChit,
   IfWinNotActive, ahk_class TfmExcelChit, , WinActivate, ahk_class TfmExcelChit,
   WinWaitActive, ahk_class TfmExcelChit,
Sleep, 100
ControlClick, TAdvToolBar1, ahk_class TfmExcelChit,,,,x146 y12
Sleep, 100

Sleep, 500
Clipboard = % A_Desktop "\오토핫키2\우딘\우딘올리기.xls"
ClipWait
Sleep, 100
   WinWait, 열기,
   IfWinNotActive, 열기, , WinActivate, 열기,
   WinWaitActive, 열기,
   Sleep, 1000
   ControlFocus, Edit1, 열기
ControlSend, Edit1, {Ctrl Down}v{Ctrl Up}, 열기
Sleep, 100
ControlSend, Edit1, {Enter}, 열기

;~ Send, {tab 2}{Enter}
;~ ControlClick, Button2, 열기

Sleep, 2000

ControlClick, TAdvToolBar1, ahk_class TfmExcelChit,,,,x229 y13

Sleep, 100
   WinWait, ahk_class TfmChitBuy,
   IfWinNotActive, ahk_class TfmChitBuy, , WinActivate, ahk_class TfmChitBuy,
   WinWaitActive, ahk_class TfmChitBuy,
Sleep, 100

ControlClick, TAdvToolBar1, ahk_class TfmChitBuy,,,,x230 y12
Sleep, 2000

ControlClick, TAdvToolBar1, ahk_class TfmChitBuy,,,,x290 y12
Sleep, 2000






Sleep, 3000


Sleep, 100
   WinWait, ahk_class TfmMain,
   IfWinNotActive, ahk_class TfmMain, , WinActivate, ahk_class TfmMain,
   WinWaitActive, ahk_class TfmMain,
WinMaximize, ahk_class TfmMain
Sleep, 500


Send, {Esc}{Alt}{Enter}{Right 3}{Up}{Enter}




Sleep, 100
   WinWait, ahk_class TfmEstimate2,
   IfWinNotActive, ahk_class TfmEstimate2, , WinActivate, ahk_class TfmEstimate2,
   WinWaitActive, ahk_class TfmEstimate2,
Sleep, 100
ControlSend, TRzEdit2, 우딘{Enter}, ahk_class TfmEstimate2
Sleep, 100
   WinWait, ahk_class TfmEstimate2,
   IfWinNotActive, ahk_class TfmEstimate2, , WinActivate, ahk_class TfmEstimate2,
   WinWaitActive, ahk_class TfmEstimate2,
Sleep, 1000
Sleep, 1000
ControlClick, TRzBitBtn5, ahk_class TfmEstimate2
ControlClick, TRzBitBtn5, ahk_class TfmEstimate2
Sleep, 100
   WinWait, ahk_class TfmEstiBuyInfo,
   IfWinNotActive, ahk_class TfmEstiBuyInfo, , WinActivate, ahk_class TfmEstiBuyInfo,
   WinWaitActive, ahk_class TfmEstiBuyInfo,
Sleep, 100



Control, Check ,, TRzGroupButton3, ahk_class TfmEstiBuyInfo
ControlClick, TRzButton1, ahk_class TfmEstiBuyInfo
ControlClick, TAdvToolBar1, ahk_class TfmEstiBuyInfo,,,, x20 y20
;~ TAdvToolBar1,

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
ControlSetText, TRzDBEdit4, 09시 착, ahk_class TfmEstimate2
Sleep,100

ControlClick, TAdvToolBar1, ahk_class TfmEstimate2,,,,x230 y12
Sleep, 2000

ControlClick, TAdvToolBar1, ahk_class TfmEstimate2,,,,x290 y12
Sleep, 2000

































ExitApp

return
return

pwbget()
{
	try
	{
		; IE 컴 오브젝트가 간혹가다가 오류가 날 때가 있는데, 이 때를 위해 Try-Catch 구문을 사용했어요. 완벽하게 잡는진 모르겠네요.
		pwb := ComObjCreate("InternetExplorer.Application") ; create IE
		return pwb
	}
	catch e
	{
		pwb:=""
		sleep,100
		pwbget()
	}
}

IELoad(pwb)
{
    If !pwb    ;If wb is not a valid pointer then quit
        Return False
    Loop    ;Otherwise sleep for .1 seconds untill the page starts loading
        Sleep,100
    Until (pwb.busy)
    Loop    ;Once it starts loading wait until completes
        Sleep,100
    Until (!pwb.busy)
    Loop    ;optional check to wait for the page to completely load
        Sleep,100
    Until (pwb.Document.Readystate = "Complete")
Return True
}


return


/*


;~ pwb := WBGet()


;~ pwb.Navigate("https://brightree.net/frmLogin.aspx?") ;Navigate to URL

while pwb.busy or pwb.ReadyState != 4 ;Wait for page to load
	Sleep, 100

;~ msgbox, the page has now loaded.

;************Pointer to Open IE Window******************
WBGet(WinTitle="ahk_class IEFrame", Svr#=1) {               ;// based on ComObjQuery docs
	static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
        , IID := "{0002DF05-0000-0000-C000-000000000046}"   ;// IID_IWebBrowserApp
;//     , IID := "{332C4427-26CB-11D0-B483-00C04FD90119}"   ;// IID_IHTMLWindow2
	SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%

	if (ErrorLevel != "FAIL") {
		lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
		if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0 {
			DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
			return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
		}
	}