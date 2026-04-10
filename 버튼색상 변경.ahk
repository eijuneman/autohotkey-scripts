#NoTrayIcon
#SingleInstance, force

Gui, Add, Button, x192 y59 w90 h80 vA gA, A
Gui, Add, Button, x+20 y59 w90 h80 vb gb, B
Gui, Add, Button, x+20 y59 w90 h80 vc gc, C
Gui, Add, Edit, x32 y59 w90 h40 , Edit
Gui, Add, Edit, x32 y99 w90 h40 , Edit
; Generated using SmartGUI Creator for SciTE
Gui, Show, x2000 w479 h379, example
return

GuiClose:
ExitApp


A:
CoordMode, mouse, Client

GuiControlGet, Apos, Pos , A
;~ MsgBox, %AposX%`n%AposY%`n%AposW%`n%AposH%
;~ MouseMove, %AposX%, %AposY%
;~ MsgBox %X%
AposX := AposX - 5
AposY := AposY - 5
AposW := AposW + 10
AposH := AposH + 10


;~ MsgBox %AposY%
Gui, Add, Picture, x%AposX% y%AposY% w%AposW% h%AposH% vA1, %A_Desktop%\red.png


return



B:
GuiControl, Move, A1, x10 y10 w0 h0


return

C:
;~ Loop, 2
;~ {
GuiControl, Move, A1, x%AposX% y%AposY% w%AposW% h%AposH%
GuiControl, Focus, A
;~ MouseGetPos, mx, my
;~ AposX := AposX + 50
;~ AposY := AposY + 50
;~ MouseMove, %AposX%, %AposY% ,0
;~ AposX := AposX - 50
;~ AposY := AposY - 50

;~ GuiControl, Focus, A
;~ Sleep, 10
;~ }
;~ MouseMove, %mx%, %my% ,0
return



