
#NoEnv
#SingleInstance, Force
;~ Process, close, JedaeroM.exe
SetTitleMatchMode, 3
SetTitleMatchMode, slow ; 엑셀 COM 객체 생성
SetBatchLines, -1

SendMode Input

;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

FormatTime, 시작, yyyyMMdd, yyyy-MM-dd
받는분=김태준
;~ 시작 = 2024-06-01
;~ 끝 = 2024-06-30

RegExMatch(시작, "(.*)-(.*)-(.*)", 시작)
시작월 := 시작1 "-" 시작2 "*"

;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

WinKill, 외상장부.xlsx - Excel

Filename1 := A_ScriptDir "\외상장부.xlsx"
;~ Filename2 := A_Desktop "\매입엑셀.xlsx"
;~ Filename3 := A_Desktop "\매출엑셀.xlsx"
;~ Filename4 := A_Desktop "\기초엑셀.xlsx"
;~ Filename5 := A_Desktop "\기말엑셀.xlsx"

Sleep,100
WINTITLE=외상리스트
Gui, 1:Destroy
Gui, 1:Default
Gui, 1:+alwaysontop
Gui, 1:ADD, TEXT, w140 v루틴넘버, %WINTITLE%
Gui, 1:ADD, button, y+0 w140 greload, 재 시 작
Gui, 1:Show, x2057 y1165 w150, %WINTITLE%

;~ /*
FileDelete, % A_ScriptDir "\외상장부.xlsx"
;~ FileDelete, % A_Desktop "\매입엑셀.xlsx"
;~ FileDelete, % A_Desktop "\매출엑셀.xlsx"
;~ FileDelete, % A_Desktop "\기초엑셀.xlsx"
;~ FileDelete, % A_Desktop "\기말엑셀.xlsx"

;~ /*

gosub, runkakaotalk1

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
	Sleep, 3000
	Control, choose, 2, TRzComboBox6, ahk_class TfmMain
	Control, choose, 2, TRzComboBox3, ahk_class TfmMain
	ControlSend, TRzDateTimeEdit2, {Del 20}%시작%, ahk_class TfmMain
	ControlSend, TRzDateTimeEdit1, {Del 20}%시작%{F6}, ahk_class TfmMain
	ControlClick, TAdvToolBar4, ahk_class TfmMain,,,,x49 y14
	Sleep, 5000
	ControlClick, TAdvToolBar3, ahk_class TfmMain,,,,x310 y13

	Sleep, 2000
	Loop
	{
		if WinExist("통합 문서1 - Excel"){
			try { ; 이미 활성화된 Excel 인스턴스 가져오기
				Global xl ; 중요함
				xl := ComObjActive("Excel.Application")
				XL := GetExcelInstance()

				xl.Visible := true ; 엑셀 창을 표시하려면 true로 설정
			} catch {
			}
			wb := xl.ActiveWorkbook
			ws := xl.ActiveSheet
				Sleep, 2000
			Loop
			{
				initialRowCount := currentRowCount
				Sleep, 100
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

			;~ WinKill, ahk_exe JedaeroM.exe
			;~ Sleep, 2000
			;~ 엑셀03.ActiveWorkbook.Saveas(A_ScriptDir . "\외상장부.xlsx")
			;~ 엑셀03.ActiveWorkbook.Close(1)
			;~ 엑셀03.Quit
			;~ 엑셀03:=""
			;~ Sleep, 2000
			;~ initialRowCount=
			;~ currentRowCount=
			;~ Sleep, 2000

			break
		}else{
			Sleep, 200
		}
	}
}
Sleep, 2000

;~ */

ToolTip,

	WinWait, 통합 문서1 - Excel,
	IfWinNotActive, 통합 문서1 - Excel, , WinActivate, 통합 문서1 - Excel,
	WinWaitActive, 통합 문서1 - Excel,

;                       ㅁ         ㅁ      ㅁㅁㅁㅁㅁㅁㅁ  ㅁ                                              \
;                     ㅁ  ㅁ       ㅁ           ㅁㅁ       ㅁ                                                     \
;                   ㅁ      ㅁ     ㅁ         ㅁ    ㅁ     ㅁㅁㅁ                                                        \
;                 ㅁ         ㅁ    ㅁ       ㅁ        ㅁ   ㅁ                                                                   \
;               ㅁ            ㅁ   ㅁ                                                                                                  \
;                                  ㅁ          ㅁㅁㅁㅁㅁㅁㅁ                                                                   \
;                                  ㅁ                      ㅁ                                                            \
;                                  ㅁ                      ㅁ                                                     \
;                                  ㅁ                      ㅁ                                              \





;~ Global XL ; 중요함
; 엑셀 인스턴스를 확인하는 함수
GetExcelInstance() {
    Loop {
        ; 이미 실행 중인 Excel 인스턴스 가져오기
        XL := ComObjActive("Excel.Application")

        ; 엑셀이 제대로 활성화되었는지 확인
        if IsObject(XL) {
            return XL
        }

        ; 1초 대기 후 다시 시도
        Sleep, 1000
    }
}

; 엑셀 인스턴스 가져오기


;~ XL.Visible := false
;~ XL.Visible := true









;~ Global xl ; 중요함
;~ xl := ComObjCreate("Excel.Application")
;~ xl.Visible := false ; 엑셀 창을 표시하려면 true로 설정


;~ xl.DisplayAlerts := false

조회월=2024-
조회월:=조회월 . "*"

;~ xl.sheets("sheet1")  ;

			;~ wb := xl.ActiveWorkbook
			;~ ws := xl.ActiveSheet

;~ ; 엑셀 파일 열기
xlWorkbook := xl.ActiveWorkbook
xlWorksheet := xl.ActiveSheet ; 첫 번째 시트 선택
;~ xlWorkbook := xl.Workbooks.Open(Filename1)
;~ xlWorksheet := xlWorkbook.Sheets("sheet1") ; 첫 번째 시트 선택
;~ ; AUTOFILTER 적용



	xlWorkbook.Sheets("sheet1").select

xlWorkbook.sheets("sheet1").Range("1:1").HorizontalAlignment := -4108  ; (C) 중앙

targetValue := ""
foundCell := xlWorkbook.sheets("sheet1").Columns("A").Find(targetValue, , , 1)

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
	값=
}

 /*
 ////////////////////////////////////////  꾸 미 기  ////////////////////////////////////////////////
 ////////////////////////////////////////  꾸 미 기  ////////////////////////////////////////////////
 ////////////////////////////////////////  꾸 미 기  ////////////////////////////////////////////////
 ////////////////////////////////////////  꾸 미 기  ////////////////////////////////////////////////
 */




	xlWorksheet.Range("A1:G2000").Font.size := 10
	xlWorksheet.Range("A2:G2000").Sort(xlWorksheet.Range("B:B"))


	;~ xlWorksheet.Range("B:B").HorizontalAlignment := -4108 ; 중앙 ;
	;~ xlWorksheet.Range("E:E").HorizontalAlignment := -4108 ; 중앙 ;





xlWorksheet.Range("I:AA").delete
xlWorksheet.Range("H:H").copy
xlWorksheet.Range("D:D").PasteSpecial(-4163)

xl.Application.CutcopyMode := 0
xlWorksheet.Range("A:B").delete

xlWorksheet.Range("F:AA").delete



xlWorksheet.Range("A:F").Sort(xlWorksheet.Range("B:B"), 2, , , , , , 2) ; 2는 내림차순을 의미합니다


xlWorksheet.Range("A1:G3000").AutoFilter



xlRange1 := xlWorksheet.Range("A1:A3000")



Loop, 1
{

	xlWorksheet.activate
	xlRange1.AutoFilter(1, "<>*★*") ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)
	;~ xlRange1.AutoFilter(1, "=*★*") ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)

	UsedRange	:=	xl.ActiveSheet.UsedRange.Address

	xlCellTypeVisible := 12

	xlWorkbook.Worksheets.Add(, xlWorkbook.Sheets(1)).Name := "일반"

	;~ xlWorkbook.Worksheets.Add(,xlWorkbook.sheets(1)) ; 새 시트를 sheet1 뒷 편에 생성합니다
	xlWorksheet.Range(UsedRange).SpecialCells(xlCellTypeVisible).Copy(xlWorkbook.sheets(2).range("A1"))
Sleep, 100
	일반행:=xlWorkbook.sheets("일반").UsedRange.Rows.Count
	일반행1:=일반행 + 1
	일반행2:=일반행 - 1



	xlWorksheet.AutoFilterMode := false

xlWorksheet.activate
	xlRange1.AutoFilter(1, "=*★*") ; 1은 필터를 적용할 열의 인덱스입니다 (G 열)

	UsedRange	:=	xl.ActiveSheet.UsedRange.Address

	xlCellTypeVisible := 12

	xlWorkbook.Worksheets.Add(, xlWorkbook.Sheets(1)).Name :=  "장기"

	xlWorksheet.Range(UsedRange).SpecialCells(xlCellTypeVisible).Copy(xlWorkbook.sheets(2).range("A1"))

	장기행:=xlWorkbook.sheets(2).UsedRange.Rows.Count
	장기행1:=장기행 + 1
	장기행2:=장기행 - 1
}



	일반행:=xlWorkbook.sheets("일반").UsedRange.Rows.Count
	일반행1:=일반행 + 1
	일반행2:=일반행 - 1


	장기행:=xlWorkbook.sheets("장기").UsedRange.Rows.Count
	장기행1:=장기행 + 1
	장기행2:=장기행 - 1


시작행 := 행 - 장기행 + 1
시작행0 := 행 - 장기행



	xlWorkbook.Sheets("장기").select
	xlWorkbook.Sheets("장기").range("1:" 장기행).copy
	xlWorkbook.Sheets("일반").Range("A" 시작행).PasteSpecial(-4163)

		xlWorkbook.sheets("일반").Range(시작행 ":"시작행).HorizontalAlignment := -4108  ; (C) 중앙

		xlWorkbook.sheets("일반").Range(시작행 ":"시작행).Font.Bold := 1 ; 진하게

		신장기행 := 행 + 2
		시작행1 := 시작행 + 1
		시작행3 := 시작행 + 2
		시작행4 := 시작행 + 3
		시작행2 := 시작행 - 1




		xlWorkbook.sheets("일반").range(시작행 ":"시작행).insert
		xlWorkbook.sheets("일반").range("A" 시작행 ":E" 시작행).Interior.ColorIndex := 3
		xlWorkbook.sheets("일반").range("A" 시작행).value := "장기 미수 총액"
		xlWorkbook.sheets("일반").Range(시작행 ":" 시작행).RowHeight := 30.25
		xlWorkbook.sheets("일반").Range(시작행 ":" 시작행).font.size := 16
		xlWorkbook.sheets("일반").Range(시작행 ":" 시작행).Font.Bold := 1 ; 진하게
		xlWorkbook.sheets("일반").range("1:1").insert
		xlWorkbook.sheets("일반").range("A1:E1").Interior.ColorIndex := 45
		xlWorkbook.sheets("일반").range("A1").value := "단기 미수 총액"
		xlWorkbook.sheets("일반").Range("1:1").RowHeight := 30.25
		xlWorkbook.sheets("일반").Range("1:1").font.size := 16
		xlWorkbook.sheets("일반").Range("1:1").Font.Bold := 1 ; 진하게

		xlWorkbook.sheets("일반").Range("2:2").Font.Bold := 1 ; 진하게



		공식1 := "=sum(B" 시작행3 ":B2000)"
		xlWorkbook.sheets("일반").range("B" 시작행1).formula := 공식1
		장기미수 := xlWorkbook.sheets("일반").range("B" 시작행1).value
		공식2 := "=sum(B3:B" 시작행 ")"
		xlWorkbook.sheets("일반").range("B1").formula := 공식2
		단기미수 := xlWorkbook.sheets("일반").range("B1").value

		총미수 := 단기미수 + 장기미수

		StringSplit, parts, 총미수, .
		integerPart := parts1

		; 천 단위로 쉼표를 추가합니다.
		총미수 := RegExReplace(integerPart, "\B(?=(\d{3})+(?!\d))", ",")








		xlWorkbook.sheets("일반").range(시작행1 ":"시작행1).insert
		xlWorkbook.sheets("일반").Range("1:1").RowHeight := 35.25

	xlWorkbook.sheets("일반").Columns("A").ColumnWidth := 32.75 ; 열너비 조정
	xlWorkbook.sheets("일반").Columns("B").ColumnWidth := 18.13 ; 열너비 조정
	xlWorkbook.sheets("일반").Columns("C").ColumnWidth := 16.5 ; 열너비 조정
	xlWorkbook.sheets("일반").Columns("D").ColumnWidth := 16.5 ; 열너비 조정
	xlWorkbook.sheets("일반").Columns("E").ColumnWidth := 16.5 ; 열너비 조정




    xlWorkbook.sheets("일반").Range("B:B").NumberFormat := "#,#0" ;"0.0" ; 숫자 포맷(천원단위 표시
    xlWorkbook.sheets("일반").select

	real행 := 행 + 4

	xlWorkbook.sheets("일반").Range("A" 시작행1 ":E" 시작행1).Merge()
	xlWorkbook.sheets("일반").Range("C" 시작행3 ":E" 시작행3).Merge()


	xlWorkbook.sheets("일반").range("1:1").insert
		xlWorkbook.sheets("일반").Range("1:1").RowHeight := 35.25
		xlWorkbook.sheets("일반").Range("1:1").font.size := 18
		xlWorkbook.sheets("일반").Range("1:1").Font.Bold := 1 ; 진하게
	xlWorkbook.sheets("일반").Range("A1:E1").Merge()
	xlWorkbook.sheets("일반").Range("C2:E2").Merge()
    xlWorkbook.sheets("일반").Range("A1:E" real행).Borders.LineStyle :=1 ; 선

	FormatTime, time, yyyyMMhh, yyyy년 MM월 hh일 기준 외상잔액
	xlWorkbook.sheets("일반").range("A1").value := time . "` 총미수 : " . 총미수 . " 원"

	xlWorkbook.sheets("일반").Range("1:1").HorizontalAlignment := -4108  ; (C) 중앙

	xlWorkbook.sheets("Sheet1").delete
	xlWorkbook.sheets("장기").delete




	xlWorkbook.sheets("일반").range("A1:E" real행).copy
gosub, runkakaotalk2

xl.Application.CutCopyMode := False ; 복사모드 해제

xl.Visible := true ; 엑셀 창을 표시하려면 true로 설정
MsgBox, , 끝, %최종행%`n외상장부 생성 완료, 5



xlWorkbook.Saveas(A_ScriptDir . "\외상장부.xlsx")
;~ xlWorkbook.Close(1)
;~ xl.Quit
;~ xl:=""

guiclose:
ExitApp

return

Reload:
Reload
return




wake(x){
	global
	Sleep, 100
	WinWait, %x%,
	IfWinNotActive, %x%, , WinActivate, %x%,
	WinWaitActive, %x%,
	Sleep, 1000
	return
}


runkakaotalk1:
{

	;~ WinMinimizeAll
	WinShow, 카카오톡

	Sleep,50
	   WinWait, 카카오톡,
	IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	WinWaitActive, 카카오톡,

	Sleep,50
	Loop, 2
	{
		ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
		Sleep,10
		ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	}
		Sleep,100
	   ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	   Sleep,100
	   WinWait, 카카오톡,
	IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	WinWaitActive, 카카오톡,
	   ControlSetText, Edit2, , 카카오톡
	   Sleep, 50
	ControlSetText, Edit2, %받는분%, 카카오톡
	Sleep, 1000
	controlsend, EVA_Window2, {Enter}, 카카오톡

	Sleep, 2000
	return
}


runkakaotalk2:
{
	WinWait, %받는분%,
	IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	WinWaitActive, %받는분%,

	Sleep, 200

	;~ FormatTime, e1, yyMMdd, ▶ yy년 MM월 dd일 기업은행 입출금 내역 ◀

	Sleep, 300
	ControlFocus, RICHEDIT50W1, %받는분%
	Sleep, 300
	Send, %time%{Enter}
	Sleep, 200
	Send, {CtrlDown}a{CtrlUp}{BackSpace}
	Send, {CtrlDown}v{CtrlUp}{Enter}
	Sleep, 200
	Send, {UP 2}{Enter}
	Sleep, 200
	Send, {Enter}

	Sleep, 200
	Winkill, %받는분%
	Sleep,300
	ControlSetText, Edit2, , 카카오톡
	Sleep, 300
	WinMinimize, 카카오톡

	return
}

runkakaotalk3:
{
	WinWait, %받는분%,
	IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	WinWaitActive, %받는분%,

	Sleep, 200

	FormatTime, e1, yyMMdd, ▶ yy년 MM월 dd일 기업은행 입출금 내역 ◀

	Sleep, 300
	ControlFocus, RICHEDIT50W1, %받는분%
	Sleep, 300
	Send, %e1%{Enter}
	Sleep, 200
	Send, {CtrlDown}a{CtrlUp}{BackSpace}
	Send, 현재까지 기업은행 추가 입출금 내역 없습니다{Enter}
	Sleep, 200
	Send, {Enter}


	Sleep, 200
	Winkill, %받는분%
	Sleep,300
	ControlSetText, Edit2, , 카카오톡
	Sleep, 300
	WinMinimize, 카카오톡

	return
}
