Gui, +AlwaysOnTop -SysMenu
Gui, Add, Button, x16 y23 w80 h80 gA, A
Gui, Add, Button, x106 y23 w80 h80 gB, B
Gui, Add, Button, x196 y23 w80 h80 gC, C
Gui, Add, Button, x286 y23 w80 h80 gD, 매출
; Generated using SmartGUI Creator for SciTE
Gui, Show, w388 h126, Untitled GUI
return

Numpad1::
A:
WinActivate, ahk_exe JedaeroM.exe
Send, {F3}
Control, Choose, 2 , TRzDBComboBox3, ahk_class TfmMain
Send, {F5}{ShiftDown}{Tab 3}{ShiftUp}{Down}
Sleep, 50

return

Numpad2::
B:
WinActivate, ahk_exe JedaeroM.exe
Send, {F3}
Control, Choose, 3 , TRzDBComboBox3, ahk_class TfmMain
Send, {F5}{ShiftDown}{Tab 3}{ShiftUp}{Down}
Sleep, 50
return

Numpad3::
C:
WinActivate, ahk_exe JedaeroM.exe
Send, {F3}
Control, Choose, 4 , TRzDBComboBox3, ahk_class TfmMain
Send, {F5}{ShiftDown}{Tab 3}{ShiftUp}{Down}
Sleep, 50
return

Numpad4::
D:
WinActivate, ahk_exe JedaeroM.exe
Send, {F3}
Control, Choose, 1 , TRzDBComboBox3, ahk_class TfmMain
Send, {F5}{ShiftDown}{Tab 3}{ShiftUp}{Down}
Sleep, 50
return




Pause::
GuiClose:
ExitApp