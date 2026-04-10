#NoEnv



Filename1 := A_Desktop . "\복사본 비용처리2.xlsx"

Global xl ; 중요함
xl := ComObjCreate("Excel.Application")
xl.Visible := true ; 엑셀 창을 표시하려면 true로 설정


xl.DisplayAlerts := false

조회월=2024-
조회월:=조회월 . "*"

xlWorkbook := xl.Workbooks.Open(Filename1)
xlWorksheet := xlWorkbook.Sheets("손익계산서") ; 첫 번째 시트 선택


	xlWorkbook.sheets("손익계산서").Range("1:40").insert ; 선택 시트의 A~Z열 복사

	xlWorkbook.sheets("손익계산서").Range("A1:F1").Merge()
	xlWorkbook.sheets("손익계산서").Range("A1").value := "■ 소득세법 시행규칙 [별지 제40호의7서식] <개정 2014.3.14>"
    xlWorkbook.sheets("손익계산서").Range("1:1").font.size := 8

	xlWorkbook.sheets("손익계산서").Range("A2").value := "표준손익계산서"
	xlWorkbook.sheets("손익계산서").Range("A2:F2").Merge()
    xlWorkbook.sheets("손익계산서").Range("2:2").font.size := 18
    xlWorkbook.sheets("손익계산서").Range("2:2").font.bold := 1
    xlWorkbook.sheets("손익계산서").Range("2:2").HorizontalAlignment := -4108  ; (C) 중앙

    xlWorkbook.sheets("손익계산서").Range("2:3").RowHeight := 35.25



    xlWorkbook.sheets("손익계산서").Range("A3").value := "기간 : 2023년 08월"
	xlWorkbook.sheets("손익계산서").Range("A3:F3").Merge()
    xlWorkbook.sheets("손익계산서").Range("3:3").font.size := 14
    xlWorkbook.sheets("손익계산서").Range("3:3").font.bold := 1
    xlWorkbook.sheets("손익계산서").Range("3:3").HorizontalAlignment := -4131  ;(L),

    ;~ xlWorkbook.sheets("손익계산서").Range("3:3").RowHeight := 35.25


	xlWorkbook.sheets("손익계산서").Range("A4").value := "단위: 원"
	xlWorkbook.sheets("손익계산서").Range("A4:F4").Merge()
    xlWorkbook.sheets("손익계산서").Range("4:4").font.size := 8
    xlWorkbook.sheets("손익계산서").Range("4:4").font.bold := 1
    xlWorkbook.sheets("손익계산서").Range("4:4").HorizontalAlignment := -4152  ;(R)

    xlWorkbook.sheets("손익계산서").Range("4:4").RowHeight := 16.5

	xlWorkbook.sheets("손익계산서").Range("A5").value := "상 호"
	xlWorkbook.sheets("손익계산서").Range("B5").value := "신흥목재"
	xlWorkbook.sheets("손익계산서").Range("D5").value := "사업자등록번호"
	xlWorkbook.sheets("손익계산서").Range("F5").value := "312-23-48342"


	xlWorkbook.sheets("손익계산서").Range("A5:A6").Merge()
	xlWorkbook.sheets("손익계산서").Range("B5:C6").Merge()
	xlWorkbook.sheets("손익계산서").Range("D5:D6").Merge()
	xlWorkbook.sheets("손익계산서").Range("E5:F6").Merge()

    xlWorkbook.sheets("손익계산서").Range("5:7").HorizontalAlignment := -4108  ; (C) 중앙



	xlWorkbook.sheets("손익계산서").Range("A7").value := "계 정 과 목"
	xlWorkbook.sheets("손익계산서").Range("B7").value := "코드"
	xlWorkbook.sheets("손익계산서").Range("C7").value := "금 액"
	xlWorkbook.sheets("손익계산서").Range("D7").value := "계 정 과 목"
	xlWorkbook.sheets("손익계산서").Range("E7").value := "코드"
	xlWorkbook.sheets("손익계산서").Range("F7").value := "금 액"

    T1:=["Ⅰ.매출액", "    1. 상품매출", "    2. 외상매출", "Ⅱ.매출원가", "    1.상품매출원가 (①+②-③-④)", "        ① 기초재고액", "        ② 당기매입액", "        ③ 기말재고액", "Ⅲ.매출총이익 (Ⅰ－Ⅱ)", "Ⅳ.판매비와 관리비", "    1.급여와 임금ㆍ제수당", "    3. 퇴직급여", "    4. 복리후생비", "    5. 여비교통비", "    6. 임차료", "    7. 통신비", "    8. 전력비", "    9. 적금", "    10. 유류비", "    11. 보험료", "    12. 식대", "    13. 세금과공과", "    14. 세무비용", "    15. 매장운영비용", "    16. 수선비", "    17. 건물관리비", "    18. 접대비", "    19. 광고선전비", "    21. 운반비", "    22. 차량장비 유지비", "    23. 카드사용료", "    24. 지급수수료", "    25. 판매수수료", "    28. 소모품비", "Ⅴ.영업손익(Ⅲ－Ⅳ)", "Ⅵ.영업외수익", "Ⅶ.영업외비용", "    9. 재고자산,감모손실", "    10. 재해손실", "Ⅷ.당기순손익(Ⅴ＋Ⅵ－Ⅶ)"]

    T2:=["1", "2", "3", "9", "10", "11", "12", "13", "20", "21", "22", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "42", "44", "45", "46", "47", "48", "51", "62", "63", "81", "90", "91", "99"]
    TT=0


    타이틀행:=xlWorkbook.sheets("손익계산서").UsedRange.Rows.Count



    Loop, 30
    {
        TT++
        TT1 := TT + 7
        xlWorkbook.sheets("손익계산서").Range("A" TT1).value := T1[TT]
        xlWorkbook.sheets("손익계산서").Range("B" TT1).value := T2[TT]

        공식 := % "=INDEX($H$42:$I$1312,MATCH(B" TT1 ",$H$42:$H$1312,0),2)"

        xlWorkbook.sheets("손익계산서").Range("C" TT1).value := 공식
    }

    TT=30
    Loop, 10
    {
        TT++
        TT1 := TT - 23
        xlWorkbook.sheets("손익계산서").Range("D" TT1).value := T1[TT]
        xlWorkbook.sheets("손익계산서").Range("E" TT1).value := T2[TT]

        공식 := % "=INDEX($H$42:$I$1312,MATCH(E" TT1 ",$H$42:$H$1312,0),2)"

        xlWorkbook.sheets("손익계산서").Range("F" TT1).value := 공식
    }

	xlWorkbook.sheets("손익계산서").Range("A38:F40").Merge()
    xlWorkbook.sheets("손익계산서").Range("A5:F40").Borders.LineStyle :=1 ; 선

    xlWorkbook.sheets("손익계산서").Range("A8:C8").Interior.ColorIndex := 15
    xlWorkbook.sheets("손익계산서").Range("A11:C11").Interior.ColorIndex := 15
    xlWorkbook.sheets("손익계산서").Range("A16:C17").Interior.ColorIndex := 15
    xlWorkbook.sheets("손익계산서").Range("D12:F14").Interior.ColorIndex := 15
    xlWorkbook.sheets("손익계산서").Range("D17:F17").Interior.ColorIndex := 15

    xlWorkbook.sheets("손익계산서").Range("A8:C8").Font.Bold := 1 ; 진하게
    xlWorkbook.sheets("손익계산서").Range("A11:C11").Font.Bold := 1 ; 진하게
    xlWorkbook.sheets("손익계산서").Range("A16:C17").Font.Bold := 1 ; 진하게
    xlWorkbook.sheets("손익계산서").Range("D12:F14").Font.Bold := 1 ; 진하게
    xlWorkbook.sheets("손익계산서").Range("D17:F17").Font.Bold := 1 ; 진하게

    RNG := "A1:F4"
    for index, Side in [7,8,9,10] ; Left, Top, Bottom, Right ; 외곽선만
        xlWorkbook.sheets("손익계산서").Range(RNG).Borders(Side).LineStyle := 1 ; 1보, 2~3점, 9이중



    xlWorkbook.sheets("손익계산서").Range("C8:C37").NumberFormat := "#,#0" ;"0.0" ; 숫자 포맷(천원단위 표시
    xlWorkbook.sheets("손익계산서").Range("F8:F37").NumberFormat := "#,#0" ;"0.0" ; 숫자 포맷(천원단위 표시



    return