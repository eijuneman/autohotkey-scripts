#SingleInstance, Force	; prevent unnecessary errors in this case, only one instance can run
#NoEnv	 ; performance optimization
SetBatchLines, -1	 ; performance optimization for loops

	;Build the first ListView (Food)
	Gui, Add, ListView, h200 gLVglabel vLVFood HwndLVFood, Cellblock A (Drag&Drop) 		; First ListView. Use G-label for dragging. The Hwnd is needed to get the ID of the control, to determine source/target.
	LV_Add("", "Apple")
	LV_Add("", "Banana")
	LV_Add("", "Bread")
	LV_Add("", "Carrot")
	LV_Add("", "Honey")
	LV_Add("", "Meat")
	;Build the second ListView (Animals)
	Gui, Add, ListView, x+ h200 gLVglabel vLVAnimals HwndLVAnimals, Cellblock B (Drag&Drop) 	; Second ListView. All ListViews have same requirements: g-label and HwndVariable
	LV_Add("", "Bear")
	LV_Add("", "Bird")
	LV_Add("", "Elephant")
	LV_Add("", "Monkey")
	LV_Add("", "Rabbit")
	LV_Add("", "Tiger")
	Gui, Add, ListView, x+ h200 gLVglabel vLVSolitary HwndLVSolitary, Solitary (Drag&Drop)	; Third ListView (SysListView323) empty.
	Gui, Add, ListView, x+ h200 gLVglabel vLVFreedom HwndLVFreedom, Freedom (Drag&Drop)	; Fourth ListView, no one can be dragged here.
	allowed_list = LVFood,LVAnimals,LVSolitary
	Gui, Show,, Zoo Prison ListView Drag & Drop ; Show the Gui
Return
;_________________________________________________________________________________________________________
GuiClose:
ExitApp
;_________________________________________________________________________________________________________
LVglabel:
	If A_GuiEvent = D ; Dragging is initiated
	{
		source := A_GuiControl
		GUI, ListView, %source%	; select originating listview
		LV_GetText(draggedrow,A_EventInfo,1) ; get the information from the dragged row
		SetTimer, DDToolTip, 25
		gosub LVdrag
	}
	If A_GuiControlEvent = DoubleClick ; Double clicking a food item
		return
Return
LVdrag:
	target := LV_DragAndDrop() ; Start the drag function. When released it will return the location (ClassNN) where to drop
	guicontrolget, target_name, name, %target%	; gets the name associated with the target Hwnd
	SetTimer, DDToolTip, Off
	ToolTip
	if ( source = target_name )	; prevent a row to be dragged onto it's own listview
		return
	if target_name not in %allowed_list%	; allowed_list contains variables where the row is allowed to be dragged
		return
	nr_col := LV_GetCount("Column")
	
	loop, %nr_col%
	{
		LV_GetText(col%A_Index%,A_EventInfo,A_Index) ; get the information from the dragged row
		LV_ModifyCol(A_Index,"Autohdr Sort")	; resize columns
		columns .= "col" . A_Index . ","
	}
	LV_Delete(A_EventInfo) ; delete the dragged row from the originating listview
	
	GUI, ListView, %target%	; select target listview		
	LV_ADD("",col1,col2,col3,col4)	; add the dragged row to the new listview		[color=#FF0000]< how do I get this to be more dynamic?[/color]
	loop, %nr_col%
		LV_ModifyCol(A_Index,"Autohdr Sort")	; resize columns
return
DDToolTip:
	ToolTip, %draggedrow% ; Shows the dragged item next to the mousepointer
Return
Killtip:
	SetTimer, DDToolTip, Off
	ToolTip
Return
LV_DragAndDrop()
{
	While GetKeyState("LButton")
	{
		MouseGetPos, mx,my
		VarSetCapacity( tvht, 16, 0 )
		NumPut( mx, tvht, 0, "int" ), NumPut( my-tvy, tvht, 4, "int" )
		Sleep, 50
	}
	MouseGetPos,,,,control
	Return control
}