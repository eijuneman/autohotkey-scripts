받는분 = 김태준
#Include, screencapture.ahk

	run, 일정표15.ahk, \\192.168.0.1\hdd2\일정표 최근\일정표220730
	Sleep, 100
	WinWait, 신흥목재 전산프로그램,
	IfWinNotActive, 신흥목재 전산프로그램, , WinActivate, 신흥목재 전산프로그램,
	WinWaitActive, 신흥목재 전산프로그램,
	Sleep, 100

ControlSend, ,{Shift down}{Tab}{Shift Up}{Right 3}, 신흥목재 전산프로그램

	Sleep, 10000
	CaptureScreen("12, 67, 1271, 743", False, 0)
	sleep, 100
	WinWait, %받는분%,
	IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	WinWaitActive, %받는분%,
	Sleep, 100
	send, {Ctrl Down}v{Ctrl Up}
	sleep, 100
	Send, {Enter 2}
	sleep, 100



ControlSend, ,{Shift down}{Tab}{Shift Up}{Right 1}, 신흥목재 전산프로그램

	Sleep, 5000
	CaptureScreen("12, 67, 1271, 743", False, 0)
	sleep, 100
	WinWait, %받는분%,
	IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	WinWaitActive, %받는분%,
	Sleep, 100
	send, {Ctrl Down}v{Ctrl Up}
	sleep, 100
	Send, {Enter 2}
	sleep, 100

winkill, 신흥목재 전산프로그램
Sleep.1000

return