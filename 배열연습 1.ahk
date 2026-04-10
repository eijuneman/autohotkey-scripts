	xl := ComObjCreate("Excel.Application")
    xl.Workbooks.Open(A_ScriptDir "\快凋\快凋.csv")
	xl.Visible := true

	xl2 := ComObjCreate("Excel.Application")
    xl2.Workbooks.Open(A_ScriptDir "\快凋\快凋棵府扁.xls")
	xl2.Visible := true

;~ MsgBox, 老窜
xl.ActiveSheet.Range("1:500").select
xl.selection.Replace("0.00","")

xl.sheets("快凋").Range("A:A").select
xl.Selection.copy
xl.sheets("快凋").Range("M:M").select
xl.Selection.pastespecial


xl.sheets("快凋").Range("B:B").select
xl.Selection.copy
xl.sheets("快凋").Range("N:N").select
xl.Selection.pastespecial



青场 := xl.ActiveSheet.UsedRange.Rows.Count
青场 ++
青矫累 := 青场
Sleep, 100

;~ 青场 ++
loop, %青场%
{
	傍侥1 = ="快/"&M%青矫累%&"/"&C%青矫累%
	傍侥2 = =N%青矫累%&"/"&E%青矫累%

	傍侥伎A := % "A" 青矫累
	傍侥伎B := % "B" 青矫累
	xl.sheets("快凋").range(傍侥伎A).formula := 傍侥1
	xl.sheets("快凋").range(傍侥伎B).formula := 傍侥2
   青矫累 --
   ;~ MsgBox, % 青矫累
}
xl.sheets("快凋").Range("A:B").select
xl.Selection.copy
xl.Selection.pastespecial(-4163)


xl.sheets("快凋").Range("F:F").select
xl.Selection.copy
xl.sheets("快凋").Range("D:D").select
xl.Selection.pastespecial(-4163)


xl.sheets("快凋").Range("G:G").select
xl.Selection.copy
xl.sheets("快凋").Range("E:E").select
xl.Selection.pastespecial(-4163)


xl.sheets("快凋").Range("F:N").select
xl.Selection.DELETE


青场 := xl.ActiveSheet.UsedRange.Rows.Count
青场 ++
青矫累 := 青场
loop, %青场%
{
	傍侥伎C := % "C" 青矫累
	xl.sheets("快凋").range(傍侥伎C).value := "ea"
   青矫累 --
}



	xl.sheets("快凋").range("A1").value := "惑前疙"
	xl.sheets("快凋").range("B1").value := "痹拜"
	xl.sheets("快凋").range("C1").value := "窜困"
	xl.sheets("快凋").range("D1").value := "荐樊"
	xl.sheets("快凋").range("E1").value := "窜啊"
	xl.sheets("快凋").range("F1").value := "官内靛"
	xl.sheets("快凋").range("G1").value := "包府内靛"
	xl.sheets("快凋").range("H1").value := "厚绊"
	xl.sheets("快凋").range("I1").value := "惑前内靛"


xl.sheets("快凋").Range("A:I").select
xl.Selection.copy
xl.Selection.pastespecial(-4163)



;~ return

	break
    }
	else{
	}






	xl.sheets("快凋").Range("A:I").select
	xl.Selection.copy
	xl2.sheets("快凋").Range("A:I").select
	xl2.Selection.pastespecial(-4163)


    xl.ActiveWorkbook.SaveAs(A_ScriptDir "\快凋\郴开2024-05-11.xls", 56)   ; same folder, same name, .xls extension
    xl.ActiveWorkbook.Close
    xl.quit


    xl2.ActiveWorkbook.Save   ; same folder, same name, .xls extension
    ;~ xl2.ActiveWorkbook.Close
    xl2.quit()
    xl2.quit := ""


;~ objWorkBook.Save
;~ objExcel.Quit()
;~ objExcel := ""





}
