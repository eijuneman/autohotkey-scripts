#NoEnv
#SingleInstance, force
#Include C:\Users\shwoodnew\Desktop\csv\csv.ahk
; A basic example illustrating some functions to get an idea of how to use CSV
; Consult the library (csv.ahk) for all available functions and required parameters

; Creating an example CSV file
FileDelete, ExampleCSVFile.csv
FileAppend,
(
Year,Make,Model,Description,Price
1997,Ford,E350,"ac, abs, moon",3000.00
1999,Chevy,"Venture ""Extended Edition""","",4900.00
1999,Chevy,"Venture ""Extended Edition, Very Large""",,5000.00
1996,Jeep,Grand Cherokee,"MUST SELL! air, moon roof, loaded",4799.00
), ExampleCSVFile.csv

; load a CSV file using CSV_Load(FileName, CSV_Identifier, Delimiter)
; "data" is the CSV_Identifier we are using to refer to the file we've loaded, you can give it any name you'd like
CSV_Load("ExampleCSVFile.csv","data")

Rows:=CSV_TotalRows("data")


MsgBox, % Rows
Results =
Loop, % Rows
	{
	 found:=CSV_Search("data", "moon", A_Index)
	 if found=0
		break
	 Results++
	}

MsgBox % Results

ExitApp
