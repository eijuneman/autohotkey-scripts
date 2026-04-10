





AA = A02-03-18

RegExMatch(AA, "(.*)-(.*)-(.*)", AA)

AA11 := RegExReplace(AA1, "\d")
AA12 := RegExReplace(AA1, "\D")
MsgBox, % AA11 "` " AA12 "/" AA2 "/" AA3


return


text := "A23"  ; 분리할 문자열입니다.

; 문자열에서 영어와 숫자를 분리합니다.
AA1 := RegExReplace(text, "\d")
AA2 := RegExReplace(text, "\D")

MsgBox, % "AA1: " AA1 "`nAA2: " AA2  ; 결과를 메시지 박스로 표시합니다.
