FileSelectFile inputFile, 3, %A_ScriptDir%, Open a file, csv-files (*.txt; *.skv; *.csv)
; inputFile := "test.csv"
oFile := FileOpen(inputFile, "r" ) ; open file as read-only
fileEncode := oFile.Encoding
oFile.close
MsgBox % "the Encode is .: " fileEncode