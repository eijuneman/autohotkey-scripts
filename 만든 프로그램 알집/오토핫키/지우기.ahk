#SingleInstance, force

;~ left::F4
;~ Down::Left
;~ Right::Enter
Sleep, 2000

Loop, 450
{
	Send, {F4}
	Sleep,100
	Send, {left}
	Sleep, 100
	Send, {enter}
}
return

	esc::
	ExitApp
