#NoEnv
#SingleInstance, force

Voice := ComObjCreate("SAPI.SpVoice")
ControlGetText, speak1, Static33, WMS_VER2 2.0


            ;~ RegExMatch(speak1, "(.*)_(.*)", newlocation)
            ;~ speak1 = % newlocation1 "-" newlocation2 "-"

            ;~ selectcar := RegExReplace(newlocation1, "\d")  ; 숫자를 제거합니다.
            ;~ selectnum := RegExReplace(newlocation1, "\D")  ; 엉어를 제거합니다.





                           ;~ speak32 := StrReplace(speak32, "-" , "?다시")
                speak1 := StrReplace(speak1, "10" , "열")
                speak1 := StrReplace(speak1, "11" , "열하나")
                speak1 := StrReplace(speak1, "12" , "열둘")
                speak1 := StrReplace(speak1, "13" , "열셋")
                speak1 := StrReplace(speak1, "14" , "엿넷")
                speak1 := StrReplace(speak1, "15" , "열다섯")
                speak1 := StrReplace(speak1, "16" , "열여섯")
                speak1 := StrReplace(speak1, "1" , "첫")
                speak1 := StrReplace(speak1, "2" , "두")
                speak1 := StrReplace(speak1, "3" , "세")
                speak1 := StrReplace(speak1, "4" , "네")
                speak1 := StrReplace(speak1, "5" , "다섯")
                speak1 := StrReplace(speak1, "6" , "여섯")
                speak1 := StrReplace(speak1, "7" , "일곱")
                speak1 := StrReplace(speak1, "8" , "여덟")
                speak1 := StrReplace(speak1, "9" , "아홉")



    ;~ ComObjCreate("SAPI.SpVoice").Speak(플큐알순서 "번째 줄 검색")

                Voice.Speak(speak1 "번째 줄 알에프아이디 카드 검색 해주세요")

;~ Voice.Speak(speak4)
ExitApp