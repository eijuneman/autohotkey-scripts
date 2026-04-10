SetKeyDelay, -1
WinWait, ahk_exe viewer.exe,
	IfWinNotActive, ahk_exe viewer.exe, , WinActivate, ahk_exe viewer.exe,
	WinWaitActive, ahk_exe viewer.exe,
;~ Sleep, 1000
;~ Control, Tableft , 0, SysTabControl321, ahk_exe viewer.exe;~ Control, Tableft , 0, SysTabControl321, ahk_exe viewer.exe
;~ Sleep, 1000
SendMessage, 0x1330, 3,, SysTabControl321, ahk_exe viewer.exe  ; 0x1330은 TCM_SETCURFOCUS입니다.
Sleep 0  ; 이 줄과 다음 줄은 어떤 탭 콘트롤에는 꼭 필요합니다.
SendMessage, 0x130C, 3,, SysTabControl321, ahk_exe viewer.exe  ; 0x130C은 TCM_SETCURSEL입니다.
Sleep 100
;~ Control, Tableft , 2, SysTabControl321, ahk_exe viewer.exe
;~ Sleep 0
;~ Control, TABRIGHT, 2, SysTabControl321, ahk_exe viewer.exe
dir = \\192.168.0.1\hdd1\일정표 최근\일정표220730\3dtab.png
Sleep 0
ImageSearch, 3x, 3y, 0, 0, 300, 1920, %dir%
Sleep 100
MouseGetPos, nx, ny
MouseClick, , %3x%, %3y%, ,  0,
MouseMove, %nx%, %ny%, 0
return


;~ ControlSend, , {PgDn}, ahk_exe viewer.exe
;~ ControlSend, , {PgUp}, ahk_exe viewer.exe
