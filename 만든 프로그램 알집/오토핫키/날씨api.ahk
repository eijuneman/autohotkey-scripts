#NoEnv

#Include, screencapture.ahk
Run, msedge.exe "https://www.weather.go.kr/w/weather/forecast/short-term.do#dong/4413125000"
Sleep, 1000
WinWait, ahk_exe msedge.exe,
IfWinNotActive, ahk_exe msedge.exe, , WinActivate, ahk_exe msedge.exe,
WinWaitActive, ahk_exe msedge.exe,

WinMove, ahk_exe msedge.exe, ,1, 1
WinMaximize, ahk_exe msedge.exe
Sleep, 3000


	CaptureScreen("456, 355, 1665, 588", false, "\\192.168.0.1\hdd2\일정표 최근\일정표220730\wd.png", 100)

WinKill, ahk_exe msedge.exe,
	run, \\192.168.0.1\hdd2\일정표 최근\일정표220730\단백프롬프터.ahk



	return