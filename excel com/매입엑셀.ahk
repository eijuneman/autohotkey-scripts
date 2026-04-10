; 엑셀 COM 객체 생성
Global xl ; 중요함
xl := ComObjCreate("Excel.Application")
xl.Visible := true ; 엑셀 창을 표시하려면 true로 설정

; 엑셀 파일 열기
xlWorkbook := xl.Workbooks.Open(A_Desktop "\복사본 비용처리1.xlsx")
xlWorksheet := xlWorkbook.Sheets("손익계산서") ; 첫 번째 시트 선택

xlWorkbook.sheets("손익계산서").Move(xlWorkbook.sheets("Sheet1")) ; DB 시트를 TEST 시트 앞으로 이동

L=0
V:=[]
C:=[]
R:=[]

loop, 99
{
	fvalue(A_Index)
	V[A_Index] := 값
	C[A_Index] := 열
	R[A_Index] := 행
}

매출총이익 := V[1] - V[9]

xlWorkbook.sheets("손익계산서").Range("F" R[20]).value := 매출총이익
xlWorkbook.sheets("손익계산서").Range("I" R[20]).value := 매출총이익






62행빼기 := R[62] - 1

판관비공식 := % "=sum(I" R[22] ":I" 62행빼기 ")"
xlWorkbook.sheets("손익계산서").Range("I" R[21]).formula := 판관비공식
xlWorkbook.sheets("손익계산서").Range("I" R[21]).copy
xlWorkbook.sheets("손익계산서").Range("I" R[21]).PasteSpecial(-4163)
xlWorkbook.sheets("손익계산서").Range("F" R[21]).PasteSpecial(-4163)
판관비 := xlWorkbook.sheets("손익계산서").Range("I" R[21]).value





99행빼기 := R[99] - 1

영업외비용 := % "=sum(I" R[90] ":I" 99행빼기 ")"
xlWorkbook.sheets("손익계산서").Range("I" R[81]).formula := 영업외비용
xlWorkbook.sheets("손익계산서").Range("I" R[81]).copy
xlWorkbook.sheets("손익계산서").Range("I" R[81]).PasteSpecial(-4163)
xlWorkbook.sheets("손익계산서").Range("F" R[81]).PasteSpecial(-4163)
영업외비용 := xlWorkbook.sheets("손익계산서").Range("I" R[81]).value


arro:=["급여 임금 제수당(1)", "통신비(7)", "전력비(8)", "적금(9)", "유류비(10)", "보험료(11)", "식대(12)", "세금과공과(13)", "세무비용(14)", "매장운영비용(15)", "건물관리비(17)", "운반비(21)"]
arrn:=["1.급여,임금,재수당", "7. 통신비", "8. 전력비", "9. 적금", "10. 유류비", "11. 보험료", "12. 식대", "13. 세금과공과", "14. 세무비용", "15. 매장운영비용", "17. 건물관리비", "21. 운반비"]


Loop, % arro.length()
{
	xlWorkbook.sheets("손익계산서").Cells.Replace(arro[A_Index], arrn[A_Index])
}


/* 꾸미기 */
*/




xlWorkbook.sheets("손익계산서").Range("1:1").font.bold := 1

xlWorkbook.sheets("손익계산서").Range(R[1] ":" R[1]).Interior.ColorIndex := 15
xlWorkbook.sheets("손익계산서").Range("C" R[1]).value := ""
xlWorkbook.sheets("손익계산서").Range(R[1] ":" R[1]).font.bold := 1

xlWorkbook.sheets("손익계산서").Range(R[9] ":" R[9]).Interior.ColorIndex := 15
xlWorkbook.sheets("손익계산서").Range("C" R[9]).value := ""
xlWorkbook.sheets("손익계산서").Range(R[9] ":" R[9]).font.bold := 1

xlWorkbook.sheets("손익계산서").Range(R[20] ":" R[20]).Interior.ColorIndex := 15
xlWorkbook.sheets("손익계산서").Range("C" R[20]).value := ""
xlWorkbook.sheets("손익계산서").Range(R[20] ":" R[20]).font.bold := 1

xlWorkbook.sheets("손익계산서").Range(R[21] ":" R[21]).Interior.ColorIndex := 15
xlWorkbook.sheets("손익계산서").Range("C" R[21]).value := ""
xlWorkbook.sheets("손익계산서").Range(R[21] ":" R[21]).font.bold := 1

xlWorkbook.sheets("손익계산서").Range(R[62] ":" R[62]).Interior.ColorIndex := 15
xlWorkbook.sheets("손익계산서").Range("C" R[62]).value := ""
xlWorkbook.sheets("손익계산서").Range(R[62] ":" R[62]).font.bold := 1

xlWorkbook.sheets("손익계산서").Range(R[63] ":" R[63]).Interior.ColorIndex := 15
xlWorkbook.sheets("손익계산서").Range("C" R[63]).value := ""
xlWorkbook.sheets("손익계산서").Range(R[63] ":" R[63]).font.bold := 1

xlWorkbook.sheets("손익계산서").Range(R[81] ":" R[81]).Interior.ColorIndex := 15
xlWorkbook.sheets("손익계산서").Range("C" R[81]).value := ""
xlWorkbook.sheets("손익계산서").Range(R[81] ":" R[81]).font.bold := 1

xlWorkbook.sheets("손익계산서").Range(R[99] ":" R[99]).Interior.ColorIndex := 15
xlWorkbook.sheets("손익계산서").Range("C" R[99]).value := ""
xlWorkbook.sheets("손익계산서").Range(R[99] ":" R[99]).font.bold := 1



xlWorkbook.sheets("손익계산서").Range("A:I").font.size := 10

xlWorkbook.sheets("손익계산서").Range("1:1").font.bold := 1
xlWorkbook.sheets("손익계산서").Range("B:B").HorizontalAlignment := -4108 ; 중앙 ;
xlWorkbook.sheets("손익계산서").Range("E:E").HorizontalAlignment := -4108 ; 중앙 ;
xlWorkbook.sheets("손익계산서").Range("1:1").HorizontalAlignment := -4108 ; 중앙 ;


xlWorkbook.sheets("손익계산서").Range("F:F").NumberFormat := "#,#0" ;"0.0" ; 숫자 포맷(천원단위 표시


손익행:=xlWorkbook.sheets("손익계산서").UsedRange.Rows.Count

	xlWorkbook.sheets("손익계산서").Range("E:E").DELETE ; 선택 시트의 A~Z열 복사
	xlWorkbook.sheets("손익계산서").Range("E:E").insert ; 선택 시트의 A~Z열 복사


xlWorkbook.sheets("손익계산서").Range("A1:F" 손익행).Borders.LineStyle :=1 ; 선
xlWorkbook.sheets("손익계산서").Range("A1:F" 손익행).Borders.Weight :=2 ; 1점선, 2보통, 3진하게

RNG := "D:D"
for index, Side in [ ,8,9,10] ; Left, Top, Bottom, Right ; 외곽선만
    xlWorkbook.sheets("손익계산서").Range(RNG).Borders(Side).LineStyle := 0 ; 1보, 2~3점, 9이중





	xlWorkbook.sheets("손익계산서").Columns("A").ColumnWidth := 24 ; 열너비 조정
	xlWorkbook.sheets("손익계산서").Columns("D").ColumnWidth := 24 ; 열너비 조정
	xlWorkbook.sheets("손익계산서").Columns("B").ColumnWidth := 6 ; 열너비 조정
	xlWorkbook.sheets("손익계산서").Columns("E").ColumnWidth := 6 ; 열너비 조정
	xlWorkbook.sheets("손익계산서").Columns("C").ColumnWidth := 16 ; 열너비 조정
	xlWorkbook.sheets("손익계산서").Columns("F").ColumnWidth := 16 ; 열너비 조정
M=0


xl.DisplayAlerts := false

Loop, 99
{
	M++
	M1 := M + 1
	이전까지 := R[M1] - 1
	if(R[M]!="") && (R[M1]=""){
		오우:=1
	;~ xlWorksheet.Range("B" R[M]).value := 22
	}else if(R[M]="") && (R[M1]!=""){
		오우:=2
	;~ xlWorksheet.Range("B" R[M]).value := 33
	}else if(R[M]="") && (R[M1]=""){
		오우:=3
	;~ xlWorksheet.Range("B" R[M]).value := 44
	}else if(R[M]!="") && (R[M1]!=""){
		오우:=4
	;~ xlWorksheet.Range("B" R[M]).value := 44
	xlWorksheet.Range("B" R[M] ":B" 이전까지).Merge()
	xlWorksheet.Range("C" R[M] ":C" 이전까지).Merge()
	}else{
		오우:=5
	;~ xlWorksheet.Range("B" R[M]).value := M
	}
	;~ MsgBox, % "M : " M "`nR[M] : " R[M] "`nM1 : " M1 "`nR[M1] : " R[M1] "`n이전까지 : " 이전까지 "`n오우 : " 오우
}

arrT1:=["1", "9", "20", "21", "62", "63", "81", "99"]
arrT2:=["Ⅰ.매출액", "Ⅱ.매출원가", "Ⅲ.매출총이익 (Ⅰ－Ⅱ)", "Ⅳ.판매비와 관리비", "Ⅴ.영업손익(Ⅲ－Ⅳ)", "Ⅵ.영업외수익", "Ⅶ.영업외비용", "Ⅷ.당기순손익(Ⅴ＋Ⅵ－Ⅶ)"]

Loop, % arrT1.length()
{
	큰제목 := arrT1[A_Index]
	큰제목1 := R[큰제목]
	xlWorkbook.sheets("손익계산서").Range("A" 큰제목1).value := arrT2[A_Index]
	;~ MsgBox, 큰제목 "`n" 큰제목1 "`n" arrT2[A_Index] "`n" xlWorkbook.sheets("손익계산서").Range("F" 큰제목1).value
}




arrT3:=["2", "10", "22", "90"]
arrT4:=["9", "20", "62", "99"]
arrT5:=["Ⅰ.매출액", "Ⅱ.매출원가", "Ⅳ.판매비와 관리비", "Ⅶ.영업외비용"]


Loop, % arrT3.length()
{
	큰제목 := arrT3[A_Index]
	큰제목1 := R[큰제목]
	xlWorkbook.sheets("손익계산서").Range("A" 큰제목1).value := arrT5[A_Index]

	큰제목빼기 := arrT4[A_Index]
	큰제목빼기1 := R[큰제목빼기] - 1
	xlWorksheet.Range("A" 큰제목1 ":A" 큰제목빼기1).Merge()
	;~ MsgBox, 큰제목 "`n" 큰제목1 "`n" arrT2[A_Index] "`n" xlWorkbook.sheets("손익계산서").Range("F" 큰제목1).value
}



영업손익 := 매출총이익 - 판관비
xlWorkbook.sheets("손익계산서").Range("F" R[62]).value := 영업손익
xlWorkbook.sheets("손익계산서").Range("I" R[62]).value := 영업손익


당기순이익 := 영업손익 + R[63] - 영업외비용

xlWorkbook.sheets("손익계산서").Range("F" R[99]).formula := 당기순이익
xlWorkbook.sheets("손익계산서").Range("I" R[99]).formula := 당기순이익






xl.DisplayAlerts := true


xlWorkbook.sheets("손익계산서").Range("F:F").NumberFormat := "#,#0" ;"0.0" ; 숫자 포맷(천원단위 표시


return



fvalue(x){
global

targetValue := x
foundCell := xlWorkbook.sheets("손익계산서").Columns("H").Find(targetValue, , , 1)

if (foundCell){
	;~ MsgBox, 찾음
    rightCell := foundCell.Offset(0, 1)
    rightCellValue := foundCell.Offset(0, 1).Value
	rightCell1 := rightCell.Address
	rightCell2 := rightCell1
	rightCell2:=StrReplace(rightCell1, "$", "_")
	RegExMatch(rightCell2, "_(.*)_(.*)", 구분)
	열:=구분1
	행:=구분2
	값:=rightCellValue
}else{
	열=
	행=
	값=
}
return
}








/*

; H열에서 값이 12인 셀 찾기
targetValue := 12
foundCell := xlWorksheet.Columns("H").Find(targetValue)

if (foundCell){
    rightCell := foundCell.Offset(0, 1)
	rightCell1 := rightCell.Address
}else{
}
rightCell2 := rightCell1
rightCell2:=StrReplace(rightCell1, "$", "_")
MsgBox, % rightCell2
RegExMatch(rightCell2, "_(.*)_(.*)", 구분)


; 작업 완료 후 엑셀 파일 저장 및 닫기
xlWorkbook.Save()
xlWorkbook.Close()
xl.Quit()
xl := "" ; 변수 해제




/*
; 엑셀 COM 객체 생성

Global x4 ; 중요함
x4 := ComObjCreate("Excel.Application")
x4.Visible := true ; 엑셀 창을 표시하려면 true로 설정

; 엑셀 파일 열기
x4Workbook := x4.Workbooks.Open(A_Desktop "\기초엑셀.xlsx")
x4Worksheet := x4Workbook.Sheets("sheet1") ; 첫 번째 시트 선택


	기초행:=x4Worksheet.UsedRange.Rows.Count

	공식6 := % "=sum(T2:T" 기초행 ")"
	x4Worksheet.range("T1").formula := 공식6

	x4Worksheet.Range("1:1").copy
	x4Worksheet.Range("1:1").PasteSpecial(-4163)

	기초합계 := x4Worksheet.range("T1").value


Global x5 ; 중요함
x5 := ComObjCreate("Excel.Application")
x5.Visible := true ; 엑셀 창을 표시하려면 true로 설정

; 엑셀 파일 열기
x5Workbook := x5.Workbooks.Open(A_Desktop "\기말엑셀.xlsx")
x5Worksheet := x5Workbook.Sheets("sheet1") ; 첫 번째 시트 선택


	기말행:=x5Worksheet.UsedRange.Rows.Count

	공식7 := % "=sum(T2:T" 기말행 ")"
	x5Worksheet.range("T1").formula := 공식7

	x5Worksheet.Range("1:1").copy
	x5Worksheet.Range("1:1").PasteSpecial(-4163)

	기말합계 := x5Worksheet.range("T1").value




MsgBox, % 기초합계 "`n" 기말합계
return






return

/*

Global x3 ; 중요함
x3 := ComObjCreate("Excel.Application")
x3.Visible := true ; 엑셀 창을 표시하려면 true로 설정

; 엑셀 파일 열기
x3Workbook := x3.Workbooks.Open(A_Desktop "\매출엑셀.xlsx")
x3Worksheet := x3Workbook.Sheets("sheet1") ; 첫 번째 시트 선택


	매출행:=x3Worksheet.UsedRange.Rows.Count

	공식4 := % "=sum(F2:F" 매출행 ")"
	공식5 := % "=sum(I2:I" 매출행 ")"
	x3Worksheet.range("F1").formula := 공식4
	x3Worksheet.range("I1").formula := 공식5

	x3Worksheet.Range("A:A").copy
	x3Worksheet.Range("A:A").PasteSpecial(-4163)

	매출합계 := x3Worksheet.range("F1").value
	외상합계 := x3Worksheet.range("I1").value


MsgBox, % 매출합계 "`n" 외상합계
return



; C열에서 0이 아닌 값만 필터링
x3Worksheet.Range("C:C").AutoFilter(1, "<>0") ; 1은 필터를 적용할 열의 인덱스입니다 (C 열)


; C열을 오름차순으로 정렬
x3Range := x3Worksheet.Range("C:C")
x3Range.Sort(x3Range, 2, , , , , , 2) ; 1은 오름차순을 의미합니다


	UsedRange	:=	x3.ActiveSheet.UsedRange.Address

	x3CellTypeVisible := 12

	x3Workbook.Worksheets.Add(, x3Workbook.Sheets(1)).Name := "매출로우데이터"

	;~ x3Workbook.Worksheets.Add(,x3Workbook.sheets(1)) ; 새 시트를 sheet1 뒷 편에 생성합니다
	x3Worksheet.Range(UsedRange).SpecialCells(x3CellTypeVisible).Copy(x3Workbook.sheets(2).range("A1"))

	매출행:=x3Workbook.sheets(2).UsedRange.Rows.Count

	매출행1 := 매출행 - 1
	Z=1

loop, % 매출행1
{
	Z++
	공식 := % "=C" Z "-D" Z

	x3Workbook.sheets(2).range("B" Z).formula := 공식
	;~ x3Workbook.sheets(2).range("I2").NumberFormat := "0" ; 포멧변경
	;~ 매출값 := x3Workbook.sheets(2).range("I2").value
	;~ arr2[A_Index] := 매출값

}




x3Workbook.sheets(2).Range("A:B").copy
x3Workbook.sheets(2).Range("A:B").PasteSpecial(-4163)

x3Workbook.sheets(2).Range("C:D").delete
x3Workbook.sheets(2).Range("B:B").insert



	공식2 := % "=sum(C2:C" 매출행 ")"
	x3Workbook.sheets(2).range("E2").value := "12"
	x3Workbook.sheets(2).range("F2").formula := 공식2




MsgBox, % 매출행1

	매출행:=x3Workbook.sheets(2).UsedRange.Rows.Count

x3Workbook.sheets(2).Range("A2:F" 매출행).copy

매출행1 := 매출행 - 1


; 작업 완료 후 엑셀 파일 저장 및 닫기
;~ x3Workbook.Save()
x3Workbook.Close(false)
x3.Quit()
x3 := "" ; 변수 해제
return