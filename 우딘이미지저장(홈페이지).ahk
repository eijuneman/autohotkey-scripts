#NoEnv
#SingleInstance, force
SetKeyDelay, 2
CoordMode, mouse, screen


~RButton::
{
MouseClick, r,
MouseGetPos, aX, aY
aX1 := aX + 63
aY1 := aY + 49
;~ MsgBox, % aX "`n"aY "`n"aX1 "`n"aY1
MouseMove, %aX1%, %aY1%
MouseClick, l, %aX1%, %aY1%, 0, 20

Sleep, 200
WinWait, 다른 이름으로 저장,
IfWinNotActive, 다른 이름으로 저장, , WinActivate, 다른 이름으로 저장,
WinWaitActive, 다른 이름으로 저장,
Sleep, 200
ControlSetText, Edit1,C:\Users\shwoodnew\Desktop\DoorOrder\img\우딘숲도어시트\%Clipboard%, 다른 이름으로 저장
ControlSend, Edit1, {Enter}, 다른 이름으로 저장
Sleep, 200
ControlClick, Button2, 다른 이름으로 저장
Sleep, 200

;~ Sleep, 100
	;~ Loop
	;~ {
		;~ ImageSearch, n42x, n42y, 1809, 225, 1951, 356, *50 C:\Users\shwoodnew\Desktop\자동전표저장\222.bmp
		;~ if (errorlevel = 1)
		;~ {
			;~ sleep 100
		;~ }
		;~ else if (errorlevel = 2) ; this has no matching if
		;~ {
			;~ msgbox, cant search
		;~ }
		;~ else
		;~ {
			;~ break
		;~ }
	;~ }
MouseGetPos, RX, RY

;~ MouseClick, l, %n42x%, %n42y%, 1, 0
MouseClick, l, 1882, 290, 1, 0
MouseMove, %RX%, %RY%
}
return

Esc::
Reload