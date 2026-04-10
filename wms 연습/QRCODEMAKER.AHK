#NoEnv
#SingleInstance, Force
#Include, %A_ScriptDir%\screencapture.ahk
CoordMode, MOUSE, SCREEN
;~ NEW::
;~ NumpadNEW::
SetKeyDelay, 2


NEW:
Clipboard=
{
	Sleep,100
	Send, {Tab}
	Sleep,100
	Send, {Enter}
	Sleep, 1000
	CaptureScreen("-1097, 766, -654, 1188", False, 0)
	SoundBeep, 500
}

return

Numpad0::

Send, {Backspace 2}0-

gosub, NEW
return

Numpad1::
Send, {Backspace 2}1-
gosub, NEW
return

Numpad2::
Send, {Backspace 2}2-
gosub, NEW
return

Numpad3::
Send, {Backspace 2}3-
gosub, NEW
return
Numpad4::
Send, {Backspace 2}4-
gosub, NEW
return

Numpad5::
Send, {Backspace 2}5-
gosub, NEW
return

Numpad6::
Send, {Backspace 2}6-
gosub, NEW
return
Numpad7::

Send, {Backspace 2}7-
gosub, NEW
return

Numpad8::
Send, {Backspace 2}8-
gosub, NEW
return

Numpad9::

Send, {Backspace 2}9-
gosub, NEW
return

<^v::
Send, {Ctrl Down}v{Ctrl Up}
;~ MouseGetPos, aX, bY
;~ MouseClick, , 1877, 579

;~ MouseMove, %aX%, %bY%
return
