xlApp := ComObjCreate("Excel.Application")

; 엑셀 파일 열기
xlBook := xlApp.Workbooks.Open(A_Desktop "\복사본 비용처리2.xlsx")

; 시트 선택
xlSheet := xlBook.Sheets("Sheet1")

; 페이지 나누기 미리보기 모드로 전환
xlApp.Visible := True ; Excel 창을 표시하여 디버깅에 도움
xlBook.ActiveWindow.View := -2 ; -2는 xlPageBreakPreview를 의미

; 페이지 나누기 미리보기에서 영역 지정
xlSheet.PageSetup.PrintArea := "A1:F166"

; 엑셀 파일 저장 및 닫기
xlBook.Save()
xlBook.Close()

; Excel 애플리케이션 종료
xlApp.Quit()

; COM 객체 해제
xlApp := ""
