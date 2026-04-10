#SingleInstance, force

;~ Gui, Add, Button, x22 y9 w100 h40 gsta, 시작
gui, font, S25
Gui, Color, EEAA99
;~ Gui, Add, Button, x22 y59 w100 h40 gsto, 멈춤

;~ Gui, Add, Button, x22 y109 w100 h40 gexit, 종료
; Generated using SmartGUI Creator for SciTE
;~ Gui, -sysmenu

if WinExist(auto)
{
    Sleep,1000
    return
}
else
{
    Gui, Show, w145 h160 x1210 y572, auto
}

Loop
{

    WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
    Sleep,1000
    clipboard :=
    WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
    Sleep,100
    ClipWait, 100
                ;~ ControlSetText, edit17, %Clipboard%, 신흥목재재고파악수정 1.0
                ;~ ControlGetText, C, edit17, 신흥목재재고파악수정 1.0

    ;~ WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
    ;~ Sleep,1000
    ;~ clipboard :=
    ;~ WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
    ;~ Sleep,100
    ;~ ClipWait, 100

    ;~ WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 버퍼 비우기(B)

    ;~ ControlSetText, edit17, %Clipboard%, 신흥목재재고파악수정 1.0
    ;~ ControlGetText, C, edit17, 신흥목재재고파악수정 1.0

        Loop
        {
            MyString := StrReplace(Clipboard, "`r`n`r`n", "`r`n", Count)
            MyString := StrReplace(MyString, A_Space, "")
            MyString := StrReplace(MyString, "`r`n")
            코드길이 := StrLen(MyString)
            if ( 코드길이 = 10 )
            {
                break
            }
            else if (코드길이 > 10 )
            {
                WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 버퍼 비우기(B)
                WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
                Sleep, 200
                clipboard :=
                WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
                Sleep,100
                ClipWait, 100


            }
            else
            {
                WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
                Sleep, 200
                clipboard :=
                WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
                Sleep,100
                ClipWait, 100
                ;~ ControlSetText, edit17, %Clipboard%, 신흥목재재고파악수정 1.0
                ;~ ControlGetText, C, edit17, 신흥목재재고파악수정 1.0
            }
        }



                WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 버퍼 비우기(B)
     ControlSetText, edit17, %MyString%,신흥목재재고파악수정 1.0




        ControlSetText, edit15, %MyString%, 신흥목재재고파악수정 1.0
        ControlGetText, A, edit15, 신흥목재재고파악수정 1.0
        ControlGetText, B, edit16, 신흥목재재고파악수정 1.0

        {
            if (A = B)
            {

                Sleep, 200
            }
            else
            {
                ControlSetText, edit15, %A%, 신흥목재재고파악수정 1.0
                Sleep,500
                SoundBeep, 300
                ControlSetText, edit16, %A%, 신흥목재재고파악수정 1.0

    Control, show , , Static19, 신흥목재재고파악수정 1.0

                ControlSetText, Edit1, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit2, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit3, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit4, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit6, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit14, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit7, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit8, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit9, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit10, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit11, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit18, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit19, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit20, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit21, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit22, , ahk_exe AutoHotkey.exe

                SoundPlay, %A_MyDocuments%\sound\sound33.wav
                Sleep, 500
                ;~ SoundPlay, %A_MyDocuments%\sound\sound1_3.mp3
                ControlSetText, Edit12, , ahk_exe AutoHotkey.exe
                ControlSetText, Edit13, , ahk_exe AutoHotkey.exe

                ControlGetText, B, edit16, 신흥목재재고파악수정 1.0
                ;~ Clipboard := B
                ;~ controlsend, combobox1, {ctrl down}v{ctrl up}, 신흥목재재고파악수정 1.0
                Sleep,10

                ControlSetText, edit1, %B%, 신흥목재재고파악수정 1.0
                Sleep,100
                WinWait, 신흥목재재고파악수정 1.0
                IfWinNotActive, 신흥목재재고파악수정 1.0, , WinActivate, 신흥목재재고파악수정 1.0,
                WinWaitActive, 신흥목재재고파악수정 1.0,





                Sleep, 100
                ControlFocus, edit1, 신흥목재재고파악수정 1.0
                Sleep, 100
                send, {tab}
                Send, {Shift Down}{tab}{Shift Up}
                loop,3
                {

                    ControlFocus, edit1, 신흥목재재고파악수정 1.0
                    send, {right}{space}
                    Sleep,100
                    send, {BackSpace}
                        ControlFocus, edit1, 신흥목재재고파악수정 1.0
                }

                ;~ Sleep, 100
                ;~ loop,3
                ;~ {

                    ;~ ControlFocus, edit1, 신흥목재재고파악수정 1.0
                    ;~ send, {right}{space}
                    ;~ Sleep,100
                    ;~ send, {BackSpace}
                        ;~ ControlFocus, edit1, 신흥목재재고파악수정 1.0
                ;~ }




Control, show , , Static20, 신흥목재재고파악수정 1.0




{
          SoundPlay, %A_MyDocuments%\sound\sound44.wav
          Sleep, 800
          SoundPlay, %A_MyDocuments%\sound\sound9_2.mp3
GuiControl,, MyProgress, +10





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    Sleep, 500
    Winwait, ahk_exe JedaeroM.exe
    IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
    WinWaitActive, ahk_exe JedaeroM.exe


Control, show , , Static21, 신흥목재재고파악수정 1.0

    Sleep, 200
    ControlClick, x21 y39, ahk_exe JedaeroM.exe

GuiControl,, MyProgress, +10



내일날짜=%A_Now%
EnvAdd,내일날짜,+1,days
FormatTime,내일날짜,%내일날짜%,yyyy-MM-dd


다음달=%A_Now%
EnvAdd,다음달,+30,days
FormatTime,다음달,%다음달%,yyyy-MM-dd



    Sleep, 200
    send, {esc 10}{alt}{enter}
    send, {Left 2}{enter}
    Sleep, 1000
GuiControl,, MyProgress, +10
    controlclick, TRzButton4, ahk_exe JedaeroM.exe
    Sleep,100
    ControlGetText, p, edit4, 신흥목재재고파악수정 1.0

    ControlSend, TRzDateTimeEdit2, {up}, ahk_class TfmMain
    ControlSend, TRzDateTimeEdit1, {up 30}, ahk_class TfmMain



    ControlSetText, TRzEdit4, %p%, ahk_exe JedaeroM.exe
    Sleep,100
    control, choose, 7, TRzComboBox3, ahk_exe JedaeroM.exe
    Sleep,100
ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe, , , , x40 y25
    Sleep,2000


Control, show , , Static24, 신흥목재재고파악수정 1.0


ControlClick, TAdvToolBar3, ahk_exe JedaeroM.exe, , , , x160 y17
GuiControl,, MyProgress, +10
Sleep, 2000
              SoundPlay, %A_MyDocuments%\sound\sound33.wav
Sleep, 1000
IfWinExist, ahk_class XLMAIN
{
              SoundPlay, %A_MyDocuments%\sound\sound11.wav
Sleep, 800
          SoundPlay, %A_MyDocuments%\sound\sound9_3.mp3
GuiControl,, MyProgress, +10

    MsgBox, , , 미래전표가 있습니다. 다음에 시도해주세요, 1.0

        Sleep, 100
GuiControl,, MyProgress, +10
Process, close, EXCEL.EXE
ControlClick, NetUIHWND1, ahk_class NUIDialog,,,,x176 y56

Sleep, 100

ControlClick, Tbutton1, ahk_class TMessageForm

WinKill, ahk_class TMessageForm





    controlclick, TAdvToolBar3, ahk_exe JedaeroM.exe, , , , x270 y17


         ;~ SoundPlay, %A_MyDocuments%\sound\sound22.wav
          ;~ Sleep, 500
        ;~ SoundPlay, %A_MyDocuments%\sound\sound5_1.mp3

GuiControl,, MyProgress, +10
	WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)

GuiControl,, MyProgress, +10
	WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
    WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 비우기(S)

GuiControl,, MyProgress, +10

    ControlSetText, Edit1, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit2, , ahk_exe AutoHotkey.exe

GuiControl,, MyProgress, +10
    ControlSetText, Edit3, , ahk_exe AutoHotkey.exe
GuiControl,, MyProgress, +10
    ControlSetText, Edit4, , ahk_exe AutoHotkey.exe
GuiControl,, MyProgress, +10
    ;~ ControlSetText, Edit5, , ahk_exe AutoHotkey.exe
        ControlSetText, Edit5, %어제날짜%, 신흥목재재고파악수정 1.0
    ControlSetText, Edit6, , ahk_exe AutoHotkey.exe

    ControlSetText, Edit14, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit7, , ahk_exe AutoHotkey.exe
GuiControl,, MyProgress, +10
    ControlSetText, Edit8, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit9, , ahk_exe AutoHotkey.exe
GuiControl,, MyProgress, +10
    ControlSetText, Edit10, , ahk_exe AutoHotkey.exe
GuiControl,, MyProgress, +10
    ControlSetText, Edit11, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit12, , ahk_exe AutoHotkey.exe
GuiControl,, MyProgress, +10
    ControlSetText, Edit18, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit19, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit20, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit21, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit22, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit13, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit15, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit16, , ahk_exe AutoHotkey.exe
    ControlSetText, Edit17, , ahk_exe AutoHotkey.exe
    Sleep,500
GuiControl,, MyProgress, 0
    SB_SetText(frmSAVEDPRESET " RFID 초기화 완료")

}
else
{
          SoundPlay, %A_MyDocuments%\sound\sound44.wav
          Sleep, 800
          SoundPlay, %A_MyDocuments%\sound\sound1_1.mp3
GuiControl,, MyProgress, +10

ControlClick, Tbutton1, ahk_class TMessageForm

WinKill, ahk_class TMessageForm


Sleep, 200

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;~ Sleep, 200
    ;~ send, {esc 10}{alt}{enter}
    ;~ send, {Left 2}{enter}
    ;~ Sleep, 1000
;~ GuiControl,, MyProgress, +10

    ;~ ControlGetText, p, edit4, 신흥목재재고파악수정 1.0
    ;~ ControlSetText, TRzEdit4, %p%, ahk_exe JedaeroM.exe
    ;~ Sleep,100
        control, choose, 1, TRzComboBox3, ahk_exe JedaeroM.exe
    controlclick, TRzButton4, ahk_exe JedaeroM.exe
    Sleep,100
ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe, , , , x40 y25
    Sleep,2000


Control, show , , Static24, 신흥목재재고파악수정 1.0








ControlClick, TAdvToolBar3, ahk_exe JedaeroM.exe, , , , x160 y17
GuiControl,, MyProgress, +10
Sleep, 500
    Winwait, ahk_class XLMAIN
    IfWinNotActive, ahk_class XLMAIN, , WinActivate, ahk_class XLMAIN,
    WinWaitActive, ahk_class XLMAIN,

Sleep,500
Control, show , , Static25, 신흥목재재고파악수정 1.0





GuiControl,, MyProgress, +10
    ax := ComObjActive("excel.Application")
    ex := ax.activeworkbook
    xl := ex.Sheets("sheet1")
    a := xl.Range("f2").Value
    b := xl.Range("u2").Value
    c := xl.Range("v2").Value
    d := xl.Range("w2").Value
    e := xl.Range("x2").Value
    f := xl.Range("e2").Value

GuiControl,, MyProgress, +10
    a := round(a,0)
    b := round(b,0)
    c := round(c,0)
    d := round(d,0)
    e := round(e,0)
    f := round(f,0)





GuiControl,, MyProgress, +10
    ControlSetText, Edit6, %a%, 신흥목재재고파악수정 1.0
    ControlSetText, Edit7, %b%, 신흥목재재고파악수정 1.0
    ControlSetText, Edit8, %c%, 신흥목재재고파악수정 1.0
    ControlSetText, Edit9, %d%, 신흥목재재고파악수정 1.0
    ControlSetText, Edit10, %e%, 신흥목재재고파악수정 1.0
    ControlSetText, Edit11, %f%, 신흥목재재고파악수정 1.0
    Controlsend, Edit12, {ctrldown}a{ctrlup}{del}, ahk_exe AutoHotkey.exe
    Controlsend, Edit13, {ctrldown}a{ctrlup}{del}, ahk_exe AutoHotkey.exe


Sleep, 200

ControlSend, NetUIHWND2, {AltDown}{F4}{AltDown}, ahk_class XLMAIN
Sleep, 1000

ControlSend, NetUIHWND1, {Right}{enter}, ahk_class XLMAIN

Control, show , , Static26, 신흥목재재고파악수정 1.0



    Sleep, 100
GuiControl,, MyProgress, +10
Process, close, EXCEL.EXE
ControlClick, NetUIHWND1, ahk_class NUIDialog,,,,x176 y56

Sleep, 100

ControlClick, Tbutton1, ahk_class TMessageForm

WinKill, ahk_class TMessageForm

Sleep, 100

		WinWait, 신흥목재재고파악수정 1.0,
		IfWinNotActive, 신흥목재재고파악수정 1.0, , WinActivate, 신흥목재재고파악수정 1.0,
		WinWaitActive, 신흥목재재고파악수정 1.0,


    ;~ controlclick, TAdvToolBar3, ahk_exe JedaeroM.exe, , , , x270 y17


GuiControl,, MyProgress, +10









;~ TAdvToolBar3 ; 수정
    ;~ Sleep,2000


Control, show , , Static27, 신흥목재재고파악수정 1.0









GuiControl,, MyProgress, +10
Sleep,100

GuiControl,, MyProgress, 0
    SB_SetText(frmSAVEDPRESET " 품목 재고 조회 완료")
;
;






    controlclick, TAdvToolBar3, ahk_exe JedaeroM.exe, , , , x270 y17



;;;;;;;;;;;;;;;;;;;;
    Sleep, 500
    Winwait, ahk_exe JedaeroM.exe
    IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
    WinWaitActive, ahk_exe JedaeroM.exe
;~ Control, show , , Static23, 신흥목재재고파악수정 1.0

    Sleep, 200
    ControlClick, x21 y39, ahk_exe JedaeroM.exe




    Sleep, 200
    send, {esc 10}{alt}{enter 2}
    ;~ send, {enter}
    Sleep, 1000
GuiControl,, MyProgress, +10


    ControlGetText, p, edit4, 신흥목재재고파악수정 1.0
    ControlSetText, TRzEdit1, %p%, ahk_exe JedaeroM.exe
    Sleep,100
ControlClick, TRzPanel9, ahk_exe JedaeroM.exe, , , , x258 y10
    ControlGetText, loca, TRzDBEdit14, ahk_exe JedaeroM.exe
    Sleep,50
    ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe, , , , x65 y 15
    Sleep, 100

Control, show , , Static22, 신흥목재재고파악수정 1.0


ControlSetText, Edit18, %loca%, 신흥목재재고파악수정 1.0


regexmatch(loca, "(.*)-(.*)-(.*)", 1loca)
loca11 := RegExReplace(1loca1, "[0-9]", "")
loca12 := RegExReplace(1loca1, "[^0-9]", "")

;~ msgbox, % 1loca1
;~ msgbox, % 1loca2
;~ msgbox, % 1loca3
;~ msgbox, % loca11
;~ msgbox, % loca12

ControlSetText, Edit19, %loca11%, 신흥목재재고파악수정 1.0
ControlSetText, Edit20, %loca12%, 신흥목재재고파악수정 1.0
ControlSetText, Edit21, %1loca2%, 신흥목재재고파악수정 1.0
ControlSetText, Edit22, %1loca3%, 신흥목재재고파악수정 1.0



GuiControl,, MyProgress, +10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



    ControlFocus, Edit13, 신흥목재재고파악수정 1.0
          SoundPlay, %A_MyDocuments%\sound\sound22.wav
          Sleep, 500
    SoundPlay, %A_MyDocuments%\sound\sound2_2.mp3





Control, show , , Static28, 신흥목재재고파악수정 1.0

Control, hide , , Static19, 신흥목재재고파악수정 1.0
Control, hide , , Static20, 신흥목재재고파악수정 1.0
Control, hide , , Static21, 신흥목재재고파악수정 1.0
Control, hide , , Static22, 신흥목재재고파악수정 1.0
Control, hide , , Static23, 신흥목재재고파악수정 1.0
Control, hide , , Static24, 신흥목재재고파악수정 1.0
Control, hide , , Static25, 신흥목재재고파악수정 1.0
Control, hide , , Static26, 신흥목재재고파악수정 1.0
Control, hide , , Static27, 신흥목재재고파악수정 1.0
Control, hide , , Static28, 신흥목재재고파악수정 1.0

}
    WinActivate, 신흥목재재고파악수정 1.0

























            }
        }
    ;~ }

    ;~ ControlGetText, AA, Edit1, 신흥목재재고파악수정 1.0
    ;~ ControlGetText, BB, Edit2, 신흥목재재고파악수정 1.0

    ;~ if ( BB = "")
    ;~ {
        ;~ Sleep, 1000
        ;~ if ( AA = )
        ;~ {
    ;~ }
    ;~ else




}




;~ sta:
;~ Pause, off
;~ return
;~ sto:
;~ Pause, on
;~ return
;~ exit:
;~ ExitApp

}
