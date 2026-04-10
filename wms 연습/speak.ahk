#NoEnv
#SingleInstance, force


Voice := ComObjCreate("SAPI.SpVoice")
ControlGetText, speak1, Edit66, WMS_VER2 2.0
ControlGetText, speak2, Edit67, WMS_VER2 2.0
ControlGetText, speak31, Edit3, WMS_VER2 2.0
ControlGetText, speak32, Edit4, WMS_VER2 2.0
ControlGetText, speak33, Edit5, WMS_VER2 2.0
ControlGetText, speak34, Edit6, WMS_VER2 2.0

;~ MsgBox, % speak31 "-"  speak32 "-"  speak33 "-"  speak34
speak1 := StrReplace(speak1, "재/" , "재현 ")
speak1 := StrReplace(speak1, "베/" , "베트남 ")
speak1 := StrReplace(speak1, "국/" , "국산 ")
speak1 := StrReplace(speak1, "인/" , "인도네시아 ")
speak1 := StrReplace(speak1, "말/" , "말레이시아 ")
speak1 := StrReplace(speak1, "말/" , "말레이시아 ")
speak1 := StrReplace(speak1, "1*4" , "원바이 포")
speak1 := StrReplace(speak1, "1*6" , "원바이 식스")
speak1 := StrReplace(speak1, "1*8" , "원바이 에잇")
speak1 := StrReplace(speak1, "1*10" , "원바이 텐")
speak1 := StrReplace(speak1, "1*12" , "원바이 투엘브")
speak1 := StrReplace(speak1, "2*12" , "투바이 투엘브")
speak1 := StrReplace(speak1, "2*10" , "투바이 텐")
speak1 := StrReplace(speak1, "2*8" , "투바이 에잇")
speak1 := StrReplace(speak1, "2*6" , "투바이 식스")
speak1 := StrReplace(speak1, "2*4" , "투바이 포")
speak1 := StrReplace(speak1, "▶" , "")
speak1 := StrReplace(speak1, "★" , "")
speak1 := StrReplace(speak1, "▷" , "")
speak1 := StrReplace(speak1, "/" , "?")
speak1 := StrReplace(speak1, A_space , "?")





speak1 := StrReplace(speak1, "*" , "에")




speak2 := StrReplace(speak2, "/" , "")
speak2 := StrReplace(speak2, "*" , "에")


;~ speak32 := StrReplace(speak32, "-" , "?다시")
speak32 := StrReplace(speak32, "10" , "ten")
speak32 := StrReplace(speak32, "11" , "eleven")
speak32 := StrReplace(speak32, "12" , "twelve")
speak32 := StrReplace(speak32, "13" , "therteen")
speak32 := StrReplace(speak32, "14" , "forteen")
speak32 := StrReplace(speak32, "15" , "fifteen")
speak32 := StrReplace(speak32, "16" , "sxteen")
speak32 := StrReplace(speak32, "1" , "one")
speak32 := StrReplace(speak32, "2" , "two")
speak32 := StrReplace(speak32, "3" , "three")
speak32 := StrReplace(speak32, "4" , "four")
speak32 := StrReplace(speak32, "5" , "five")
speak32 := StrReplace(speak32, "6" , "six")
speak32 := StrReplace(speak32, "7" , "seven")
speak32 := StrReplace(speak32, "8" , "eight")
speak32 := StrReplace(speak32, "9" , "nine")



;~ speak31 := StrReplace(speak31, "-" , "?다시")
speak31 := StrReplace(speak31, "A" , "에이")
speak31 := StrReplace(speak31, "B" , "비")
speak31 := StrReplace(speak31, "C" , "씨")
speak31 := StrReplace(speak31, "D" , "디")
speak31 := StrReplace(speak31, "E" , "이")
speak31 := StrReplace(speak31, "F" , "에프")
speak31 := StrReplace(speak31, "G" , "쥐")
speak31 := StrReplace(speak31, "H" , "에이치")
speak31 := StrReplace(speak31, "I" , "아이")
speak31 := StrReplace(speak31, "J" , "제이")
speak31 := StrReplace(speak31, "K" , "케이")
speak31 := StrReplace(speak31, "L" , "엘")
speak31 := StrReplace(speak31, "M" , "엠")
speak31 := StrReplace(speak31, "N" , "엔")
speak31 := StrReplace(speak31, "O" , "오")
speak31 := StrReplace(speak31, "P" , "피")
speak31 := StrReplace(speak31, "Q" , "큐")
speak31 := StrReplace(speak31, "R" , "알")
speak31 := StrReplace(speak31, "S" , "에스")
speak31 := StrReplace(speak31, "T" , "티")
speak31 := StrReplace(speak31, "U" , "유")
speak31 := StrReplace(speak31, "V" , "브이")
speak31 := StrReplace(speak31, "W" , "더블류")
speak31 := StrReplace(speak31, "X" , "엑스")
speak31 := StrReplace(speak31, "Y" , "와이")
speak31 := StrReplace(speak31, "Z" , "제트")




;~ speak34 := StrReplace(speak34, "1" , "one")
;~ speak34 := StrReplace(speak34, "2" , "two")
;~ speak34 := StrReplace(speak34, "3" , "three")
;~ speak34 := StrReplace(speak34, "4" , "four")
;~ speak34 := StrReplace(speak34, "5" , "five")
;~ speak34 := StrReplace(speak34, "6" , "six")
;~ speak34 := StrReplace(speak34, "7" , "seven")
;~ speak34 := StrReplace(speak34, "8" , "eight")
;~ speak34 := StrReplace(speak34, "9" , "nine")
;~ speak34 := StrReplace(speak34, "10" , "ten")
;~ speak34 := StrReplace(speak34, "11" , "eleven")
;~ speak34 := StrReplace(speak34, "12" , "twelve")
;~ speak34 := StrReplace(speak34, "13" , "therteen")
;~ speak34 := StrReplace(speak34, "14" , "forteen")
;~ speak34 := StrReplace(speak34, "15" , "fifteen")
;~ speak34 := StrReplace(speak34, "16" , "sxteen")




if ( speak31 ="" ) or (speak32 ="" ) or ( speak33 ="" ) or ( speak34 ="" )
{
	Voice.Speak("로케이션이 없습니다 다시 기록해주세요")
}
else
{
	Voice.Speak("로케이션??" speak31 "" speak32 "다시?" speak33 "다시?" speak34)
}

Voice.Speak(speak1)
Voice.Speak(speak2)

ControlGetText, speak4, Edit76, WMS_VER2 2.0
Voice.Speak("전산상 낱장수량은" speak4)
ExitApp