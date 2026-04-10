
#NoEnv
#SingleInstance, Force
Process, close, JedaeroM.exe
SetTitleMatchMode, 3
SetTitleMatchMode, slow ; 엑셀 COM 객체 생성
SetBatchLines, -1

SendMode Input

Filename1 := A_Desktop . "\복사본 비용처리2.xlsx"
Filename2 := A_Desktop . "\매입엑셀.xlsx"
Filename3 := A_Desktop . "\매출엑셀.xlsx"
Filename4 := A_Desktop . "\기초엑셀.xlsx"
Filename5 := A_Desktop . "\기말엑셀.xlsx"

FileDelete, % A_Desktop . "\복사본 비용처리2.xlsx"
FileDelete, % A_Desktop . "\매입엑셀.xlsx"
FileDelete, % A_Desktop . "\매출엑셀.xlsx"
FileDelete, % A_Desktop . "\기초엑셀.xlsx"
FileDelete, % A_Desktop . "\기말엑셀.xlsx"

;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

시작 = 2024-07-01
끝 = 2024-07-31

;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

WINTITLE=손익계산서
Gui, 1:Destroy
Gui, 1:Default
Gui, 1:+alwaysontop
Gui, 1:ADD, TEXT, w140 v루틴넘버, %WINTITLE%
Gui, 1:Show, x2057 y1165 w150, %WINTITLE%


RegExMatch(시작, "(.*)-(.*)-(.*)", 시작)
시작월 := 시작1 "-" 시작2 "*"


루틴1:   ;  비용처리 수입지출 내역 확보
{
	GuiControl, , 루틴넘버, %WINTITLE%=루틴1

	run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M, Max

	WinWait, ahk_class TfmLogin,
	IfWinNotActive, ahk_class TfmLogin, , WinActivate, ahk_class TfmLogin,
	WinWaitActive, ahk_class TfmLogin,
	Sleep, 100

	Send, kk0404
	Sleep, 100
	send, {Enter}
	Sleep, 2000
	;~ WinActivate, ahk_exe JedaeroM.exe

	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 1000

	send, {LAlt}{Enter}{Right 4}{Down 3}{Enter}
	Sleep, 1000
	ControlSend, TRzDateTimeEdit2, {Del 20}%시작%, ahk_class TfmMain
	ControlSend, TRzDateTimeEdit1, {Del 20}%끝%, ahk_class TfmMain
	ControlClick, TAdvToolBar4, ahk_class TfmMain
	Sleep, 2000
	ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x143 y13

	Sleep, 2000
	Loop
	{
		if WinExist("통합 문서1 - Excel"){
		try { ; 이미 활성화된 Excel 인스턴스 가져오기
			엑셀03 := ComObjActive("Excel.Application")
			엑셀03.Visible := false ; 엑셀 창을 표시하려면 true로 설정
		} catch {
		}
		wb := 엑셀03.ActiveWorkbook
		ws := wb.ActiveSheet
		Loop
		{
			initialRowCount := currentRowCount
			Sleep, 2000
			currentRowCount := ws.UsedRange.Rows.Count
			if(currentRowCount = "0")
			{
					ToolTip, Append 작업중. 현재 행 갯수0: %currentRowCount%
			}
			else
			{
				if (currentRowCount = initialRowCount) {
					ToolTip, Append 작업이 완료되었습니다. 현재 행 갯수1: %currentRowCount%
					break
				}
				else
				{
					ToolTip, Append 작업중. 현재 행 갯수2: %currentRowCount%
				}
			}
		}



		ws.Range("A:A").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("L:L").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("C:C").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("A:A").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("H:H").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("B:B").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("D:D").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("C:C").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("G:G").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("D:D").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("E:E").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("M:M").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("F:F").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("E:E").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("M:M").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("F:F").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("L:L").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("G:G").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("E:F").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("H:I").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("H:H").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("F:F").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("I:I").Copy ; 선택 시트의 A~Z열 복사
		ws.Range("E:E").PasteSpecial(-4163) ; 값만 붙여넣기

		ws.Range("H:T").DELETE ; 선택 시트의 A~Z열 복사


			WinKill, ahk_exe JedaeroM.exe
		Sleep, 2000
		엑셀03.ActiveWorkbook.Saveas(A_Desktop . "\복사본 비용처리2.xlsx")
		엑셀03.ActiveWorkbook.Close(1)
		엑셀03.Quit
		엑셀03:=""
		Sleep, 2000
		initialRowCount=
		currentRowCount=
		Sleep, 2000
					break
		}else{
		}
	}
}



루틴2:   ;  매입금액 외상장부 내역 확보
{
	GuiControl, , 루틴넘버, %WINTITLE%=루틴2
	run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M, Max

	WinWait, ahk_class TfmLogin,
	IfWinNotActive, ahk_class TfmLogin, , WinActivate, ahk_class TfmLogin,
	WinWaitActive, ahk_class TfmLogin,
	Sleep, 100

	Send, kk0404
	Sleep, 100
	send, {Enter}
	Sleep, 2000
	;~ WinActivate, ahk_exe JedaeroM.exe

	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 1000

	send, {LAlt}{Enter}{Left 3}{Down 2}{Enter}
	Sleep, 1000
	Control, choose, 3, TRzComboBox6, ahk_class TfmMain
	ControlSend, TRzDateTimeEdit2, {Del 20}%시작%, ahk_class TfmMain
	ControlSend, TRzDateTimeEdit1, {Del 20}%끝%{F6}, ahk_class TfmMain
	ControlClick, TAdvToolBar4, ahk_class TfmMain,,,,x49 y14
	Sleep, 5000
	ControlClick, TAdvToolBar3, ahk_class TfmMain,,,,x143 y13

	Sleep, 2000
	Loop
	{
		if WinExist("통합 문서1 - Excel"){
			try { ; 이미 활성화된 Excel 인스턴스 가져오기
				엑셀03 := ComObjActive("Excel.Application")
				엑셀03.Visible := false ; 엑셀 창을 표시하려면 true로 설정
			} catch {
			}
			wb := 엑셀03.ActiveWorkbook
			ws := wb.ActiveSheet
			Loop
			{
				initialRowCount := currentRowCount
				Sleep, 2000
				currentRowCount := ws.UsedRange.Rows.Count
				if(currentRowCount = "0")
				{
						ToolTip, Append 작업중. 현재 행 갯수0: %currentRowCount%
				}
				else
				{
					if (currentRowCount = initialRowCount) {
						ToolTip, Append 작업이 완료되었습니다. 현재 행 갯수1: %currentRowCount%
						break
					}
					else
					{
						ToolTip, Append 작업중. 현재 행 갯수2: %currentRowCount%
					}
				}
			}

			WinKill, ahk_exe JedaeroM.exe
			Sleep, 2000
			엑셀03.ActiveWorkbook.Saveas(A_Desktop . "\매입엑셀.xlsx")
			엑셀03.ActiveWorkbook.Close(1)
			엑셀03.Quit
			엑셀03:=""
			Sleep, 2000
			initialRowCount=
			currentRowCount=
			Sleep, 2000

			break
		}else{
		}
	}
}

루틴3:   ;  매출 부분    일자전표관리 서  내역 확보
{
	GuiControl, , 루틴넘버, %WINTITLE%=루틴3
	run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M, Max

	WinWait, ahk_class TfmLogin,
	IfWinNotActive, ahk_class TfmLogin, , WinActivate, ahk_class TfmLogin,
	WinWaitActive, ahk_class TfmLogin,
	Sleep, 100

	Send, kk0404
	Sleep, 100
	send, {Enter}
	Sleep, 2000
	;~ WinActivate, ahk_exe JedaeroM.exe

	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 1000

	send, {LAlt}{Enter}{Right 3}{Enter}
	Sleep, 1000
	ControlSend, TRzDateTimeEdit2, {Del 20}%시작%, ahk_class TfmMain
	ControlSend, TRzDateTimeEdit1, {Del 20}%끝%, ahk_class TfmMain
	ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x49 y14
	Sleep, 5000
	ControlClick, TAdvToolBar4, ahk_class TfmMain,,,,x329,y15
	Sleep, 400
	Send, {Down}{Enter}
	Sleep, 2000

	Loop
	{
		if WinExist("통합 문서1 - Excel"){
			try { ; 이미 활성화된 Excel 인스턴스 가져오기
				엑셀03 := ComObjActive("Excel.Application")
				엑셀03.Visible := false ; 엑셀 창을 표시하려면 true로 설정
			} catch {
			}
			wb := 엑셀03.ActiveWorkbook
			ws := wb.ActiveSheet
			Loop
			{
				initialRowCount := currentRowCount
				Sleep, 2000
				currentRowCount := ws.UsedRange.Rows.Count
				if(currentRowCount = "0")
				{
						ToolTip, Append 작업중. 현재 행 갯수0: %currentRowCount%
				}
				else
				{
					if (currentRowCount = initialRowCount) {
						ToolTip, Append 작업이 완료되었습니다. 현재 행 갯수1: %currentRowCount%
						break
					}
					else
					{
						ToolTip, Append 작업중. 현재 행 갯수2: %currentRowCount%
					}
				}
			}

			WinKill, ahk_exe JedaeroM.exe
			Sleep, 2000
			엑셀03.ActiveWorkbook.Saveas(A_Desktop . "\매출엑셀.xlsx")
			엑셀03.ActiveWorkbook.Close(1)
			엑셀03.Quit
			엑셀03:=""
			Sleep, 2000
			initialRowCount=
			currentRowCount=
			Sleep, 2000

			break
		}else{
		}
	}
}

루틴4:   ; 기초재고   시점재고 시작 검색
{
	GuiControl, , 루틴넘버, %WINTITLE%=루틴4
	run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M, Max

	WinWait, ahk_class TfmLogin,
	IfWinNotActive, ahk_class TfmLogin, , WinActivate, ahk_class TfmLogin,
	WinWaitActive, ahk_class TfmLogin,
	Sleep, 100

	Send, kk0404
	Sleep, 100
	send, {Enter}
	Sleep, 2000
	;~ WinActivate, ahk_exe JedaeroM.exe

	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 1000

	send, {LAlt}{Enter}{Left 3}{Down 5}{Enter}
	Sleep, 1000
	ControlSend, TRzDateTimeEdit2, {Del 20}%시작%, ahk_class TfmMain
	ControlSend, TRzDateTimeEdit1, {Del 20}%시작%{F6}, ahk_class TfmMain
	ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x28 y14
	Sleep, 2000
	ControlClick, TAdvToolBar3, ahk_class TfmMain,,,,x143 y13

	Sleep, 2000

	Loop
	{
		if WinExist("통합 문서1 - Excel"){
			try { ; 이미 활성화된 Excel 인스턴스 가져오기
				엑셀03 := ComObjActive("Excel.Application")
				엑셀03.Visible := false ; 엑셀 창을 표시하려면 true로 설정
			} catch {
			}
			wb := 엑셀03.ActiveWorkbook
			ws := wb.ActiveSheet
			Loop
			{
				initialRowCount := currentRowCount
				Sleep, 2000
				currentRowCount := ws.UsedRange.Rows.Count
				if(currentRowCount = "0")
				{
						ToolTip, Append 작업중. 현재 행 갯수0: %currentRowCount%
				}
				else
				{
					if (currentRowCount = initialRowCount) {
						ToolTip, Append 작업이 완료되었습니다. 현재 행 갯수1: %currentRowCount%
						break
					}
					else
					{
						ToolTip, Append 작업중. 현재 행 갯수2: %currentRowCount%
					}
				}
			}

			WinKill, ahk_exe JedaeroM.exe
			Sleep, 2000
			엑셀03.ActiveWorkbook.Saveas(A_Desktop . "\기초엑셀.xlsx")
			엑셀03.ActiveWorkbook.Close(1)
			엑셀03.Quit
			엑셀03:=""
			Sleep, 2000
			initialRowCount=
			currentRowCount=
			Sleep, 2000

			break
		}else{
		}
	}
}


루틴5:   ; 기말재고   시점재고 끝 검색
{
	GuiControl, , 루틴넘버, %WINTITLE%=루틴5
	run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M, Max

	WinWait, ahk_class TfmLogin,
	IfWinNotActive, ahk_class TfmLogin, , WinActivate, ahk_class TfmLogin,
	WinWaitActive, ahk_class TfmLogin,
	Sleep, 100

	Send, kk0404
	Sleep, 100
	send, {Enter}
	Sleep, 2000
	;~ WinActivate, ahk_exe JedaeroM.exe

	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 1000

	send, {LAlt}{Enter}{Left 3}{Down 5}{Enter}
	Sleep, 1000
	ControlSend, TRzDateTimeEdit2, {Del 20}%끝%, ahk_class TfmMain
	ControlSend, TRzDateTimeEdit1, {Del 20}%끝%{F6}, ahk_class TfmMain
	ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x28 y14
	Sleep, 2000
	ControlClick, TAdvToolBar3, ahk_class TfmMain,,,,x143 y13

Sleep, 2000

	Loop
	{
		if WinExist("통합 문서1 - Excel"){
			try { ; 이미 활성화된 Excel 인스턴스 가져오기
				엑셀03 := ComObjActive("Excel.Application")
				엑셀03.Visible := false ; 엑셀 창을 표시하려면 true로 설정
			} catch {
			}
			wb := 엑셀03.ActiveWorkbook
			ws := wb.ActiveSheet
			Loop
			{
				initialRowCount := currentRowCount
				Sleep, 2000
				currentRowCount := ws.UsedRange.Rows.Count
				if(currentRowCount = "0")
				{
						ToolTip, Append 작업중. 현재 행 갯수0: %currentRowCount%
				}
				else
				{
					if (currentRowCount = initialRowCount) {
						ToolTip, Append 작업이 완료되었습니다. 현재 행 갯수1: %currentRowCount%
						break
					}
					else
					{
						ToolTip, Append 작업중. 현재 행 갯수2: %currentRowCount%
					}
				}
			}
			WinKill, ahk_exe JedaeroM.exe
			Sleep, 2000
			엑셀03.ActiveWorkbook.Saveas(A_Desktop . "\기말엑셀.xlsx")
			엑셀03.ActiveWorkbook.Close(1)
			엑셀03.Quit
			엑셀03:=""
			Sleep, 2000
			initialRowCount=
			currentRowCount=
			Sleep, 2000

			break
		}else{
		}
	}
}


;                       ㅁ         ㅁ      ㅁㅁㅁㅁㅁㅁㅁ  ㅁ                                              \
;                     ㅁ  ㅁ       ㅁ           ㅁㅁ       ㅁ                                                     \
;                   ㅁ      ㅁ     ㅁ         ㅁ    ㅁ     ㅁㅁㅁ                                                        \
;                 ㅁ         ㅁ    ㅁ       ㅁ        ㅁ   ㅁ                                                               \
;               ㅁ            ㅁ   ㅁ                                                                                           \
;                                  ㅁ          ㅁㅁㅁㅁㅁㅁㅁ                                                               \
;                                  ㅁ                      ㅁ                                                            \
;                                  ㅁ                      ㅁ                                                     \
;                                  ㅁ                      ㅁ                                              \


Global xl ; 중요함
xl := ComObjCreate("Excel.Application")
xl.Visible := true ; 엑셀 창을 표시하려면 true로 설정


xl.DisplayAlerts := false

조회월=2024-
조회월:=조회월 . "*"



; 엑셀 파일 열기
xlWorkbook := xl.Workbooks.Open(Filename1)
xlWorksheet := xlWorkbook.Sheets("sheet1") ; 첫 번째 시트 선택
; AUTOFILTER 적용





 /*
 ////////////////////////////////////////  꾸 미 기  ////////////////////////////////////////////////
 ////////////////////////////////////////  꾸 미 기  ////////////////////////////////////////////////
 ////////////////////////////////////////  꾸 미 기  ////////////////////////////////////////////////
 ////////////////////////////////////////  꾸 미 기  ////////////////////////////////////////////////
 */


	xlWorksheet.Columns("A").ColumnWidth := 24 ; 열너비 조정
	xlWorksheet.Columns("D").ColumnWidth := 24 ; 열너비 조정
	xlWorksheet.Columns("B").ColumnWidth := 6 ; 열너비 조정
	xlWorksheet.Columns("E").ColumnWidth := 6 ; 열너비 조정
	xlWorksheet.Columns("C").ColumnWidth := 16 ; 열너비 조정
	xlWorksheet.Columns("F").ColumnWidth := 16 ; 열너비 조정


	xlWorksheet.Range("A1:G2000").Font.size := 10
	xlWorksheet.Range("A2:G2000").Sort(xlWorksheet.Range("B:B"))


	xlWorksheet.Range("B:B").HorizontalAlignment := -4108 ; 중앙 ;
	xlWorksheet.Range("E:E").HorizontalAlignment := -4108 ; 중앙 ;










	xlWorksheet.Range("A1:G3000").AutoFilter
	xlRange1 := xlWorksheet.Range("G2:G3000")
	xlRange2 := xlWorksheet.Range("B2:B3000")
arr:=["1", "2", "3", "9", "10", "11", "12", "13", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "42", "44", "45", "46", "47", "48", "51", "62", "63", "81", "90", "91", "99"]
arr3:=["()", "1. 상품매출", "2. 외상매출", "()", "1.상품매출원가①+②-③)", "① 기초재고액", "② 당기매입액", "③ 기말재고액", "()", "()", "1.급여,임금,재수당", "2. 일용급여", "3. 퇴직급여", "4. 복리후생비", "5. 여비교통비", "6. 임차료", "7. 통신비", "8. 전력비", "9. 적금", "10. 유류비", "11. 보험료", "12. 식대", "13. 세금과공과", "14. 세무비용", "15. 매장운영비용", "16. 수선비", "17. 건물관리비", "18. 접대비", "19. 광고선전비", "21. 운반비", "22. 차량장비 유지비", "23. 카드사용료", "24. 지급수수료", "25. 판매수수료", "28. 소모품비", "()", "()", "()", "9. 재고자산,감모손실", "10. 재해손실", "()"]
arr4:=["① 기초재고액", "재해손실", "급여 임금 제수당(1) ", "퇴직급여(3)", "복리후생비(4)", "여비교통비(5)", "임차료(6)", "통신비(7)", "전력비(8)", "적금(9)", "유류비(10)", "보험료(11)", "세금과공과(13)", "세무비용(14)", "매장운영비용(15)", "식대(12)", "수선비(16)", "건물관리비(17)", "접대비(18)", "광고선전비(19)", "운반비(21)", "차량장비유지비(22)", "카드사용료(23)", "지급수수료(24)", "판매수수료(25)", "소모품비(28)"]
arr2:=[]
A=0



	xlWorkbook.Worksheets.Add(, xlWorkbook.Sheets(1)).Name := "손익계산서"

		xlWorkbook.sheets("손익계산서").Range("A1") := "계정분류"
		xlWorkbook.sheets("손익계산서").Range("B1") := "과목코드"
		xlWorkbook.sheets("손익계산서").Range("C1") := "계정과목"
		xlWorkbook.sheets("손익계산서").Range("D1") := "항목내용"
		xlWorkbook.sheets("손익계산서").Range("E1") := "수입금액"
		xlWorkbook.sheets("손익계산서").Range("F1") := "지출금액"
		xlWorkbook.sheets("손익계산서").Range("G1") := "입력날짜"
Loop, % arr.length()
;~ Loop, 1
{
	A++
	종목:=arr[A]
	;~ 종목시트:=arr[A] . " . " . arr3[A]
	종목시트:=arr[A]
	;~ MsgBox, % 종목
	xlWorksheet.activate
	;~ xlWorksheet.AutoFilterMode := false
	xlRange1.AutoFilter(7, 조회월) ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)
	xlRange2.AutoFilter(2, 종목) ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)

	UsedRange	:=	xl.ActiveSheet.UsedRange.Address

	xlCellTypeVisible := 12

	xlWorkbook.Worksheets.Add(, xlWorkbook.Sheets(1)).Name := 종목시트

	;~ xlWorkbook.Worksheets.Add(,xlWorkbook.sheets(1)) ; 새 시트를 sheet1 뒷 편에 생성합니다
	xlWorksheet.Range(UsedRange).SpecialCells(xlCellTypeVisible).Copy(xlWorkbook.sheets(2).range("A1"))

	종목행:=xlWorkbook.sheets(2).UsedRange.Rows.Count
	종목행1:=종목행 + 1
	종목행2:=종목행 - 1


 /* 합계구하기 /* /*
 */


	공식 := % "=sum(F2:F" 종목행 ")"
	;~ xlWorkbook.sheets(2).range("F" 종목행1).formula := 공식
	xlWorkbook.sheets(2).range("H2").formula := arr[A]
	xlWorkbook.sheets(2).range("I2").formula := 공식
	xlWorkbook.sheets(2).range("I2").NumberFormat := "0" ; 포멧변경
	종목값 := xlWorkbook.sheets(2).range("I2").value
	arr2[A_Index] := 종목값





	종목행4:=xlWorkbook.sheets("손익계산서").UsedRange.Rows.Count

	종목행44 := 종목행4 + 1
	종목행33 := 종목행44 + 종목행2 + 1

;~ MsgBox, 종목행1:%종목행1%`n종목행:%종목행%`n종목행12:%종목행12%`n종목행2:%종목행2%`n종목행3:%종목행3%`n종목행4:%종목행4%`n종목행44:%종목행44%`n최종붙일행:%최종붙일행%
	if(종목행="1"){

		xlWorkbook.sheets("손익계산서").Range("A" 종목행44).value := "판관비와 관리비"
		xlWorkbook.sheets("손익계산서").Range("B" 종목행44).value := arr[A]
		xlWorkbook.sheets("손익계산서").Range("C" 종목행44).value := arr3[A]
		xlWorkbook.sheets("손익계산서").Range("D" 종목행44).value :=
		xlWorkbook.sheets("손익계산서").Range("E" 종목행44).value :=
		xlWorkbook.sheets("손익계산서").Range("F" 종목행44).value :=
		xlWorkbook.sheets("손익계산서").Range("G" 종목행44).value :=
		xlWorkbook.sheets("손익계산서").Range("H" 종목행44).value := arr[A]
		xlWorkbook.sheets("손익계산서").Range("I" 종목행44).value := "0"

	}else{
	xlWorkbook.sheets(종목시트).Range("A2:I" 종목행).copy
	붙일행 := 종목행 - 1
	최종붙일행 := 종목행44 + 종목행2
	;~ MsgBox, % "종목행1:" 종목행1 "`n" "종목행44:" 종목행44 "`n" "종목행3:" 종목행3
	xlWorkbook.sheets("손익계산서").Range("A" 종목행44).pastespecial(-4163)

	;~ MsgBox, % "종목행1:" 종목행1 "`n" "종목행44:" 종목행44 "`n" "최종붙일행:" 최종붙일행


	;~ xlWorksheet.AutoFilterMode := false
	;~ xlRange1.AutoFilter(7,"") ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)
	;~ xlRange2.AutoFilter(2,"") ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)
	;~ Sleep, 1000
	}
}



/*
; 필터링된 행만 보기
visibleRows := xlRange1.SpecialCells(12) ; 12는 보이는 셀만 선택하는 상수입니다
filteredRowCount := visibleRows.Rows.Count

MsgBox % "필터링된 행 수: " . filteredRowCount
*/



	xlWorksheet.AutoFilterMode := false

	;~ xlRange1.AutoFilter(7, 시작월) ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)
	;~ xlRange2.AutoFilter(2, 종목) ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)
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





	xlWorkbook.sheets("손익계산서").Range("G:G").DELETE ; 선택 시트의 A~Z열 복사
	xlWorkbook.sheets("손익계산서").Range("G:G").insert ; 선택 시트의 A~Z열 복사






; 엑셀 COM 객체 생성
Global x3 ; 중요함
x3 := ComObjCreate("Excel.Application")
x3.Visible := false ; 엑셀 창을 표시하려면 true로 설정
;~ x3.Visible := true ; 엑셀 창을 표시하려면 true로 설정

x3.DisplayAlerts := false

; 엑셀 파일 열기
x3Workbook := x3.Workbooks.Open(A_Desktop "\매출엑셀.xlsx")
x3Worksheet := x3Workbook.Sheets("sheet1") ; 첫 번째 시트 선택


	매출행:=x3Worksheet.UsedRange.Rows.Count

	공식4 := % "=sum(F2:F" 매출행 ")"
	공식5 := % "=sum(I2:I" 매출행 ")"
	x3Worksheet.range("F1").formula := 공식4
	x3Worksheet.range("I1").formula := 공식5

	x3Worksheet.Range("1:1").copy
	x3Worksheet.Range("1:1").PasteSpecial(-4163)

	매출합계 := x3Worksheet.range("F1").value
	외상합계 := x3Worksheet.range("I1").value



Global x4 ; 중요함
x4 := ComObjCreate("Excel.Application")
x4.Visible := false ; 엑셀 창을 표시하려면 true로 설정
;~ x4.Visible := true ; 엑셀 창을 표시하려면 true로 설정

x4.DisplayAlerts := false

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
x5.Visible := false ; 엑셀 창을 표시하려면 true로 설정
;~ x5.Visible := true ; 엑셀 창을 표시하려면 true로 설정
x5.DisplayAlerts := false


; 엑셀 파일 열기
x5Workbook := x5.Workbooks.Open(A_Desktop "\기말엑셀.xlsx")
x5Worksheet := x5Workbook.Sheets("sheet1") ; 첫 번째 시트 선택


	기말행:=x5Worksheet.UsedRange.Rows.Count

	공식7 := % "=sum(T2:T" 기말행 ")"
	x5Worksheet.range("T1").formula := 공식7

	x5Worksheet.Range("1:1").copy
	x5Worksheet.Range("1:1").PasteSpecial(-4163)

	x5Worksheet.Range("1:1").select
	기말합계 := x5Worksheet.range("T1").value

;~ MsgBox, % 매출합계 "`n" 외상합계 "`n" 기초합계 "`n" 기말합계


		xlWorkbook.sheets("손익계산서").Range("F9").value := 기말합계
		xlWorkbook.sheets("손익계산서").Range("I9").value := 기말합계

		xlWorkbook.sheets("손익계산서").Range("F7").value := 기초합계
		xlWorkbook.sheets("손익계산서").Range("I7").value := 기초합계

		xlWorkbook.sheets("손익계산서").Range("F2").value := 매출합계
		xlWorkbook.sheets("손익계산서").Range("I2").value := 매출합계

		xlWorkbook.sheets("손익계산서").Range("F3").value := 매출합계
		xlWorkbook.sheets("손익계산서").Range("I3").value := 매출합계

		xlWorkbook.sheets("손익계산서").Range("F4").value := 외상합계
		xlWorkbook.sheets("손익계산서").Range("I4").value := 외상합계




;~ MsgBox, 쉿




Global x2 ; 중요함
x2 := ComObjCreate("Excel.Application")
x2.Visible := false ; 엑셀 창을 표시하려면 true로 설정
;~ x2.Visible := true ; 엑셀 창을 표시하려면 true로 설정
x2.DisplayAlerts := false


; 엑셀 파일 열기
x2Workbook := x2.Workbooks.Open(A_Desktop "\매입엑셀.xlsx")
x2Worksheet := x2Workbook.Sheets("sheet1") ; 첫 번째 시트 선택

x2Worksheet.Range("Y:Z").delete
x2Worksheet.Range("U:W").delete
x2Worksheet.Range("D:R").delete
x2Worksheet.Range("A:B").delete





; C열에서 0이 아닌 값만 필터링
x2Worksheet.Range("C:C").AutoFilter(1, "<>0") ; 1은 필터를 적용할 열의 인덱스입니다 (C 열)


; C열을 오름차순으로 정렬
x2Range := x2Worksheet.Range("C:C")
x2Range.Sort(x2Range, 2, , , , , , 2) ; 1은 오름차순을 의미합니다


	UsedRange	:=	x2.ActiveSheet.UsedRange.Address

	x2CellTypeVisible := 12

	x2Workbook.Worksheets.Add(, x2Workbook.Sheets(1)).Name := "매입로우데이터"

	;~ x2Workbook.Worksheets.Add(,x2Workbook.sheets(1)) ; 새 시트를 sheet1 뒷 편에 생성합니다
	x2Worksheet.Range(UsedRange).SpecialCells(x2CellTypeVisible).Copy(x2Workbook.sheets(2).range("A1"))

	매입행:=x2Workbook.sheets(2).UsedRange.Rows.Count

	매입행1 := 매입행 - 1
	Z=1

loop, % 매입행1
{
	Z++
	공식1 := % "=C" Z "-D" Z

	x2Workbook.sheets(2).range("B" Z).formula := 공식1
	;~ x2Workbook.sheets(2).range("I2").NumberFormat := "0" ; 포멧변경
	;~ 매입값 := x2Workbook.sheets(2).range("I2").value
	;~ arr2[A_Index] := 매입값

}




x2Workbook.sheets(2).Range("A:B").copy
x2Workbook.sheets(2).Range("A:B").PasteSpecial(-4163)

x2Workbook.sheets(2).Range("C:D").delete
x2Workbook.sheets(2).Range("B:B").insert



	공식2 := % "=sum(C2:C" 매입행 ")"
	x2Workbook.sheets(2).range("E2").value := "12"
	x2Workbook.sheets(2).range("F2").formula := 공식2


	매입합계 := x2Workbook.sheets(2).range("F2").value



	매입행:=x2Workbook.sheets(2).UsedRange.Rows.Count


매입행1 := 매입행 - 1

추가매입행 := 매입행1 + 7

	xlWorkbook.sheets("손익계산서").Range("9:" 추가매입행).insert


x2Workbook.sheets(2).Range("A2:F" 매입행).copy
Sleep, 100
;~ xlWorkbook.sheets("손익계산서")
xlWorkbook.sheets("손익계산서").Range("D8").PasteSpecial(-4163)
;~ xlWorkbook.sheets("손익계산서").Range("D8").Paste


x2.Application.CutCopyMode := False ; 복사모드 해제
x3.Application.CutCopyMode := False ; 복사모드 해제
x4.Application.CutCopyMode := False ; 복사모드 해제
x5.Application.CutCopyMode := False ; 복사모드 해제

x2.DisplayAlerts := true

x3.DisplayAlerts := true

x4.DisplayAlerts := true

x5.DisplayAlerts := true


x2Workbook.Close(false) ; 변경 내용을 저장하지 않고 닫기
x2.Quit()
x2 := "" ; 변수 해제

x3Workbook.Close(false) ; 변경 내용을 저장하지 않고 닫기
x3.Quit()
x3 := "" ; 변수 해제

x4Workbook.Close(false) ; 변경 내용을 저장하지 않고 닫기
x4.Quit()
x4 := "" ; 변수 해제

x5Workbook.Close(false) ; 변경 내용을 저장하지 않고 닫기
x5.Quit()
x5 := "" ; 변수 해제




	xlWorkbook.sheets("손익계산서").Columns("A").ColumnWidth := 24 ; 열너비 조정
	xlWorkbook.sheets("손익계산서").Columns("D").ColumnWidth := 24 ; 열너비 조정
	xlWorkbook.sheets("손익계산서").Columns("B").ColumnWidth := 6 ; 열너비 조정
	xlWorkbook.sheets("손익계산서").Columns("E").ColumnWidth := 6 ; 열너비 조정
	xlWorkbook.sheets("손익계산서").Columns("C").ColumnWidth := 16 ; 열너비 조정
	xlWorkbook.sheets("손익계산서").Columns("F").ColumnWidth := 16 ; 열너비 조정



	상품매출원가:= 기초합계 + 매입합계 - 기말합계


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



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





매출원가 := V[11] + V[12] - V[13]

xlWorkbook.sheets("손익계산서").Range("F" R[9]).value := 매출원가
xlWorkbook.sheets("손익계산서").Range("I" R[9]).value := 매출원가

xlWorkbook.sheets("손익계산서").Range("F" R[10]).value := 매출원가
xlWorkbook.sheets("손익계산서").Range("I" R[10]).value := 매출원가











매출총이익 := V[1] - 매출원가

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


영업손익 := 매출총이익 - 판관비
xlWorkbook.sheets("손익계산서").Range("F" R[62]).value := 영업손익
xlWorkbook.sheets("손익계산서").Range("I" R[62]).value := 영업손익


당기순이익 := 영업손익 + R[63] - 영업외비용

xlWorkbook.sheets("손익계산서").Range("F" R[99]).formula := 당기순이익
xlWorkbook.sheets("손익계산서").Range("I" R[99]).formula := 당기순이익






arro:=["급여 임금 제수당(1)", "통신비(7)", "전력비(8)", "적금(9)", "유류비(10)", "보험료(11)", "식대(12)", "세금과공과(13)", "세무비용(14)", "매장운영비용(15)", "건물관리비(17)", "운반비(21)"]
arrn:=["1.급여,임금,재수당", "7. 통신비", "8. 전력비", "9. 적금", "10. 유류비", "11. 보험료", "12. 식대", "13. 세금과공과", "14. 세무비용", "15. 매장운영비용", "17. 건물관리비", "21. 운반비"]


Loop, % arro.length()
{
	xlWorkbook.sheets("손익계산서").Cells.Replace(arro[A_Index], arrn[A_Index])
}

MsgBox, 여기


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


Loop, 99
{
	M++
	M1 := M + 1
	이전까지 := R[M1] - 1
	if(R[M]!="") && (R[M1]=""){
		오우:=1
	}else if(R[M]="") && (R[M1]!=""){
		오우:=2
	}else if(R[M]="") && (R[M1]=""){
		오우:=3
	}else if(R[M]!="") && (R[M1]!=""){
		오우:=4
	xlWorkbook.sheets("손익계산서").Range("B" R[M] ":B" 이전까지).Merge()
	xlWorkbook.sheets("손익계산서").Range("C" R[M] ":C" 이전까지).Merge()
	}else{
		오우:=5
	}
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
	xlWorkbook.sheets("손익계산서").Range("A" 큰제목1 ":A" 큰제목빼기1).Merge()
	;~ MsgBox, 큰제목 "`n" 큰제목1 "`n" arrT2[A_Index] "`n" xlWorkbook.sheets("손익계산서").Range("F" 큰제목1).value
}






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




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



xl.DisplayAlerts := true

xlWorkbook.sheets("손익계산서").Range("F:F").NumberFormat := "#,#0" ;"0.0" ; 숫자 포맷(천원단위 표시






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

return


guiclose:
ExitApp



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

