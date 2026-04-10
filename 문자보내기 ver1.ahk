#NoEnv
SetKeyDelay, 1
CoordMode, Mouse, SCREEN

path := A_ScriptDir . "\문자발송리스트.xlsx"
MsgBox, % path

XL := ComObjCreate("Excel.Application")
XL.Workbooks.Open(path, 3, 0)
XL.Visible := false

;~ 행끝 := XL.sheets("sheet1").UsedRange.Rows.Count
행 = 78
Loop, 238
{
	행 ++
	값 := XL.sheets("sheet1").Range("B" 행).value




	MouseClick,, -821, 153, , 0,
	Sleep, 1000
	;~ MouseClick,, -688, 144, , 0,
	Send, %값%{Enter}
	Sleep, 1000
	Send, {Tab 2}[신흥목재 휴가알림]{Shift Down}{Enter}{Shift UP}- 휴가일자 : 08월03일(목) ~ 08월06일(일){Shift Down}{Enter}{Shift UP}- 정상영업 : 08월07일(월) ~ {Shift Down}{Enter}{Shift UP}감사합니다{Enter}
	Sleep, 1000
	MouseClick,, -471, 706, , 0,
	Sleep, 2000

}
return


Esc::
ExitApp