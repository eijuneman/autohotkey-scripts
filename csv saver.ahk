파일경로 := A_DESKTOP . "\어제자상품재고정보.xlsx"
XL := ComObjCreate("Excel.Application")
XL.workbooks.open(파일경로,3,0)
XL.Visible := 0
XL.sheets("sheet1").Activate
XL.cells.Copy
XL.cells.Select
XL.selection.PasteSpecial(-4163)
XL.Application.CutCopyMode := 0
XL.Activeworkbook.save
XL.Activeworkbook.saveAs(A_Desktop . "\판매정보" , 62)
XL.Activeworkbook.Close(1)
XL.Quit

return