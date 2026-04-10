#NoEnv

;~ X1 := ComObjCreate( "Excel.Application" )
;~ X1.workbooks.open(path1)
;~ X1.Visible:=false

;~ 青1
;~ x1.Sheets("Sheet1").Select
;~ X1.sheets("sheet1").Columns("A" 青).value
;~ X1.ActiveworkBook.Close(1)
;~ X1.Quit

青场 := X1.ActiveSheet.UsedRange.Rows.Count



path := A_ScriptDir . "\巩磊惯价府胶飘.xlsx"


XL := ComObjCreate("Excel.Application")
XL.Workbooks.Open(path, 3, 0)
XL.Visible := false

青场 := XL.ActiveSheet.UsedRange.Rows.Count
青 = 1
Loop, 青场
{
青 ++
蔼 := X1.sheets("sheet1").Columns("A" 青).value
MsgBox, % 蔼
}

return