Gui, +AlwaysOnTop
Gui, Add, Edit, x22 y39 w180 h40 , 
Gui, Add, Edit, x232 y39 w180 h40 , 
Gui, Add, Edit, x22 y129 w180 h40 , 
Gui, Add, Edit, x232 y129 w180 h40 , 
Gui, Add, Edit, x22 y219 w390 h90 , 
Gui, Add, Text, x22 y9 w140 h20 , Text
Gui, Add, Text, x232 y9 w140 h20 , Text
Gui, Add, Text, x232 y99 w140 h20 , Text
Gui, Add, Text, x22 y99 w140 h20 , Text
Gui, Add, Text, x22 y189 w140 h20 , Text
Gui, Add, Button, x22 y339 w130 h30 gg1, Button
Gui, Add, Button, x172 y339 w110 h30 gg2, Button
Gui, Add, Button, x302 y339 w110 h30 gg3, Button
; Generated using SmartGUI Creator for SciTE
Gui, Show, w453 h407, Untitled GUI
return

g1:
{
ControlGetText, var1 , TRzEdit8, ahk_exe JedaeroM.exe ; 거래처명





ControlGetText, var4 , 	TRzDBEdit12, ahk_exe JedaeroM.exe ; 시각



ControlGetText, var5 , 		TRzDBEdit11, ahk_exe JedaeroM.exe ;비고



ControlGetText, var8 , 	TRzDBDateTimeEdit1, ahk_exe JedaeroM.exe ; 날짜

ControlGetText, var9, TRzDBEdit13, ahk_exe JedaeroM.exe ; 장소

Sleep,1000


WinActivate,	ahk_exe JedaeroM.exe
Send,{F12}
Sleep,1000
ImageSearch, aX,aY, 0,0,1000,400, C:\Users\taeju\Documents\IMAGESEARCH\15.png
MouseClick, l,%aX%,%aY%,,0
WinWait, 매출전표
WinActivate, 매출전표
SetControlDelay, 1





ControlSetText,TRzDBEdit12 ,%var4%, ahk_exe JedaeroM.exe ; 시각

ControlFocus, TRzDBEdit11,ahk_exe JedaeroM.exe
ControlSetText,TRzDBEdit11,%var5%, ahk_exe JedaeroM.exe    ;비고

ControlSetText,TRzDBDateTimeEdit1, %var8%, ahk_exe JedaeroM.exe  ; 날짜

ControlFocus, TRzDBEdit13,ahk_exe JedaeroM.exe
ControlSetText, TRzDBEdit13, %var9% ,  ahk_exe JedaeroM.exe ; 장소

ControlSetText,TRzEdit8, %var1%, ahk_exe JedaeroM.exe  ; 거래처명 
controlsend,TRzEdit8, {Enter}, ahk_exe JedaeroM.exe

ControlClick, TRzBitBtn17, ahk_exe JedaeroM.exe
send,{Right}{F12}
ControlClick,TDBGridInplaceEdit1, ahk_exe JedaeroM.exe,,,,X206,y181
ControlSend,TDBGridInplaceEdit1, {Del}, ahk_exe JedaeroM.exe





}
return

g2:
Reload
return






g3:
{
WinActivate,	ahk_exe JedaeroM.exe
ImageSearch, aX,aY, 0,0,1000,400, C:\Users\taeju\Documents\IMAGESEARCH\15.png
MouseClick, l,%aX%,%aY%,,0
WinWait, 매출전표
WinActivate, 매출전표
Sleep,1000
ControlGetText, var1 , Edit1, Untitled GUI 
ControlSend,TRzEdit8, %var1%{Enter}, ahk_exe JedaeroM.exe


ControlGetText, var2 , Edit2	, Untitled GUI
ControlSend,TRzDBDateTimeEdit1,%var2%, ahk_exe JedaeroM.exe


ControlGetText, var3 , Edit3	, Untitled GUI
ControlSend,TRzDBEdit13,%var3%,ahk_exe JedaeroM.exe


ControlGetText, var4 ,Edit4 	, Untitled GUI
ControlSend,TDBGridInplaceEdit1,%var4%, ahk_exe JedaeroM.exe


ControlGetText, var5 , 	Edit5	,Untitled GUI
ControlSend,TRzDBEdit11,%var5%, ahk_exe JedaeroM.exe


ControlClick, TRzBitBtn17,  ahk_exe JedaeroM.exe
sleep,500
ControlClick, TRzGroupButton3,  ahk_exe JedaeroM.exe



}
return







GuiClose:
ExitApp
