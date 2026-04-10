A_GuiMargin=7
Gui, Margin, %A_GuiMargin%, %A_GuiMargin%
Gui, Add, Text, w300, Use Window Spy && hover over each button, see Button1 2 && 3, press Delete Me, then hover again...Delete Me was really deleted.
Gui, Add, Button, section xm+30 w75, Test
Gui, Add, Button, ys w75 gDeleteButton vdel , Delete Me
Gui, Add, Button, ys w75 gKeepMe, Keep Me
Gui, Show ;, w300 h100 ;, AutoSize

WM_DESTROY=0x02
WM_PAINT=0x0F
WM_CLOSE=0x10
WM_NCDESTROY=0x82
WM_PARENTNOTIFY=0x210
return

DeleteButton:
PostMessage, WM_CLOSE, , , del
;PostMessage, WM_DESTROY, , , %A_GuiControl%
;PostMessage, WM_NCDESTROY, , , %A_GuiControl%
;PostMessage, WM_PARENTNOTIFY, , , %A_GuiControl%
;PostMessage, WM_PAINT, , , %A_GuiControl%

MsgBox, %A_GuiControl%
return


KeepMe:

Gui, Add, Button, x100 ys w75 gDeleteButton, Delete Me
return



GuiEscape:
GuiClose:
ExitApp