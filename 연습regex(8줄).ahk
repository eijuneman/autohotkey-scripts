#SingleInstance, FORCE
;~ <+9::


#Include, %A_ScriptDir%\ScreenCapture.ahk


WinSet, alwaysontop, on, Å¸°øµµ¾î
Space::
ToolTip,1
CoordMode, MOUSE, SCREEN
Clipboard=
Send, ^c
ClipWait
company := Clipboard
company := RegExReplace(company, "/", "")
company := RegExReplace(company, "(\r?\n)", "_")




RegExMatch(company, "(.*)_(.*)_(.*)_(.*)_(.*)_(.*)_(.*)_(.*)", company1)



MouseGetPos , X0, Y0,



Y1 := Y0 - 652
X2 := X0 + 430
Y2 := Y1 + 540


X3 := X2 + 65
X4 := X3 + 430


X5 := X4 + 65
X6 := X5 + 430


X7 := X6 + 65
X8 := X7 + 430


company1 = % company11 company12
company2 = % company13 company14
company3 = % company15 company16
company4 = % company17 company18

;~ MsgBox %company1%`n%company2%`n%company3%`n%company4%

    DIR1 = C:\Users\shwoodnew\Desktop\DoorOrder\img\ÀçÇöÇÏ´ÃÃ¢\¸ôµù\¸¶°¨\%company1%.png
    DIR2 = C:\Users\shwoodnew\Desktop\DoorOrder\img\ÀçÇöÇÏ´ÃÃ¢\¸ôµù\¸¶°¨\%company2%.png
    DIR3 = C:\Users\shwoodnew\Desktop\DoorOrder\img\ÀçÇöÇÏ´ÃÃ¢\¸ôµù\¸¶°¨\%company3%.png
    DIR4 = C:\Users\shwoodnew\Desktop\DoorOrder\img\ÀçÇöÇÏ´ÃÃ¢\¸ôµù\¸¶°¨\%company4%.png

;~ MsgBox,%company%`n%X1%`n%Y1%`n%X2%`n%Y2%`n%DIR2%
screen1 = % X0 ", " Y1 ", " X2 ", " Y2
screen2 = % X3 ", " Y1 ", " X4 ", " Y2
screen3 = % X5 ", " Y1 ", " X6 ", " Y2
screen4 = % X7 ", " Y1 ", " X8 ", " Y2
    CaptureScreen(screen1, False, DIR1)
    CaptureScreen(screen2, False, DIR2)
    CaptureScreen(screen3, False, DIR3)
    CaptureScreen(screen4, False, DIR4)

	SoundBeep,500
	ToolTip
return

;~ NumpadEnter::
;~ Send, {Enter}
;~ Sleep, 1000
;~ Send, {PrintScreen}

;~ return

esc::
ExitApp

RShift::
Reload