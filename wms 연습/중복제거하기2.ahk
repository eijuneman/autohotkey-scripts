#NoEnv
SendMode Input
SetKeyDelay, -1
SetMouseDelay, -1
SetWinDelay, -1
SetControlDelay, -1
SetBatchLines, -1
#Include, CSV.ahk

Loop,10
{
Process, close, EXCEL.EXE
Sleep, 1
}


Sleep, 1000

path1 = % A_Desktop "\WMS\어제판매리스트.xlsx"
path2 = % A_Desktop "\WMS\오늘미래판매리스트.xlsx"

FileCopy, \\192.168.0.1\hdd1\일정표 최근\WMS\어제판매리스트.xlsx, %path1%, 1
Sleep,500
FileCopy, \\192.168.0.1\hdd1\일정표 최근\WMS\오늘미래판매리스트.xlsx, %path2%, 1
Sleep,2000




X1 := ComObjCreate( "Excel.Application" )
X1.workbooks.open(path1)
X1.Visible:=true



X2 := ComObjCreate( "Excel.Application" )
X2.workbooks.open(path2)
X2.Visible:=false



X1.Sheets.Add
x1.Sheets("Sheet1").Select



X2.Cells.Select
X2.Selection.Copy
X1.Sheets("sheet2").Select
X1.ActiveSheet.Paste

X1.sheets("sheet1").Select
X1.sheets("sheet1").Columns("A").Select

X1.sheets("sheet1").Columns("A").insert
;~ X2.ActiveworkBook.Close(1)
;~ X2.Quit

행끝 := X1.ActiveSheet.UsedRange.Rows.Count



;~ X1.sheets("sheet1").cells("A2").Select
;~ MsgBox, % 행끝
행시작 := 행끝
Sleep, 100


행끝 --
loop, %행끝%
{
공식 := % "=INDEX(Sheet2!$A$2:$A$1000,MATCH(B" 행시작 ", Sheet2!$A$2:$A$1000,0),1)"

;~ X1.sheets("sheet1").Select
공식셀 := % "A" 행시작
;~ MsgBox, % 공식셀
X1.sheets("sheet1").Select
X1.sheets("sheet1").range(공식셀).formula := 공식


X1.sheets("sheet1").Select
X1.sheets("sheet1").Range("A:A").select

비교셀 := % "B" 행시작
공식값 := X1.sheets("sheet1").Range(공식셀).value
비교값 := X1.sheets("sheet1").Range(비교셀).value
	;~ MsgBox, %공식값%`n%비교값%
	if (공식값 = 비교값)
	{
	X1.sheets("sheet1").Range(행시작 ":" 행시작).select
	X1.Selection.delete

	;~ MsgBox, %범위%`n일치합니다

	}
	else
	{
			;~ MsgBox, 틀립니다
	}
	행시작 --
}

X1.sheets("sheet1").Select
;~ X1.Selection.Font.size := 8
X1.sheets("sheet1").Range("R:S").select
X1.Selection.copy
X1.sheets("sheet1").Range("A:B").select
X1.Selection.pastespecial
X1.sheets("sheet1").Range("G:AA").select
X1.Selection.delete
X1.sheets("sheet1").Range("B:B").select
X1.Selection.delete

X1.Sheets("sheet1").Range("A1").select
;~ X1Range_Sort := X1.ActiveCell.CurrentRegion
;~ X1Range_SortKey := X1Range_Sort.Columns(1)
;~ X1Range_Sort.Sort(X1lRange_SortKey,,,,,,,1)
X1.Sheets("sheet1").Range("A1").value := ""
X1.Sheets("sheet1").Range("A2:E2000").Sort(X1.Sheets("sheet1").Range("A1"))


X1.sheets("sheet1").Range("1:1").select
;~ X1.Selection.characters.Font.Color := 17

X1.sheets("sheet1").Rows("1").insert
X1.sheets("sheet1").Range("A1:E1").select
X1.Selection.merge
x1.selection.horizontalAlignment := -4108
X1.Selection.Font.Bold := 1


FormatTime, 제목, , yyyy년 MM월 dd일 시점재고표

X1.Sheets("sheet1").Range("A1").value := 제목
X1.Sheets("sheet1").Range("A1").select
X1.Selection.Font.size := 20

X1.Sheets("sheet1").Range("A2").value := "로케이션"
;~ X1.Sheets("sheet1").Range("B2").value := "RFID코드"


열끝 := X1.Sheets("sheet1").UsedRange.Columns.Count
행끝 := X1.Sheets("sheet1").UsedRange.Rows.Count
좌표 = A1:E%행끝%


X1.Sheets("sheet1").range(좌표).currentRegion.Select

X1.Sheets("sheet1").Range(좌표).borders().linestyle := 6
X1.Sheets("sheet1").Range(좌표).borders().weight := 2

X1.Sheets("sheet1").Range("A2:E2").interior.colorindex := 6



Xl.Sheets("sheet1").Range(좌표).borders().linestyle := 6
Xl.Sheets("sheet1").Range(좌표).borders().weight := 2


X1.sheets("sheet1").Range(좌표).select
X1.selection.copy
X1.Application.CutcopyMode := 0
X1.PrintCommunication := 0
X1.Sheets("sheet1").Pagesetup.zoom := ComObj(0xB,0)
X1.Sheets("sheet1").Pagesetup.FittopagesWide := 1
X1.Sheets("sheet1").Pagesetup.FittopagesTall := 0
X1.Printcommunication := -1
;~ MsgBox, 응
X1.Activesheet.printOut


X1.sheets("sheet1").Range("1:2").select
X1.Selection.delete
X1.sheets("sheet1").columns("A").insert




Sleep, 100

SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\기록중.mp3
FormatTime, 오늘날짜, , yyyy-MM-dd
체크상태 = 체크 중
PATH3 := % "\\192.168.0.1\hdd1\일정표 최근\일정표220730\일일재고관리\" 오늘늘짜 ".CSV"

파일이름 := "A" 오늘날짜 "_B" 체크상태


X1.ActiveWorkbook.Save
X1.ActiveWorkbook.SaveAs("\\192.168.0.1\hdd1\일정표 최근\일정표220730\일일재고관리\" . 파일이름, 62)
Sleep, 1000
X1.ActiveWorkbook.Close(1)

;~ XL.DisplayAlerts := False ; this is Set to False to suppress prompts and alert messages
;~ XL.ActiveWorkbook.SaveAs("\\192.168.0.1\hdd1\일정표 최근\일정표" . "\" . BookName . ".CSV", 6)
;~ XL.ActiveWorkbook.SaveAs(PATH1, xlCSV:=6)
X1.Quit()

	CSV_Load(PATH3, "datacsv")
	CSV_Save(PATH3, "datacsv", 1)
;~ MsgBox, %A_Desktop%\7.2번째 전표.CSV`nC:\Users\shwoodnew\Desktop\일정표\%파일이름1%.CSV
;~ FileMove, % A_Desktop "\7.2번째 전표.CSV", \\192.168.0.1\hdd1\일정표 최근\일정표220730\%파일이름1%.CSV, 1
	;~ winkill, ahk_exe hcell.exe



SoundBeep, 500


ExitApp
return



/*
    Application.PrintCommunication = False
    With ActiveSheet.PageSetup
        .PrintTitleRows = ""
        .PrintTitleColumns = ""
    End With
    Application.PrintCommunication = True
    ActiveSheet.PageSetup.PrintArea = ""
    Application.PrintCommunication = False
    With ActiveSheet.PageSetup
        .LeftHeader = ""
        .CenterHeader = ""
        .RightHeader = ""
        .LeftFooter = ""
        .CenterFooter = ""
        .RightFooter = ""
        .LeftMargin = Application.InchesToPoints(0.7)
        .RightMargin = Application.InchesToPoints(0.7)
        .TopMargin = Application.InchesToPoints(0.75)
        .BottomMargin = Application.InchesToPoints(0.75)
        .HeaderMargin = Application.InchesToPoints(0.3)
        .FooterMargin = Application.InchesToPoints(0.3)
        .PrintHeadings = False
        .PrintGridlines = False
        .PrintComments = xlPrintNoComments
        .CenterHorizontally = False
        .CenterVertically = False
        .Orientation = xlLandscape
        .Draft = False
        .PaperSize = xlPaperA4
        .FirstPageNumber = xlAutomatic
        .Order = xlDownThenOver
        .BlackAndWhite = False
        .Zoom = False
        .FitToPagesWide = 1
        .FitToPagesTall = False
        .PrintErrors = xlPrintErrorsDisplayed
        .OddAndEvenPagesHeaderFooter = False
        .DifferentFirstPageHeaderFooter = False
        .ScaleWithDocHeaderFooter = True
        .AlignMarginsHeaderFooter = True
        .EvenPage.LeftHeader.Text = ""
        .EvenPage.CenterHeader.Text = ""
        .EvenPage.RightHeader.Text = ""
        .EvenPage.LeftFooter.Text = ""
        .EvenPage.CenterFooter.Text = ""
        .EvenPage.RightFooter.Text = ""
        .FirstPage.LeftHeader.Text = ""
        .FirstPage.CenterHeader.Text = ""
        .FirstPage.RightHeader.Text = ""
        .FirstPage.LeftFooter.Text = ""
        .FirstPage.CenterFooter.Text = ""
        .FirstPage.RightFooter.Text = ""
    End With
    Application.PrintCommunication = True
;~ xl.entirecol.insertshift

;~ px2.Cells.Select
;~ px2.Cells.Copy ;시트전체 카피
;px2.ActiveSheet.Copy ;새로운 엑셀파일로 시트카피
;px2.ActiveSheet.UsedRange.Copy ;유효시트내용만 카피


/*


file1 := % A_Desktop "\통합 문서1.xlsx"
file2 := % A_Desktop "\통합 문서2.xlsx"





XL := ComObjCreate( "Excel.Application" )

;books to open
Dest := XL.workbooks.open(file1)
Source := XL.workbooks.open(file2)

sheet1 := Source.sheets(1)
sheet := Dest.sheets(1)

; here we are maving value of source's sheet 1 cell a5 to dest sheet 1 cell a1
sheet.range("a1").value := sheet1.range("a5").value

; copy paste is a manual way to move data like value color formatting and so many other information between but we can also automate copy paste as these are also methods .copy() .paste()
*/
/*
	숫자 = 1
Loop, 20

{

	값 = A%숫자%
	;~ MsgBox, %값%
	X := XL.Range(값).value

	MsgBox, %X%

	숫자 ++
}
*/
;~ return