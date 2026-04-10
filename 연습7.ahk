#SingleInstance, force

#Include, %A_WorkingDir%\csv.ahk





AA = A02-03-18

RegExMatch(AA, "(.*)-(.*)-(.*)", AA)

AA11 := RegExReplace(AA1, "\d")
AA12 := RegExReplace(AA1, "\D")
MsgBox, % AA11 "` " AA12 "/" AA2 "/" AA3


return


text := "A23"  ; 분리할 문자열입니다.

; 문자열에서 영어와 숫자를 분리합니다.
AA1 := RegExReplace(text, "\d")
AA2 := RegExReplace(text, "\D")

MsgBox, % "AA1: " AA1 "`nAA2: " AA2  ; 결과를 메시지 박스로 표시합니다.















상품정보 = C:\Users\shwoodnew\Desktop\WMS\상품정보\상품정보.csv


; load a CSV file using CSV_Load(FileName, CSV_Identifier, Delimiter)
; "data" is the CSV_Identifier we are using to refer to the file we've loaded, you can give it any name you'd like
CSV_Load(상품정보,"data")

; Display how many rows we have using CSV_TotalRows()
MsgBox % "There are " CSV_TotalRows("data") " rows in this CSV file."

; Assign this to a variable like so:
Rows:=CSV_TotalRows("data")

; Reading a Cell using CSV_ReadCell(), should show "E350"
MsgBox % "Contents of Cell in row number 2, and column 3: " CSV_ReadCell("data",2,3)

; Assign this to a variable like so:
Model:=CSV_ReadCell("data",2,3)

; ModifyReading a Cell using CSV_ModifyCell()
CSV_ModifyCell("data", "Mustang",2,3) ; change E350 to Mustang

MsgBox % "Contents of Cell in row number 2, and column 3: " CSV_ReadCell("data",2,3)

; Search for a cell containing "find" with CSV_Search()
MsgBox % CSV_Search("data", "3C0081B986") ; row 4, cell 3 e.g. 4,3

; Assign this to a variable like so:
Result:=CSV_Search("data", "large")

; Note: if you want to use the result of CSV_Search() later on you need to split the result into a ROW and COLUMN
Result:=StrSplit(Result,",") ; Result[1]=Row, Result[2]=Column
MsgBox % CSV_ReadCell("data",Result[1],Result[2])

; Find all cells containing "find" with CSV_Search() using a loop

Loop, % Rows
	{
	 found:=CSV_Search("data","moon",A_Index)
	 if found=0
		break
	 Results .= found "`n"
	}

MsgBox % Results

; Save the modified CSV data to a file using CSV_Save()
CSV_Save("ExampleCSVFile.csv","data")

; Sample script on how to add a column to be able to write new data to a CSV
; https://www.autohotkey.com/boards/viewtopic.php?p=242250#p242250

; CSVSwapColumns() - https://www.autohotkey.com/boards/viewtopic.php?p=484029#p484029
; CSVMoveColumns() - https://www.autohotkey.com/boards/viewtopic.php?p=484035#p484035

; When using this CSV library the script will remain persistent (remain active in memory)
; so you need close the script when you are done to free the memory
ExitApp

return