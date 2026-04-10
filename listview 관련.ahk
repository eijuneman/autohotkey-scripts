#NoEnv
#SingleInstance, Force
#Include,Class_LV_Rows.ahk

SendMode Input                ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

 F1=%a_scriptdir%\LV_Test21.txt

 e4x=
 (Ltrim Join`r`n
 Calc;calc.exe
 Notepad;notepad.exe
 ProgramFiles;%a_programfiles%
 )

ifnotexist,%f1%
  fileappend,%e4x%,%f1%


Gui,1: Default
Gui,1: Font,CDefault,Fixedsys


Menu, EditMenu, Add, Copy`tCtrl+C, Copy
Menu, EditMenu, Add, Cut`tCtrl+X, Cut
Menu, EditMenu, Add, Paste`tCtrl+V, Paste
Menu, EditMenu, Add, Delete`tDelete, Delete
Menu, EditMenu, Add
Menu, EditMenu, Add, Undo`tCtrl+Z, Undo
Menu, EditMenu, Add, Redo`tCtrl+Y, Redo
Menu, EditMenu, Add
Menu, EditMenu, Add, Move Up`tCtrl+Up, MoveUp
Menu, EditMenu, Add, Move Down`tCtrl+Down, MoveDown
Menu, MenuBar, Add, Edit, :EditMenu
Gui,1: Menu, MenuBar

Gui,1: Add , ListView, AltSubmit vLv1 gLVLabel x10 w320 r8 LV0x10000 backgroundgray +grid ,Name|Fullpath
; Create a handle for the History of first ListView.
HistoryLv1 := New LV_Rows()
HistoryLv1.Add()

LV_ModifyCol(1,200)
LV_ModifyCol(2,300)

gosub,fill
Gui,1: Show,x0 y0 h160 w350,TEST
return
;--------

Guiclose:
exitapp
;--------

fill:
Gui,1:submit,nohide
;fileread,e4x,%f1%                ;-  ????  if I read file how to manage .....
Loop, Parse,e4x, `n, `r
 {
 StringSplit,C, A_LoopField, `;
    LV_Add("",c1,c2)
 }
return
;--------

; Context Menu.
GuiContextMenu:
If !InStr(A_GuiControl, "LV")
   return
Menu, EditMenu, Show, %A_GuiX%, %A_GuiY%
return


; ListViews G-Label.
LVLabel:
Gui,1: ListView, %A_GuiControl%   ; Sets selected ListView as Default.
ActiveList := A_GuiControl        ; Sets a variable to define the active list for History entries.

; Detect Drag event.
If A_GuiEvent = D
{
LV_Rows.Drag()            ; Call Drag function.
History%ActiveList%.Add() ; Add an entry in History.
}
return

Copy:
LV_Rows.Copy()            ; Copy active List selected rows.
return

Cut:
LV_Rows.Cut()             ; Cut active List selected rows.
History%ActiveList%.Add() ; Add an entry in History.
return

Paste:
If (LV_Rows.Paste())      ; Paste contents from memory.
History%ActiveList%.Add() ; Add an entry in History if Paste had data.
return

Delete:
If (LV_Rows.Delete())     ; Deletes selected rows.
History%ActiveList%.Add() ; Add an entry in History if there are rows selected.
return

MoveUp:
If (LV_Rows.Move(1))      ; Move selected rows up.
History%ActiveList%.Add() ; Add an entry in History if there are rows selected.
return

MoveDown:
If (LV_Rows.Move())        ; Move selected rows down.
History%ActiveList%.Add()  ; Add an entry in History if there are rows selected.
return

Undo:
GuiControl,1: -Redraw, %ActiveList%
History%ActiveList%.Undo() ; Go to previous History entry.
GuiControl,1: +Redraw, %ActiveList%
return

Redo:
GuiControl,1: -Redraw, %ActiveList%
History%ActiveList%.Redo() ; Go to next History entry.
GuiControl,1: +Redraw, %ActiveList%
return
;=============================================================