#NoEnv
SetKeyDelay, 1
;~ SetMouseDelay, 50
;~ SetWinDelay, 50
CoordMode, mouse, Screen

중분류 = 13
소분류 = 0
;~ MsgBox, % 중분류

		WinWait, ahk_class TfmMain,
	IfWinNotActive, ahk_class TfmMain, , WinActivate, ahk_class TfmMain,
	WinWaitActive, ahk_class TfmMain,
;~ ControlSend, TDBGridEh1, {down}, ahk_class TfmMain
ControlSend, TDBGridEh1, {F3}, ahk_class TfmMain
ControlClick, TRzBitBtn1, ahk_class TfmMain
Sleep, 50
	WinWait, ahk_class TfmJeBulu,
	IfWinNotActive, ahk_class TfmJeBulu, , WinActivate, ahk_class TfmJeBulu,
	WinWaitActive, ahk_class TfmJeBulu,
	Sleep, 50
ControlClick , TDBGridEh1, ahk_class TfmJeBulu,,,,x113 y34
Sleep, 50
ControlSend, TDBGridEh1, {down %중분류%}, ahk_class TfmJeBulu      ;;;;;;;중분류
Sleep, 50
ControlClick , TDBGridEh2, ahk_class TfmJeBulu,,,,x113 y34
Sleep, 50
ControlSend, TDBGridEh2, {down %소분류%}, ahk_class TfmJeBulu ;; ;;;;;;;소분류
Sleep, 50

ControlSend, TAdvToolBar1, {F6}, ahk_class TfmJeBulu


Loop,
{

	WinWait, ahk_class TfmMain,
	IfWinNotActive, ahk_class TfmMain, , WinActivate, ahk_class TfmMain,
	WinWaitActive, ahk_class TfmMain,
ControlSend, TDBGridEh1, {down}, ahk_class TfmMain
ControlSend, TDBGridEh1, {F3}, ahk_class TfmMain
ControlClick, TRzBitBtn1, ahk_class TfmMain
Sleep, 50
	WinWait, ahk_class TfmJeBulu,
	IfWinNotActive, ahk_class TfmJeBulu, , WinActivate, ahk_class TfmJeBulu,
	WinWaitActive, ahk_class TfmJeBulu,
	Sleep, 50
ControlClick , TDBGridEh1, ahk_class TfmJeBulu,,,,x113 y34
Sleep, 50
ControlSend, TDBGridEh1, {down %중분류%}, ahk_class TfmJeBulu      ;;;;;;;중분류
Sleep, 50
ControlClick , TDBGridEh2, ahk_class TfmJeBulu,,,,x113 y34
Sleep, 50
ControlSend, TDBGridEh2, {down %소분류%}, ahk_class TfmJeBulu ;; ;;;;;;;소분류
Sleep, 50

ControlSend, TAdvToolBar1, {F6}, ahk_class TfmJeBulu

Sleep, 50
}


break::
ExitApp


return
