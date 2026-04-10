#Persistent
#NoEnv
SetBatchLines, -1
SetTitleMatchMode, 2

; 엑셀 COM 객체 생성
oExcel := ComObjCreate("Excel.Application")
oExcel.Visible := True  ; 엑셀을 보이게 설정, 원하지 않으면 False로 변경

dir=C:\Users\shwoodnew\Desktop\오토핫키2\제대로로우데이터\csv\2016-10-18.xlsx




; 엑셀 파일 열기
oWorkbook := oExcel.Workbooks.Open(dir)
; 각 워크시트 처리
for oSheet in oWorkbook.Sheets
{
    ; UsedRange의 모든 데이터를 배열로 가져오기
    oRange := oSheet.UsedRange
    vData := oRange.Value

    ; 배열에서 쉼표를 대체
    Loop, % oRange.Rows.Count
    {
        RowIndex := A_Index
        Loop, % oRange.Columns.Count
        {
            ColIndex := A_Index
            if InStr(vData[RowIndex, ColIndex], ",")
            {
                vData[RowIndex, ColIndex] := StrReplace(vData[RowIndex, ColIndex], ",", "")
            }
        }
    }

    ; 변환된 배열을 다시 범위에 설정
    oRange.Value := vData
}

; 변경 사항 저장
oWorkbook.SaveAs("C:\Users\shwoodnew\Desktop\오토핫키2\제대로로우데이터\csv\안녕_수정됨.csv", 62)
oWorkbook.Close(1)
oExcel.Quit()

; COM 객체 해제
oWorkbook := ""
oExcel := ""

MsgBox, 작업이 완료되었습니다.
ExitApp












