#NoEnv
SetWorkingDir %A_ScriptDir%  ;


xlCSV = 6
;~ CSVFILENAME := "A123123_123.csv"

;~ FileSelectFile, FilePath

;~ XL := ComObjCreate("Excel.Application") ; Creates excel object
;~ XL.Workbooks.Open(FilePath) ; Opens the selected existing file
;~ XL.Visible := True ; set to false if you don't need excel to be seen
;~ XL.DisplayAlerts := False ; this is Set to False to suppress prompts and alert messages 
;~ XL.ActiveWorkbook.SaveAs(A_Desktop . "\" . CSVFILENAME, xlCSV)
;~ XL.Quit()
;~ exitapp


path := "C:\Users\shwoodnew\Desktop\9.33.12.xls"
XL := ComObjCreate("Excel.Application")
XL.Workbooks.Open(path, 3, 0)
XL.Visible := 0



XL.ActiveSheet.Range("J:BP").Delete
XL.ActiveSheet.Range("1:11").Delete
찾는문자 := "    *** 이 하 여 백 ***"
;~ 시트이름 := XL.Page 1
범위 := XL.workSheets("page 1").Range("1:500").Find(찾는문자)
행 := 범위.Row
행 := 행 + 1
XL.ActiveSheet.Range(행 ":500").Delete


BookName:= "A123123_123111" 

;~ XL.ActiveWorkbook.SaveAs(BookName) ;'bookname' is a variable with the path and name of the file you desire 
;~ XL_Workbook := XL.Workbooks.Open(BookName) ;handle to specific workbook 
;~ XL_Workbook.Save() 

XL.DisplayAlerts := False ; this is Set to False to suppress prompts and alert messages 
XL.ActiveWorkbook.SaveAs("Z:\HDD1\일정표 최근\일정표" . "\" . BookName . ".csv", 6)
XL.Quit()
exitapp
 

    ;~ ChDir "C:\Users\shwoodnew\Desktop"
    ;~ ActiveWorkbook.SaveAs Filename:="C:\Users\shwoodnew\Desktop\asd_dasd_.csv", _
        ;~ FileFormat:=xlCSV, CreateBackup:=False
;~ End Sub
;~ )
;~ FileAppend, %VBA%, %A_ScriptDir%\VBACODE.TXT
;~ XL.ActiveWorkBook.VBproject.VBComponents.Import(A_ScriptDir . "\vbacode.txt")
;~ FileDelete, %A_ScriptDir%\vbacode.txt
;~ XL.Application.Run("매크로1")