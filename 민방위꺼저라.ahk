#NoEnv
#SingleInstance, Off
;~ Process, Priority,, High
#SingleInstance, Force
;~ #MaxMem 512  ; that's a large chunk of memory for a script
;~ SetBatchLines, -1  ; affects CPU utilization... script will run at max speed
;~ ListLines Off  ; helps with speed

;~ DetectHiddenText, On
;~ DetectHiddenWindows, On
;~ SetControlDelay, 1
;~ SetWinDelay, 1
;~ SetKeyDelay, 1
;~ SetMouseDelay, 1

내용 = 전표정리

FormatTime, date, YYYYMMDDHH24MISS, yyyy-MM-dd

		A = 1

;~ Loop, Files, \\192.168.0.1\hdd2\일정표 최근\일정표220730\사무루틴\*U예.csv



Loop, \\192.168.0.1\hdd2\일정표 최근\일정표220730\사무루틴\*U예.CSV
    FileList .= A_LoopFileName "`n"
Sort, FileList,   ; R 옵션은 역순으로 정렬합니다. 다른 옵션은 Sort를 참조하십시오.
Loop, parse, FileList, `n
{
RegExMatch(A_LoopField, "2_P(.*)_R(.*)_S(.*)_T(.*)_U예.CSV", output)

;~ MsgBox, %A_LoopField%`n%output1%`n%output2%`n%output3%`n%output4%

;~ MsgBox, % A_Index
	IF (output1 = date)
	{

		Random, rand, 100000, 999999
		Random, randX, 200, 1700
		Random, randY, 100, 900



		Gui, %A%:Destroy
		Gui, %A%:Default
		Gui, %A%:-SysMenu
		WinSet, Style, +0x20000000,
		Gui, %A%:+alwaysontop

		Gui, %A%:Font, S25 CDefault W700, Malgun Gothic
		;~ Gui, Color, FcFcFc                                  |             |             |               |             |             |             |             |             |
		;~ Gui, %output3%:Add, Tab3, x0 y0 w1281 h731 Background0xFF00FF grefreshtab1 vrefreshtab, 출고지시서`   |매입/발주`    |상품정보`     ` |사무 루틴`    |현장 루틴`    |수동 루틴`    |일일재고파악|
		;~ Gui, %output3%:Tab, 출고지시서`   ,,
		;~ Gui, %output3%:Add, GroupBox, x10 y30 w1260 h690, ; [ 사무 루틴   ]
		;~ Gui, %output3%:Font, S13 CDefault W700, Malgun Gothic
		Gui, %A%:Add, Text, x10 y10 w250 h55 , %output3%

		Gui, %A%:Font, S20 Cred W700, Malgun Gothic
		Gui, %A%:Add, Text, y+10 w250 h55 , %output4%
		Gui, %A%:Font, S13 CDefault W700, Malgun Gothic
		gui, %A%:add, edit, y+5 w140 h25 ,
		gui, %A%:add, button, x+5 w80 h25 g해제, 해제하기
		gui, %A%:show, x%randX% y%randY%, 해제 password : %rand%

		;~ ComObjCreate("SAPI.SpVoice").Speak(내용 "하세요")
		;~ Sleep, 1000
		A++
	}
	else
	{
	}
}

return






해제:
{
	gui, submit, nohide

	WinGetTitle, OutputVar
	RegExMatch(OutputVar, "해제 password : (.*)", output)
	ControlGetText, 텍스트, edit1,
	;~ MsgBox, 1%output1%`n2%텍스트%
	if (output1 = 텍스트)
	{
		winkill, %OutputVar%
	}
	else
	{
		MsgBox, 262160, , 다시 시도하세요
	}

}
return