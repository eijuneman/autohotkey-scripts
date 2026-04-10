#NoEnv
#SingleInstance, Force

;~ Send, {Ctrl}
CoordMode, mouse, screen
MouseGetPos, X, Y
Sleep, 1
Send, {Ctrl 3}
MouseClick, , -879, 53, ,0
MouseMove, %X%, %Y%
ExitApp