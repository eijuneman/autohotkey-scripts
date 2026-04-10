#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; Simple Digital Clock

; first create the empty gui
Gui, font, bold            ; bold letters look better
Gui, add, text, center w90 r1 vdisplay,
gui, add, text, center w90 r1 vdisplayUTC,
Gui, show, autosize, Clock

; now set the display
Gosub, currentTime         ; start time display immediately
SetTimer, currentTime, 500   ; and update it every 500 milliseconds
Return

currentTime:
GuiControl,, display, %A_Hour%:%A_Min%:%A_Sec%
Return

; close the gui with Escape or usual method
GuiEscape:
GuiClose:
ExitApp