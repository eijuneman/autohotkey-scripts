#NoEnv
#SingleInstance, Force
;~ Menu, TRAY, Icon, Mushroom - Super.ico
Process, Priority,, High
#MaxMem 512  ; that's a large chunk of memory for a script
ListLines Off  ; helps with speed
#MaxHotkeysPerInterval, 10000
DetectHiddenText, On
DetectHiddenWindows, On
SetBatchLines, -1  ; affects CPU utilization... script will run at max speed
SetControlDelay, -1
SetWinDelay, -1
SetKeyDelay, -1
SetMouseDelay, -1

#Include, CSV.ahk




path1 = % A_ScriptDir "\전산상품정보.xlsx"
;~ path2 = % A_Desktop "\WMS\EDSM\오늘미래판매리스트.xlsx"

;~ FileCopy, \\192.168.0.1\hdd2\일정표 최근\WMS\전산상품정보.xlsx, %path1%, 1
PATH2 = % "\\192.168.0.1\hdd2\일정표 최근\일정표220730\부족재고관리\부족재고관리.CSV"

FileDelete, % PATH2


Sleep,2000


Sleep, 1000



X1 := ComObjCreate( "Excel.Application" )
X1.workbooks.open(path1)
X1.Visible:=false





X1.sheets("sheet1").Select

X1.sheets("sheet1").Range("Y:AD").select
X1.Selection.delete
X1.sheets("sheet1").Range("N:W").select
X1.Selection.delete

X1.sheets("sheet1").Range("I:I").select
X1.Selection.delete

X1.sheets("sheet1").Range("A:B").select
X1.Selection.copy
X1.sheets("sheet1").Range("C:D").select
X1.Selection.pastespecial

X1.sheets("sheet1").Range("E:F").select
X1.Selection.copy
X1.sheets("sheet1").Range("A:B").select
X1.Selection.pastespecial


X1.sheets("sheet1").Range("E:F").select
X1.Selection.delete

X1.sheets("sheet1").Range("H:H").select
X1.Selection.copy
X1.sheets("sheet1").Range("E:E").select
X1.Selection.pastespecial

X1.sheets("sheet1").Range("K:K").select
X1.Selection.copy
X1.sheets("sheet1").Range("F:F").select
X1.Selection.pastespecial



X1.sheets("sheet1").Range("H:H").select
X1.Selection.delete

X1.sheets("sheet1").Range("1:1").select
X1.Selection.delete






Sleep, 100




x1.Sheets("Sheet1").Select
행끝 := X1.ActiveSheet.UsedRange.Rows.Count
행시작 := 행끝
Sleep, 100


loop, %행끝%
{
공식 := % "=IF(E" 행시작 ">F" 행시작 ",E" 행시작 "-F" 행시작 ",0)"

공식셀 = % "I" 행시작
X1.sheets("sheet1").Select
X1.sheets("sheet1").range(공식셀).formula := 공식

공식값 := X1.sheets("sheet1").Range(공식셀).value
	if (공식값 = 0)
	{
        X1.sheets("sheet1").Range(행시작 ":" 행시작).select
        X1.Selection.delete
	}
	else
	{
	}
    행시작 --
}
Sleep, 100







x1.Sheets("Sheet1").Select
행끝 := X1.ActiveSheet.UsedRange.Rows.Count
행시작 := 행끝
Sleep, 100


loop, %행끝%
{
공식 := % "=ROUND(I" 행시작 "/G" 행시작 ",0)"


공식셀 = % "J" 행시작
X1.sheets("sheet1").Select
X1.sheets("sheet1").range(공식셀).formula := 공식

공식값 := X1.sheets("sheet1").Range(공식셀).value

    행시작 --

}
Sleep, 100








x1.Sheets("Sheet1").Select
행끝 := X1.ActiveSheet.UsedRange.Rows.Count
행시작 := 행끝
Sleep, 100


loop, %행끝%
{

공식셀 = % "A" 행시작
;~ MsgBox, % 공식셀
공식값 := X1.sheets("sheet1").Range(공식셀).value
;~ X1.sheets("sheet1").Select
	if (공식값 = "Z.업무") or (공식값 = "Z.업무") or (공식값 = "20.재현하늘창") or (공식값 = "40.은성프레임") or (공식값 = "06.합성목재")
	{
        X1.sheets("sheet1").Range(행시작 ":" 행시작).select
        X1.Selection.delete
	}
	else
	{
	}
    행시작 --

}

행끝1 := X1.sheets("sheet1").UsedRange.Rows.Count

X1.Sheets("sheet1").Range("A1:J"행끝1).Sort(X1.Sheets("sheet1").Columns(1), 1) ;A열을 기준으로 올림차순 sort sheet by data in the 'a' column






X1.ActiveWorkbook.Save
X1.ActiveWorkbook.SaveAs("\\192.168.0.1\hdd2\일정표 최근\일정표220730\부족재고관리\부족재고관리", 62)
Sleep, 1000
X1.ActiveWorkbook.Close(1)
X1.Quit()
;~ XL.DisplayAlerts := False ; this is Set to False to suppress prompts and alert messages
;~ XL.ActiveWorkbook.SaveAs("\\192.168.0.1\hdd2\일정표 최근\일정표" . "\" . BookName . ".CSV", 6)
;~ XL.ActiveWorkbook.SaveAs(PATH2, xlCSV:=6)


	CSV_Load(PATH2, "datacsv")
	CSV_Save(PATH2, "datacsv", 1)
;~ MsgBox, %A_Desktop%\7.2번째 전표.CSV`nC:\Users\shwoodnew\Desktop\일정표\%파일이름1%.CSV
;~ FileMove, % A_Desktop "\7.2번째 전표.CSV", \\192.168.0.1\hdd2\일정표 최근\일정표220730\%파일이름1%.CSV, 1
	;~ winkill, ahk_exe hcell.exe



SoundBeep, 500

MsgBox, ,,끝,1
ExitApp
return
