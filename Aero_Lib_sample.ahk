#Include Aero_Lib.ahk

Aero_StartUp() ;Start Aero LibaryAero_StartUp() ;Start Aero Libary

DWM_Win_TransColor:=0x123456 ;its your decision which color do you choose:=0x123456 ;its your decision which color do you choose
Gui,Color,%DWM_Win_TransColor%
Gui,Color,%DWM_Win_TransColor%
Gui,+LastFound ;Gui LastFoundGui,+LastFound ;Gui LastFound
MainHandle:=WinExist() ;get Handle of the GuiMainHandle:=WinExist() ;get Handle of the Gui
Aero_ChangeFrameAreaAll(MainHandle) ;Extend the Fram Area over the whole Dwm WindowAero_ChangeFrameAreaAll(MainHandle) ;Extend the Fram Area over the whole Dwm Window
Gui,Add,Button,x5 y5 w200 h35,Sample Button`nText is visible`! ;Sample ButtonGui,Add,Button,x5 y5 w200 h35,Sample Button`nText is visible`! ;Sample Button
Gui,Show,x5 y5 w500 h500,Aero Transparent Color TestGui,Show,x5 y5 w500 h500,Aero Transparent Color Test
WinSet,TransColor,%DWM_Win_TransColor%,ahk_id %MainHandle%
WinSet,TransColor,%DWM_Win_TransColor%,ahk_id %MainHandle%
Return

GuiClose:GuiClose:
Aero_End() ;Shutdown Aero LibaryAero_End() ;Shutdown Aero Libary
ExitApp