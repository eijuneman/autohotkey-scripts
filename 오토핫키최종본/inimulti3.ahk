#NoEnv
#Include csv.ahk

;품목리스트
도어리스트 := "문틀만|JA350-1|JA332-1|JA365-1|JA385-1|JA198-1|JA166-1|JA113|JA111|JA175|JA008|JA162-1|JA002|JA001|JA119|JA101"
문틀리스트 := "도어만|110바|130바|140바|155바|175바|195바|210바|230바|245바"




Gui, Add, ComboBox, x42 y29 w140 h30 va1 gga1, %도어리스트%
Gui, Add, ComboBox, x42 y79 w140 h10 va2 gga2, %문틀리스트%
Gui, Add, Text, x212 y29 w110 h20 va3
Gui, Add, Text, x212 y79 w110 h20 va4,
Gui, Add, Text, x212 y120 w110 h20 va5,
Gui, Add, Button, x42 y169 w140 h50 , Button
Gui, Add, Button, x212 y169 w140 h50 , Button
Gui, Show, , Untitled GUI

GoSub, UpdatePresetList  ; update drop down to show all preset section names in ini file
return

ga1: ; 도어
{
    gui, submit, nohide
CSV_Load("재현.csv","data")
    if (a1 = "")
        return
a1 := a1
Result:=CSV_Search("data", a1)
Result:=StrSplit(Result,",") ; Result[1]=Row, Result[2]=Column
Result[2] := Result[2] + 1
a11 := CSV_ReadCell("data", Result[1], Result[2])
GoSub, UpdatePresetList
}

ga2: ; 문틀
{
    gui, submit, nohide
CSV_Load("재현.csv","data")
    if (a2 = "")
        return
a2 := a2
Result:=CSV_Search("data", a2)
Result:=StrSplit(Result,",") ; Result[1]=Row, Result[2]=Column
Result[2] := Result[2] + 1
a22 := CSV_ReadCell("data", Result[1], Result[2])
GoSub, UpdatePresetList
}

UpdatePresetList:
{
	gui, submit, nohide
    GuiControl, , a3, %a11%  ; update the control
	GuiControl, , a4, %a22%  ; update the control
	az := a11 + a22  
	
	GuiControl, , a5, %az%  ; update the control

}
Return

GuiClose:
ExitApp