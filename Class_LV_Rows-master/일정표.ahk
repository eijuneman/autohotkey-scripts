#SingleInstance, Force	; prevent unnecessary errors in this case, only one instance can run
#NoEnv	 ; performance optimization
#Include, Class_LV_Rows.ahk
#Include, csv.ahk
SetBatchLines, -1	 ; performance optimization for loops

SetTimer, timer, 10
SetTimer, autosave, 60000

SetTimer, title, 3000


	받는분 = 신흥목재카톡방

Gui,add, GroupBox, x-900 y236 w900 h1363, 1


Gui, Font, S13 CDefault, Malgun Gothic
Menu, EditMenu, Add, Add`tCtrl+A, Add
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
Menu, EditMenu, Add, Save`tCtrl+S, Save

Menu, MenuBar, Add, 편집, :EditMenu
Gui, Menu, MenuBar





	;Build the first ListView (Food)

			Gui, add, text,  x10 y10 w200 h30 , 출고날짜
			Gui, add, text,  x+10 w200, 출고시간
			Gui, add, text,  x+10 w200, 거래처
			Gui, add, text,  x+10 w200,	출고장소
			
			Gui, add, text,  x10 y65 w410 h30 , 출고품목
			Gui, add, text,  x+10 w410, 비고 특징







			Gui, add, edit, -VScroll x10 y30 w200 h30 , TRzDBDateTimeEdit1 날짜
			Gui, add, edit, -VScroll x+10 w200, TRzDBEdit12 시간
			Gui, add, edit, -VScroll x+10 w200, TRzEdit8, 거래처
			Gui, add, edit, -VScroll x+10 w240,	TRzDBEdit13 매장출고
			
			Gui, add, edit, -VScroll x10 y85 w410 h30 , TDBGridInplaceEdit1, 내용
			Gui, add, edit, -VScroll x+10 w450, TRzDBEdit11 비고


			gui, add, button,  x10 y+10 w95 h50 gsave , 저장
			gui, add, button,  x+10 w95 h50 gAdd , 일정추가
			gui, add, button,  x+10 w95 h50 gsend , 카톡발송

			gui, add, button,  x+10 w95 h50 gre , 재시작
			gui, add, button,  x+10 w95 h50 garrow , 묶음화살표
			gui, add, button,  x+10 w95 h50 gdirect , 직접입력

			Gui, Font, S20 w700 CDefault, Malgun Gothic
			;~ Gui, add, text, x10 y+20 w870 h40 , FormatTime, 내
			Gui, add, edit, -VScroll x10 y+30 w870 h40 Center ,
	
	
	Gui, Font, S16 w400 CDefault, Malgun Gothic


	
	
	
	Gui, Add, ListView, x10 y+20 w869 h270 gLVglabel vLV1 HwndLV1 NoSortHdr BackgroundFFD7BA -ReadOnly, ※ 채과장님 배송 ※  		; First ListView. Use G-label for dragging. The Hwnd is needed to get the ID of the control, to determine source/target.

	FileRead, data, csv\LV1.csv
	Gui, ListView, vLV1
	loop, parse, data, `n
	{
	x:=[]
	loop, parse, A_LoopField, CSV
	x.Insert(A_LoopField)
	LV_Add("", x*)
	}




	;Build the second ListView (Animals)
	Gui, Add, ListView, y+10 w869 h270 gLVglabel vLV2 HwndLV2 NoSortHdr BackgroundD8E2DC -ReadOnly, ※ 여기사님 배송 ※  	; Second ListView. All ListViews have same requirements: g-label and HwndVariable

	FileRead, data, csv\LV2.csv
	Gui, ListView, vLV2
	loop, parse, data, `n
	{
	x:=[]
	loop, parse, A_LoopField, CSV
	x.Insert(A_LoopField)
	LV_Add("", x*)
	}


	Gui, Add, ListView, y+10 w869 h270 gLVglabel vLV3 HwndLV3 NoSortHdr BackgroundF8EDEB -ReadOnly, ※ 매장출고 ※ 	; Third ListView (SysListView323) empty.

	FileRead, data, csv\LV3.csv
	Gui, ListView, vLV3
	loop, parse, data, `n
	{
	x:=[]
	loop, parse, A_LoopField, CSV
	x.Insert(A_LoopField)
	LV_Add("", x*)
	}



	Gui, Add, ListView, y+30 w869 h500 gLVglabel vLV4 HwndLV4 NoSortHdr BackgroundECE4DB -ReadOnly, ※ 주문제,견적중,출고예정 ※ 	; Fourth ListView, no one can be dragged here.

	FileRead, data, csv\LV4.csv
	Gui, ListView, vLV4
	loop, parse, data, `n
	{
	x:=[]
	loop, parse, A_LoopField, CSV
	x.Insert(A_LoopField)
	LV_Add("", x*)
	}





	allowed_list = LV1,LV2,LV3,LV4
	
	HistoryLv1 := New LV_Rows()
	HistoryLv1.Add()

		
	Gui, add, edit, -VScroll x660 y124 w220 h47 , 
	
	Gui, Show,x1920 y0 h1600 w900, 일정표 ; Show the Gui
	
	
	
	
	
	
	
	
	
	
	
Return
;_________________________________________________________________________________________________________
GuiClose:
ExitApp
;_________________________________________________________________________________________________________
LVglabel:
Gui, ListView, %A_GuiControl%   ; Sets selected ListView as Default.
ActiveList := A_GuiControl    
	If A_GuiEvent = D ; Dragging is initiated
	{
		source := A_GuiControl
		GUI, ListView, %source%	; select originating listview
		LV_GetText(draggedrow,A_EventInfo,1) ; get the information from the dragged row
		LV_Rows.Drag()            ; Call Drag function.
		History%ActiveList%.Add() ; Add an entry in History.
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
GuiContextMenu:
If !InStr(A_GuiControl, "LV")
   return
Menu, EditMenu, Show, %A_GuiX%, %A_GuiY%
return


; ListViews G-Label.


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
GuiControl, -Redraw, %ActiveList%
History%ActiveList%.Undo() ; Go to previous History entry.
GuiControl, +Redraw, %ActiveList%
return

Redo:
GuiControl, -Redraw, %ActiveList%
History%ActiveList%.Redo() ; Go to next History entry.
GuiControl, +Redraw, %ActiveList%
return






timer:
{
	
	ControlGetText, TRzDBDateTimeEdit1, TRzDBDateTimeEdit1, ahk_class TfmChitSale
	ControlGetText, TRzDBEdit12, TRzDBEdit12, ahk_class TfmChitSale	
	ControlGetText, TRzEdit8, TRzEdit8, ahk_class TfmChitSale	
	ControlGetText, TRzDBEdit13, TRzDBEdit13, ahk_class TfmChitSale
	ControlGetText, TDBGridInplaceEdit1, TDBGridInplaceEdit1, ahk_class TfmChitSale
	ControlGetText, TRzDBEdit11, TRzDBEdit11, ahk_class TfmChitSale

	ControlsetText, edit1, %TRzDBDateTimeEdit1%, 일정표
	ControlsetText, edit2, %TRzDBEdit12%, 일정표
	ControlsetText, edit3, %TRzEdit8%, 일정표
	ControlsetText, edit4, %TRzDBEdit13%, 일정표
	ControlsetText, edit5, %TDBGridInplaceEdit1%, 일정표
	ControlsetText, edit6, %TRzDBEdit11%, 일정표
}
return


title:
{
	FormatTime, time, YYYYMMDDHH24MISS, MM월 dd일 HH시
	
	ControlSetText, edit7, %time% 신흥목재 일정표, 일정표

	
}
return







save:
{
   
	X := 0

	Loop, 4
	{
		X ++
		Gui, ListView, LV%X%
		Sleep,200
		TempFile = % "csv\LV" X ".csv"
		FileDelete, % TempFile
		Sleep,100
		loop, % LV_GetCount() 
			{		
			RowNum := A_Index
			LV_GetText(row1, RowNum, 1)
			FileAppend, % row1 ",`n", % TempFile
			}
	}
	;~ SoundBeep, 100
}
return





Add:
{

; "/" TRzDBEdit12 "/" TRzEdit8"/" TRzDBEdit13 "/" TDBGridInplaceEdit1 "/" TRzDBEdit11
	

	ControlFocus, SysListView323, 일정표 
	Gui, ListView, vLV3
	Sleep, 1000

	LV_ADD("", TRzDBDateTimeEdit1 "` / " TRzDBEdit12 "` / " TRzEdit8 "` / " TRzDBEdit13 "` / " TRzDBEdit11)
	
	SoundPlay, C:\Users\taeju\Desktop\오토핫키2\listadd.wav
	
}

return


re:
{
	Reload
}
return



arrow:
{
	LV_Add("", "`↓↓↓묶음배송↓↓↓")
}
return


direct:
{
	ControlGetText, 직접, edit8, 일정표
	LV_Add("", 직접)	
}
return




send:
{
	

	
	
	
	
	
winkill, 다른 이름으로 저장	




WinShow, 카카오톡


	send, {PrintScreen}
	{
		CoordMode, Mouse, Screen
		sleep, 1500
		MouseClick, left, 1920, 238, , , d
		sleep, 100
		MouseClick, left, 2811, 1596, , , u
		sleep, 100
	}	

Sleep,100

WinWait, 카카오톡, 
IfWinNotActive, 카카오톡, , WinActivate, 카카오톡, 
WinWaitActive, 카카오톡, 


Sleep,100
ControlClick, x29 y118, 카카오톡
Sleep,300




ControlSend, EVA_VH_ListControl_Dblclk3, {CtrlDown}F{CtrlUp}, 카카오톡
Sleep,300
ControlSetText, Edit2, %받는분%, 카카오톡
Sleep, 300
controlsend, Edit2, {Enter}, 카카오톡	

	WinKill,  다른 이름으로 저장

	WinWait, 일정표, 
	IfWinNotActive, 일정표, , WinActivate, 일정표, 
	WinWaitActive, 일정표, 

Sleep, 100



	Sleep, 200
	WinWait, %받는분%, 
	IfWinNotActive, %받는분%, , WinActivate, %받는분%, 
	WinWaitActive, %받는분%, 
	Sleep, 100				
	send, {Ctrl Down}v{Ctrl Up}
	sleep, 200
	Send, {Enter 2}
	sleep, 300



ControlClick, Edit2, 카카오톡
ControlSend, Edit2, {Del 30}{BackSpace 30}, ahk_class EVA_Window_Dblclk
Sleep, 100



controlsend, EVA_Window2, {Ctrl}F, ahk_class EVA_Window_Dblclk	
controlsend, , {Enter}, ahk_exe KakaoTalk.exe


}
return







autosave:
{
ControlClick, button2, 일정표
}





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