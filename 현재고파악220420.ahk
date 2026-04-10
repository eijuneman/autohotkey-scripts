
Xl := ComObjActive("Excel.Application") 

winmove, ahk_class XLMAIN, , 5, 5
WinMaximize, ahk_class XLMAIN

Xl.Columns("R:R").Select
Xl.Selection.Cut
Xl.Range("A1").Select
Xl.ActiveSheet.Paste

xlRange_Sort := xl.ActiveCell.CurrentRegion
xlRange_SortKey := xlRange_Sort.Columns(1)
xlRange_Sort.Sort(xlRange_SortKey,,,,,,,1)

Xl.Columns("F:AB").Select
Xl.Selection.Delete

Ð—{ := Xl.ActiveSheet.UsedRange.Rows.Count
µi{ := Xl.ActiveSheet.UsedRange.Columns.Count

Xl.ActiveSheet.Cells(Ð—{,µi{).currentRegion.Select
Xl.selection.EntireColumn.Autofit

Xl.Range("A1:E1").Select
Xl.Selection.Font.Bold := 1

Clipboard1 = A1:E%Ð—{%
Xl.ActiveSheet.Range(Clipboard1).borders().linestyle := 6
Xl.ActiveSheet.Range(Clipboard1).borders().weight := 2

Clipboard2 = E1:E%Ð—{%

xl.Range(Clipboard2).interior.colorindex := 6

Xl.Rows(1).insert
xl.range("a1:e1").merge
xl.selection.horizontalAlignment := -4108

FormatTime, ¹A¡¢, , yyyy‘e MM¶© dd·© ¯¡¸ñ¸‰¡Îa

SoundBeep, 500
Xl.Range("A1").value := ¹A¡¢
Xl.Selection.Font.size := 20
Xl.ActiveSheet.Cells(Ð—{,µi{).currentRegion.Select

Xl.Application.CutcopyMode := 0
Xl.PrintCommunication := 0
Xl.ActiveSheet.Pagesetup.zoom := ComObj(0xB,0)
Xl.ActiveSheet.Pagesetup.FittopagesWide := 1
Xl.ActiveSheet.Pagesetup.FittopagesTall := 0
Xl.Printcommunication := -1

Xl.Activesheet.printOut

Xl.Activeworkbook.Close(0)
Xl.Quit