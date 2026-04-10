Gui, Add, Button, x16 y23 w80 h80 gA, A
Gui, Add, Button, x106 y23 w80 h80 gB, B
Gui, Add, Button, x196 y23 w80 h80 gC, C
Gui, Add, Button, x286 y23 w80 h80 gD, 매출
; Generated using SmartGUI Creator for SciTE
Gui, Show, w388 h126, Untitled GUI
return

A:
Send, {F3}
ControlClick, TRzDBComboBox3, ahk_class TfmMain, A단가
return

B:

C:

D:


GuiClose:
ExitApp
