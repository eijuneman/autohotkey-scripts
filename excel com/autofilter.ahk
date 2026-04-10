

Global xl ; 중요함
xl := ComObjCreate("Excel.Application")
xl.Visible := true ; 엑셀 창을 표시하려면 true로 설정


조회월=2024-
조회월:=조회월 . "*"



; 엑셀 파일 열기
xlWorkbook := xl.Workbooks.Open(A_Desktop "\복사본 비용처리2.xlsx")
xlWorksheet := xlWorkbook.Sheets("sheet1") ; 첫 번째 시트 선택
; AUTOFILTER 적용

	xlWorksheet.Range("A1:G3000").AutoFilter
	;~ xlWorkbook.AutoFilter
	;~ xlWorksheet.AutoFilterMode
	xlRange1 := xlWorksheet.Range("G2:G3000")
	xlRange2 := xlWorksheet.Range("B2:B3000")
arr:=["90", "91", "22", "24", "25", "26", "27", "28", "29", "30", "31", "32", "34", "35", "36", "33", "37", "38", "39", "42", "44", "45", "46", "47", "48", "51"]
arr3:=["재고자산,감모손실", "재해손실", "급여 임금 제수당(1) ", "퇴직급여(3)", "복리후생비(4)", "여비교통비(5)", "임차료(6)", "통신비(7)", "전력비(8)", "적금(9)", "유류비(10)", "보험료(11)", "세금과공과(13)", "세무비용(14)", "매장운영비용(15)", "식대(12)", "수선비(16)", "건물관리비(17)", "접대비(18)", "광고선전비(19)", "운반비(21)", "차량장비유지비(22)", "카드사용료(23)", "지급수수료(24)", "판매수수료(25)", "소모품비(28)"]
arr2:=[]
A=0
Loop, % arr.length()
;~ Loop, 1
{
	A++
	종목:=arr[A]
	종목시트:=arr[A] . arr3[A]
	;~ MsgBox, % 종목
	xlWorksheet.activate
	;~ xlWorksheet.AutoFilterMode := false
	xlRange1.AutoFilter(7, 조회월) ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)
	xlRange2.AutoFilter(2, 종목) ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)

	UsedRange	:=	xl.ActiveSheet.UsedRange.Address

	;~ MsgBox,필터링이 끝난 표에서 화면에 보이는 셀만 복사하구`n 새로운 시트로 붙여넣겠습니다~
	xlCellTypeVisible := 12

	; 새 시트를 원하는 이름으로 추가
	;~ NewSheetName := "내시트이름" ; 원하는 시트 이름으로 변경하세요
	xlWorkbook.Worksheets.Add(, xlWorkbook.Sheets(1)).Name := 종목시트





	;~ xlWorkbook.Worksheets.Add(,xlWorkbook.sheets(1)) ; 새 시트를 sheet1 뒷 편에 생성합니다
	xlWorksheet.Range(UsedRange).SpecialCells(xlCellTypeVisible).Copy(xlWorkbook.sheets(2).range("A1"))


	종목행:=xlWorkbook.sheets(2).UsedRange.Rows.Count
	종목행1:=종목행 + 1

	공식 := % "=sum(E2:E" 종목행 ")"
	xlWorkbook.sheets(2).range("E" 종목행1).formula := 공식
	xlWorkbook.sheets(2).range("E" 종목행1).NumberFormat := "0" ; 포멧변경
	종목값 := xlWorkbook.sheets(2).range("E" 종목행1).value
	arr2[A_Index] := 종목값




	;~ xlWorksheet.AutoFilterMode := false
	;~ xlRange1.AutoFilter(7,"") ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)
	;~ xlRange2.AutoFilter(2,"") ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)
	;~ Sleep, 1000
}



/*
; 필터링된 행만 보기
visibleRows := xlRange1.SpecialCells(12) ; 12는 보이는 셀만 선택하는 상수입니다
filteredRowCount := visibleRows.Rows.Count

MsgBox % "필터링된 행 수: " . filteredRowCount
*/

	xlRange1.AutoFilter(7, "2024-04*") ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)
	xlRange2.AutoFilter(2, 종목) ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)
	;~ MsgBox, % arr[1] ":" arr2[1] "`n"  arr[2] ":" arr2[2] "`n"  arr[3] ":" arr2[3] "`n"  arr[3] ":" arr2[3] "`n" arr[4] ":" arr2[4] "`n"  arr[5] ":" arr2[5] "`n"  arr[6] ":" arr2[6] "`n"  arr[7] ":" arr2[7] "`n" arr[8] ":" arr2[8] "`n"  arr[9] ":" arr2[9] "`n"  arr[10] ":" arr2[10] "`n"  arr[11] ":" arr2[11] "`n"


	;~ NewSheetName := "내시트이름" ; 원하는 시트 이름으로 변경하세요
	xlWorkbook.Worksheets.Add(, xlWorkbook.Sheets(1)).Name := "종합"
	;~ xlWorksheet.Range(UsedRange).SpecialCells(xlCellTypeVisible).Copy(xlWorkbook.sheets(2).range("A1"))
	Loop, % arr.length()
	{
		xlWorkbook.sheets(2).range("A" A_Index).value := arr[A_Index]
		xlWorkbook.sheets(2).range("B" A_Index).value := arr3[A_Index]
		xlWorkbook.sheets(2).range("C" A_Index).value := arr2[A_Index]
	}

MsgBox, 쉿
; 필터 해제
xlWorksheet.AutoFilterMode := false
; COM 객체 정리
xlWorkbook.Close(false) ; 변경 내용을 저장하지 않고 닫기
xl.Quit()
xl := "" ; 변수 해제

return


X1.Sheets("sheet1").Range("A2:E2000").Sort(X1.Sheets("sheet1").Range("A1"))


