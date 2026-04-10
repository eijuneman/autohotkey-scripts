
{
gui, submit, nohide
XLS_file_path1 := % A_ScriptDir "\어제판매리스트.xlsx"
1xl := ComObjCreate("Excel.Application")
1xl.Workbooks.Open(XLS_file_path1)
11xl := 1xl.Workbooks.Open(XLS_file_path1, 3, 0)
1xl.Visible:=false
1xl := 1xl.Sheets("Sheet1")

XLS_file_path2 := % A_ScriptDir "\오늘미래판매리스트.xlsx"
2xl := ComObjCreate("Excel.Application")
2xl.Workbooks.Open(XLS_file_path2)
22xl := 2xl.Workbooks.Open(XLS_file_path2, 3, 0)
2xl.Visible:=false
2xl := 2xl.Sheets("Sheet1")

상품코드 = D020006

R = 2
;~ 1FoundCell := 1xl.Range("R" R).value
;~ 1pdtCell := 1xl.Range("A" R).value
endCol := 2xl.UsedRange.Columns.Count
1FoundCell := 1xl.Range("R:R").Find(상품코드)

    ;~ Loop, %endCol%
    ;~ {
        2FoundCell := 2xl.Range("R:R").Find(1FoundCell)
        if(1FoundCell = "" )
        {
            MsgBox, 중복 X


        }
        else
        {
            MsgBox, 중복 O
        }
        ;~ R++

    ;~ }


22xl.close(0)
Process, close, EXCEL.EXE
Sleep, 200

11xl.close(0)
Process, close, EXCEL.EXE


}
return