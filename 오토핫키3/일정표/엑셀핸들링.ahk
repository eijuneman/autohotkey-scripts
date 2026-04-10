path := "C:\Users\shwoodnew\Desktop\9.33.12.xls"

X1 := ComObjCreate("Excel.Application")
FileSelectFile, path
X1.Workbooks.Open(path)

X1.Visible := false

return