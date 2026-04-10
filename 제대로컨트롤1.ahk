#SingleInstance, force


StartDate = 20240617     ; 날 짜 입 력 하 세 요

Loop, 3
{


	loop, 3
	{
		Process, close, EXCEL.EXE
		winkill, ahk_class XLMAIN
		WinKill, ahk_exe EXCEL.EXE
		;~ WinKill, ahk_exe JedaeroM.exe
	}


다시:
{
	{
		StartDate += -1, Days
		FormatTime, Date, % StartDate, yyyy-MM-dd
		FormatTime, Date2, % StartDate, ddd
		MsgBox, , , %A_Index%`n%Date%`n%Date2%, 1
	}

/*
Sleep, 100
run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M, Max
WinWait, ahk_class TfmLogin,
IfWinNotActive, ahk_class TfmLogin, , WinActivate, ahk_class TfmLogin,
WinWaitActive, ahk_class TfmLogin,
Sleep, 100
Send, kk0404
Sleep, 100
send, {Enter}
Sleep, 1000
WinActivate, ahk_exe JedaeroM.exe



	*/

;~ {
    ;~ ControlClick, TRzButton4, ahk_class TfmMain
    ;~ Sleep, 500
    ;~ ControlClick, TRzButton4, ahk_class TfmMain
    ;~ Sleep, 500
    ;~ Control, choose, 1, TRzComboBox3, ahk_class TfmMain
;~ }
    ;~ ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x39 y25
    ;~ Sleep, 3000
    ;~ ControlClick, TAdvToolBar3, ahk_class TfmMain,,,,x173 y18
    ;~ Sleep, 1000



ControlClick, TAdvToolBar3, ahk_class TfmMain,,,,x221 y22
    Sleep, 1000


    WinWait, ahk_exe JedaeroM.exe,
    IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
    WinWaitActive, ahk_exe JedaeroM.exe,
    Sleep, 100
    send, {LAlt}{Enter}{Left 3}{Down 5}{Enter}
    Sleep, 1000



if(Date2 = "일"){
}

else
{
ControlSend, TRzDateTimeEdit2, {del 20}{Backspace 20}%Date%, ahk_class TfmMain
ControlSend, TRzDateTimeEdit1, {del 20}{Backspace 20}%Date%, ahk_class TfmMain

ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x32 y14
Sleep, 2000
ControlClick, TAdvToolBar3, ahk_class TfmMain,,,,x157 y13
Sleep, 4000




	Loop
	{
		Sleep, 500

        if WinExist("통합 문서1 - Excel")
        {
			Sleep, 500
            try { ; 이미 활성화된 Excel 인스턴스 가져오기

				XL := ComObjActive("Excel.Application")
				XL.Visible:=false


            } catch {
                ;~ MsgBox, Excel 인스턴스를 찾을 수 없습니다.
                ;~ ExitApp
            }
				XL1 := XL.ActiveWorkbook
				XL2 := XL.ActiveSheet

            Loop
            {
                initialRowCount := currentRowCount
                Sleep, 1000
                currentRowCount := XL2.UsedRange.Rows.Count
                if(currentRowCount = "0")
                {
                        ToolTip, Append 작업중.%Date%`n%Date2% %A_Index%번째 현재 행 갯수0: %currentRowCount%
                }
                else
                {
                    if (currentRowCount = initialRowCount) {
                        ToolTip, Append 작업이 완료되었습니다. 현재 행 갯수1: %currentRowCount%

                        break
                    }
                    else
                    {
                        ToolTip, Append 작업중.%Date%`n%Date2% %A_Index%번째 현재 행 갯수2: %currentRowCount%
                    }
                }
            }
			break
		}
		else{
			if WinExist("Warning"){
				ControlClick, Tbutton1, Warning
				Sleep, 2000
				goto, 다시
			}
			else
			{
			}
		}

	}

시점재고 := XL2.range("S2").Value
매출 := XL2.range("U2").Value
반입 := XL2.range("V2").Value
매입 := XL2.range("W2").Value
반출 := XL2.range("X2").Value

시점재고 := Round(시점재고)
매출 := Round(매출)
반입 := Round(반입)
매입 := Round(매입)
반출 := Round(반출)

/*
s 시점재고
U 매출
V 반입(-매출)
W 매입
X 반출(-매입)
*/

;~ XL.CLose(false)

;~ MsgBox, 시점재고:%시점재고%`n매출:%매출%`n반입:%반입%`n매입:%매입%`n반출:%반출%



BookName:= A_WorkingDir . "\제대로로우데이터\" Date ".xlsx"

XL1.SaveAs(BookName) ;'bookname' is a variable with the path and name of the file you desire
XL_Workbook := XL.Workbooks.Open(BookName) ;handle to specific workbook
XL_Workbook.Save()
;~ px1.Visible := True
XL.ActiveWorkBook.Close
XL.Quit
ToolTip,
MsgBox, , ,% Date "`n" A_Index "번째 끝났습니다", 1
;~ return
Sleep, 2000


Loop
{
	if FileExist(BookName){
		loop, 2
		{
			Process, close, EXCEL.EXE
			winkill, ahk_class XLMAIN
			WinKill, ahk_exe EXCEL.EXE
		}


		break
	}
	else{
	}
}

;~ Process, close, JedaeroM.exe
Sleep, 1000
/*
	Loop
	{
        if WinExist("통합 문서1 - Excel")
        {

            try { ; 이미 활성화된 Excel 인스턴스 가져오기

				XL := ComObjCreate("Excel.Application")
				XL.Visible:=false


            } catch {
                ;~ MsgBox, Excel 인스턴스를 찾을 수 없습니다.
                ;~ ExitApp
            }
				XL := XL.ActiveWorkbook
				XL1 := XL.ActiveSheet

            Loop
            {
                initialRowCount := currentRowCount
                Sleep, 2000
                currentRowCount := XL1.UsedRange.Rows.Count
                if(currentRowCount = "0")
                {
                        ToolTip, Append 작업중. 현재 행 갯수0: %currentRowCount%
                }
                else
                {
                    if (currentRowCount = initialRowCount) {
                        ToolTip, Append 작업이 완료되었습니다. 현재 행 갯수1: %currentRowCount%

                        break
                    }
                    else
                    {
                        ToolTip, Append 작업중. 현재 행 갯수2: %currentRowCount%
                    }
                }
            }
			break
		}
		else{
		}

	}
*/
}

}
}
