Gui, Add, ListView, vMyListView, Column1
Loop, 6
{
    LV_Add("", "Item" . A_Index)
}
Gui, Add, Button, gStartSelection, 1¹ø
Gui, Show
return

StartSelection:
SetTimer, SelectRow, 2000
return

SelectRow:
row := 1
LV_Modify(row, "Select")
if (row = 6)
{
    row := 1
    SetTimer, SelectRow, Off
}
else
{
    row++
}
return
