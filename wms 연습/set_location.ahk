#NoEnv
#SingleInstance, force


gui, destroy
gui, Default
gui, +alwaysontop


;~ Gui, L:Add, Edit, -WantReturn +Center -VScroll -HScroll w800 h150 vbluetooth Backgroundtrans gbluetooth Uppercase, RFID CARD TAG
;~ Gui, L:show, , set_location
;~ return


Gui, Font, S10 CDefault w300, Malgun Gothic

Gui, Add, Groupbox, x5 y0 w300 h175,
Gui, Add, Groupbox, x+15 y0 w185 h175,
Gui, Add, Text, x12 y12 w250 h18, 로케이션 위치

Gui, Font, S30 CDefault w300, Malgun Gothic
Gui, Add, Edit, x12 y+0 w40 h55 +center, A
Gui, Add, Edit, x+5 w60 h55 +center, 9
Gui, Add, Text, x+5 w20 h55 +center, -
Gui, Add, Edit, x+5 w60 h55 +center, 9
Gui, Add, Text, x+5 w20 h55 +center, -
Gui, Add, Edit, x+5 w60 h55 +center, 9

Gui, Font, S15 CDefault w300, Malgun Gothic
Gui, Add, Button, x+30 w80 h55 , ◁ 이전
Gui, Add, Button, x+10 w80 h55 , 다음 ▶

Gui, Font, S10 CDefault w300, Malgun Gothic
Gui, Add, Text, x12 y+10 w250 h18, RFID 카드 넘버

Gui, Font, S30 CDefault w300, Malgun Gothic
Gui, Add, Edit, x12 y+0 w285 h55 , ABCEDF00AA

Gui, Font, S15 CDefault w300, Malgun Gothic
Gui, Add, Button, x+30 w80 h55 gstop, 멈춤(종료)
Gui, Add, Button, x+30 w80 h55 gstart, 시작



Gui, show, , set_location
return

GuiClose:
ExitApp

stop:
{

}
return


start:


리더기5:
{

	;~ WinWait, set_location,
	;~ IfWinNotActive, set_location, , WinActivate, set_location,
	;~ WinWaitActive, set_location,
MsgBox, 일단 여기 ;;;;;;;;;;;;;;;;;;;;;;;;;
ToolTip, 시작
        ControlSetText, Edit81, , WMS_VER2 2.0
        ControlSetText, Edit82, , WMS_VER2 2.0
        ControlSetText, Edit83, , WMS_VER2 2.0

        ;~ renumber := RegExReplace(btread, "B", "")
        ;~ renumber := RegExReplace(renumber, "b", "")
        ;~ rfidcheck = 1
;~ clipboard =
ControlGetText, MyString, edit5, set_location
Loop,20
{
    Sleep, 200
    코드길이 := StrLen(MyString)
    if ( 코드길이 = 10 )
    {
        break
    }
    else if (코드길이 > 10 )
    {
        ControlSend, edit5, {ctrl Down}a, set_location
        ControlSend, edit5, {ctrl Up}{Del}, set_location
        Sleep, 100
        clipboard :=
        ControlGetText, MyString, edit5, set_location
    }
    else if (코드길이 < 10)
    {
        Sleep, 100
        ControlGetText, MyString, edit5, set_location
    }
    else
    {
        gosub, 리더기5
    }
    카운트다운 := 30 - A_Index
    ToolTip, % "남은 시간 : " 카운트다운
}
    ControlSend, edit5, {ctrl Down}a, set_location
    ControlSend, edit5, {ctrl Up}{Del}, set_location
    Sleep, 100
    ;~ WinKill, set_location
    ToolTip,
if (MyString = "")
    return
else
{
    ;~ GUI, SUBMIT, NOHIDE
        ControlSetText, Edit81, %MyString%, WMS_VER2 2.0
        ;~ GuiControl, Edit82, , WMS_VER2 2.0
        ControlSetText, Edit83, %MyString%, WMS_VER2 2.0
    ;~ GuiControl, , RFIDREAD3, %MyString%
    ;~ GuiControl, , RFIDREAD1, %MyString%
    ;~ GUI, SUBMIT, NOHIDE
    if (RFIDREAD1 = RFIDREAD2)
    {
        gosub, 리더기5
    }
    else
    {


        ControlGetText, MyString1, Edit81, WMS_VER2 2.0
        ControlGetText, MyString2, Edit82, WMS_VER2 2.0
        ControlGetText, MyString3, Edit83, WMS_VER2 2.0


        ControlGetText, Edit81, %MyString1%, WMS_VER2 2.0
        ControlGetText, Edit82, %MyString1%, WMS_VER2 2.0
        ControlSetText, Edit81, %MyString2%, WMS_VER2 2.0



        ;~ GuiControl, , RFIDREAD1, %RFIDREAD1%
        ;~ GuiControl, , RFIDREAD2, %RFIDREAD1%
        ;~ GuiControl, , RFIDREAD1, %RFIDREAD2%

		MsgBox, 여기까지



        GUI, SUBMIT, NOHIDE
        if (서브리딩="") ;;;;;;;;;;;;;;;; 중복 확인 ;;;;;;;;;;;;;;;;
        {
            Loop, % Rows
            {
                foundread:=CSV_Search("data1",RFIDREAD2,A_Index)

                if foundread=0
                {
                    brandnew=1
                    gosub, PresetChange
                    break
                }
                else
                {
                    gosub, PresetChange
                    break
                }

            }

        }
        else
        {
            Loop, % Rows
            {
                foundread:=CSV_Search("data1",RFIDREAD2,A_Index)

                if foundread=0
                {
                    GuiControl, , %renumber%RFID1, %RFIDREAD2%
                    GuiControlGet, highlight1, pos, %renumber%RFID1
                    highlight1X := highlight1X - 26
                    highlight1Y := highlight1Y - 35
                    highlight1W := highlight1W + 18
                    GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W830 h48
                    break
                }
                else
                {
                    MsgBox, 262196, 중복 발견 , 이전에 기록된 정보가 있습니다`n이전 기록으로 가시겠습니까?,
                    {
                        IfMsgBox Yes
                        {
                            MsgBox, 262196, 카드 초기화, 이전 기록있는 라인을 삭제해주세요
                            {
                                IfMsgBox Yes
                                {
                                    gosub, PresetChange
                                    break
                                }
                                IfMsgBox NO
                                {
                                }
                            }
                        }
                        IfMsgBox NO
                        {
                        }
                    }
                }

            }
        }
        Sleep, 100
        GuiControl, , RFIDREAD3,
        GuiControl, , RFIDREAD2,
        GuiControl, , RFIDREAD1,
        GuiControl, , 수정값,
        GuiControl, , 실제합계,
        GuiControl, , 실제낱장,
        Sleep,10
        gosub, mapping

        */






    }
}

    clipboard =
    rfidcheck =
    서브리딩 =
    brandnew =
    카드기록삭제 =
return
}