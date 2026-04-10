#NoEnv
#SingleInstance, force

Voice := ComObjCreate("SAPI.SpVoice")
ControlGetText, speak1, Static42, WMS_VER2 2.0


            RegExMatch(speak1, "(.*)_(.*)", newlocation)
            speak1 = % newlocation1 "-" newlocation2 "-"

            selectcar := RegExReplace(newlocation1, "\d")  ; 숫자를 제거합니다.
            selectnum := RegExReplace(newlocation1, "\D")  ; 엉어를 제거합니다.





            {                ;~ speak32 := StrReplace(speak32, "-" , "?다시")
                selectnum := StrReplace(selectnum, "10" , "ten")
                selectnum := StrReplace(selectnum, "11" , "eleven")
                selectnum := StrReplace(selectnum, "12" , "twelve")
                selectnum := StrReplace(selectnum, "13" , "therteen")
                selectnum := StrReplace(selectnum, "14" , "forteen")
                selectnum := StrReplace(selectnum, "15" , "fifteen")
                selectnum := StrReplace(selectnum, "16" , "sxteen")
                selectnum := StrReplace(selectnum, "1" , "one")
                selectnum := StrReplace(selectnum, "2" , "two")
                selectnum := StrReplace(selectnum, "3" , "three")
                selectnum := StrReplace(selectnum, "4" , "four")
                selectnum := StrReplace(selectnum, "5" , "five")
                selectnum := StrReplace(selectnum, "6" , "six")
                selectnum := StrReplace(selectnum, "7" , "seven")
                selectnum := StrReplace(selectnum, "8" , "eight")
                selectnum := StrReplace(selectnum, "9" , "nine")



                ;~ selectcar := StrReplace(selectcar, "-" , "?다시")
                selectcar := StrReplace(selectcar, "A" , "에이")
                selectcar := StrReplace(selectcar, "B" , "비")
                selectcar := StrReplace(selectcar, "C" , "씨")
                selectcar := StrReplace(selectcar, "D" , "디")
                selectcar := StrReplace(selectcar, "E" , "이")
                selectcar := StrReplace(selectcar, "F" , "에프")
                selectcar := StrReplace(selectcar, "G" , "쥐")
                selectcar := StrReplace(selectcar, "H" , "에이치")
                selectcar := StrReplace(selectcar, "I" , "아이")
                selectcar := StrReplace(selectcar, "J" , "제이")
                selectcar := StrReplace(selectcar, "K" , "케이")
                selectcar := StrReplace(selectcar, "L" , "엘")
                selectcar := StrReplace(selectcar, "M" , "엠")
                selectcar := StrReplace(selectcar, "N" , "엔")
                selectcar := StrReplace(selectcar, "O" , "오")
                selectcar := StrReplace(selectcar, "P" , "피")
                selectcar := StrReplace(selectcar, "Q" , "큐")
                selectcar := StrReplace(selectcar, "R" , "알")
                selectcar := StrReplace(selectcar, "S" , "에스")
                selectcar := StrReplace(selectcar, "T" , "티")
                selectcar := StrReplace(selectcar, "U" , "유")
                selectcar := StrReplace(selectcar, "V" , "브이")
                selectcar := StrReplace(selectcar, "W" , "더블류")
                selectcar := StrReplace(selectcar, "X" , "엑스")
                selectcar := StrReplace(selectcar, "Y" , "와이")
                selectcar := StrReplace(selectcar, "Z" , "제트")
            }
                ;~ MsgBox, , , % selectcar selectnum "-" newlocation2 "- 선택해 주세요", 3

                Voice.Speak(selectcar "?" selectnum "?다시?" newlocation2 "다시?" )

;~ Voice.Speak(speak4)
ExitApp