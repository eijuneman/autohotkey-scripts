path2 := A_MyDocuments . "\거래처원장_tms_list.xlsx"
Global XL
XL := ComObjCreate("Excel.Application")
XL.Workbooks.Open(path2, 3, 0)
XL.Visible := true

uniqueArr := []

; 동적으로 마지막 행 찾기
lastRow := XL.ActiveSheet.Range("Q" XL.ActiveSheet.Rows.Count).End(-4162).Row  ; -4162 = xlUp

; 1. 원본 범위 복사
sourceRange := "Q2:Q" lastRow
XL.ActiveSheet.Range(sourceRange).Copy()
XL.ActiveSheet.Range("Z1").PasteSpecial()

; 2. 중복 제거
rowCount := lastRow - 1  ; Q2부터 시작이므로 -1
tempRange := "Z1:Z" rowCount
XL.ActiveSheet.Range(tempRange).RemoveDuplicates(1, 0)

; 3. 배열로 수집
Loop, % rowCount
{
    value := XL.ActiveSheet.Range("Z" A_Index).value
    if(value != "" && value != 0){
        uniqueArr.Push(value)
    }
}

; 4. 임시 데이터 삭제
XL.ActiveSheet.Range(tempRange).ClearContents()

; 5. 결과 사용
MsgBox, % "고유값 개수: " uniqueArr.Length()
output := ""
for index, value in uniqueArr {
    output .= index ". " value "`n"
}
	uniqueArr[1] := Floor(uniqueArr[1])
MsgBox, % output "`n" uniqueArr[1] "`n" uniqueArr[2]