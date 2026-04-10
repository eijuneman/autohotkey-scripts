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
ControlGetText, var1 , TRzEdit8, 매출전표
ControlSend,Edit1,%var1%, Untitled GUI


ControlGetText, var2 , 	TRzDBDateTimeEdit1, 매출전표
ControlSend,Edit2,%var2%, Untitled GUI


ControlGetText, var3 , 	TRzDBEdit13, 매출전표
ControlSend,Edit3,%var3%, Untitled GUI


ControlGetText, var4 , 	TDBGridInplaceEdit1, 매출전표
ControlSend,Edit4,%var4%, Untitled GUI


ControlGetText, var5 , 		TRzDBEdit11, 매출전표
ControlSend,Edit5,%var5%, Untitled GUI

Sleep,1000


WinActivate,	ahk_exe JedaeroM.exe
Send,{F12}
Sleep,1000
ImageSearch, aX,aY, 0,0,1000,400, C:\Users\taeju\Documents\IMAGESEARCH\15.png
MouseClick, l,%aX%,%aY%,,0
WinWait, 매출전표
WinActivate, 매출전표
Sleep,1000
ControlGetText, var1 , Edit1, Untitled GUI               
ControlSend,TRzEdit8, %var1%{Enter}, ahk_exe JedaeroM.exe ; 


ControlGetText, var2 , Edit2	, Untitled GUI3
ControlClick,TRzDBDateTimeEdit1, ahk_exe JedaeroM.exe
ControlSend,TRzDBDateTimeEdit1,%var2%, ahk_exe JedaeroM.exe


ControlGetText, var3 , Edit3	, Untitled GUI
ControlClick,TRzDBEdit13, ahk_exe JedaeroM.exe
ControlSend,TRzDBEdit13,%var3%{Enter},ahk_exe JedaeroM.exe


ControlGetText, var4 ,Edit4 	, Untitled GUI
ControlClick,TDBGridInplaceEdit1, ahk_exe JedaeroM.exe
ControlSend,TDBGridInplaceEdit1,%var4%{Enter}, ahk_exe JedaeroM.exe


ControlGetText, var5 , 	Edit5	,Untitled GUI
ControlClick,TRzDBEdit11, ahk_exe JedaeroM.exe
ControlSend,TRzDBEdit11,%var5%{Enter}, ahk_exe JedaeroM.exe


ControlClick, TRzBitBtn17,  ahk_exe JedaeroM.exe
sleep,500
ControlClick, TRzGroupButton3,  ahk_exe JedaeroM.exe


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
