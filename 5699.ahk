run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M, Max

WinWait, ahk_class TfmLogin, 
IfWinNotActive, ahk_class TfmLogin, , WinActivate, ahk_class TfmLogin, 
WinWaitActive, ahk_class TfmLogin, 
Sleep, 100	

Send, kk0404
Sleep, 100
send, {Enter}
Sleep, 1000
WinActivate, ahk_exe JedaeroM.exe

WinWait, ahk_exe JedaeroM.exe, 
IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe, 
WinWaitActive, ahk_exe JedaeroM.exe, 
Sleep, 100	



WinGet, OutputVar, PID , ahk_exe JedaeroM.exe
MsgBox, %OutputVar%