#NoEnv
#SingleInstance, force
FormatTime, 오늘, , dd



run, C:\Program Files (x86)\Jhintex_Cust\JHIntex.exe
Sleep, 100

	WinWait, 사용자 로그인,
	IfWinNotActive, 사용자 로그인, , WinActivate, 사용자 로그인,
	WinWaitActive, 사용자 로그인,

Sleep, 100
ControlSend, TEdit2, 64216, 사용자 로그인
Sleep, 100
ControlSend, TEdit1, 48342, 사용자 로그인
ControlClick, TButton2, 사용자 로그인

	WinWait, [재현인텍스 거래처관리],
	IfWinNotActive, [재현인텍스 거래처관리], , WinActivate, [재현인텍스 거래처관리],
	WinWaitActive, [재현인텍스 거래처관리],

Sleep, 1000
Send, {Esc}{Alt}{Enter}{Right}{Enter}
ControlSetText, TDateTimePicker1, , [재현인텍스 거래처관리]
ControlSend, TDateTimePicker2, {Right 2}24, [재현인텍스 거래처관리]
Sleep, 1000
ControlClick, TPanel3, [재현인텍스 거래처관리],,,,x47 y20
Sleep, 1500
ControlClick, TPanel3, [재현인텍스 거래처관리],,,,X140 y20
;;;;;;;;;;;;;;; 재현발주프로그램 ~ 엑셀 열기 까지


	WinWait, 통합 문서1 - Excel,
	IfWinNotActive, 통합 문서1 - Excel, , WinActivate, 통합 문서1 - Excel,
	WinWaitActive, 통합 문서1 - Excel,



Sleep, 1000

XL := ComObjActive("Excel.Application")
XL.Visible := true

XL.ActiveSheet.Range("1:500").select
XL.selection.Replace("0.00","")

행끝 := XL.ActiveSheet.UsedRange.Rows.Count
행시작 := 행끝
Sleep, 100

행끝 --
loop, %행끝%
{
공식 = ="재/"&B%행시작%&"("&D%행시작%&")"

공식셀 := % "A" 행시작
공식셀C := % "C" 행시작
XL.sheets("sheet1").Select
XL.sheets("sheet1").range(공식셀).formula := 공식
XL.sheets("sheet1").Range(공식셀C).value := "ea"
	행시작 --
}


copyRange := XL.sheets("sheet1").Range("A:A") ; 복사할 셀 선택   ; 복사할 범위를 수정하세요
copiedValue := copyRange.Value  ; 복사한 값 가져오기
pasteRange := XL.sheets("sheet1").Range("A:A") ; ; 붙여넣을 셀 선택     붙여넣을 범위를 수정하세요
pasteRange.Value := copiedValue  ; 값을 붙여넣기







XL.sheets("sheet1").Select


XL.sheets("sheet1").Range("E:E").select
XL.Selection.copy
XL.sheets("sheet1").Range("B:B").select
XL.Selection.pastespecial


XL.sheets("sheet1").Range("I:I").select
XL.Selection.copy
XL.sheets("sheet1").Range("D:D").select
XL.Selection.pastespecial


XL.sheets("sheet1").Range("H:H").select
XL.Selection.copy
XL.sheets("sheet1").Range("E:E").select
XL.Selection.pastespecial


XL.sheets("sheet1").Range("M:M").select
XL.Selection.copy
XL.sheets("sheet1").Range("H:H").select
XL.Selection.pastespecial




;;;;;;;;;;;;;;; 빈칸으로 만들기 시작
XL.sheets("sheet1").Range("Z:Z").select
XL.Selection.copy

XL.sheets("sheet1").Range("F:F").select
XL.Selection.pastespecial
XL.sheets("sheet1").Range("G:G").select
XL.Selection.pastespecial
XL.sheets("sheet1").Range("J:J").select
XL.Selection.pastespecial
XL.sheets("sheet1").Range("K:K").select
XL.Selection.pastespecial
XL.sheets("sheet1").Range("L:L").select
XL.Selection.pastespecial
XL.sheets("sheet1").Range("M:M").select
XL.Selection.pastespecial
XL.sheets("sheet1").Range("I:I").select
XL.Selection.pastespecial
;;;;;;;;;;;;;;; 빈칸으로 만들기 끝



XL.Sheets("sheet1").Range("A1").value := "상품명"
XL.Sheets("sheet1").Range("B1").value := "규격"
XL.Sheets("sheet1").Range("C1").value := "단위"
XL.Sheets("sheet1").Range("D1").value := "수량"
XL.Sheets("sheet1").Range("E1").value := "단가"
XL.Sheets("sheet1").Range("F1").value := "바코드"
XL.Sheets("sheet1").Range("G1").value := "관리코드"
XL.Sheets("sheet1").Range("H1").value := "비고"
XL.Sheets("sheet1").Range("I1").value := "상품코드"
XL.sheets("sheet1").Range("J:Z").DELETE
return




return
