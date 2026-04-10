#NoEnv
#Include csv.ahk




Gui, Add, ComboBox, x42 y29 w140 h30 va1 gga1, |JA350-1|JA332-1|JA365-1|JA385-1|JA198-1|JA166-1|JA113|JA111|JA175|JA008|JA162-1|JA002|JA001|JA119|JA101
Gui, Add, ComboBox, x42 y99 w140 h10 va2 
Gui, Add, Text, x212 y29 w110 h20 va3
Gui, Add, Text, x212 y99 w110 h20 va4, Edit
Gui, Add, Button, x42 y169 w140 h50 , Button
Gui, Add, Button, x212 y169 w140 h50 , Button
; Generated using SmartGUI Creator for SciTE
Gui, Show, , Untitled GUI


GoSub, UpdatePresetList  ; update drop down to show all preset section names in ini file

return





ga1:
    gui, submit, nohide
CSV_Load("a1.csv","data")



    ; if drop down text is blank then error message and return
    if (a1 = "")
        return

a1 := a1

Result:=CSV_MatchCell("data", a1)

; Note: if you want to use the result of CSV_Search() later on you need to split the result into a ROW and COLUMN
Result:=StrSplit(Result,",") ; Result[1]=Row, Result[2]=Column
;~ MsgBox % CSV_ReadCell("data", Result[1],Result[2])
Result[2] := Result[2] + 1

;~ MsgBox % Result[1]
;~ MsgBox % Result[2]

a11 := CSV_ReadCell("data", Result[1], Result[2])
;~ MsgBox, % a1
	
;~ MsgBox, % a11
	

;~ Return


UpdatePresetList:

    gui, submit, nohide



    ; update drop down to show all preset section names in ini file
    GuiControl, , a3, %a11%  ; update the control

Return

;============================================================
; when you click x or close button
;============================================================







GuiClose:
ExitApp