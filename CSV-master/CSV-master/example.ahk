#NoEnv
#SingleInstance, force
#Include, Z:\HDD1\csv.ahk

; A basic example illustrating some functions to get an idea of how to use CSV
; Consult the library (csv.ahk) for all available functions and required parameters

; Creating an example CSV file


; load a CSV file using CSV_Load(FileName, CSV_Identifier, Delimiter)
; "data" is the CSV_Identifier we are using to refer to the file we've loaded, you can give it any name you'd like
CSV_Load(ExampleCSVFile.csv,data)


Loop, % Rows
	{
	 found:=CSV_Search(data, 1999, A_Index)
	 if found=0
		break
	 Results .= found "`n"
	}

MsgBox % Results


ExitApp
