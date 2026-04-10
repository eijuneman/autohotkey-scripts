#SingleInstance, FORCE
받는분 = 김태준


#Include, %A_ScriptDir%\screencapture.ahk
sleep, 100

Control, choose, 8 , TfrxComboBox1, Preview


;~ return
;~ Loop,3
;~ {
;~ ControlClick, TToolBar1, Preview,,,,x183 y17
;~ Sleep, 100
;~ }
ControlClick, TToolBar1, Preview,,,,x534 y15
Sleep, 100


ControlGetText, 페이지, TEdit1, Preview
ControlClick, TToolBar1, Preview,,,,x416 y15

페이지 := 페이지 / 2
WinWait, %받는분%,
IfWinNotActive, %받는분%, , WinActivate, %받는분%,
WinWaitActive, %받는분%,


Sleep, 100
ControlFocus, RICHEDIT50W1, %받는분%
Sleep, 100
	ControlSetText, , ☏☏☏ %거래처명1% 매장출고 ☏☏☏, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 60
	ControlSetText, , %요약%, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 50

Sleep, 100

	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,

Sleep, 100
Send, {Home 3}
	ControlClick, TToolBar1, Preview,,,,x509 y15
Loop, %페이지% ; 매장출고
{
;~ Send, {PgDn 2}
	Sleep, 110
;~ CaptureScreen("361, 82, 1046, 1346", False, 0)
CaptureScreen("1294, 82, 1974, 1346", False, 0)
		sleep, 100
	WinWait, %받는분%,
	IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	WinWaitActive, %받는분%,
	Sleep, 100
	send, {Ctrl Down}v{Ctrl Up}
	sleep, 200
	Send, {Enter 2}
	sleep, 100

		sleep, 100

	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,

	Sleep, 200
	ControlClick, TToolBar1, Preview,,,,x509 y15
	Sleep, 100
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,
Sleep, 100