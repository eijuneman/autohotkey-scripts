#NoENV
#SingleInstance, Force
#InstallMouseHook
Menu, TRAY, Icon, Question Block.ico
#MaxMem 512
#Include, %A_ScriptDir%\Class_LV_InCellEdit.ahk
#Include, %A_ScriptDir%\Class_LV_Colors.ahk
#Include, %A_ScriptDir%\csv.ahk
#Include, %A_ScriptDir%\screencapture.ahk
연다 = 0

어제날짜=%A_Now%
EnvAdd,어제날짜,-1,days
FormatTime,어제날짜,%어제날짜%,yyyy-MM-dd
csvfile1 = %A_ScriptDir%\상품정보\상품정보.CSV
        csv_Load(csvfile1,"data1")
;~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gosub, 인폼받기
;~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SetTitleMatchMode, 3
SetTitleMatchMode, slow


SetBatchLines, -1
SetKeyDelay, 2
SetMouseDelay, -1
SetWinDelay, -1
SetControlDelay, -1

Voice := ComObjCreate("SAPI.SpVoice")
VERSION := 2.0
RegExMatch(A_ScriptName, "^(.*?)\.", basename)
WINTITLE := basename1 " " VERSION


;~ if (A_UserName = "지게차용")
if (A_UserName = "shwoodnew")
{

    /*
    SetTimer , timer, 600000
    Loop, 0
    {
    Process, close, EXCEL.EXE
    ;~ Sleep, 10
    }

    Loop,2
    {
    WinKill, ahk_exe ttermpro.exe
    Sleep,1
    winkill, ahk_exe JedaeroM.exe
    Sleep,1
    }

    run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M
    ;~ WinKill, ahk_exe ttermpro.exe

    Sleep, 500
        WinWait, ahk_exe JedaeroM.exe,
        IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
        WinWaitActive, ahk_exe JedaeroM.exe,
    Sleep, 50

    ControlSetText, TRzEdit2, 0415660571, ahk_exe JedaeroM.exe
    Sleep,1
    ControlSetText, TRzEdit1, 0415660571, ahk_exe JedaeroM.exe
    Sleep,100
    ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe

    ;~ run, ttermpro.exe, C:\Program Files (x86)\teraterm
    ;~ Sleep,100
        ;~ WinWait, Tera Term: 새 연결,
        ;~ IfWinNotActive, Tera Term: 새 연결, , WinActivate, Tera Term: 새 연결,
        ;~ WinWaitActive, Tera Term: 새 연결,

    ;~ Sleep, 500
    ;~ control, Check, , Button11, Tera Term: 새 연결
    ;~ Sleep,200,
    ;~ control, choose, 1, ComboBox4, Tera Term: 새 연결
    ;~ Sleep, 200,
    ;~ ControlSend, Button5, {enter}, Tera Term: 새 연결
    ;~ Sleep, 1000
    ;~ WinMaximize, ahk_exe JedaeroM.exe
    ;~ ListLines Off
    ;~ GuiControl,, PG, 0
    ;~ Loop, 20
    ;~ {
        ;~ Process, close, EXCEL.EXE
        ;~ Sleep, 10
    ;~ }


    Sleep, 1000

    Winwait, ahk_class TfmMain
    IfWinNotActive, ahk_class TfmMain, , WinActivate, ahk_class TfmMain
    WinWaitActive, ahk_class TfmMain

    Sleep, 100
    ControlClick, x5 y5, ahk_exe JedaeroM.exe
    Sleep, 100

GuiControl,, PG, +10

    send, {esc 10}{alt}{enter}
    Sleep, 100
    send, {down 2}{enter}
GuiControl,, PG, +10

 Sleep, 2000
    ControlSend, TRzDateTimeEdit1, {del 20}{BackSpace 20}, ahk_class TfmMain
;~ Send, {ctrl up}{Alt up}{Shift up}
    Sleep,200
    ControlSend, TRzDateTimeEdit1, %어제날짜%, ahk_class TfmMain
    Sleep,200


*/

}
else
{

}

/*

else if (A_UserName = "지게차용")
{
    SetTimer , timer, 600000
    /*
    ;~ Loop, 20
    ;~ {
    ;~ Process, close, EXCEL.EXE
    ;~ Sleep, 10
    ;~ }

    ;~ Loop,2
    ;~ {
    ;~ WinKill, ahk_exe ttermpro.exe
    ;~ Sleep,10
    ;~ winkill, ahk_exe JedaeroM.exe
    ;~ Sleep,10
    ;~ }

    run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M
    WinKill, ahk_exe ttermpro.exe

    ;~ Sleep, 500
        WinWait, ahk_exe JedaeroM.exe,
        IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
        WinWaitActive, ahk_exe JedaeroM.exe,
    Sleep, 500

    ControlSetText, TRzEdit2, 0415660571, ahk_exe JedaeroM.exe
    ControlSetText, TRzEdit1, 0415660571, ahk_exe JedaeroM.exe
    ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe

    ;~ run, ttermpro.exe, C:\Program Files (x86)\teraterm
    ;~ Sleep,100
        ;~ WinWait, Tera Term: 새 연결,
        ;~ IfWinNotActive, Tera Term: 새 연결, , WinActivate, Tera Term: 새 연결,
        ;~ WinWaitActive, Tera Term: 새 연결,

    ;~ Sleep, 500
    ;~ control, Check, , Button11, Tera Term: 새 연결
    ;~ Sleep,200,
    ;~ control, choose, 1, ComboBox4, Tera Term: 새 연결
    ;~ Sleep, 200,
    ;~ ControlSend, Button5, {enter}, Tera Term: 새 연결
    ;~ Sleep, 1000
    ;~ WinMaximize, ahk_exe JedaeroM.exe
    ;~ ListLines Off
    ;~ GuiControl,, PG, 0
    ;~ Loop, 20
    ;~ {
        ;~ Process, close, EXCEL.EXE
        ;~ Sleep, 10
    ;~ }
    */
;~ }
;~ else
;~ {
    ;~ SetTimer , timer, 600000
;~ }
*/


; SoundPlay, %A_ScriptDir%\sound\sound22.wav
Sleep, 500
; SoundPlay, %A_ScriptDir%\sound\sound0_1.mp3
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath
gui, destroy
gui, Default
;~ Gui, +alwaysontop
;~ Background0xFF00FF
Gui, Font, S13 CDefault w700, Malgun Gothic
Gui, Add, Tab3, x0 y0 w1281 h731 vtabname gtabname, 상품검색`  |▼평면[내부]`  |▼평면[철물]`  |▼평면[외부]`  |▽[K1~K6]`  |▽[K7~K12]`  |▽[G14~G9]`  |▽[G8~7  J4~2]`  |`      EDSM`       |
;~ Gui, Tab, 상품검색`  ,,Exact
Gui, Tab, 상품검색`  ,,

Gui, Add, Radio, x0 y120 vradio1 Backgroundtrans gradio1, #1
Gui, Add, Radio, y+30 h40 vradio2 backgroundtrans gradio2, #2
Gui, Add, Radio, y+5 h40 vradio3 backgroundtrans gradio3, #3
Gui, Add, Radio, y+5 h40 vradio4 backgroundtrans gradio4, #4
Gui, Add, Radio, y+5 h40 vradio5 backgroundtrans gradio5, #5
Gui, Add, Radio, y+5 h40 vradio6 backgroundtrans gradio6, #6
Gui, Add, Radio, y+5 h40 vradio7 backgroundtrans gradio7, #7
Gui, Add, Radio, y+5 h40 vradio8 backgroundtrans gradio8, #8
Gui, Add, Radio, y+5 h40 vradio9 backgroundtrans gradio9, #9


Gui, Add, Picture, y+1 w0 h0 vhighlight, %A_ScriptDir%\images\highlight.png   ; 하이라이트
Gui, Add, Picture, x608 y113 w44 h44 vcolor1, %A_ScriptDir%\images\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, y+16 w44 h44 vcolor2, %A_ScriptDir%\images\blue.png
Gui, Add, Picture, y+1 w44 h44 vcolor3, %A_ScriptDir%\images\colour1.png
Gui, Add, Picture, y+1 w44 h44 vcolor4, %A_ScriptDir%\images\colour2.png
Gui, Add, Picture, y+1 w44 h44 vcolor5, %A_ScriptDir%\images\colour3.png
Gui, Add, Picture, y+1 w44 h44 vcolor6, %A_ScriptDir%\images\colour4.png
Gui, Add, Picture, y+1 w44 h44  vcolor7, %A_ScriptDir%\images\colour5.png
Gui, Add, Picture, y+1 w44 h44 vcolor8, %A_ScriptDir%\images\colour6.png
Gui, Add, Picture, y+1 w44 h44 vcolor9, %A_ScriptDir%\images\colour7.png

Gui, Font, S13 CDefault w700, Malgun Gothic



;~ Gui, Add, Text, x20 y120 w20 h40 v#1 Backgroundtrans,
;~ Gui, Add, Text, y+20 w20 h40 v#2 backgroundtrans, #2
;~ Gui, Add, Text, y+5 w20 h40 v#3 backgroundtrans, #3
;~ Gui, Add, Text, y+5 w20 h40 v#4 backgroundtrans, #4
;~ Gui, Add, Text, y+5 w20 h40 v#5 backgroundtrans, #5
;~ Gui, Add, Text, y+5 w20 h40 v#6 backgroundtrans, #6
;~ Gui, Add, Text, y+5 w20 h40 v#7 backgroundtrans, #7
;~ Gui, Add, Text, y+5 w20 h40 v#8 backgroundtrans, #8
;~ Gui, Add, Text, y+5 w20 h40 v#9 backgroundtrans, #9


Gui, Font, S13 CDefault w400, Malgun Gothic
Gui, Add, GroupBox, x15 y85 w860 h450  vgroupbox1,    `   [RFID CODE]                    [LOCATION CODE]                                              [수량]
Gui, Font, S15 CDefault, Malgun Gothic
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 01   01   01
Gui, Add, ComboBox, x42 y115 w170 h40 r10 cE7141B section vfrmSAVEDPRESET gPresetChange,%TR1%
;~ Gui, Add, edit, x42 y115 w170 h40 cE7141B section vfrmSAVEDPRESET gPresetChange,
Gui, Add, Button, x+0   w40 h40 gbtread1 vB1, B1 ; RRRRRRRRRRRR
Gui, Add, Edit, x+8  w100 h40 +ReadOnly cE7141B -vscroll Uppercase v1RFID2,
Gui, Add, Edit, x+10  w40 h40 cE7141B -vscroll Uppercase +center  vlo1_1 glo1,
Gui, Add, Edit, x+0 w50 h40 cE7141B -vscroll Number +center Limit20 vlo1_2 glo1,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 cE7141B -vscroll Number +center Limit20 vlo1_3 glo1,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 cE7141B -vscroll Number +center Limit20 vlo1_4 glo1,
Gui, Add, UpDown,Range00-20 ,1
Gui, Add, Button, x+10 y115 w40 h40 vL1 gselect1 vL1, L1
Gui, Add, Edit, x+20 y115 w60 h40 cE7141B -vscroll Uppercase +right v1RFID3 gb1RFID3,
GuiControl, disable, 1RFID3
Gui, Add, Button, x+10 y115 h40 cE7141B -vscroll Uppercase gminer1, 삭제  ;★☆★☆★☆★☆
Gui, Add, Button, x+0   w40 h40 grefridread vR1, R1 ; RRRRRRRRRRRR
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 02   02   02
Gui, Add, Edit, x42 y+20 w170 h40 c0000FF -vscroll +ReadOnly Uppercase v2RFID1,
Gui, Add, Button, X+0   w40 h40 gbtread2 vB2, B2
Gui, Add, Edit,x+8 y175 w100 h40 c0000FF +ReadOnly -vscroll Uppercase v2RFID2,
Gui, Add, Edit, x+10  w40 h40 c0000FF -vscroll Uppercase +center vlo2_1 glo2,
Gui, Add, Edit, x+0 w50 h40 c0000FF -vscroll Number +center  vlo2_2 glo2,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 c0000FF -vscroll Number +center  vlo2_3 glo2,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 c0000FF -vscroll Number +center  vlo2_4 glo2,
Gui, Add, UpDown,,
Gui, Add, Button, x+10 y175 w40 h40 gselect2 vL2, L2
Gui, Add, Edit, x+20 y175 w60 h40 c0000FF -vscroll Uppercase +right v2RFID3 gb2RFID3,
Gui, Add, Button, x+10   h40 cE7141B -vscroll Uppercase gminer2, 삭제  ;★☆★☆★☆★☆
Gui, Add, Button, X+0   w40 h40 grefridread2 vR2, R2
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 03   03   03
Gui, Add, Edit, x42 y+5 w170 h40 cFF7F27 -vscroll +ReadOnly Uppercase v3RFID1,
Gui, Add, Button, x+0 w40 h40 gbtread3 vB3, B3
Gui, Add, Edit, x+8 w100 h40 cFF7F27 +ReadOnly -vscroll Uppercase v3RFID2,
Gui, Add, Edit, x+10  w40 h40 cFF7F27 -vscroll Uppercase +center vlo3_1 glo3,
Gui, Add, Edit, x+0 w50 h40 cFF7F27 -vscroll Number +center vlo3_2 glo3,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 cFF7F27 -vscroll Number +center vlo3_3 glo3,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 cFF7F27 -vscroll Number +center vlo3_4 glo3,
Gui, Add, UpDown,,1
Gui, Add, Button, x+10  w40 h40 gselect3 vL3, L3
Gui, Add, Edit, x+20 w60 h40 cFF7F27 -vscroll Uppercase +right v3RFID3 gb3RFID3,
Gui, Add, Button, x+10   h40 cE7141B -vscroll Uppercase gminer3, 삭제  ;★☆★☆★☆★☆
Gui, Add, Button, x+0 w40 h40 grefridread3 vR3, R3
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 04   04   04
Gui, Add, Edit, x42 y+5 w170 h40 cFF00FF -vscroll +ReadOnly Uppercase v4RFID1,
Gui, Add, Button,  x+0 w40 h40 gbtread4 vB4, B4
Gui, Add, Edit, x+8 w100 h40 cFF00FF +ReadOnly -vscroll Uppercase v4RFID2,

Gui, Add, Edit, x+10  w40 h40 cFF00FF -vscroll Uppercase +center vlo4_1 glo4,
Gui, Add, Edit, x+0 w50 h40  cFF00FF -vscroll Number +center vlo4_2 glo4,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 cFF00FF  -vscroll Number +center vlo4_3 glo4,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 cFF00FF  -vscroll Number +center vlo4_4 glo4,
Gui, Add, UpDown,,1


Gui, Add, Button, x+10 w40 h40 gselect4 vL4, L4
Gui, Add, Edit, x+20 w60 h40 -vscroll Uppercase +right v4RFID3 gb4RFID3,
Gui, Add, Button, x+10   h40 cE7141B -vscroll Uppercase gminer4, 삭제  ;★☆★☆★☆★☆
Gui, Add, Button, x+0 w40 h40 grefridread4 vR4, R4
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 05   05   05
Gui, Add, Edit, x42 y+5 w170 h40 c68E4E6 -vscroll +ReadOnly Uppercase v5RFID1,
Gui, Add, Button,  x+0 w40 h40 gbtread5 vB5, B5
Gui, Add, Edit, x+8 w100 h40 c68E4E6 +ReadOnly -vscroll Uppercase v5RFID2,

Gui, Add, Edit, x+10  w40 h40 c68E4E6 -vscroll Uppercase +center vlo5_1 glo5,
Gui, Add, Edit, x+0 w50 h40 c68E4E6 -vscroll Number +center vlo5_2 glo5,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 c68E4E6 -vscroll Number +center vlo5_3 glo5,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 c68E4E6 -vscroll Number +center vlo5_4 glo5,
Gui, Add, UpDown,,1


Gui, Add, Button, x+10 w40 h40 gselect5 vL5, L5
Gui, Add, Edit, x+20 w60 h40 c68E4E6 -vscroll Uppercase +right v5RFID3 gb5RFID3,
Gui, Add, Button, x+10   h40 cE7141B -vscroll Uppercase gminer5, 삭제  ;★☆★☆★☆★☆
Gui, Add, Button,  x+0 w40 h40 grefridread5 vR5, R5
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 06   06   06
Gui, Add, Edit,  x42 y+5 w170 h40 c00E800 -vscroll +ReadOnly Uppercase v6RFID1,
Gui, Add, Button,   x+0 w40 h40 gbtread6 vB6, B6
Gui, Add, Edit, x+8  w100 h40 c00E800  +ReadOnly -vscroll Uppercase v6RFID2,

Gui, Add, Edit, x+10  w40 h40  c00E800 -vscroll Uppercase +center  vlo6_1 glo6,
Gui, Add, Edit, x+0 w50 h40  c00E800 -vscroll Number +center vlo6_2 glo6,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 c00E800  -vscroll Number +center vlo6_3 glo6,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40  c00E800 -vscroll Number +center vlo6_4 glo6,
Gui, Add, UpDown,,1


Gui, Add, Button, x+10 w40 h40 gselect6, L6
Gui, Add, Edit, x+20 w60 h40  c00E800 -vscroll Uppercase +right v6RFID3 gb6RFID3,
Gui, Add, Button, x+10   h40 cE7141B -vscroll Uppercase gminer6, 삭제  ;★☆★☆★☆★☆
Gui, Add, Button,   x+0 w40 h40 grefridread6 vR6, R6
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 07   07   07
Gui, Add, Edit,x42 y+5 w170 h40 cC4C400 -vscroll +ReadOnly Uppercase v7RFID1,
Gui, Add, Button,  x+0 w40 h40 gbtread7 vB7, B7
Gui, Add, Edit,  x+8  w100 h40 cC4C400 +ReadOnly -vscroll Uppercase v7RFID2,

Gui, Add, Edit, x+10  w40 h40 cC4C400  -vscroll Uppercase +center vlo7_1 glo7,
Gui, Add, Edit, x+0 w50 h40 cC4C400  -vscroll Number +center vlo7_2 glo7,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40  cC4C400 -vscroll Number +center vlo7_3 glo7,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40  cC4C400 -vscroll Number +center vlo7_4 glo7,
Gui, Add, UpDown,,1


Gui, Add, Button, x+10 w40 h40 gselect7 vL7, L7
Gui, Add, Edit,  x+20 w60 h40 cC4C400  -vscroll Uppercase +right v7RFID3 gb7RFID3,
Gui, Add, Button, x+10   h40 cE7141B -vscroll Uppercase gminer7, 삭제  ;★☆★☆★☆★☆
Gui, Add, Button,  x+0 w40 h40 grefridread7 vR7, R7
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 08   08   08
Gui, Add, Edit,x42 y+5 w170 h40 cA349A4 -vscroll +ReadOnly Uppercase v8RFID1,
Gui, Add, Button, x+0 w40 h40 gbtread8 vB8, B8
Gui, Add, Edit,  x+8  w100 h40  cA349A4 +ReadOnly -vscroll Uppercase v8RFID2,

Gui, Add, Edit, x+10  w40 h40  cA349A4 -vscroll Uppercase +center vlo8_1 glo8,
Gui, Add, Edit, x+0 w50 h40  cA349A4 -vscroll Number +center vlo8_2 glo8,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 cA349A4  -vscroll Number +center vlo8_3 glo8,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40  cA349A4 -vscroll Number +center vlo8_4 glo8,
Gui, Add, UpDown,,1


Gui, Add, Button, x+10 w40 h40 gselect8 vL8, L8
Gui, Add, Edit, x+20 w60 h40 cA349A4  -vscroll Uppercase +right v8RFID3 gb8RFID3,
Gui, Add, Button, x+10  h40 cE7141B -vscroll Uppercase gminer8, 삭제  ;★☆★☆★☆★☆
Gui, Add, Button, x+0 w40 h40 grefridread8 vR8, R8
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 09   09   09
Gui, Add, Edit, x42 y+5 w170 h40  c6B6B00 -vscroll +ReadOnly Uppercase v9RFID1,
Gui, Add, Button,  x+0 w40 h40 gbtread9 vB9, B9
Gui, Add, Edit, x+8 w100 h40  c6B6B00 +ReadOnly -vscroll Uppercase v9RFID2,

Gui, Add, Edit, x+10  w40 h40  c6B6B00 -vscroll Uppercase +center vlo9_1 glo9,
Gui, Add, Edit, x+0 w50 h40 c6B6B00  -vscroll Number +center vlo9_2 glo9,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40  c6B6B00 -vscroll Number +center vlo9_3 glo9,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
Gui, Add, Edit, x+0 w50 h40 c6B6B00 -vscroll Number +center vlo9_4 glo9,
Gui, Add, UpDown,,1


Gui, Add, Button, x+10 w40 h40 gselect9 vL9, L9
Gui, Add, Edit, x+20 w60 h40  c6B6B00 -vscroll Uppercase +right v9RFID3 gb9RFID3,
Gui, Add, Button, x+10  h40 cE7141B -vscroll Uppercase gminer9, 삭제  ;★☆★☆★☆★☆
Gui, Add, Button,  x+0 w40 h40 grefridread9 vR9, R9
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







GuiControl, Move, 2colorbutton, x202 y37 w55 h29
GuiControl, Move, 3colorbutton, x308 y37 w55 h29
GuiControl, Move, 4colorbutton, x416 y37 w55 h29

Gui, Font, S13 CDefault, Malgun Gothic
;~ if (A_UserName = "지게차용")
;~ {
    Gui, Add, Button, x42 y45 w80 h25 vSavePreset gSavePreset, 저장
;~ }
;~ else
;~ {
    ;~ Gui, Add, Button, x42 y45 w80 h25 vSavePreset , 저장
    ;~ GuiControl, disable, SavePreset
;~ }

Gui, Add, Button, x+2 w80 h25 gDeletePreset vDELETEBUTTON, 삭제
;~ Gui, Add, Button, x+10 w80 h25 vPresetChange gPresetChange, #1 리딩
;~ Gui, Add, Button, x+2 w80 h25 v키보드 g키보드,
Gui, Add, Button, x+50 w76 h25 vbutton2 gbutton2, 초기화
Gui, Add, Button, x+2 w76 h25 v인폼받기 g인폼받기, 인폼받기
;~ Gui, Add, Button, x+2 w80 h25 v카드값초기화 g카드값초기화, 서브카드
Gui, Add, Button, x+84  w80 h25 vmapping gmapping, 맵에표시
Gui, Add, Button, x+2  w160 h25 vdelrfid gdelrfid, 밴딩해체 라인정렬
Gui, Add, Button, x+2  w160 h25 gchange, 카드 수기로 저장
Gui, Add, Progress, vPG x+10 y45  w182 h22 cred, 0
Gui, Add, Button, x+7 y42 w100 h25 v검색 g검색, ▼ 빠른검색
Gui, Font, S13 W700 CDefault, Malgun Gothic
Gui, Add, Button, x+15 w60 h100 v키보드열기 gRFID삭제, 카드`n기록`n`삭제
Gui, Add, Button, y+30 w60 h100 v블루사이드 gbtread1, 블루`n투스`n`검색
Gui, Add, Button, y+30 w60 h100 vQR사이드 gQr, QR`n코드`n`검색
Gui, Add, Button, y+30 w60 h100 v로케이션정렬 g로캐이션정렬, 로케`n이션`n`정렬
Gui, Add, Button, y+30 w60 h50 g리스트변경, 리`n스`n트
Gui, Add, Button, y+30 w60 h50 gUpdatePresetList, 추가


Gui, Font, S13 CDefault, Malgun Gothic
Gui, Add, Edit, y+0 w75 h1 vRFIDREAD4,

Gui, Add, StatusBar




;~ Gui, Add, GroupBox, x85 y149 w255 h90 , [로케이션]


;~ Gui, Add, Text, x90 y179 w230 h17 , 라인          칸                줄               칸
Gui, Font, S13 W400 CDefault, Malgun Gothic
Gui, Font, S8 CDefault, Malgun Gothic

;~ Gui, Add, GroupBox, x85 y244 w255 h300 , [기타 로케이션]
;~ Gui, Add, Text, x90 y269 w260 h20 , 기타RFID코드            로케이션       수량
Gui, Font, S15 CDefault, Malgun Gothic


;~ Gui, Add, Edit, x440 y115 w170 h40 -vscroll Uppercase v1RFID2r,







;~ Gui, Add, GroupBox, x347 y429 w180 h240 , [비고]
;~ Gui, Add, Edit, x352 y564 w170 h100 v비고,

;~ Gui, Font, S9 W1000 CDefault, Malgun Gothic
;~ Gui, Add, button, x352 y449 w39 h32 gnum1, 7
;~ Gui, Add, button, x+5 w39 h32 gnum1, 8
;~ Gui, Add, button, x+5 w39 h32 gnum1, 9

;~ Gui, Font, S8 W400 CDefault, Malgun Gothic
;~ Gui, Add, button, x+5 w39 h32 gnum1, ←

;~ Gui, Font, S9 W1000 CDefault, Malgun Gothic
;~ Gui, Add, button, x352 y485 w39 h32 gnum1, 4
;~ Gui, Add, button, x+5 w39 h32 gnum1, 5
;~ Gui, Add, button, x+5 w39 h32 gnum1, 6

;~ Gui, Font, S8 W400 CDefault, Malgun Gothic
;~ Gui, Add, button, x+5 w39 h32 gnum1, DEL

;~ Gui, Font, S9 W1000 CDefault, Malgun Gothic
;~ Gui, Add, button, x352 y521 w39 h32 gnum1, 1
;~ Gui, Add, button, x+5 w39 h32 gnum1, 2
;~ Gui, Add, button, x+5 w39 h32 gnum1, 3

;~ Gui, Font, S8 W400 CDefault, Malgun Gothic
;~ Gui, Add, button, x+5 w39 h32 gnum1, RE

;~ Gui, Font, S8 W400 CDefault, Malgun Gothic






Gui, Font, S13 CDefault, Malgun Gothic


Gui, Font, S13 CDefault, Malgun Gothic
Gui, Add, GroupBox, x889 y80 w315 h147 , [상품명 / 규격]
Gui, Font, S15 CDefault, Malgun Gothic
Gui, Add, Edit, x1095 y70 w100 h40 -vscroll  v상품코드,
Gui, Add, Edit, x900 y115 w295 h40 -vscroll v상품명,
Gui, Add, Edit, x900 y+20 w295 h40 -vscroll v규격,



;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

Gui, Font, S11 CDefault, Malgun Gothic
Gui, Add, GroupBox,  x889 y230 w315 h305 , ` 어제재고       오늘매출수량   오늘반입수량

;~ 1205, 535 (

;~ Gui, Add, GroupBox, x347 y184 w180 h240 , [재고량]
;~ Gui, Add, Text, x352 y205 w170 h15 ,
;~ Gui, Font, S13 CDefault, Malgun Gothic
Gui, Add, Text, x900 y295 w280 h18       , ` 현재수량       오늘매입수량   오늘반출수량
Gui, Add, Text, x900 y355 w280 h18       , ` 전산총수량  - 전산밴딩   =   전산낱장
Gui, Add, Text, x900 y415 w280 h18       , ` 수정값          #실제합계      #실제낱장


Gui, Font, S15 CDefault, Malgun Gothic
Gui, Add, Edit, x900  y254 w95 h40 -vscroll Number +right v이전재고 g이전재고,
Gui, Add, Edit, x+5 w95 h40 -vscroll Number +right v매출수량 g매출수량 ,
Gui, Add, Edit, x+5  w95 h40 -vscroll Number +right v반입수량 g반입수량,

;~ Gui, Add, Edit, x317 y264 w70 h25 -vscroll ,
Gui, Add, Edit, x900 y314 w95 h40 Number -vscroll +right v현재수량 ,
Gui, Add, Edit, x+5  w95 h40 Number -vscroll +right v매입수량 g매입수량,
Gui, Add, Edit, x+5  w95 h40 Number -vscroll +right v반출수량 g반출수량,

Gui, Add, Edit, x900 y374 w95 h40 Number -vscroll +right v전산총수량,
Gui, Add, Edit, x+5  w95 h40 Number -vscroll +right v전산밴딩 g전산밴딩,
Gui, Add, Edit, x+5  w95 h40 Number -vscroll cred +right v전산낱장,

Gui, Add, Edit,  x900  y434 w95 h40 Number -vscroll +right v수정값,
Gui, Add, Edit,  x+5  w95 h40 Number -vscroll +right v실제합계,
Gui, Add, Edit,  x+5  w95 h40 Number -vscroll +right v실제낱장 g실제낱장,

Gui, Font, S13 CDefault, Malgun Gothic
Gui, Font, S13 CDefault, Malgun Gothic




Gui, Add, Button, x900 y490 w95 h40 v전산수정 g전산수정, 전산수정
Gui, Add, Button, x+100  w100 h40 v역계산 g역계산, 역계산
;~ if (A_UserName = "지게차용")
;~ {
;~ }
;~ else
;~ {
    ;~ GuiControl, disable, 역계산
    ;~ GuiControl, disable, 전산수정
;~ }
Gui, Add, GroupBox, x889 y533  w315 h147 , [수정로그]
Gui, Add, Edit, x900 y564 w295 h110 v비고,





 /* new 리더기 x22 y535
 */
리더기입니다 = %리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%

Gui, Font, S10 CDefault w300, Malgun Gothic



Gui, Add, Groupbox, x15 y530 w307 h175,
Gui, Add, Groupbox, x+15  w195 h175,
Gui, Add, Text, x29 y545 w250 h18, 로케이션 위치

Gui, Font, S30 Cblack w300, Malgun Gothic
Gui, Add, Edit, x29 y+0 w195 h55 -WantReturn +Center -VScroll -HScroll vqrcode Backgroundtrans Uppercase, %qrloca%
Gui, Font, S30 CRED w700, Malgun Gothic
Gui, Add, Text, x+25 +right w70 h55 v큐알순서 , ; 숫자
;~ Gui, Add, Edit, x+5 w60 h55 +center, 9
;~ Gui, Add, Text, x+5 w20 h55 +center, -
;~ Gui, Add, Edit, x+5 w60 h55 +center, 9
;~ Gui, Add, Text, x+5 w20 h55 +center, -
;~ Gui, Add, Edit, x+5 w60 h55 +center, 9

Gui, Font, S14 Cblack w300, Malgun Gothic
Gui, Add, Button, x+30 w80 h55 v정렬이전 g정렬이전, ◁ 이전
Gui, Add, Button, x+10 w80 h55 v정렬다음 g정렬다음, 다음 ▶

Gui, Font, S10 CDefault w300, Malgun Gothic
Gui, Add, Text, x29 y+10 w250 h18, RFID 카드 넘버

Gui, Font, S30 CDefault w300, Malgun Gothic
Gui, Add, Edit, x29 y+0 w285 h55 +center Uppercase vbtcode,

Gui, Font, S14 CDefault w300, Malgun Gothic
Gui, Add, Button, x+35 w80 h55 gBt3 v정렬멈춤, QR코드리딩 ; v정렬멈춤
Gui, Font, S14 CDefault w300, Malgun Gothic
Gui, Add, Button, x+10 w80 h55 v정렬시작 g정렬시작, 시작




리더기입니다 = %리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%%리더기입니다%




/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*

Gui, Add, Button, x22 y535 w55 h55 gnum1, Q
Gui, Add, Button, x+0 w55 h55 gnum1, W
Gui, Add, Button, x+0 w55 h55 gnum1, E
Gui, Add, Button, x+0 w55 h55 gnum1, R
Gui, Add, Button, x+0 w55 h55 gnum1, T
Gui, Add, Button, x+0 w55 h55 gnum1, Y
Gui, Add, Button, x+0 w55 h55 gnum1, U
Gui, Add, Button, x+0 w55 h55 gnum1, I
Gui, Add, Button, x+0 w55 h55 gnum1, O
Gui, Add, Button, x+0 w55 h55 gnum1, P
Gui, Add, Button, x42 y590 w55 h55 gnum1, A
Gui, Add, Button, x+0 w55 h55 gnum1, S
Gui, Add, Button, x+0 w55 h55 gnum1, D
Gui, Add, Button, x+0 w55 h55 gnum1, F
Gui, Add, Button, x+0 w55 h55 gnum1, G
Gui, Add, Button, x+0 w55 h55 gnum1, H
Gui, Add, Button, x+0 w55 h55 gnum1, J
Gui, Add, Button, x+0 w55 h55 gnum1, K
Gui, Add, Button, x+0 w55 h55 gnum1, L
Gui, Add, Button, x62 y645 w55 h55 gnum1, Z
Gui, Add, Button, x+0 w55 h55 gnum1, X
Gui, Add, Button, x+0 w55 h55 gnum1, C
Gui, Add, Button, x+0 w55 h55 gnum1, V
Gui, Add, Button, x+0 w55 h55 gnum1, B
Gui, Add, Button, x+0 w55 h55 gnum1, N
Gui, Add, Button, x+0 w55 h55 gnum1, M
Gui, Add, Button, x+0 w55 h55 gnum1, SPACE
Gui, Add, Button, x+0 w55 h55 gnum1, 한


Gui, Add, Button, x650 y535 w55 h55 gnum1, <-
Gui, Add, Button, x+0 w55 h55 gnum1, 7
Gui, Add, Button, x+0 w55 h55 gnum1, 8
Gui, Add, Button, x+0 w55 h55 gnum1, 9
Gui, Add, Button, x650 y+0 w55 h110 gnum1, 0
Gui, Add, Button, x+0 w55 h55 gnum1, 4
Gui, Add, Button, x+0 w55 h55 gnum1, 5
Gui, Add, Button, x+0 w55 h55 gnum1, 6
;~ Gui, Add, Button,  y+0 w55 h55 gnum1, 0
Gui, Add, Button, x705 y+0 w55 h55 gnum1, 1
Gui, Add, Button, x+0 w55 h55 gnum1, 2
Gui, Add, Button, x+0 w55 h55 gnum1, 3


*/

;~ GuiControl, Move, colorbutton, x315 y387 w74 h29

GuiControl, Move, colorbutton, x463 y387 w64 h31


;~ Gui, Add, Button, x387 y389 w65 h25 , 총-밴딩

;~ GuiControl, disable, 전산수정
;~ GuiControl, disable, 역계산

GuiControl, disable, DELETEBUTTON


Gui, Font, S15 CDefault w300, Malgun Gothic
Gui, Add, Button, x1185 y5 w80 h26 gbattery, 베터리 잔량
Gui, Add, Button, x+0 y5 w80 h26 gchange, TMS




;~ Gui, Add, GroupBox, x562 y515 w780 h185 , 각 로케이션 별 제품 정보
;~ Gui, Add, Text, x572 y535 w70 h20 , 로케이션 번호



;~ Gui, Add, GroupBox, x562 y515 w780 h185 , 각 로케이션 별 제품 정보
Gui, Add, Text, x900 y680 w70 h20 , 로케이션
Gui, Add, Text, x+0 w70 h20 cred vshowlocation, 로케이션 번호
Gui, Font, S1 CDefault, Malgun Gothic
Gui, Add, Edit, x+10 w30 h12 -vscroll vRFIDREAD1,
Gui, Add, Edit, x+10 w30 h12 -vscroll vRFIDREAD2,
Gui, Add, Edit, x+10 w30 h12 -vscroll vRFIDREAD3,



Gui, Font, S14 CDefault w900, Malgun Gothic
Gui, Add, button, x212 y45 w40 h65 vBt grecolor, 조`n회  ; bluetooth
Gui, Add, button, x410 y45 w80 h65 vQr gQr, QR`nCODE  ; bluetooth












;~ Gui, Tab, ▼평면[내부]`  ,,Exact
Gui, Tab, ▼평면[내부]`  ,,

Gui, Font, S11 CDefault W700 c0xFF2211, Malgun Gothic
Gui, Add, Listview, x800 y340 w460 h340 vLV1 gLV1 hwndHLV1 SortDesc,  로케이션|RFID CODE|상품명|규격|수량|PRODUCT CODE

Gui, ListView, lv1
LV_ModifyCol(1, 80)  ;
LV_ModifyCol(2, 0) ;
LV_ModifyCol(3, 170)  ;
LV_ModifyCol(4, 140)  ;
LV_ModifyCol(5, "50 Integer" "Integer Right")  ;
LV_ModifyCol(6, 0)  ;
;~ Gui, Add, GroupBox, x547 y9 w800 h695 , [창고 2D 평면도]



Gui, Font, S11 CDefault W400, Malgun Gothic





Gui, Color, FFFFFF
;~ Gui, Add, Picture, x640 y225 w312 h95 vdivi1, %A_ScriptDir%\divi.png
;~ Gui, Add, Picture, x1122 y201 w62 h170 vdivi2, %A_ScriptDir%\divi.png
;~ Gui, Add, Picture, x610 y435 w345 h75 vdivi3, %A_ScriptDir%\divi.png
;~ Gui, Add, Picture, x758 y34 w585 h80 vdivi4, %A_ScriptDir%\divi.png
;~ Gui, Add, Picture, x1045 y461 w100 h47 vdivi5, %A_ScriptDir%\divi.png

Gui, Add, Picture, x0 y0 w0 h0 v1color1, %A_ScriptDir%\images\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x0 y0 w0 h0 v1color2, %A_ScriptDir%\images\blue.png
Gui, Add, Picture, x0 y0 w0 h0 v1color3, %A_ScriptDir%\images\colour1.png
Gui, Add, Picture, x0 y0 w0 h0 v1color4, %A_ScriptDir%\images\colour2.png
Gui, Add, Picture, x0 y0 w0 h0 v1color5, %A_ScriptDir%\images\colour3.png
Gui, Add, Picture, x0 y0 w0 h0 v1color6, %A_ScriptDir%\images\colour4.png
Gui, Add, Picture, x0 y0 w0 h0 v1color7, %A_ScriptDir%\images\colour5.png
Gui, Add, Picture, x0 y0 w0 h0 v1color8, %A_ScriptDir%\images\colour6.png
Gui, Add, Picture, x0 y0 w0 h0 v1color9, %A_ScriptDir%\images\colour7.png






Gui, Add, Button, x22 y50 w70 h40 vF4_3 gF4_3, F4_3
Gui, Add, Button,  y+4 w70 h40 vF4_2 gF4_2, F4_2
Gui, Add, Button,  y+4 w70 h40 vF4_1 gF4_1, F4_1
;~ Gui, Add, Button,  y+4 w70 h40 vF4_0 gF4_0, F4_0

Gui, Add, Button, x+4 y50 w70 h40 vF3_3 gF3_3, F3_3
Gui, Add, Button,  y+4 w70 h40 vF3_2 gF3_2, F3_2
Gui, Add, Button,  y+4 w70 h40 vF3_1 gF3_1, F3_1
;~ Gui, Add, Button,  y+4 w70 h40 vF3_0 gF3_0, F3_0

Gui, Add, Button, x+8 y50 w70 h40 vF2_3 gF2_3, F2_3
Gui, Add, Button, y+4 w70 h40 vF2_2 gF2_2, F2_2
Gui, Add, Button, y+4 w70 h40 vF2_1 gF2_1, F2_1
;~ Gui, Add, Button, y+4 w70 h40 vF2_0 gF2_0, F2_0

Gui, Add, Button, x+4 y50 w70 h40 vF1_3 gF1_3, F1_3
Gui, Add, Button, y+4 w70 h40 vF1_2 gF1_2, F1_2
Gui, Add, Button, y+4 w70 h40 vF1_1 gF1_1, F1_1
;~ Gui, Add, Button, y+4 w70 h40 vF1_0 gF1_0, F1_0


Gui, Add, Button, x+8 y50 w30 h99 vF0_1 gF0_1, F0_1



Gui, Add, Button, x+8 y50 w50 h30 vH14_3 gH14_3, H14_3
Gui, Add, Button, y+4 w50 h30 vH14_2 gH14_2, H14_2
Gui, Add, Button, y+4 w50 h30 vH14_1 gH14_1, H14_1
Gui, Add, Button, y+8 w50 h30 vG14_3 gG14_3, G14_3
Gui, Add, Button, y+4 w50 h30 vG14_2 gG14_2, G14_2
Gui, Add, Button, y+4 w50 h30 vG14_1 gG14_1, G14_1

Gui, Add, Button, x+8 y50 w50 h30 vH13_3 gH13_3, H13_3
Gui, Add, Button, y+4  w50 h30 vH13_2 gH13_2, H13_2
Gui, Add, Button, y+4  w50 h30 vH13_1 gH13_1, H13_1
Gui, Add, Button, y+8  w50 h30 vG13_3 gG13_3, G13_3
Gui, Add, Button, y+4  w50 h30 vG13_2 gG13_2, G13_2
Gui, Add, Button, y+4  w50 h30 vG13_1 gG13_1, G13_1


Gui, Add, Button, x+16 y50 w50 h30 vH12_2 gH12_2, H12_2
Gui, Add, Button, y+4  w50 h30 vH12_3 gH12_3, H12_3
Gui, Add, Button, y+4  w50 h30 vH12_1 gH12_1, H12_1
Gui, Add, Button, y+8  w50 h30 vG12_3 gG12_3, G12_3
Gui, Add, Button, y+4  w50 h30 vG12_2 gG12_2, G12_2
Gui, Add, Button, y+4  w50 h30 vG12_1 gG12_1, G12_1

Gui, Add, Button, x+8 y50 w50 h30 vH11_3 gH11_3, H11_3
Gui, Add, Button, y+4  w50 h30 vH11_2 gH11_2, H11_2
Gui, Add, Button, y+4  w50 h30 vH11_1 gH11_1, H11_1
Gui, Add, Button, y+8  w50 h30 vG11_3 gG11_3, G11_3
Gui, Add, Button, y+4  w50 h30 vG11_2 gG11_2, G11_2
Gui, Add, Button, y+4  w50 h30 vG11_1 gG11_1, G11_1

Gui, Add, Button, x+16 y50 w50 h30 vH10_3 gH10_3, H10_3
Gui, Add, Button, y+4  w50 h30 vH10_2 gH10_2, H10_2
Gui, Add, Button, y+4  w50 h30 vH10_1 gH10_1, H10_1
Gui, Add, Button, y+8  w50 h30 vG10_3 gG10_3, G10_3
Gui, Add, Button, y+4  w50 h30 vG10_2 gG10_2, G10_2
Gui, Add, Button, y+4  w50 h30 vG10_1 gG10_1, G10_1

Gui, Add, Button, x+8 y50 w50 h30 vH9_3 gH9_3, H9_3
Gui, Add, Button, y+4  w50 h30 vH9_2 gH9_2, H9_2
Gui, Add, Button, y+4  w50 h30 vH9_1 gH9_1, H9_1
Gui, Add, Button, y+8  w50 h30 vG9_3 gG9_3, G9_3
Gui, Add, Button, y+4  w50 h30 vG9_2 gG9_2, G9_2
Gui, Add, Button, y+4  w50 h30 vG9_1 gG9_1, G9_1

Gui, Add, Button, x+16 y50 w50 h30 vH8_3 gH8_3, H8_3
Gui, Add, Button, y+4  w50 h30 vH8_2 gH8_2, H8_2
Gui, Add, Button, y+4  w50 h30 vH8_1 gH8_1, H8_1
Gui, Add, Button, y+8  w50 h30 vG8_3 gG8_3, G8_3
Gui, Add, Button, y+4  w50 h30 vG8_2 gG8_2, G8_2
Gui, Add, Button, y+4  w50 h30 vG8_1 gG8_1, G8_1

Gui, Add, Button, x+8 y50 w50 h30 vH7_3 gH7_3, H7_3
Gui, Add, Button, y+4  w50 h30 vH7_2 gH7_2, H7_2
Gui, Add, Button, y+4  w50 h30 vH7_1 gH7_1, H7_1
Gui, Add, Button, y+8  w50 h30 vG7_3 gG7_3, G7_3
Gui, Add, Button, y+4  w50 h30 vG7_2 gG7_2, G7_2
Gui, Add, Button, y+4  w50 h30 vG7_1 gG7_1, G7_1

Gui, Add, Button, x+16 y50 w50 h30 vH6_3 gH6_3, H6_3
Gui, Add, Button, y+4  w50 h30 vH6_2 gH6_2, H6_2
Gui, Add, Button, y+4  w50 h30 vH6_1 gH6_1, H6_1
Gui, Add, Button, y+8  w50 h30 vG6_3 gG6_3, G6_3
Gui, Add, Button, y+4  w50 h30 vG6_2 gG6_2, G6_2
Gui, Add, Button, y+4  w50 h30 vG6_1 gG6_1, G6_1

Gui, Add, Button, x+8 y50 w50 h30 vH5_3 gH5_3, H5_3
Gui, Add, Button, y+4  w50 h30 vH5_2 gH5_2, H5_2
Gui, Add, Button, y+4  w50 h30 vH5_1 gH5_1, H5_1
Gui, Add, Button, y+8  w50 h30 vG5_3 gG5_3, G5_3
Gui, Add, Button, y+4  w50 h30 vG5_2 gG5_2, G5_2
Gui, Add, Button, y+4  w50 h30 vG5_1 gG5_1, G5_1

Gui, Add, Button, x+16 y50 w50 h30 vH4_3 gH4_3, H4_3
Gui, Add, Button, y+4  w50 h30 vH4_2 gH4_2, H4_2
Gui, Add, Button, y+4  w50 h30 vH4_1 gH4_1, H4_1
Gui, Add, Button, y+8  w50 h30 vG4_3 gG4_3, G4_3
Gui, Add, Button, y+4  w50 h30 vG4_2 gG4_2, G4_2
Gui, Add, Button, y+4  w50 h30 vG4_1 gG4_1, G4_1

Gui, Add, Button, x+8 y50 w50 h30 vH3_3 gH3_3, H3_3
Gui, Add, Button, y+4  w50 h30 vH3_2 gH3_2, H3_2
Gui, Add, Button, y+4  w50 h30 vH3_1 gH3_1, H3_1
Gui, Add, Button, y+8  w50 h30 vG3_3 gG3_3, G3_3
Gui, Add, Button, y+4  w50 h30 vG3_2 gG3_2, G3_2
Gui, Add, Button, y+4  w50 h30 vG3_1 gG3_1, G3_1

Gui, Add, Button, x+16 y50 w50 h30 vH2_3 gH2_3, H2_3
Gui, Add, Button, y+4  w50 h30 vH2_2 gH2_2, H2_2
Gui, Add, Button, y+4  w50 h30 vH2_1 gH2_1, H2_1
Gui, Add, Button, y+8  w50 h30 vG2_3 gG2_3, G2_3
Gui, Add, Button, y+4  w50 h30 vG2_2 gG2_2, G2_2
Gui, Add, Button, y+4  w50 h30 vG2_1 gG2_1, G2_1

Gui, Add, Button, x+8 y50 w50 h30 vH1_3 gH1_3, H1_3
Gui, Add, Button, y+4 w50 h30 vH1_2 gH1_2, H1_2
Gui, Add, Button, y+4 w50 h30 vH1_1 gH1_1, H1_1
Gui, Add, Button, y+8 w50 h30 vG1_3 gG1_3, G1_3
Gui, Add, Button, y+4 w50 h30 vG1_2 gG1_2, G1_2
Gui, Add, Button, y+4 w50 h30 vG1_1 gG1_1, G1_1




;227, 265

Gui, Add, Button, x200 y340 w60 h40 vA8_3 gA8_3, A8_3
Gui, Add, Button,  y+4 w60 h40 vA8_2 gA8_2, A8_2
Gui, Add, Button,  y+8 w60 h40 vA8_1 gA8_1, A8_1 ; B8_2
;~ Gui, Add, Button,  y+4 w60 h40 vA8_1 gB8_1, B8_1

Gui, Add, Button, x+8 y340 w60 h40 vA7_3 gA7_3, A7_3
Gui, Add, Button, y+4  w60 h40 vA7_2 gA7_2, A7_2
;~ Gui, Add, Button, y+8 w60 h40 vA7_2 gB7_2, B7_2
Gui, Add, Button, y+8 w60 h40 vA7_1 gA7_1, A7_1
Gui, Add, Button, y+4 w60 h40 va7_0 gA7_0, A7_0

Gui, Add, Button, x+16 y340 w60 h40 vA6_3 gA6_3, A6_3
Gui, Add, Button, y+4 w60 h40 vA6_2 gA6_2, A6_2
Gui, Add, Button, y+8 w60 h40 vA6_1 gA6_1, A6_1
Gui, Add, Button,y+4 w60 h40 vA6_0 gA6_0, A6_0

Gui, Add, Button, x+8 y340 w60 h40 vA5_3 gA5_3, A5_3
Gui, Add, Button, y+4 w60 h40 vA5_2 gA5_2, A5_2
;~ Gui, Add, Button, y+8 w60 h40 vA5_2 gB5_2, B5_2
Gui, Add, Button, y+8 w60 h40 vA5_1 gA5_1, A5_1

Gui, Add, Button, x+16 y340 w60 h40 vA4_3 gA4_3, A4_3
Gui, Add, Button, y+4 w60 h40 vA4_2 gA4_2, A4_2
;~ Gui, Add, Button, y+8 w60 h40 vA4_2 gB4_2, B4_2
Gui, Add, Button, y+8 w60 h40 vA4_1 gA4_1, A4_1

Gui, Add, Button, x+8 y340 w60 h40 vA3_3 gA3_3, A3_3
Gui, Add, Button, y+4 w60 h40 vA3_2 gA3_2, A3_2
Gui, Add, Button,y+8 w60 h40 vA3_1 gA3_1, A3_1

Gui, Add, Button, x+16 y340 w60 h40 vA2_3 gA2_3, A2_3
Gui, Add, Button, y+4 w60 h40 vA2_2 gA2_2, A2_2
Gui, Add, Button, y+8 w60 h40 vA2_1 gA2_1, A2_1

Gui, Add, Button, x+8 y340 w60 h40 vA1_3 gA1_3, A1_3
Gui, Add, Button, y+4 w60 h40 vA1_2 gA1_2, A1_2
Gui, Add, Button, y+8 w60 h40 vA1_1 gA1_1, A1_1


Gui, Add, Button, x22 y300 w40 h90 vE2_3 gE2_3, E2_3
Gui, Add, Button, x+4  w40 h90 vE2_2 gE2_2, E2_2
Gui, Add, Button, x+4  w40 h90 vE2_1 gE2_1, E2_1
Gui, Add, Button, x22 y+8 w40 h90 vE1_3 gE1_3, E1_3
Gui, Add, Button, x+4 w40 h90 vE1_2 gE1_2, E1_2
Gui, Add, Button, x+4 w40 h90 vE1_1 gE1_1, E1_1

Gui, Add, Button, x22 y566 w60 h40 vD1_1 gD1_1, D1_1
Gui, Add, Button,  y+4 w60 h40 vD2_1 gD2_1, D2_1
Gui, Add, Button,  y+4 w60 h40 vD3_1 gD3_1, D3_1





Gui, Add, Button, x150 y610 w60 h40 vC9_1 gC9_1, C9_1
Gui, Add, Button, y+4 w60 h40 vC9_2 gC9_2, C9_2
Gui, Add, Button, x+4 y610 w60 h40 vC8_1 gC8_1, C8_1
Gui, Add, Button, y+4 w60 h40 vC8_2 gC8_2, C8_2
Gui, Add, Button, x+4 y610 w60 h40 vC7_1 gC7_1, C7_1
Gui, Add, Button, y+4 w60 h40 vC7_2 gC7_2, C7_2

Gui, Add, Button, x+16 y610 w60 h40 vC6_1 gC6_1, C6_1
Gui, Add, Button, y+4 w60 h40 vC6_2 gC6_2, C6_2
Gui, Add, Button, x+4 y610 w60 h40 vC5_1 gC5_1, C5_1
Gui, Add, Button, y+4 w60 h40 vC5_2 gC5_2, C5_2
Gui, Add, Button, x+16 y610 w60 h40 vC4_1 gC4_1, C4_1
Gui, Add, Button, y+4 w60 h40 vC4_2 gC4_2, C4_2
Gui, Add, Button, x+4 y610 w60 h40 vC3_1 gC3_1, C3_1
Gui, Add, Button, y+4 w60 h40 vC3_2 gC3_2, C3_2
Gui, Add, Button, x+16 y610 w60 h40 vC2_1 gC2_1, C2_1
Gui, Add, Button, y+4 w60 h40 vC2_2 gC2_2, C2_2
Gui, Add, Button, x+4 y610 w60 h40 vC1_1 gC1_1, C1_1
Gui, Add, Button, y+4 w60 h40 vC1_2 gC1_2, C1_2


Gui, Font, S28 CDefault W400 cred, Malgun Gothic
Gui, Add, text, x872 y465 W400 h55 vload1 backgroundtrans, Reading DataBase


;~ Gui, Tab, ▼평면[철물]`  ,,Exact
Gui, Tab, ▼평면[철물]`  ,,
Gui, Add, Picture, x610 y435 w0 h0 v2color1, %A_ScriptDir%\images\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x610 y435 w0 h0 v2color2, %A_ScriptDir%\images\blue.png
Gui, Add, Picture, x610 y435 w0 h0 v2color3, %A_ScriptDir%\images\colour1.png
Gui, Add, Picture, x610 y435 w0 h0 v2color4, %A_ScriptDir%\images\colour2.png
Gui, Add, Picture, x610 y435 w0 h0 v2color5, %A_ScriptDir%\images\colour3.png
Gui, Add, Picture, x610 y435 w0 h0 v2color6, %A_ScriptDir%\images\colour4.png
Gui, Add, Picture, x610 y435 w0 h0 v2color7, %A_ScriptDir%\images\colour5.png
Gui, Add, Picture, x610 y435 w0 h0 v2color8, %A_ScriptDir%\images\colour6.png
Gui, Add, Picture, x610 y435 w0 h0 v2color9, %A_ScriptDir%\images\colour7.png

Gui, Font, S11 CDefault W700 c0xFF2211, Malgun Gothic
Gui, Add, Listview, x40 y60 w800 h240 vLV2 gLV2 hwndHLV2  SortDesc,  로케이션|RFID CODE|상품명|규격|수량|PRODUCT CODE


Gui, ListView, lv2
LV_ModifyCol(1, 80)  ;
LV_ModifyCol(2, 0) ;
LV_ModifyCol(3, 170)  ;
LV_ModifyCol(4, 140)  ;
LV_ModifyCol(5, "50 Integer" "Integer Right")  ;
LV_ModifyCol(6, 0)  ;

Gui, Font, S12 CDefault W400, Malgun Gothic



Gui, Add, Button, x40 y+10 w80 h110  vL3_3 gL3_3, L3_3
Gui, Add, Button, x+4 w80 h110  vL3_2  gL3_2, L3_2
Gui, Add, Button, x+4 w80 h110  vL3_1 gL3_1, L3_1


Gui, Add, Button, x40 y+4 w80 h110  vL2_3 gL2_3, L2_3
Gui, Add, Button, x+4 w80 h110  vL2_2 gL2_2, L2_2
Gui, Add, Button, x+4 w80 h110  vL2_1 gL2_1, L2_1

Gui, Add, Button, x40 y+18 w80 h110  vL1_3 gL1_3, L1_3
Gui, Add, Button, x+4 w80 h110  vL1_2 gL1_2, L1_2
Gui, Add, Button, x+4 w80 h110  vL1_1 gL1_1, L1_1


Gui, Add, Button, x+8 y310 w150 h353 vM1_1 gM1_1, M1_1






k0열=520

Gui, Add, Button, x%k0열% y314 w103 h41 vJ2_3 gJ2_3, J2_3
Gui, Add, Button, x+8  w103 h41 vJ2_2 gJ2_2, J2_2
Gui, Add, Button, x+4  w103 h41 vJ2_1 gJ2_1, J2_1

Gui, Add, Button, x%k0열%  y+4 w103 h41 vJ1_3 gJ1_3, J1_3
Gui, Add, Button, x+8  w103 h41 vJ1_2 gJ1_2, J1_2
Gui, Add, Button, x+4  w103 h41 vJ1_1 gJ1_1, J1_1

k1열=520

Gui, Add, Button, x%k1열% y441 w60 h41 vK14_5 gK14_5, K14_5
Gui, Add, Button, x+8  w60 h41 vK14_4 gK14_4, K14_4
Gui, Add, Button, x+4  w60 h41 vK14_3 gK14_3, K14_3
Gui, Add, Button, x+4  w60 h41 vK14_2 gK14_2, K14_2
Gui, Add, Button, x+4  w60 h41 vK14_1 gK14_1, K14_1

Gui, Add, Button, x%k1열% y+4 w60 h41 vK13_5 gK13_5, K13_5
Gui, Add, Button, x+8  w60 h41 vK13_4 gK13_4, K13_4
Gui, Add, Button, x+4  w60 h41 vK13_3 gK13_3, K13_3
Gui, Add, Button, x+4  w60 h41 vK13_2 gK13_2, K13_2
Gui, Add, Button, x+4  w60 h41 vK13_1 gK13_1, K13_1

Gui, Add, Button, x%k1열% y+41 w60 h41 vK12_5 gK12_5, K12_5
Gui, Add, Button, x+8  w60 h41 vK12_4 gK12_4, K12_4
Gui, Add, Button, x+4  w60 h41 vK12_3 gK12_3, K12_3
Gui, Add, Button, x+4  w60 h41 vK12_2 gK12_2, K12_2
Gui, Add, Button, x+4  w60 h41 vK12_1 gK12_1, K12_1

Gui, Add, Button, x%k1열% y+4 w60 h41 vK11_5 gK11_5, K11_5
Gui, Add, Button, x+8  w60 h41 vK11_4 gK11_4, K11_4
Gui, Add, Button, x+4  w60 h41 vK11_3 gK11_3, K11_3
Gui, Add, Button, x+4  w60 h41 vK11_2 gK11_2, K11_2
Gui, Add, Button, x+4  w60 h41 vK11_1 gK11_1, K11_1


k2열=880
Gui, Add, Button, x%k2열% y60 w60 h41 vK10_5 gK10_5, K10_5
Gui, Add, Button, x+8  w60 h41 vK10_4 gK10_4, K10_4
Gui, Add, Button, x+4  w60 h41 vK10_3 gK10_3, K10_3
Gui, Add, Button, x+4  w60 h41 vK10_2 gK10_2, K10_2
Gui, Add, Button, x+4  w60 h41 vK10_1 gK10_1, K10_1

Gui, Add, Button, x%k2열% y+4 w60 h41 , K9_5
Gui, Add, Button, x+8  w60 h41 vK9_4 gK9_4, K9_4
Gui, Add, Button, x+4  w60 h41 vK9_3 gK9_3, K9_3
Gui, Add, Button, x+4  w60 h41 vK9_2 gK9_2, K9_2
Gui, Add, Button, x+4  w60 h41 vK9_1 gK9_1, K9_1

Gui, Add, Button, x+4 y+0 w60 h41 vI5_1 gI5_1, I5_1 ;;◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ 창문 쪽


Gui, Add, Button, x%k2열% y+0 w60 h41 vK8_5 gK8_5, K8_5
Gui, Add, Button, x+8  w60 h41 vK8_4 gK8_4, K8_4
Gui, Add, Button, x+4  w60 h41 vK8_3 gK8_3, K8_3
Gui, Add, Button, x+4  w60 h41 vK8_2 gK8_2, K8_2
Gui, Add, Button, x+4  w60 h41 vK8_1 gK8_1, K8_1

Gui, Add, Button, x%k2열% y+4 w60 h41 vK7_5 gK7_5, K7_5
Gui, Add, Button, x+8  w60 h41 vK7_4 gK7_4, K7_4
Gui, Add, Button, x+4  w60 h41 vK7_3 gK7_3, K7_3
Gui, Add, Button, x+4  w60 h41 vK7_2 gK7_2, K7_2
Gui, Add, Button, x+4  w60 h41 vK7_1 gK7_1, K7_1

Gui, Add, Button, x+4 y+0 w60 h41 vI4_1 gI4_1, I4_1 ;;◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ 창문 쪽

Gui, Add, Button, x%k2열% y+0 w60 h41 vK6_5 gK6_5, K6_5
Gui, Add, Button, x+8  w60 h41 vK6_4 gK6_4, K6_4
Gui, Add, Button, x+4  w60 h41 vK6_3 gK6_3, K6_3
Gui, Add, Button, x+4  w60 h41 vK6_2 gK6_2, K6_2
Gui, Add, Button, x+4  w60 h41 vK6_1 gK6_1, K6_1

Gui, Add, Button, x%k2열% y+4 w60 h41 vK5_5 gK5_5, K5_5
Gui, Add, Button, x+8  w60 h41 vK5_4 gK5_4, K5_4
Gui, Add, Button, x+4  w60 h41 vK5_3 gK5_3, K5_3
Gui, Add, Button, x+4  w60 h41 vK5_2 gK5_2, K5_2
Gui, Add, Button, x+4  w60 h41 vK5_1 gK5_1, K5_1

Gui, Add, Button, x+4 y+0 w60 h41 vI3_1 gI3_1, I3_1 ;;◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ 창문 쪽

Gui, Add, Button, x%k2열% y+0 w60 h41 vK4_5 gK4_5, K4_5
Gui, Add, Button, x+8  w60 h41 vK4_4 gK4_4, K4_4
Gui, Add, Button, x+4  w60 h41 vK4_3 gK4_3, K4_3
Gui, Add, Button, x+4  w60 h41 vK4_2 gK4_2 , K4_2
Gui, Add, Button, x+4  w60 h41 vK4_1 gK4_1 , K4_1

Gui, Add, Button, x%k2열% y+4 w60 h41 vK3_5 gK3_5, K3_5
Gui, Add, Button, x+8  w60 h41 vK3_4 gK3_4, K3_4
Gui, Add, Button, x+4  w60 h41 vK3_3 gK3_3, K3_3
Gui, Add, Button, x+4  w60 h41 vK3_2 gK3_2, K3_2
Gui, Add, Button, x+4  w60 h41 vK3_1 gK3_1, K3_1

Gui, Add, Button, x+4 y+0 w60 h41 vI2_1 gI2_1, I2_1 ;;◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ 창문 쪽

Gui, Add, Button, x%k2열% y+0 w60 h41 vK2_5 gK2_5, K2_5
Gui, Add, Button, x+8  w60 h41 vK2_4 gK2_4, K2_4
Gui, Add, Button, x+4  w60 h41 vK2_3 gK2_3, K2_3
Gui, Add, Button, x+4  w60 h41 vK2_2 gK2_2, K2_2
Gui, Add, Button, x+4  w60 h41 vK2_1 gK2_1, K2_1

Gui, Add, Button, x%k2열% y+4 w60 h41 vK1_5 gK1_5, K1_5
Gui, Add, Button, x+8  w60 h41 vK1_4 gK1_4, K1_4
Gui, Add, Button, x+4  w60 h41 vK1_3 gK1_3, K1_3
Gui, Add, Button, x+4  w60 h41 vK1_2 gK1_2, K1_2
Gui, Add, Button, x+4  w60 h41 vK1_1 gK1_1, K1_1

Gui, Add, Button, x+4 y+0 w60 h41 vI1_1 gI1_1, I1_1 ;;◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ 창문 쪽




Gui, Font, S28 CDefault W400 cred, Malgun Gothic
Gui, Add, text, x340 y100 W400 h55 vload2 backgroundtrans, Reading DataBase




;~ Gui, Tab, ▽[K1~K6]`  ,,Exact
Gui, Tab, ▽[K1~K6]`  ,,

Gui, Font, S12 CDefault W500, Malgun Gothic
Gui, Add, Listview, x635 y390 w605 h315 vLV4 gLV4 hwndHLV4 Sort,  로케이션|RFID CODE|상품명|규격|수량|PRODUCT CODE
Gui, ListView, lv4
LV_ModifyCol(1, 90)  ;
LV_ModifyCol(2, 0) ;
LV_ModifyCol(3, 230)  ;
LV_ModifyCol(4, 150)  ;
LV_ModifyCol(5, "60 Integer" "Integer Right")  ;
LV_ModifyCol(6, 0)  ;


Gui, Add, Picture, x18 y63 w296 h302  , %A_ScriptDir%\images\k1.png
Gui, Add, Picture, x326 y63 w296 h302  , %A_ScriptDir%\images\k2.png
Gui, Add, Picture, x634 y63 w296 h302 , %A_ScriptDir%\images\k3.png
Gui, Add, Picture, x943 y63 w296 h302 , %A_ScriptDir%\images\k4.png
Gui, Add, Picture, x18 y403 w296 h302 , %A_ScriptDir%\images\k5.png
Gui, Add, Picture, x326 y403 w296 h302 , %A_ScriptDir%\images\k6.png



Gui, Add, Picture, x0 y0 w0 h0 v4color1, %A_ScriptDir%\images\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x0 y0 w0 h0 v4color2, %A_ScriptDir%\images\blue.png
Gui, Add, Picture, x0 y0 w0 h0 v4color3, %A_ScriptDir%\images\colour1.png
Gui, Add, Picture, x0 y0 w0 h0 v4color4, %A_ScriptDir%\images\colour2.png
Gui, Add, Picture, x0 y0 w0 h0 v4color5, %A_ScriptDir%\images\colour3.png
Gui, Add, Picture, x0 y0 w0 h0 v4color6, %A_ScriptDir%\images\colour4.png
Gui, Add, Picture, x0 y0 w0 h0 v4color7, %A_ScriptDir%\images\colour5.png
Gui, Add, Picture, x0 y0 w0 h0 v4color8, %A_ScriptDir%\images\colour6.png
Gui, Add, Picture, x0 y0 w0 h0 v4color9, %A_ScriptDir%\images\colour7.png

;~ Gui, Add, Button, x+4 W60 h267 vK1_4_1 gK1_4_1, K1_4_1 ;/\\\\\\\\\\\\\ 0번쨰

Gui, Font, S15 CDefault W700 , Malgun Gothic
Gui, Add, GroupBox, x18 y50 w296 h315  , [K1] : 타카핀 ▶
Gui, Font, S12 CDefault W400, Malgun Gothic
Gui, Add, Button, x40 y80 W252 h50 vK1_1_5 gK1_1_5, K1_1_5

Gui, Add, Button, x40 y+4 W60 h50 vK1_4_4 gK1_4_4, K1_4_4
Gui, Add, Button, x+4 W60 h50 vK1_3_4 gK1_3_4, K1_3_4
Gui, Add, Button, x+4 W60 h50 vK1_2_4 gK1_2_4, K1_2_4
Gui, Add, Button, x+4 W60 h50 vK1_1_4 gK1_1_4, K1_1_4
Gui, Add, Button, x40 y+4 W60 h50 vK1_4_3 gK1_4_3, K1_4_3
Gui, Add, Button, x+4 W60 h50 vK1_3_3 gK1_3_3, K1_3_3
Gui, Add, Button, x+4 W60 h50 vK1_2_3 gK1_2_3, K1_2_3
Gui, Add, Button, x+4 W60 h50 vK1_1_3 gK1_1_3, K1_1_3
Gui, Add, Button, x40 y+4 W60 h50 vK1_4_2 gK1_4_2, K1_4_2
Gui, Add, Button, x+4 W60 h50 vK1_3_2 gK1_3_2, K1_3_2
Gui, Add, Button, x+4 W60 h50 vK1_2_2 gK1_2_2, K1_2_2
Gui, Add, Button, x+4 W60 h50 vK1_1_2 gK1_1_2, K1_1_2
Gui, Add, Button, x40 y+4 W60 h50 vK1_4_1 gK1_4_1, K1_4_1
Gui, Add, Button, x+4 W60 h50 vK1_3_1 gK1_3_1, K1_3_1
Gui, Add, Button, x+4 W60 h50 vK1_2_1 gK1_2_1, K1_2_1
Gui, Add, Button, x+4 W60 h50 vK1_1_1 gK1_1_1, K1_1_1




Gui, Font, S15 CDefault W700, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP
Gui, Add, GroupBox, x326 y50 w296 h315  , [K2] : 실리콘 ◁
Gui, Font, S12 CDefault W400, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP



Gui, Add, Button, x348 y80 W252 h50 vK2_1_5 gK2_1_5, K2_1_5

Gui, Add, Button, x348 y+4 W60 h50 vK2_1_4 gK2_1_4, K2_1_4
Gui, Add, Button, x+4 W60 h50 vK2_2_4 gK2_2_4, K2_2_4
Gui, Add, Button, x+4 W60 h50 vK2_3_4 gK2_3_4, K2_3_4
Gui, Add, Button, x+4 W60 h50 vK2_4_4 gK2_4_4, K2_4_4
Gui, Add, Button, x348 y+4 W60 h50 vK2_1_3 gK2_1_3, K2_1_3
Gui, Add, Button, x+4 W60 h50 vK2_2_3 gK2_2_3, K2_2_3
Gui, Add, Button, x+4 W60 h50 vK2_3_3 gK2_3_3, K2_3_3
Gui, Add, Button, x+4 W60 h50 vK2_4_3 gK2_4_3, K2_4_3
Gui, Add, Button, x348 y+4 W60 h50 vK2_1_2 gK2_1_2, K2_1_2
Gui, Add, Button, x+4 W60 h50 vK2_2_2 gK2_2_2, K2_2_2
Gui, Add, Button, x+4 W60 h50 vK2_3_2 gK2_3_2, K2_3_2
Gui, Add, Button, x+4 W60 h50 vK2_4_2 gK2_4_2, K2_4_2
Gui, Add, Button, x348 y+4 W60 h50 vK2_1_1 gK2_1_1, K2_1_1
Gui, Add, Button, x+4 W60 h50 vK2_2_1 gK2_2_1, K2_2_1
Gui, Add, Button, x+4 W60 h50 vK2_3_1 gK2_3_1, K2_3_1
Gui, Add, Button, x+4 W60 h50 vK2_4_1 gK2_4_1, K2_4_1




Gui, Font, S15 CDefault W700 , Malgun Gothic
Gui, Add, GroupBox, x634 y50 w296 h315  , [K3] : 폼 / 스프레이 ▶
Gui, Font, S12 CDefault W400, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP

Gui, Add, Button, x656 y80 W252 h50 vK3_1_5 gK3_1_5, K3_1_5

Gui, Add, Button, x656 y+4 W60 h50 vK3_4_4 gK3_4_4, K3_4_4
Gui, Add, Button, x+4 W60 h50 vK3_3_4 gK3_3_4, K3_3_4
Gui, Add, Button, x+4 W60 h50 vK3_2_4 gK3_2_4, K3_2_4
Gui, Add, Button, x+4 W60 h50 vK3_1_4 gK3_1_4, K3_1_4
Gui, Add, Button, x656 y+4 W60 h50 vK3_4_3 gK3_4_3, K3_4_3
Gui, Add, Button, x+4 W60 h50 vK3_3_3 gK3_3_3, K3_3_3
Gui, Add, Button, x+4 W60 h50 vK3_2_3 gK3_2_3, K3_2_3
Gui, Add, Button, x+4 W60 h50 vK3_1_3 gK3_1_3, K3_1_3
Gui, Add, Button, x656 y+4 W60 h50 vK3_4_2 gK3_4_2, K3_4_2
Gui, Add, Button, x+4 W60 h50 vK3_3_2 gK3_3_2, K3_3_2
Gui, Add, Button, x+4 W60 h50 vK3_2_2 gK3_2_2, K3_2_2
Gui, Add, Button, x+4 W60 h50 vK3_1_2 gK3_1_2, K3_1_2
Gui, Add, Button, x656 y+4 W60 h50 vK3_4_1 gK3_4_1, K3_4_1
Gui, Add, Button, x+4 W60 h50 vK3_3_1 gK3_3_1, K3_3_1
Gui, Add, Button, x+4 W60 h50 vK3_2_1 gK3_2_1, K3_2_1
Gui, Add, Button, x+4 W60 h50 vK3_1_1 gK3_1_1, K3_1_1





Gui, Font, S15 CDefault W700 , Malgun Gothic
Gui, Add, GroupBox, x943 y50 w296 h315  , [K4] : 피스 1 ◁
Gui, Font, S12 CDefault W400, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP



Gui, Add, Button, x965 y80 W252 h50 vK4_1_5 gK4_1_5, K4_1_5

Gui, Add, Button, x965 y+4 W60 h50 vK4_1_4 gK4_1_4, K4_1_4
Gui, Add, Button, x+4 W60 h50 vK4_2_4 gK4_2_4, K4_2_4
Gui, Add, Button, x+4 W60 h50 vK4_3_4 gK4_3_4, K4_3_4
Gui, Add, Button, x+4 W60 h50 vK4_4_4 gK4_4_4, K4_4_4
Gui, Add, Button, x965 y+4 W60 h50 vK4_1_3 gK4_1_3, K4_1_3
Gui, Add, Button, x+4 W60 h50 vK4_2_3 gK4_2_3, K4_2_3
Gui, Add, Button, x+4 W60 h50 vK4_3_3 gK4_3_3, K4_3_3
Gui, Add, Button, x+4 W60 h50 vK4_4_3 gK4_4_3, K4_4_3
Gui, Add, Button, x965 y+4 W60 h50 vK4_1_2 gK4_1_2, K4_1_2
Gui, Add, Button, x+4 W60 h50 vK4_2_2 gK4_2_2, K4_2_2
Gui, Add, Button, x+4 W60 h50 vK4_3_2 gK4_3_2, K4_3_2
Gui, Add, Button, x+4 W60 h50 vK4_4_2 gK4_4_2, K4_4_2
Gui, Add, Button, x965 y+4 W60 h50 vK4_1_1 gK4_1_1, K4_1_1
Gui, Add, Button, x+4 W60 h50 vK4_2_1 gK4_2_1, K4_2_1
Gui, Add, Button, x+4 W60 h50 vK4_3_1 gK4_3_1, K4_3_1
Gui, Add, Button, x+4 W60 h50 vK4_4_1 gK4_4_1, K4_4_1


Gui, Font, S15 CDefault W700, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP
Gui, Add, GroupBox, x18 y390 w296 h315  , [K5] : 피스 2 ▶
Gui, Font, S12 CDefault W400, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP


Gui, Add, Button, x40 y420 W252 h50 vK5_1_5 gK5_1_5, K5_1_5

Gui, Add, Button, x40 y+4 W60 h50 vK5_4_4 gK5_4_4, K5_4_4
Gui, Add, Button, x+4 W60 h50 vK5_3_4 gK5_3_4, K5_3_4
Gui, Add, Button, x+4 W60 h50 vK5_2_4 gK5_2_4, K5_2_4
Gui, Add, Button, x+4 W60 h50 vK5_1_4 gK5_1_4, K5_1_4
Gui, Add, Button, x40 y+4 W60 h50 vK5_4_3 gK5_4_3, K5_4_3
Gui, Add, Button, x+4 W60 h50 vK5_3_3 gK5_3_3, K5_3_3
Gui, Add, Button, x+4 W60 h50 vK5_2_3 gK5_2_3, K5_2_3
Gui, Add, Button, x+4 W60 h50 vK5_1_3 gK5_1_3, K5_1_3
Gui, Add, Button, x40 y+4 W60 h50 vK5_4_2 gK5_4_2, K5_4_2
Gui, Add, Button, x+4 W60 h50 vK5_3_2 gK5_3_2, K5_3_2
Gui, Add, Button, x+4 W60 h50 vK5_2_2 gK5_2_2, K5_2_2
Gui, Add, Button, x+4 W60 h50 vK5_1_2 gK5_1_2, K5_1_2
Gui, Add, Button, x40 y+4 W60 h50 vK5_4_1 gK5_4_1, K5_4_1
Gui, Add, Button, x+4 W60 h50 vK5_3_1 gK5_3_1, K5_3_1
Gui, Add, Button, x+4 W60 h50 vK5_2_1 gK5_2_1, K5_2_1
Gui, Add, Button, x+4 W60 h50 vK5_1_1 gK5_1_1, K5_1_1








Gui, Font, S15 CDefault W700, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP
Gui, Add, GroupBox, x326 y390 w296 h315  , [K6] : 이음쇠(메가타이) 1 ◁
Gui, Font, S12 CDefault W400, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP



Gui, Add, Button, x345 y420 W252 h50 vK6_1_5 gK6_1_5, K6_1_5

Gui, Add, Button, x345 y+4 W60 h50 vK6_1_4 gK6_1_4, K6_1_4
Gui, Add, Button, x+4 W60 h50 vK6_2_4 gK6_2_4, K6_2_4
Gui, Add, Button, x+4 W60 h50 vK6_3_4 gK6_3_4, K6_3_4
Gui, Add, Button, x+4 W60 h50 vK6_4_4 gK6_4_4, K6_4_4
Gui, Add, Button, x345 y+4 W60 h50 vK6_1_3 gK6_1_3, K6_1_3
Gui, Add, Button, x+4 W60 h50 vK6_2_3 gK6_2_3, K6_2_3
Gui, Add, Button, x+4 W60 h50 vK6_3_3 gK6_3_3, K6_3_3
Gui, Add, Button, x+4 W60 h50 vK6_4_3 gK6_4_3, K6_4_3
Gui, Add, Button, x345 y+4 W60 h50 vK6_1_2 gK6_1_2, K6_1_2
Gui, Add, Button, x+4 W60 h50 vK6_2_2 gK6_2_2, K6_2_2
Gui, Add, Button, x+4 W60 h50 vK6_3_2 gK6_3_2, K6_3_2
Gui, Add, Button, x+4 W60 h50 vK6_4_2 gK6_4_2, K6_4_2
Gui, Add, Button, x345 y+4 W60 h50 vK6_1_1 gK6_1_1, K6_1_1
Gui, Add, Button, x+4 W60 h50 vK6_2_1 gK6_2_1, K6_2_1
Gui, Add, Button, x+4 W60 h50 vK6_3_1 gK6_3_1, K6_3_1
Gui, Add, Button, x+4 W60 h50 vK6_4_1 gK6_4_1, K6_4_1




Gui, Font, S28 CDefault W400 cred, Malgun Gothic
Gui, Add, text, x797 y509 W400 h55 vload4 backgroundtrans, Reading DataBase



;~ Gui, Tab, ▽[K7~K12]`  ,,Exact
Gui, Tab, ▽[K7~K12]`  ,,

Gui, Font, S12 CDefault W500, Malgun Gothic
Gui, Add, Listview, x635 y390 w605 h315 vLV5 gLV5 hwndHLV5 Sort,  로케이션|RFID CODE|상품명|규격|수량|PRODUCT CODE
Gui, ListView, lv5
LV_ModifyCol(1, 90)  ;
LV_ModifyCol(2, 0) ;
LV_ModifyCol(3, 230)  ;
LV_ModifyCol(4, 150)  ;
LV_ModifyCol(5, "60 Integer" "Integer Right")  ;
LV_ModifyCol(6, 0)  ;


Gui, Add, Picture, x18 y63 w296 h302  , %A_ScriptDir%\images\k7.png
Gui, Add, Picture, x326 y63 w296 h302  , %A_ScriptDir%\images\k8.png
Gui, Add, Picture, x634 y63 w296 h302 , %A_ScriptDir%\images\k9.png
Gui, Add, Picture, x943 y63 w296 h302 , %A_ScriptDir%\images\k10.png
Gui, Add, Picture, x18 y403 w296 h302 , %A_ScriptDir%\images\white.png
Gui, Add, Picture, x326 y403 w296 h302 , %A_ScriptDir%\images\K12.png




Gui, Add, Picture, x0 y0 w0 h0 v5color1, %A_ScriptDir%\images\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x0 y0 w0 h0 v5color2, %A_ScriptDir%\images\blue.png
Gui, Add, Picture, x0 y0 w0 h0 v5color3, %A_ScriptDir%\images\colour1.png
Gui, Add, Picture, x0 y0 w0 h0 v5color4, %A_ScriptDir%\images\colour2.png
Gui, Add, Picture, x0 y0 w0 h0 v5color5, %A_ScriptDir%\images\colour3.png
Gui, Add, Picture, x0 y0 w0 h0 v5color6, %A_ScriptDir%\images\colour4.png
Gui, Add, Picture, x0 y0 w0 h0 v5color7, %A_ScriptDir%\images\colour5.png
Gui, Add, Picture, x0 y0 w0 h0 v5color8, %A_ScriptDir%\images\colour6.png
Gui, Add, Picture, x0 y0 w0 h0 v5color9, %A_ScriptDir%\images\colour7.png

Gui, Font, S15 CDefault W700 , Malgun Gothic
Gui, Add, GroupBox, x18 y50 w296 h315  , [K7] : 이음쇠(메가타이) 1 ▶
Gui, Font, S12 CDefault W400, Malgun Gothic



Gui, Add, Button, x40 y80 W252 h50 vK7_1_5 gK7_1_5, K7_1_5

Gui, Add, Button, x40 y+4 W60 h50 vK7_4_4 gK7_4_4, K7_4_4
Gui, Add, Button, x+4 W60 h50 vK7_3_4 gK7_3_4, K7_3_4
Gui, Add, Button, x+4 W60 h50 vK7_2_4 gK7_2_4, K7_2_4
Gui, Add, Button, x+4 W60 h50 vK7_1_4 gK7_1_4, K7_1_4
Gui, Add, Button, x40 y+4 W60 h50 vK7_4_3 gK7_4_3, K7_4_3
Gui, Add, Button, x+4 W60 h50 vK7_3_3 gK7_3_3, K7_3_3
Gui, Add, Button, x+4 W60 h50 vK7_2_3 gK7_2_3, K7_2_3
Gui, Add, Button, x+4 W60 h50 vK7_1_3 gK7_1_3, K7_1_3
Gui, Add, Button, x40 y+4 W60 h50 vK7_4_2 gK7_4_2, K7_4_2
Gui, Add, Button, x+4 W60 h50 vK7_3_2 gK7_3_2, K7_3_2
Gui, Add, Button, x+4 W60 h50 vK7_2_2 gK7_2_2, K7_2_2
Gui, Add, Button, x+4 W60 h50 vK7_1_2 gK7_1_2, K7_1_2
Gui, Add, Button, x40 y+4 W60 h50 vK7_4_1 gK7_4_1, K7_4_1
Gui, Add, Button, x+4 W60 h50 vK7_3_1 gK7_3_1, K7_3_1
Gui, Add, Button, x+4 W60 h50 vK7_2_1 gK7_2_1, K7_2_1
Gui, Add, Button, x+4 W60 h50 vK7_1_1 gK7_1_1, K7_1_1





Gui, Font, S15 CDefault W700, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP
Gui, Add, GroupBox, x326 y50 w296 h315  , [K8] : 락카 ◁
Gui, Font, S12 CDefault W400, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP



Gui, Add, Button, x348 y80 W252 h50 vK8_1_5 gK8_1_5, K8_1_5

Gui, Add, Button, x348 y+4 W60 h50 vK8_1_4 gK8_1_4, K8_1_4
Gui, Add, Button, x+4 W60 h50 vK8_2_4 gK8_2_4, K8_2_4
Gui, Add, Button, x+4 W60 h50 vK8_3_4 gK8_3_4, K8_3_4
Gui, Add, Button, x+4 W60 h50 vK8_4_4 gK8_4_4, K8_4_4
Gui, Add, Button, x348 y+4 W60 h50 vK8_1_3 gK8_1_3, K8_1_3
Gui, Add, Button, x+4 W60 h50 vK8_2_3 gK8_2_3, K8_2_3
Gui, Add, Button, x+4 W60 h50 vK8_3_3 gK8_3_3, K8_3_3
Gui, Add, Button, x+4 W60 h50 vK8_4_3 gK8_4_3, K8_4_3
Gui, Add, Button, x348 y+4 W60 h50 vK8_1_2 gK8_1_2, K8_1_2
Gui, Add, Button, x+4 W60 h50 vK8_2_2 gK8_2_2, K8_2_2
Gui, Add, Button, x+4 W60 h50 vK8_3_2 gK8_3_2, K8_3_2
Gui, Add, Button, x+4 W60 h50 vK8_4_2 gK8_4_2, K8_4_2
Gui, Add, Button, x348 y+4 W60 h50 vK8_1_1 gK8_1_1, K8_1_1
Gui, Add, Button, x+4 W60 h50 vK8_2_1 gK8_2_1, K8_2_1
Gui, Add, Button, x+4 W60 h50 vK8_3_1 gK8_3_1, K8_3_1
Gui, Add, Button, x+4 W60 h50 vK8_4_1 gK8_4_1, K8_4_1





Gui, Font, S15 CDefault W700 , Malgun Gothic
Gui, Add, GroupBox, x634 y50 w296 h315  , [K9] : 기타 1 ▶
Gui, Font, S12 CDefault W400, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP


Gui, Add, Button, x656 y80 W252 h50 vK9_1_5 gK9_1_5, K9_1_5

Gui, Add, Button, x656 y+4 W60 h50 vK9_4_4 gK9_4_4, K9_4_4
Gui, Add, Button, x+4 W60 h50 vK9_3_4 gK9_3_4, K9_3_4
Gui, Add, Button, x+4 W60 h50 vK9_2_4 gK9_2_4, K9_2_4
Gui, Add, Button, x+4 W60 h50 vK9_1_4 gK9_1_4, K9_1_4
Gui, Add, Button, x656 y+4 W60 h50 vK9_4_3 gK9_4_3, K9_4_3
Gui, Add, Button, x+4 W60 h50 vK9_3_3 gK9_3_3, K9_3_3
Gui, Add, Button, x+4 W60 h50 vK9_2_3 gK9_2_3, K9_2_3
Gui, Add, Button, x+4 W60 h50 vK9_1_3 gK9_1_3, K9_1_3
Gui, Add, Button, x656 y+4 W60 h50 vK9_4_2 gK9_4_2, K9_4_2
Gui, Add, Button, x+4 W60 h50 vK9_3_2 gK9_3_2, K9_3_2
Gui, Add, Button, x+4 W60 h50 vK9_2_2 gK9_2_2, K9_2_2
Gui, Add, Button, x+4 W60 h50 vK9_1_2 gK9_1_2, K9_1_2
Gui, Add, Button, x656 y+4 W60 h50 vK9_4_1 gK9_4_1, K9_4_1
Gui, Add, Button, x+4 W60 h50 vK9_3_1 gK9_3_1, K9_3_1
Gui, Add, Button, x+4 W60 h50 vK9_2_1 gK9_2_1, K9_2_1
Gui, Add, Button, x+4 W60 h50 vK9_1_1 gK9_1_1, K9_1_1





Gui, Font, S15 CDefault W700 , Malgun Gothic
Gui, Add, GroupBox, x943 y50 w296 h315  , [K10] : 기타 2 ◁
Gui, Font, S12 CDefault W400, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP


Gui, Add, Button, x965 y80 W252 h50 vK10_1_5 gK10_1_5, K10_1_5

Gui, Add, Button, x965 y+4 W60 h50 vK10_1_4 gK10_1_4, K10_1_4
Gui, Add, Button, x+4 W60 h50 vK10_2_4 gK10_2_4, K10_2_4
Gui, Add, Button, x+4 W60 h50 vK10_3_4 gK10_3_4, K10_3_4
Gui, Add, Button, x+4 W60 h50 vK10_4_4 gK10_4_4, K10_4_4
Gui, Add, Button, x965 y+4 W60 h50 vK10_1_3 gK10_1_3, K10_1_3
Gui, Add, Button, x+4 W60 h50 vK10_2_3 gK10_2_3, K10_2_3
Gui, Add, Button, x+4 W60 h50 vK10_3_3 gK10_3_3, K10_3_3
Gui, Add, Button, x+4 W60 h50 vK10_4_3 gK10_4_3, K10_4_3
Gui, Add, Button, x965 y+4 W60 h50 vK10_1_2 gK10_1_2, K10_1_2
Gui, Add, Button, x+4 W60 h50 vK10_2_2 gK10_2_2, K10_2_2
Gui, Add, Button, x+4 W60 h50 vK10_3_2 gK10_3_2, K10_3_2
Gui, Add, Button, x+4 W60 h50 vK10_4_2 gK10_4_2, K10_4_2
Gui, Add, Button, x965 y+4 W60 h50 vK10_1_1 gK10_1_1, K10_1_1
Gui, Add, Button, x+4 W60 h50 vK10_2_1 gK10_2_1, K10_2_1
Gui, Add, Button, x+4 W60 h50 vK10_3_1 gK10_3_1, K10_3_1
Gui, Add, Button, x+4 W60 h50 vK10_4_1 gK10_4_1, K10_4_1






Gui, Font, S15 CDefault W700, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP
Gui, Add, GroupBox, x18 y390 w296 h315  , [K11] : 건네일/장갑 ▶
Gui, Font, S12 CDefault W400, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP


Gui, Add, Button, x40 y420 W252 h50 vK11_1_5 gK11_1_5, K11_1_5

Gui, Add, Button, x40 y+4 W60 h50 vK11_4_4 gK11_4_4, K11_4_4
Gui, Add, Button, x+4 W60 h50 vK11_3_4 gK11_3_4, K11_3_4
Gui, Add, Button, x+4 W60 h50 vK11_2_4 gK11_2_4, K11_2_4
Gui, Add, Button, x+4 W60 h50 vK11_1_4 gK11_1_4, K11_1_4
Gui, Add, Button, x40 y+4 W60 h50 vK11_4_3 gK11_4_3, K11_4_3
Gui, Add, Button, x+4 W60 h50 vK11_3_3 gK11_3_3, K11_3_3
Gui, Add, Button, x+4 W60 h50 vK11_2_3 gK11_2_3, K11_2_3
Gui, Add, Button, x+4 W60 h50 vK11_1_3 gK11_1_3, K11_1_3
Gui, Add, Button, x40 y+4 W60 h50 vK11_4_2 gK11_4_2, K11_4_2
Gui, Add, Button, x+4 W60 h50 vK11_3_2 gK11_3_2, K11_3_2
Gui, Add, Button, x+4 W60 h50 vK11_2_2 gK11_2_2, K11_2_2
Gui, Add, Button, x+4 W60 h50 vK11_1_2 gK11_1_2, K11_1_2
Gui, Add, Button, x40 y+4 W60 h50 vK11_4_1 gK11_4_1, K11_4_1
Gui, Add, Button, x+4 W60 h50 vK11_3_1 gK11_3_1, K11_3_1
Gui, Add, Button, x+4 W60 h50 vK11_2_1 gK11_2_1, K11_2_1
Gui, Add, Button, x+4 W60 h50 vK11_1_1 gK11_1_1, K11_1_1







Gui, Font, S15 CDefault W700, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP
Gui, Add, GroupBox, x326 y390 w296 h315  , [K12] : 합성목재부속 ▶
Gui, Font, S12 CDefault W400, Malgun Gothic ;;;;;;;;;;;;;;;;;;;;;;;;;;;GROUP






Gui, Add, Button, x345 y420 W252 h50 vK12_1_5 gK12_1_5, K12_1_5

Gui, Add, Button, x345 y+4 W60 h50 vK12_1_4 gK12_1_4, K12_1_4
Gui, Add, Button, x+4 W60 h50 vK12_2_4 gK12_2_4, K12_2_4
Gui, Add, Button, x+4 W60 h50 vK12_3_4 gK12_3_4, K12_3_4
Gui, Add, Button, x+4 W60 h50 vK12_4_4 gK12_4_4, K12_4_4
Gui, Add, Button, x345 y+4 W60 h50 vK12_1_3 gK12_1_3, K12_1_3
Gui, Add, Button, x+4 W60 h50 vK12_2_3 gK12_2_3, K12_2_3
Gui, Add, Button, x+4 W60 h50 vK12_3_3 gK12_3_3, K12_3_3
Gui, Add, Button, x+4 W60 h50 vK12_4_3 gK12_4_3, K12_4_3
Gui, Add, Button, x345 y+4 W60 h50 vK12_1_2 gK12_1_2, K12_1_2
Gui, Add, Button, x+4 W60 h50 vK12_2_2 gK12_2_2, K12_2_2
Gui, Add, Button, x+4 W60 h50 vK12_3_2 gK12_3_2, K12_3_2
Gui, Add, Button, x+4 W60 h50 vK12_4_2 gK12_4_2, K12_4_2
Gui, Add, Button, x345 y+4 W60 h50 vK12_1_1 gK12_1_1, K12_1_1
Gui, Add, Button, x+4 W60 h50 vK12_2_1 gK12_2_1, K12_2_1
Gui, Add, Button, x+4 W60 h50 vK12_3_1 gK12_3_1, K12_3_1
Gui, Add, Button, x+4 W60 h50 vK12_4_1 gK12_4_1, K12_4_1





Gui, Font, S28 CDefault W400 cred, Malgun Gothic
Gui, Add, text, x747 y518 W400 h55 vload5 backgroundtrans, Reading DataBase





;~ Gui, Tab, ▽[G14~G9]`  ,,Exact
Gui, Tab, ▽[G14~G9]`  ,,

Gui, Font, S12 CDefault W500, Malgun Gothic
Gui, Add, Listview, x635 y390 w605 h315  vLV6 gLV6 hwndHLV6 Sort,  로케이션|RFID CODE|상품명|규격|수량|PRODUCT CODE
Gui, ListView, lv6
LV_ModifyCol(1, 90)  ;
LV_ModifyCol(2, 0) ;
LV_ModifyCol(3, 230)  ;
LV_ModifyCol(4, 150)  ;
LV_ModifyCol(5, "60 Integer" "Integer Right")  ;
LV_ModifyCol(6, 0)  ;
;~ Gui, Add, Picture, x18 y63 w615 h302  , %A_ScriptDir%\images\k6.png
;~ Gui, Add, Picture, x662 y63 w550 h302  , %A_ScriptDir%\images\k5.png
;~ Gui, Add, Picture, x18 y403 w615 h302 , %A_ScriptDir%\images\k4.png
Gui, Add, Picture, x8 y30 w625 h110, %A_ScriptDir%\images\블랑쉬오크(재현10).png
Gui, Add, Picture, x8 y+0 w625 h110, %A_ScriptDir%\images\아이비201(재현75).png
Gui, Add, Picture, x8 y+0 w625 h110, %A_ScriptDir%\images\다크그레이(재현184).png
Gui, Add, Picture, x8 y+5 w625 h110, %A_ScriptDir%\images\썬더오크(재현56).png
Gui, Add, Picture, x8 y+0 w625 h110, %A_ScriptDir%\images\스킨펄(재현12).png
Gui, Add, Picture, x8 y+0 w625 h110, %A_ScriptDir%\images\블랙(재현64).png

Gui, Add, Picture, x+10 y30 w625 h110, %A_ScriptDir%\images\백색(재현8).png
Gui, Add, Picture, y+0 w625 h110, %A_ScriptDir%\images\크림펄시다(재현13).png
Gui, Add, Picture, y+0 w625 h110, %A_ScriptDir%\images\마리보오크(재현82).png



Gui, Font, S11 CDefault W700 , Malgun Gothic
Gui, Add, GroupBox, x8 y30 w625 h110 CFF7F27,` 블랑쉬오크(재현10)                       G14 ~ G13
Gui, Add, GroupBox, x8 y+0 w625 h110 CFF7F27,` 아이비(재현75)                             G14 ~ G13
Gui, Add, GroupBox, x8 y+0 w625 h110 CFF7F27,` 다크그레이(재현184)                       G14 ~ G13
Gui, Add, GroupBox, x8 y+5 w625 h110 CBLACK,` 썬더오크(재현56)                          G10 ~ G9
Gui, Add, GroupBox, x8 y+0 w625 h110 CBLACK,` 스킨펄(재현12)                             G10 ~ G9
Gui, Add, GroupBox, x8 y+0 w625 h110 CBLACK,` 블랙(재현64)                                G10 ~ G9

Gui, Add, GroupBox, x+10 y30 w625 h110 CBLUE,` 백색(재현8)                                G12 ~ G11
Gui, Add, GroupBox, y+0 w625 h110 CBLUE   ,` 크림펄시다(재현13)                      G12 ~ G11
Gui, Add, GroupBox, y+0 w625 h110 CBLUE   ,` 마리보오크(재현82)                      G12 ~ G11




Gui, Add, Picture, x0 y0 w0 h0 v6color1, %A_ScriptDir%\images\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x0 y0 w0 h0 v6color2, %A_ScriptDir%\images\blue.png
Gui, Add, Picture, x0 y0 w0 h0 v6color3, %A_ScriptDir%\images\colour1.png
Gui, Add, Picture, x0 y0 w0 h0 v6color4, %A_ScriptDir%\images\colour2.png
Gui, Add, Picture, x0 y0 w0 h0 v6color5, %A_ScriptDir%\images\colour3.png
Gui, Add, Picture, x0 y0 w0 h0 v6color6, %A_ScriptDir%\images\colour4.png
Gui, Add, Picture, x0 y0 w0 h0 v6color7, %A_ScriptDir%\images\colour5.png
Gui, Add, Picture, x0 y0 w0 h0 v6color8, %A_ScriptDir%\images\colour6.png
Gui, Add, Picture, x0 y0 w0 h0 v6color9, %A_ScriptDir%\images\colour7.png

Gui, Font, S11 CDefault W400, Malgun Gothic

Gui, Add, Button, x20 y50 w27 h85 vG14_3_1 gG14_3_1 , G`n14`n-3`n-1
Gui, Add, Button, x+4 w27 h85 vG14_3_2 gG14_3_2, G`n14`n-3`n-2
Gui, Add, Button, x+4 w27 h85 vG14_3_3 gG14_3_3, G`n14`n-3`n-3
Gui, Add, Button, x+4 w27 h85 vG14_3_4 gG14_3_4, G`n14`n-3`n-4
Gui, Add, Button, x+4 w27 h85 vG14_3_5 gG14_3_5, G`n14`n-3`n-5
Gui, Add, Button, x+4 w27 h85 vG14_3_6 gG14_3_6, G`n14`n-3`n-6
Gui, Add, Button, x+4 w27 h85 vG14_3_7 gG14_3_7, G`n14`n-3`n-7
Gui, Add, Button, x+4 w27 h85 vG14_3_8 gG14_3_8, G`n14`n-3`n-8
Gui, Add, Button, x+4 w27 h85 vG14_3_9 gG14_3_9, G`n14`n-3`n-9

Gui, Add, Button, x+20 w27 h85 vG13_3_1 gG13_3_1, G`n13`n-3`n-1
Gui, Add, Button, x+4 w27 h85 vG13_3_2 gG13_3_2, G`n13`n-3`n-2
Gui, Add, Button, x+4 w27 h85 vG13_3_3 gG13_3_3, G`n13`n-3`n-3
Gui, Add, Button, x+4 w27 h85 vG13_3_4 gG13_3_4, G`n13`n-3`n-4
Gui, Add, Button, x+4 w27 h85 vG13_3_5 gG13_3_5, G`n13`n-3`n-5
Gui, Add, Button, x+4 w27 h85 vG13_3_6 gG13_3_6, G`n13`n-3`n-6
Gui, Add, Button, x+4 w27 h85 vG13_3_7 gG13_3_7, G`n13`n-3`n-7
Gui, Add, Button, x+4 w27 h85 vG13_3_8 gG13_3_8, G`n13`n-3`n-8
Gui, Add, Button, x+4 w27 h85 vG13_3_9 gG13_3_9, G`n13`n-3`n-9
Gui, Add, Button, x+4 w28 h85 vG13_3_10 gG13_3_10, G`n13`n-3`n-10

Gui, Add, Button, x+30 w27 h85 vG12_3_1 gG12_3_1 , G`n12`n-3`n-1
Gui, Add, Button, x+4 w27 h85 vG12_3_2 gG12_3_2, G`n12`n-3`n-2
Gui, Add, Button, x+4 w27 h85 vG12_3_3 gG12_3_3, G`n12`n-3`n-3
Gui, Add, Button, x+4 w27 h85 vG12_3_4 gG12_3_4, G`n12`n-3`n-4
Gui, Add, Button, x+4 w27 h85 vG12_3_5 gG12_3_5, G`n12`n-3`n-5
Gui, Add, Button, x+4 w27 h85 vG12_3_6 gG12_3_6, G`n12`n-3`n-6
Gui, Add, Button, x+4 w27 h85 vG12_3_7 gG12_3_7, G`n12`n-3`n-7
Gui, Add, Button, x+4 w27 h85 vG12_3_8 gG12_3_8, G`n12`n-3`n-8
Gui, Add, Button, x+4 w27 h85 vG12_3_9 gG12_3_9, G`n12`n-3`n-9

Gui, Add, Button, x+20 w27 h85 vG11_3_1 gG11_3_1, G`n11`n-3`n-1
Gui, Add, Button, x+4 w27 h85 vG11_3_2 gG11_3_2, G`n11`n-3`n-2
Gui, Add, Button, x+4 w27 h85 vG11_3_3 gG11_3_3, G`n11`n-3`n-3
Gui, Add, Button, x+4 w27 h85 vG11_3_4 gG11_3_4, G`n11`n-3`n-4
Gui, Add, Button, x+4 w27 h85 vG11_3_5 gG11_3_5, G`n11`n-3`n-5
Gui, Add, Button, x+4 w27 h85 vG11_3_6 gG11_3_6, G`n11`n-3`n-6
Gui, Add, Button, x+4 w27 h85 vG11_3_7 gG11_3_7, G`n11`n-3`n-7
Gui, Add, Button, x+4 w27 h85 vG11_3_8 gG11_3_8, G`n11`n-3`n-8
Gui, Add, Button, x+4 w27 h85 vG11_3_9 gG11_3_9, G`n11`n-3`n-9
Gui, Add, Button, x+4 w28 h85 vG11_3_10 gG11_3_10, G`n11`n-3`n-10


Gui, Add, Button, x20 y+25 w27 h85 vG14_2_1 gG14_2_1 , G`n14`n-2`n-1
Gui, Add, Button, x+4 w27 h85 vG14_2_2 gG14_2_2, G`n14`n-2`n-2
Gui, Add, Button, x+4 w27 h85 vG14_2_3 gG14_2_3, G`n14`n-2`n-3
Gui, Add, Button, x+4 w27 h85 vG14_2_4 gG14_2_4, G`n14`n-2`n-4
Gui, Add, Button, x+4 w27 h85 vG14_2_5 gG14_2_5, G`n14`n-2`n-5
Gui, Add, Button, x+4 w27 h85 vG14_2_6 gG14_2_6, G`n14`n-2`n-6
Gui, Add, Button, x+4 w27 h85 vG14_2_7 gG14_2_7, G`n14`n-2`n-7
Gui, Add, Button, x+4 w27 h85 vG14_2_8 gG14_2_8, G`n14`n-2`n-8
Gui, Add, Button, x+4 w27 h85 vG14_2_9 gG14_2_9, G`n14`n-2`n-9

Gui, Add, Button, x+20 w27 h85 vG13_2_1 gG13_2_1, G`n13`n-2`n-1
Gui, Add, Button, x+4 w27 h85 vG13_2_2 gG13_2_2, G`n13`n-2`n-2
Gui, Add, Button, x+4 w27 h85 vG13_2_3 gG13_2_3, G`n13`n-2`n-3
Gui, Add, Button, x+4 w27 h85 vG13_2_4 gG13_2_4, G`n13`n-2`n-4
Gui, Add, Button, x+4 w27 h85 vG13_2_5 gG13_2_5, G`n13`n-2`n-5
Gui, Add, Button, x+4 w27 h85 vG13_2_6 gG13_2_6, G`n13`n-2`n-6
Gui, Add, Button, x+4 w27 h85 vG13_2_7 gG13_2_7, G`n13`n-2`n-7
Gui, Add, Button, x+4 w27 h85 vG13_2_8 gG13_2_8, G`n13`n-2`n-8
Gui, Add, Button, x+4 w27 h85 vG13_2_9 gG13_2_9, G`n13`n-2`n-9
Gui, Add, Button, x+4 w28 h85 vG13_2_10 gG13_2_10, G`n13`n-2`n-10

Gui, Add, Button, x+30 w27 h85 vG12_2_1 gG12_2_1 , G`n12`n-2`n-1
Gui, Add, Button, x+4 w27 h85 vG12_2_2 gG12_2_2, G`n12`n-2`n-2
Gui, Add, Button, x+4 w27 h85 vG12_2_3 gG12_2_3, G`n12`n-2`n-3
Gui, Add, Button, x+4 w27 h85 vG12_2_4 gG12_2_4, G`n12`n-2`n-4
Gui, Add, Button, x+4 w27 h85 vG12_2_5 gG12_2_5, G`n12`n-2`n-5
Gui, Add, Button, x+4 w27 h85 vG12_2_6 gG12_2_6, G`n12`n-2`n-6
Gui, Add, Button, x+4 w27 h85 vG12_2_7 gG12_2_7, G`n12`n-2`n-7
Gui, Add, Button, x+4 w27 h85 vG12_2_8 gG12_2_8, G`n12`n-2`n-8
Gui, Add, Button, x+4 w27 h85 vG12_2_9 gG12_2_9, G`n12`n-2`n-9

Gui, Add, Button, x+20 w27 h85 vG11_2_1 gG11_2_1, G`n11`n-2`n-1
Gui, Add, Button, x+4 w27 h85 vG11_2_2 gG11_2_2, G`n11`n-2`n-2
Gui, Add, Button, x+4 w27 h85 vG11_2_3 gG11_2_3, G`n11`n-2`n-3
Gui, Add, Button, x+4 w27 h85 vG11_2_4 gG11_2_4, G`n11`n-2`n-4
Gui, Add, Button, x+4 w27 h85 vG11_2_5 gG11_2_5, G`n11`n-2`n-5
Gui, Add, Button, x+4 w27 h85 vG11_2_6 gG11_2_6, G`n11`n-2`n-6
Gui, Add, Button, x+4 w27 h85 vG11_2_7 gG11_2_7, G`n11`n-2`n-7
Gui, Add, Button, x+4 w27 h85 vG11_2_8 gG11_2_8, G`n11`n-2`n-8
Gui, Add, Button, x+4 w27 h85 vG11_2_9 gG11_2_9, G`n11`n-2`n-9
Gui, Add, Button, x+4 w28 h85 vG11_2_10 gG11_2_10, G`n11`n-2`n-10



Gui, Add, Button, x20 y+25 w27 h85 vG14_1_1 gG14_1_1 , G`n14`n-1`n-1
Gui, Add, Button, x+4 w27 h85 vG14_1_2 gG14_1_2, G`n14`n-1`n-2
Gui, Add, Button, x+4 w27 h85 vG14_1_3 gG14_1_3, G`n14`n-1`n-3
Gui, Add, Button, x+4 w27 h85 vG14_1_4 gG14_1_4, G`n14`n-1`n-4
Gui, Add, Button, x+4 w27 h85 vG14_1_5 gG14_1_5, G`n14`n-1`n-5
Gui, Add, Button, x+4 w27 h85 vG14_1_6 gG14_1_6, G`n14`n-1`n-6
Gui, Add, Button, x+4 w27 h85 vG14_1_7 gG14_1_7, G`n14`n-1`n-7
Gui, Add, Button, x+4 w27 h85 vG14_1_8 gG14_1_8, G`n14`n-1`n-8
Gui, Add, Button, x+4 w27 h85 vG14_1_9 gG14_1_9, G`n14`n-1`n-9

Gui, Add, Button, x+20 w27 h85 vG13_1_1 gG13_1_1, G`n13`n-1`n-1
Gui, Add, Button, x+4 w27 h85 vG13_1_2 gG13_1_2, G`n13`n-1`n-2
Gui, Add, Button, x+4 w27 h85 vG13_1_3 gG13_1_3, G`n13`n-1`n-3
Gui, Add, Button, x+4 w27 h85 vG13_1_4 gG13_1_4, G`n13`n-1`n-4
Gui, Add, Button, x+4 w27 h85 vG13_1_5 gG13_1_5, G`n13`n-1`n-5
Gui, Add, Button, x+4 w27 h85 vG13_1_6 gG13_1_6, G`n13`n-1`n-6
Gui, Add, Button, x+4 w27 h85 vG13_1_7 gG13_1_7, G`n13`n-1`n-7
Gui, Add, Button, x+4 w27 h85 vG13_1_8 gG13_1_8, G`n13`n-1`n-8
Gui, Add, Button, x+4 w27 h85 vG13_1_9 gG13_1_9, G`n13`n-1`n-9
Gui, Add, Button, x+4 w28 h85 vG13_1_10 gG13_1_10, G`n13`n-1`n-10

Gui, Add, Button, x+30 w27 h85 vG12_1_1 gG12_1_1 , G`n12`n-1`n-1
Gui, Add, Button, x+4 w27 h85 vG12_1_2 gG12_1_2, G`n12`n-1`n-2
Gui, Add, Button, x+4 w27 h85 vG12_1_3 gG12_1_3, G`n12`n-1`n-3
Gui, Add, Button, x+4 w27 h85 vG12_1_4 gG12_1_4, G`n12`n-1`n-4
Gui, Add, Button, x+4 w27 h85 vG12_1_5 gG12_1_5, G`n12`n-1`n-5
Gui, Add, Button, x+4 w27 h85 vG12_1_6 gG12_1_6, G`n12`n-1`n-6
Gui, Add, Button, x+4 w27 h85 vG12_1_7 gG12_1_7, G`n12`n-1`n-7
Gui, Add, Button, x+4 w27 h85 vG12_1_8 gG12_1_8, G`n12`n-1`n-8
Gui, Add, Button, x+4 w27 h85 vG12_1_9 gG12_1_9, G`n12`n-1`n-9

Gui, Add, Button, x+20 w27 h85 vG11_1_1 gG11_1_1, G`n11`n-1`n-1
Gui, Add, Button, x+4 w27 h85 vG11_1_2 gG11_1_2, G`n11`n-1`n-2
Gui, Add, Button, x+4 w27 h85 vG11_1_3 gG11_1_3, G`n11`n-1`n-3
Gui, Add, Button, x+4 w27 h85 vG11_1_4 gG11_1_4, G`n11`n-1`n-4
Gui, Add, Button, x+4 w27 h85 vG11_1_5 gG11_1_5, G`n11`n-1`n-5
Gui, Add, Button, x+4 w27 h85 vG11_1_6 gG11_1_6, G`n11`n-1`n-6
Gui, Add, Button, x+4 w27 h85 vG11_1_7 gG11_1_7, G`n11`n-1`n-7
Gui, Add, Button, x+4 w27 h85 vG11_1_8 gG11_1_8, G`n11`n-1`n-8
Gui, Add, Button, x+4 w27 h85 vG11_1_9 gG11_1_9, G`n11`n-1`n-9
Gui, Add, Button, x+4 w28 h85 vG11_1_10 gG11_1_10, G`n11`n-1`n-10





;


;



Gui, Add, Button, x20 y+30 w27 h85 vG10_3_1 gG10_3_1 , G`n10`n-3`n-1
Gui, Add, Button, x+4 w27 h85 vG10_3_2 gG10_3_2, G`n10`n-3`n-2
Gui, Add, Button, x+4 w27 h85 vG10_3_3 gG10_3_3, G`n10`n-3`n-3
Gui, Add, Button, x+4 w27 h85 vG10_3_4 gG10_3_4, G`n10`n-3`n-4
Gui, Add, Button, x+4 w27 h85 vG10_3_5 gG10_3_5, G`n10`n-3`n-5
Gui, Add, Button, x+4 w27 h85 vG10_3_6 gG10_3_6, G`n10`n-3`n-6
Gui, Add, Button, x+4 w27 h85 vG10_3_7 gG10_3_7, G`n10`n-3`n-7
Gui, Add, Button, x+4 w27 h85 vG10_3_8 gG10_3_8, G`n10`n-3`n-8
Gui, Add, Button, x+4 w27 h85 vG10_3_9 gG10_3_9, G`n10`n-3`n-9

Gui, Add, Button, x+20 w27 h85 vG9_3_1 gG9_3_1, G`n9`n-3`n-1
Gui, Add, Button, x+4 w27 h85 vG9_3_2 gG9_3_2, G`n9`n-3`n-2
Gui, Add, Button, x+4 w27 h85 vG9_3_3 gG9_3_3, G`n9`n-3`n-3
Gui, Add, Button, x+4 w27 h85 vG9_3_4 gG9_3_4, G`n9`n-3`n-4
Gui, Add, Button, x+4 w27 h85 vG9_3_5 gG9_3_5, G`n9`n-3`n-5
Gui, Add, Button, x+4 w27 h85 vG9_3_6 gG9_3_6, G`n9`n-3`n-6
Gui, Add, Button, x+4 w27 h85 vG9_3_7 gG9_3_7, G`n9`n-3`n-7
Gui, Add, Button, x+4 w27 h85 vG9_3_8 gG9_3_8, G`n9`n-3`n-8
Gui, Add, Button, x+4 w27 h85 vG9_3_9 gG9_3_9, G`n9`n-3`n-9
Gui, Add, Button, x+4 w28 h85 vG9_3_10 gG9_3_10, G`n9`n-3`n-10

Gui, Add, Button, x20 y+25 w27 h85 vG10_2_1 gG10_2_1 , G`n10`n-2`n-1
Gui, Add, Button, x+4 w27 h85 vG10_2_2 gG10_2_2, G`n10`n-2`n-2
Gui, Add, Button, x+4 w27 h85 vG10_2_3 gG10_2_3, G`n10`n-2`n-3
Gui, Add, Button, x+4 w27 h85 vG10_2_4 gG10_2_4, G`n10`n-2`n-4
Gui, Add, Button, x+4 w27 h85 vG10_2_5 gG10_2_5, G`n10`n-2`n-5
Gui, Add, Button, x+4 w27 h85 vG10_2_6 gG10_2_6, G`n10`n-2`n-6
Gui, Add, Button, x+4 w27 h85 vG10_2_7 gG10_2_7, G`n10`n-2`n-7
Gui, Add, Button, x+4 w27 h85 vG10_2_8 gG10_2_8, G`n10`n-2`n-8
Gui, Add, Button, x+4 w27 h85 vG10_2_9 gG10_2_9, G`n10`n-2`n-9

Gui, Add, Button, x+20 w27 h85 vG9_2_1 gG9_2_1, G`n9`n-2`n-1
Gui, Add, Button, x+4 w27 h85 vG9_2_2 gG9_2_2, G`n9`n-2`n-2
Gui, Add, Button, x+4 w27 h85 vG9_2_3 gG9_2_3, G`n9`n-2`n-3
Gui, Add, Button, x+4 w27 h85 vG9_2_4 gG9_2_4, G`n9`n-2`n-4
Gui, Add, Button, x+4 w27 h85 vG9_2_5 gG9_2_5, G`n9`n-2`n-5
Gui, Add, Button, x+4 w27 h85 vG9_2_6 gG9_2_6, G`n9`n-2`n-6
Gui, Add, Button, x+4 w27 h85 vG9_2_7 gG9_2_7, G`n9`n-2`n-7
Gui, Add, Button, x+4 w27 h85 vG9_2_8 gG9_2_8, G`n9`n-2`n-8
Gui, Add, Button, x+4 w27 h85 vG9_2_9 gG9_2_9, G`n9`n-2`n-9
Gui, Add, Button, x+4 w28 h85 vG9_2_10 gG9_2_10, G`n9`n-2`n-10

Gui, Add, Button, x20 y+25 w27 h85 vG10_1_1 gG10_1_1 , G`n10`n-1`n-1
Gui, Add, Button, x+4 w27 h85 vG10_1_2 gG10_1_2, G`n10`n-1`n-2
Gui, Add, Button, x+4 w27 h85 vG10_1_3 gG10_1_3, G`n10`n-1`n-3
Gui, Add, Button, x+4 w27 h85 vG10_1_4 gG10_1_4, G`n10`n-1`n-4
Gui, Add, Button, x+4 w27 h85 vG10_1_5 gG10_1_5, G`n10`n-1`n-5
Gui, Add, Button, x+4 w27 h85 vG10_1_6 gG10_1_6, G`n10`n-1`n-6
Gui, Add, Button, x+4 w27 h85 vG10_1_7 gG10_1_7, G`n10`n-1`n-7
Gui, Add, Button, x+4 w27 h85 vG10_1_8 gG10_1_8, G`n10`n-1`n-8
Gui, Add, Button, x+4 w27 h85 vG10_1_9 gG10_1_9, G`n10`n-1`n-9

Gui, Add, Button, x+20 w27 h85 vG9_1_1 gG9_1_1, G`n9`n-1`n-1
Gui, Add, Button, x+4 w27 h85 vG9_1_2 gG9_1_2, G`n9`n-1`n-2
Gui, Add, Button, x+4 w27 h85 vG9_1_3 gG9_1_3, G`n9`n-1`n-3
Gui, Add, Button, x+4 w27 h85 vG9_1_4 gG9_1_4, G`n9`n-1`n-4
Gui, Add, Button, x+4 w27 h85 vG9_1_5 gG9_1_5, G`n9`n-1`n-5
Gui, Add, Button, x+4 w27 h85 vG9_1_6 gG9_1_6, G`n9`n-1`n-6
Gui, Add, Button, x+4 w27 h85 vG9_1_7 gG9_1_7, G`n9`n-1`n-7
Gui, Add, Button, x+4 w27 h85 vG9_1_8 gG9_1_8, G`n9`n-1`n-8
Gui, Add, Button, x+4 w27 h85 vG9_1_9 gG9_1_9, G`n9`n-1`n-9
Gui, Add, Button, x+4 w28 h85 vG9_1_10 gG9_1_10, G`n9`n-1`n-10

Gui, Font, S28 CDefault W400 cred, Malgun Gothic
Gui, Add, text, x797 y509 W400 h55 vload6 backgroundtrans, Reading DataBase





;~ Gui, Tab, ▽[G8~7  J4~2]`  ,,Exact
Gui, Tab, ▽[G8~7  J4~2]`  ,,

Gui, Font, S12 CDefault W500, Malgun Gothic
Gui, Add, Listview, x662 y390 w550 h315 vLV7 gLV7 hwndHLV7 Sort,  로케이션|RFID CODE|상품명|규격|수량|PRODUCT CODE
Gui, ListView, lv7
LV_ModifyCol(1, 90)  ;
LV_ModifyCol(2, 0) ;
LV_ModifyCol(3, 230)  ;
LV_ModifyCol(4, 150)  ;
LV_ModifyCol(5, "60 Integer" "Integer Right")  ;
LV_ModifyCol(6, 0)  ;
;~ Gui, Add, Picture, x18 y63 w615 h302  , %A_ScriptDir%\images\k6.png
;~ Gui, Add, Picture, x662 y63 w550 h302  , %A_ScriptDir%\images\k5.png
;~ Gui, Add, Picture, x18 y403 w615 h302 , %A_ScriptDir%\images\k4.png

Gui, Add, Picture, x8 y365 w625 h110 , %A_ScriptDir%\images\백색(재현8).png
Gui, Add, Picture, x8 y+0 w625 h110  , %A_ScriptDir%\images\k3.png
Gui, Add, Picture, x8 y+0 w625 h110  , %A_ScriptDir%\images\그레이(재현67).png



Gui, Font, S11 CDefault W700 , Malgun Gothic
Gui, Add, GroupBox, x8 y30 w340 h330 CFF11C2,` [J4] : 실린더 ▶
Gui, Add, GroupBox, x+20 w210 h330 CFF11C2,` [J3] : 경첩 및 기타
Gui, Add, GroupBox, x+20 w340 h330 CFF11C2,` [J2] : 수성스테인 바니쉬 등 ◁
Gui, Add, GroupBox, x+20 w290 h330 CFF11C2,` [I] : 대형박스단위
;~ Gui, Add, GroupBox, x8 y+0 w625 h110 CFF7F27,` 아이비(재현75)                             G14 ~ G13
;~ Gui, Add, GroupBox, x8 y+0 w625 h110 CFF7F27,` 지정안됨                                     G14 ~ G13
;~ Gui, Add, GroupBox, x8 y+0 w625 h110 CFF7F27,` 지정안됨                                     G14 ~ G13



Gui, Add, GroupBox, x8 y+5 w625 h110 CBLACK,` 크로스 중백색                               G8 ~ G7
Gui, Add, GroupBox, x8 y+0 w625 h110 CBLACK,` 우딘 및 기타몰딩                           G8 ~ G7
Gui, Add, GroupBox, x8 y+0 w625 h110 CBLACK,` 그레이(재현67)                              G8 ~ G7

;~ Gui, Add, GroupBox, x+10 y30 w625 h110 CBLUE,` 백색(재현8)                                G12 ~ G11
;~ Gui, Add, GroupBox, y+0 w625 h110 CBLUE   ,` 크림펄시다(재현13)                      G12 ~ G11
;~ Gui, Add, GroupBox, y+0 w625 h110 CBLUE   ,` 마리보오크(재현82)                      G12 ~ G11




Gui, Add, Picture, x0 y0 w0 h0 v7color1, %A_ScriptDir%\images\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x0 y0 w0 h0 v7color2, %A_ScriptDir%\images\blue.png
Gui, Add, Picture, x0 y0 w0 h0 v7color3, %A_ScriptDir%\images\colour1.png
Gui, Add, Picture, x0 y0 w0 h0 v7color4, %A_ScriptDir%\images\colour2.png
Gui, Add, Picture, x0 y0 w0 h0 v7color5, %A_ScriptDir%\images\colour3.png
Gui, Add, Picture, x0 y0 w0 h0 v7color6, %A_ScriptDir%\images\colour4.png
Gui, Add, Picture, x0 y0 w0 h0 v7color7, %A_ScriptDir%\images\colour5.png
Gui, Add, Picture, x0 y0 w0 h0 v7color8, %A_ScriptDir%\images\colour6.png
Gui, Add, Picture, x0 y0 w0 h0 v7color9, %A_ScriptDir%\images\colour7.png






Gui, Font, S11 CDefault W400, Malgun Gothic
Gui, Add, Button,  x20 y130 W317 h50 vJ4_4_1 gJ4_4_1 , J4_4_1

Gui, Add, Button, x20 y+4 W60 h50 vJ4_3_1 gJ4_3_1, J4_3_1
Gui, Add, Button, x+4 W60 h50 vJ4_3_2 gJ4_3_2, J4_3_2
Gui, Add, Button, x+4 W60 h50 vJ4_3_3 gJ4_3_3, J4_3_3
Gui, Add, Button, x+4 W60 h50 vJ4_3_4 gJ4_3_4, J4_3_4
Gui, Add, Button, x+4 W60 h50 vJ4_3_5 gJ4_3_5, J4_3_5

Gui, Add, Button, x20 y+4 W60 h50 vJ4_2_1 gJ4_2_1, J4_2_1
Gui, Add, Button, x+4 W60 h50 vJ4_2_2 gJ4_2_2, J4_2_2
Gui, Add, Button, x+4 W60 h50 vJ4_2_3 gJ4_2_3, J4_2_3
Gui, Add, Button, x+4 W60 h50 vJ4_2_4 gJ4_2_4, J4_2_4
Gui, Add, Button, x+4 W60 h50 vJ4_2_5 gJ4_2_5, J4_2_5

Gui, Add, Button, x20 y+4 W60 h50 vJ4_1_1 gJ4_1_1, J4_1_1
Gui, Add, Button, x+4 W60 h50 vJ4_1_2 gJ4_1_2, J4_1_2
Gui, Add, Button, x+4 W60 h50 vJ4_1_3 gJ4_1_3, J4_1_3
Gui, Add, Button, x+4 W60 h50 vJ4_1_4 gJ4_1_4, J4_1_4
Gui, Add, Button, x+4 W60 h50 vJ4_1_5 gJ4_1_5, J4_1_5






Gui, Font, S11 CDefault W400, Malgun Gothic
Gui, Add, Button, x380 y76 W60 h50 vJ3_5_1 gJ3_5_1, J3_5_1
Gui, Add, Button, x+4 W60 h50 vJ3_5_2 gJ3_5_2, J3_5_2
Gui, Add, Button, x+4 W60 h50 vJ3_5_3 gJ3_5_3, J3_5_3

Gui, Add, Button, x380 y+4 W60 h50 vJ3_4_1 gJ3_4_1, J3_4_1
Gui, Add, Button, x+4 W60 h50 vJ3_4_2 gJ3_4_2, J3_4_2
Gui, Add, Button, x+4 W60 h50 vJ3_4_3 gJ3_4_3, J3_4_3

Gui, Add, Button, x380 y+4 W60 h50 vJ3_3_1 gJ3_3_1, J3_3_1
Gui, Add, Button, x+4 W60 h50 vJ3_3_2 gJ3_3_2, J3_3_2
Gui, Add, Button, x+4 W60 h50 vJ3_3_3 gJ3_3_3, J3_3_3

Gui, Add, Button, x380 y+4 W60 h50 vJ3_2_1 gJ3_2_1, J3_2_1
Gui, Add, Button, x+4 W60 h50 vJ3_2_2 gJ3_2_2, J3_2_2
Gui, Add, Button, x+4 W60 h50 vJ3_2_3 gJ3_2_3, J3_2_3

Gui, Add, Button, x380 y+4 W60 h50 vJ3_1_1 gJ3_1_1, J3_1_1
Gui, Add, Button, x+4 W60 h50 vJ3_1_2 gJ3_1_2, J3_1_2
Gui, Add, Button, x+4 W60 h50 vJ3_1_3 gJ3_1_3, J3_1_3





Gui, Font, S11 CDefault W400, Malgun Gothic
Gui, Add, Button, x610 y130  W317 h50 vJ2_4_1 , J2_4_1

Gui, Add, Button, x610 y+4 W60 h50 vJ2_3_5 gJ2_3_5, J2_3_5
Gui, Add, Button, x+4 W60 h50 vJ2_3_4 gJ2_3_4, J2_3_4
Gui, Add, Button, x+4 W60 h50 vJ2_3_3 gJ2_3_3, J2_3_3
Gui, Add, Button, x+4 W60 h50 vJ2_3_2 gJ2_3_2, J2_3_2
Gui, Add, Button, x+4 W60 h50 vJ2_3_1 gJ2_3_1, J2_3_1

Gui, Add, Button, x610 y+4 W60 h50 vJ2_2_5 gJ2_2_5, J2_2_5
Gui, Add, Button, x+4 W60 h50 vJ2_2_4 gJ2_2_4, J2_2_4
Gui, Add, Button, x+4 W60 h50 vJ2_2_3 gJ2_2_3, J2_2_3
Gui, Add, Button, x+4 W60 h50 vJ2_2_2 gJ2_2_2, J2_2_2
Gui, Add, Button, x+4 W60 h50 vJ2_2_1 gJ2_2_1, J2_2_1

Gui, Add, Button, x610 y+4 W60 h50 vJ2_1_5 gJ2_1_5, J2_1_5
Gui, Add, Button, x+4 W60 h50 vJ2_1_4 gJ2_1_4, J2_1_4
Gui, Add, Button, x+4 W60 h50 vJ2_1_3 gJ2_1_3, J2_1_3
Gui, Add, Button, x+4 W60 h50 vJ2_1_2 gJ2_1_2, J2_1_2
Gui, Add, Button, x+4 W60 h50 vJ2_1_1 gJ2_1_1, J2_1_1









GuI, Font, S11 CDefault W400, Malgun GothIc
GuI, Add, Button, x970 y130 W80 h50 vI3_4_3 gI3_4_3, I3_4_3
GuI, Add, Button, x+4 W80 h50 vI2_4_2 gI2_4_2, I2_4_2
GuI, Add, Button, x+4 W80 h50 vI1_4_1 gI1_4_1, I1_4_1

GuI, Add, Button, x970 y+4 W80 h50 vI3_3_3 gI3_3_3, I3_3_3
GuI, Add, Button, x+4 W80 h50 vI2_3_2 gI2_3_2, I2_3_2
GuI, Add, Button, x+4 W80 h50 vI1_3_1 gI1_3_1, I1_3_1

GuI, Add, Button, x970 y+4 W80 h50 vI3_2_3 gI3_2_3, I3_2_3
GuI, Add, Button, x+4 W80 h50 vI2_2_2 gI2_2_2, I2_2_2
GuI, Add, Button, x+4 W80 h50 vI1_2_1 gI1_2_1, I1_2_1

GuI, Add, Button, x970 y+4 W80 h50 vI3_1_3 gI3_1_3, I3_1_3
GuI, Add, Button, x+4 W80 h50 vI2_1_2 gI2_1_2, I2_1_2
GuI, Add, Button, x+4 W80 h50 vI1_1_1 gI1_1_1, I1_1_1











Gui, Add, Button, x20 y385 w27 h85 vG8_3_1 gG8_3_1 , G`n8`n-3`n-1
Gui, Add, Button, x+4 w27 h85 vG8_3_2 gG8_3_2, G`n8`n-3`n-2
Gui, Add, Button, x+4 w27 h85 vG8_3_3 gG8_3_3, G`n8`n-3`n-3
Gui, Add, Button, x+4 w27 h85 vG8_3_4 gG8_3_4, G`n8`n-3`n-4
Gui, Add, Button, x+4 w27 h85 vG8_3_5 gG8_3_5, G`n8`n-3`n-5
Gui, Add, Button, x+4 w27 h85 vG8_3_6 gG8_3_6, G`n8`n-3`n-6
Gui, Add, Button, x+4 w27 h85 vG8_3_7 gG8_3_7, G`n8`n-3`n-7
Gui, Add, Button, x+4 w27 h85 vG8_3_8 gG8_3_8, G`n8`n-3`n-8
Gui, Add, Button, x+4 w27 h85 vG8_3_9 gG8_3_9, G`n8`n-3`n-9

Gui, Add, Button, x+20 w27 h85 vG7_3_1 gG7_3_1, G`n7`n-3`n-1
Gui, Add, Button, x+4 w27 h85 vG7_3_2 gG7_3_2, G`n7`n-3`n-2
Gui, Add, Button, x+4 w27 h85 vG7_3_3 gG7_3_3, G`n7`n-3`n-3
Gui, Add, Button, x+4 w27 h85 vG7_3_4 gG7_3_4, G`n7`n-3`n-4
Gui, Add, Button, x+4 w27 h85 vG7_3_5 gG7_3_5, G`n7`n-3`n-5
Gui, Add, Button, x+4 w27 h85 vG7_3_6 gG7_3_6, G`n7`n-3`n-6
Gui, Add, Button, x+4 w27 h85 vG7_3_7 gG7_3_7, G`n7`n-3`n-7
Gui, Add, Button, x+4 w27 h85 vG7_3_8 gG7_3_8, G`n7`n-3`n-8
Gui, Add, Button, x+4 w27 h85 vG7_3_9 gG7_3_9, G`n7`n-3`n-9
Gui, Add, Button, x+4 w28 h85 vG7_3_10 gG7_3_10, G`n7`n-3`n-10

Gui, Add, Button, x20 y+25 w27 h85 vG8_2_1 gG8_2_1 , G`n8`n-2`n-1
Gui, Add, Button, x+4 w27 h85 vG8_2_2 gG8_2_2, G`n8`n-2`n-2
Gui, Add, Button, x+4 w27 h85 vG8_2_3 gG8_2_3, G`n8`n-2`n-3
Gui, Add, Button, x+4 w27 h85 vG8_2_4 gG8_2_4, G`n8`n-2`n-4
Gui, Add, Button, x+4 w27 h85 vG8_2_5 gG8_2_5, G`n8`n-2`n-5
Gui, Add, Button, x+4 w27 h85 vG8_2_6 gG8_2_6, G`n8`n-2`n-6
Gui, Add, Button, x+4 w27 h85 vG8_2_7 gG8_2_7, G`n8`n-2`n-7
Gui, Add, Button, x+4 w27 h85 vG8_2_8 gG8_2_8, G`n8`n-2`n-8
Gui, Add, Button, x+4 w27 h85 vG8_2_9 gG8_2_9, G`n8`n-2`n-9

Gui, Add, Button, x+20 w27 h85 vG7_2_1 gG7_2_1, G`n7`n-2`n-1
Gui, Add, Button, x+4 w27 h85 vG7_2_2 gG7_2_2, G`n7`n-2`n-2
Gui, Add, Button, x+4 w27 h85 vG7_2_3 gG7_2_3, G`n7`n-2`n-3
Gui, Add, Button, x+4 w27 h85 vG7_2_4 gG7_2_4, G`n7`n-2`n-4
Gui, Add, Button, x+4 w27 h85 vG7_2_5 gG7_2_5, G`n7`n-2`n-5
Gui, Add, Button, x+4 w27 h85 vG7_2_6 gG7_2_6, G`n7`n-2`n-6
Gui, Add, Button, x+4 w27 h85 vG7_2_7 gG7_2_7, G`n7`n-2`n-7
Gui, Add, Button, x+4 w27 h85 vG7_2_8 gG7_2_8, G`n7`n-2`n-8
Gui, Add, Button, x+4 w27 h85 vG7_2_9 gG7_2_9, G`n7`n-2`n-9
Gui, Add, Button, x+4 w28 h85 vG7_2_10 gG7_2_10, G`n7`n-2`n-10

Gui, Add, Button, x20 y+25 w27 h85 vG8_1_1 gG8_1_1 , G`n8`n-1`n-1
Gui, Add, Button, x+4 w27 h85 vG8_1_2 gG8_1_2, G`n8`n-1`n-2
Gui, Add, Button, x+4 w27 h85 vG8_1_3 gG8_1_3, G`n8`n-1`n-3
Gui, Add, Button, x+4 w27 h85 vG8_1_4 gG8_1_4, G`n8`n-1`n-4
Gui, Add, Button, x+4 w27 h85 vG8_1_5 gG8_1_5, G`n8`n-1`n-5
Gui, Add, Button, x+4 w27 h85 vG8_1_6 gG8_1_6, G`n8`n-1`n-6
Gui, Add, Button, x+4 w27 h85 vG8_1_7 gG8_1_7, G`n8`n-1`n-7
Gui, Add, Button, x+4 w27 h85 vG8_1_8 gG8_1_8, G`n8`n-1`n-8
Gui, Add, Button, x+4 w27 h85 vG8_1_9 gG8_1_9, G`n8`n-1`n-9

Gui, Add, Button, x+20 w27 h85 vG7_1_1 gG7_1_1, G`n7`n-1`n-1
Gui, Add, Button, x+4 w27 h85 vG7_1_2 gG7_1_2, G`n7`n-1`n-2
Gui, Add, Button, x+4 w27 h85 vG7_1_3 gG7_1_3, G`n7`n-1`n-3
Gui, Add, Button, x+4 w27 h85 vG7_1_4 gG7_1_4, G`n7`n-1`n-4
Gui, Add, Button, x+4 w27 h85 vG7_1_5 gG7_1_5, G`n7`n-1`n-5
Gui, Add, Button, x+4 w27 h85 vG7_1_6 gG7_1_6, G`n7`n-1`n-6
Gui, Add, Button, x+4 w27 h85 vG7_1_7 gG7_1_7, G`n7`n-1`n-7
Gui, Add, Button, x+4 w27 h85 vG7_1_8 gG7_1_8, G`n7`n-1`n-8
Gui, Add, Button, x+4 w27 h85 vG7_1_9 gG7_1_9, G`n7`n-1`n-9
Gui, Add, Button, x+4 w28 h85 vG7_1_10 gG7_1_10, G`n7`n-1`n-10

Gui, Font, S28 CDefault W400 cred, Malgun Gothic
Gui, Add, text, x797 y509 W400 h55 vload7 backgroundtrans, Reading DataBase












;~ Gui, Tab, ▼평면[외부]`  ,,Exact
Gui, Tab, ▼평면[외부]`  ,,


;~ Gui, Add, GroupBox, x547 y9 w800 h695 , [창고 2D 평면도]


Gui, Font, S12 CDefault W400, Malgun Gothic





Gui, Color, FFFFFF
Gui, Add, Picture, x50 y50 w820 h370 v2divi5, %A_ScriptDir%\images\창고.png



Gui, Add, Picture, x468 y440 w225 h70 v2divi1, %A_ScriptDir%\images\divi.png
Gui, Add, GroupBox, x468 y430 w225 h80 , < 2 번 천막 >


Gui, Add, Picture, x40 y440 w330 h70 v2divi2, %A_ScriptDir%\images\divi.png
Gui, Add, GroupBox, x40 y430 w330 h80 , < 3 번 천막 >

Gui, Add, Picture, x790 y610 w330 h70 v2diviFR, %A_ScriptDir%\images\divi.png
Gui, Add, GroupBox, x790 y600 w330 h80 , < 상가 앞 >


Gui, Add, Picture, x40 y610 w430 h70 v2divi3, %A_ScriptDir%\images\divi.png
Gui, Add, GroupBox, x40 y600 w430 h80 , < 4 번 천막 >

Gui, Add, Picture, x990 y40 w120 h330 v2divi4, %A_ScriptDir%\images\divi.png
Gui, Add, GroupBox, x990 y30 w120 h340 , < 1 번 천막 >

Gui, Add, Picture, x790 y250 w120 h180 v2diviCNC, %A_ScriptDir%\images\divi.png
Gui, Add, GroupBox, x790 y240 w120 h190 , < CNC 앞 >

Gui, Add, Picture, x610 y435 w0 h0 v3color1, %A_ScriptDir%\images\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x610 y435 w0 h0 v3color2, %A_ScriptDir%\images\blue.png
Gui, Add, Picture, x610 y435 w0 h0 v3color3, %A_ScriptDir%\images\colour1.png
Gui, Add, Picture, x610 y435 w0 h0 v3color4, %A_ScriptDir%\images\colour2.png
Gui, Add, Picture, x610 y435 w0 h0 v3color5, %A_ScriptDir%\images\colour3.png
Gui, Add, Picture, x610 y435 w0 h0 v3color6, %A_ScriptDir%\images\colour4.png
Gui, Add, Picture, x610 y435 w0 h0 v3color7, %A_ScriptDir%\images\colour5.png
Gui, Add, Picture, x610 y435 w0 h0 v3color8, %A_ScriptDir%\images\colour6.png
Gui, Add, Picture, x610 y435 w0 h0 v3color9, %A_ScriptDir%\images\colour7.png


Gui, Font, S10 CDefault w700 c0xFF2211, Malgun Gothic

Gui, Add, Listview, x80 y80 w660 h240 vLV3 gLV3 hwndHLV3 SortDesc,  로케이션|RFID CODE|상품명|규격|수량|PRODUCT CODE
Gui, ListView, lv3
LV_ModifyCol(1, 70)  ;
LV_ModifyCol(2, 95) ;
LV_ModifyCol(3, 170)  ;
LV_ModifyCol(4, 170)  ;
LV_ModifyCol(5, "40 Integer" "Integer Right")  ;
LV_ModifyCol(6, 95)  ;


Gui, Font, S12 CDefault W400, Malgun Gothic

Gui, Add, Button, x50 y450 w100 h50 vN5_1 gN5_1, N5_1
Gui, Add, Button, x+4 w100 h50 gN4_1 vN4_1, N4_1
Gui, Add, Button, x+4 w100 h50 gN3_1 vN3_1, N3_1

Gui, Add, Button, x+120 w100 h50 gN2_1 vN2_1, N2_1
Gui, Add, Button, x+2 w100 h50 gN1_1 vN1_1, N1_1
;~ Gui, Add, Button, x+22 w40 h40 gM1_1 vM1_1, M1_1



Gui, Add, Button, x800 y620 w100 h50 vR1_1 gR1_1, R1_1
Gui, Add, Button, x+4 w100 h50 gR2_1 vR2_1, R2_1
Gui, Add, Button, x+4 w100 h50 gR3_1 vR3_1, R3_1

Gui, Add, Button, x50 y620 w100 h50 vO4_1 gO4_1, O4_1
Gui, Add, Button, x+4 w100 h50 gO3_1 vO3_1, O3_1
Gui, Add, Button, x+4 w100 h50 gO2_1 vO2_1, O2_1
Gui, Add, Button, x+4 w100 h50 gO1_1 vO1_1, O1_1





Gui, Add, Button, x1000 y50 w100 h50  vP6_1 gP6_1, P6_1
Gui, Add, Button, y+2 w100 h50 gP5_1 vP5_1, P5_1
Gui, Add, Button, y+2 w100 h50 gP4_1 vP4_1, P4_1
Gui, Add, Button, y+2 w100 h50 gP3_1 vP3_1, P3_1
Gui, Add, Button, y+2 w100 h50 gP2_1 vP2_1, P2_1
Gui, Add, Button, y+2 w100 h50 gP1_1 vP1_1, P1_1



Gui, Add, Button, x800 y260 w100 h50  vQ3_1 gQ3_1, Q3_1
Gui, Add, Button, y+2 w100 h50 gQ2_1 vQ2_1, Q2_1
Gui, Add, Button, y+2 w100 h50 gQ1_1 vQ1_1, Q1_1




Gui, Font, S28 CDefault W400 cred, Malgun Gothic
Gui, Add, text, x832 y497 W400 h55 vload3 backgroundtrans, Reading DataBase

Gui, Tab, `      EDSM`       ,,




	workdir = \\192.168.0.1\hdd1\일정표 최근\일정표220730
    edsmtoday = %a_now%
    ;~ edsmtoday += -1, days <<< ???
    FormatTime, edsmtoday, %edsmtoday%, yyyy-MM-dd

    containr = % workdir "\일일재고관리\A" edsmtoday "_B체크 중.CSV"

;~ MsgBox, % containr
    if FileExist(containr)
    {

    FileRead, dataedsm, %containr%
        if not ErrorLevel  ; 성공적으로 적재됨.
        {
            ;~ ; SoundPlay, %A_ScriptDir%\sound\soundopen.mp3
        }
        else
        {
            ; SoundPlay, %A_ScriptDir%\sound\초기화중.mp3
            MsgBox , 262160, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
            ExitApp
            return
        }

    }
    else
    {
        MsgBox , 262160, 문제발생, 읽기 실패`n오늘 체크할 EDSM이 없습니다, 2
        ExitApp
        return
    }

Gui, Font, S15 CDefault W400 c0xFF2211, Malgun Gothic
;~ gui, Add, progress, smooth y+10 w730 h35 cCCCCFF vPG2, 0
Gui, Add, button, x20 y40 w90 h30 c0xFF2211 v저장save g저장save, 저장
Gui, Add, button, x+0 w90 h30 c0xFF2211 v상태close g상태close, 닫기
Gui, Font, S12 CDefault W400, Malgun Gothic

Gui, Add, Edit, x20 y+40 w140 h30 c0xFF2211 vedsmpdt, PDT CODE
Gui, Add, Edit, x+10 w30 h30 c0xFF2211 vedsmnum, No
Gui, Add, button, x20 y+30 w180 h60 c0xFF2211 gedsmfind, ◧ RFID체크

Gui, Add, button, x20 y+30 w90 h60 c0xFF2211 +center gedsmcheck, ◎ 체크`n확인
Gui, Add, button, x+0 w90 h60 c0xFF2211 gedsmcancel, X 체크`n취소

Gui, Font, S15 CDefault W400, Malgun Gothic
Gui, Add, ListView,  x+20 y40 w1020 h640 grid vLVedsm1 gLVedsm1 AltSubmit hwndHLVedsm1 -ReadOnly WantF2 -Multi NoSortHdr, 체크|상품코드|품명|규격|단위|현재고



    ;~ GuiControl,, PG, +10

;~ Gui, Font, S13 CDefault W400 c0xFF2211, Malgun Gothic

;~ GUI, Show, x820 y0, %상태%





Gui, ListView, LVedsm1
LV_ModifyCol(1, "60 Integer" "Integer center")
LV_ModifyCol(2, 120)
LV_ModifyCol(3, 310)
LV_ModifyCol(4, 310)
LV_ModifyCol(5, 80)
LV_ModifyCol(6, "80 Integer" "Integer Right")



GuiControl, hide, load1
GuiControl, hide, load2
GuiControl, hide, load3
GuiControl, hide, load4
GuiControl, hide, load5
GuiControl, hide, load6


loop, parse, dataedsm, `n
{
	x:=[]
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	LV_Add("", x*)
}

Gui, Show, x0 y0 w1280 h730, %WINTITLE%
GoSub, UpdatePresetList


return


리스트변경:
    GuiControl, , frmSAVEDPRESET, |  ; update the control
    ;~ GuiControl, , frmSAVEDPRESET, % "|" TR1  ; update the control
return

radio1:
{
            GuiControlGet, highlight1, pos, frmSAVEDPRESET
            highlight1X := highlight1X - 26
            highlight1Y := highlight1Y - 35
            highlight1W := highlight1W + 18
            GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W830 h48
            qrloca=1
            Sleep, 10
            GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W830 h48
}
return
radio2:
{
    ANU=2
    gosub, radioloop
}
return
radio3:
{
    ANU=3
    gosub, radioloop
}
return
radio4:
{
    ANU=4
    gosub, radioloop
}
return
radio5:
{
    ANU=5
    gosub, radioloop
}
return
radio6:
{
    ANU=6
    gosub, radioloop
}
return
radio7:
{
    ANU=7
    gosub, radioloop
}
return
radio8:
{
    ANU=8
    gosub, radioloop
}
return
radio9:
{
    ANU=9
    gosub, radioloop
}
return


radioloop:
{
        GuiControlGet, highlight1, pos, %ANU%RFID1
        highlight1X := highlight1X - 26
        highlight1Y := highlight1Y - 35
        highlight1W := highlight1W + 18
        GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W830 h48
        qrloca:=ANU
        Sleep, 10
        GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W830 h48

return
}
return










Bt3: ;QR > 로케이션
{
;~ GuiControlGet, btread, FocusV
;~ run, %A_ScriptDir%\%WINTITLE%.ahk

리더기4:
{

    ret := IME_CHECK("A")
    if %ret% <> 0           ; 1 means IME is in Hangul(Korean) mode now.
        {
	          ;~ Send, {Esc}
            Send, {vk15}    ;한글인 경우 Esc키를 입력하고 한영키를 입력해 준다.
        }
    else if %ret% = 0       ; 0 means IME is in English mode now.
        {
	          ;~ Send, {Esc}     ;영문인 경우 Esc키만 입력한다.
        }


;~ GuiControl, focus, btread1
ControlFocus, edit81, %WinTitle%
;~ Sleep, 1000
;~ return
	;~ WinWait, %WINTITLE%,
	;~ IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
	;~ WinWaitActive, %WINTITLE%,

ToolTip, QR 시작
        ;~ GuiControl, , RFIDREAD3,
        ;~ GuiControl, , RFIDREAD2,
        ;~ GuiControl, , RFIDREAD1,

        ;~ renumber := RegExReplace(btread, "B", "")
        ;~ renumber := RegExReplace(renumber, "b", "")
        rfidcheck = 1
clipboard =




Loop,60
{
ControlGetText, MyString, edit81, %WINTITLE%





    ;~ RegExMatch(MyString, "(.*)-(.*)", newlocation)
    RegExMatch(MyString, "(.*)-(.*)-(.*)", 3newlocation)


    Sleep, 200
    ;~ 코드길이 := StrLen(MyString)
    if ( 3newlocation2 != "" ) && ( 3newlocation3 = "" ) ; 2차 까지 통과
    {
        gosub, 한영변환
        llll=
        break
    }
    else if ( 3newlocation2 != "" ) && ( 3newlocation3 != "" ) ; 3차 까지 통과
    {
        gosub, 한영변환
        llll=1
        break
    }
    else
    {
        ;~ gosub, 리더기4
    }

    }
    카운트다운 := 60 - A_Index
    ToolTip, % "[ QR > location ]`n남은 시간 : " 카운트다운 "`nnewlocation: " 3newlocation2 "`n2newlocation: " 3newlocation3
}



    GUI, SUBMIT, NOHIDE
    ControlGetText, locaqr, edit81, %WINTITLE%
    ControlSend, edit81, {ctrl Down}a, %WINTITLE%
    ControlSend, edit81, {ctrl Up}{Del}, %WINTITLE%
    Sleep, 100
    ;~ WinKill, %WINTITLE%
    ToolTip,
if (MyString = "")
    return
else
{

    lvget=
    IF (llll = "1") ; 3자리 수 일때
    {

        showloc = % 3newlocation1 "_" 3newlocation2 "_" 3newlocation3

        if(3newlocation1="K1" or 3newlocation1="K2" or 3newlocation1="K3" or 3newlocation1="K4" or 3newlocation1="K5" or 3newlocation1="K6"){
        GuiControl, Choose, tabname, 5
        }else if(3newlocation1="K7" or 3newlocation1="K8" or 3newlocation1="K9" or 3newlocation1="K10" or 3newlocation1="K11" or 3newlocation1="K12"){
        GuiControl, Choose, tabname, 6
        }else if(3newlocation1="G14" or 3newlocation1="G13" or 3newlocation1="G12" or 3newlocation1="G11" or 3newlocation1="G10" or 3newlocation1="G9"){
        GuiControl, Choose, tabname, 7
        }else if(3newlocation1="G8" or 3newlocation1="G7" or 3newlocation1="J1" or 3newlocation1="J2" or 3newlocation1="K13"){
        GuiControl, Choose, tabname, 8
        }else{
        }


        ;~ run, speakerlocation.exe
    }
    else
    {

        selectcar := RegExReplace(3newlocation1, "\d")  ; 숫자를 제거합니다.
        selectnum := RegExReplace(3newlocation1, "\D")  ; 엉어를 제거합니다.


        showloc = % 3newlocation1 "_" 3newlocation2
        if(selectcar="A" or selectcar="B" or selectcar="C" or selectcar="D" or selectcar="E" or selectcar="F" or selectcar="G" or selectcar="H"){
        GuiControl, Choose, tabname, 2
        }else if(selectcar="I" or selectcar="J" or selectcar="K" or selectcar="L" or selectcar="M"){
        GuiControl, Choose, tabname, 3
        }else if(selectcar="N" or selectcar="O" or selectcar="P" or selectcar="Q" or selectcar="R"){
        GuiControl, Choose, tabname, 4
        }else{
        }

    }

}
MsgBox, % "3newlocation2:"3newlocation2 "`n3newlocation3:"  3newlocation3  "`nllll:" llll "`nshowloc:" showloc        ;;;;;;;;;;;;;;;;;;       ;;;;;;;;;;;;;;;;;;       ;;;;;;;;;;;;;;;;;;       ;;;;;;;;;;;;;;;;;;       ;;;;;;;;;;;;;;;;;;       ;;;;;;;;;;;;;;;;;;       ;;;;;;;;;;;;;;;;;;       ;;;;;;;;;;;;;;;;;;

    gosub, %showloc%
    clipboard =
    rfidcheck =
    서브리딩 =
    brandnew =
    카드기록삭제 =
return
}






qrcode2:   ;;; 큐알코드 에디트에 문자열 입력시

    Gui, submit, nohide
Sleep, 1000
    mystring:=qrcode
    ;~ MsgBox, % qrcode
gosub, 한영변환
    GuiControl,, PG, +15
    ;~ qrcode := mystring
    return
    GuiControl, , qrcode, %mystring%
    ;~ Gui, submit, nohide

    RegExMatch(mystring, "(.*)-(.*)-(.*)", q)
    q11 := RegExReplace(q1, "\d")
    q12 := RegExReplace(q1, "\D")

    qeditnum1 := ( qrloca * 7 ) - 4
    qeditnum2 := qeditnum1 + 1
    qeditnum3 := qeditnum1 + 2
    qeditnum4 := qeditnum1 + 3




    ControlSetText, edit%qeditnum1%, %q11%, %WINTITLE%
    ControlSetText, edit%qeditnum2%, %q12%, %WINTITLE%
    ControlSetText, edit%qeditnum3%, %q2%, %WINTITLE%
    ControlSetText, edit%qeditnum4%, %q3%, %WINTITLE%

    ;~ MsgBox, % qeditnum1 "\" q11 q12 q2 q3
;~ winkill, QRCODE
    GuiControl,, PG, 100
Sleep, 1000
    GuiControl,, PG, 0

return




정렬이전:
{
    Gui, submit, nohide
    lvget=
    showloc = K1_2_1

    RegExMatch(showloc, "(.*)_(.*)", newlocation)
    RegExMatch(showloc, "(.*)_(.*)_(.*)", 2newlocation)

    IF (2newlocation3 = "") ; 2자리 수 일때
    {
        ;~ showloc = % newlocation1 "-" newlocation2 "-"

        selectcar := RegExReplace(newlocation1, "\d")  ; 숫자를 제거합니다.
        selectnum := RegExReplace(newlocation1, "\D")  ; 엉어를 제거합니다.
        ;~ MsgBox, % selectcar
        if(selectcar="A" or selectcar="B" or selectcar="C" or selectcar="D" or selectcar="E" or selectcar="F" or selectcar="G" or selectcar="H"){
        GuiControl, Choose, tabname, 2
        }else if(selectcar="I" or selectcar="J" or selectcar="K" or selectcar="L" or selectcar="M"){
        GuiControl, Choose, tabname, 3
        }else if(selectcar="N" or selectcar="O" or selectcar="P" or selectcar="Q" or selectcar="R"){
        GuiControl, Choose, tabname, 4
        }else{
        }
        ;~ run, speakerlocation.exe
    }
    else
    {
        ;~ showloc = % 2newlocation1 "-" 2newlocation2 "-" 2newlocation3

        ;~ 2selectcar := RegExReplace(2newlocation1, "\d")  ; 숫자를 제거합니다.
        ;~ 2selectnum := RegExReplace(2newlocation1, "\D")  ; 엉어를 제거합니다.

        ;~ MsgBox, % 2newlocation1
        if(2newlocation1="K1" or 2newlocation1="K2" or 2newlocation1="K3" or 2newlocation1="K4" or 2newlocation1="K5" or 2newlocation1="K6"){
        GuiControl, Choose, tabname, 5
        }else if(2newlocation1="K7" or 2newlocation1="K8" or 2newlocation1="K9" or 2newlocation1="K10" or 2newlocation1="K11" or 2newlocation1="K12"){
        GuiControl, Choose, tabname, 6
        }else if(2newlocation1="G14" or 2newlocation1="G13" or 2newlocation1="G12" or 2newlocation1="G11" or 2newlocation1="G10" or 2newlocation1="G9"){
        GuiControl, Choose, tabname, 7
        }else if(2newlocation1="G8" or 2newlocation1="G7" or 2newlocation1="J1" or 2newlocation1="J2" or 2newlocation1="K13"){
        GuiControl, Choose, tabname, 8
        }else{
        }
    }



    ;~ MsgBox, % showloc


    gosub, %showloc%

}
return

;~ qrcode

정렬다음:
{
    mute=1
    GuiControl,, PG, +15
    ;~ gosub, SavePreset
    Sleep, 100
    GuiControl,, PG, +40
    GuiControlGet, 큐알순서
    GuiControlGet, qrcode
    ;~ Gui, submit, nohide
;~ MsgBox, , , % "1`n큐알순서:" 큐알순서 "`nqrcode:" qrcode "`n플큐알순서:" 플큐알순서, 2
gosub, 한영변환
    ;~ GuiControl, , qrcode, %mystring%
    ;~ ComObjCreate("SAPI.SpVoice").Speak(플큐알순서 "번째 줄 검색")
    GuiControl,, PG, +15
gosub, btread1
    GuiControl,, PG, +15
    ;~ Gui, submit, nohide
    ;~ GuiControlGet, qrcode
    RegExMatch(qrcode, "(.*)-(.*)-(.*)", startq)
    startq11 := RegExReplace(startq1, "\d")
    startq12 := RegExReplace(startq1, "\D")

;~ MsgBox, , , % "2`nstartq11:" startq11 "`nstartq12:" startq12, 2
    Loop, 9
    {
        IF (radio%A_Index%="1"){
            GuiControl, , lo%A_Index%_1, %startq11%
            GuiControl, , lo%A_Index%_2, %startq12%
            GuiControl, , lo%A_Index%_3, %startq2%
            GuiControl, , lo%A_Index%_4, %startq3%
            break
        }
    }

    플큐알순서 := 큐알순서 + 1
    플큐알순서2 := 플큐알순서 + 1
    startqrcode := startq1 "-" startq2 "-" 플큐알순서

    GuiControl, , 큐알순서, %플큐알순서%
    GuiControl, , 정렬다음, %플큐알순서%번째`n줄 ▶

    GuiControl,, PG, 100
    GuiControl, , qrcode, %startqrcode%
    Sleep, 100
    ;~ gosub, qrcode2
gosub, SavePreset
    GuiControl,, PG, 0
}
return







정렬멈춤:
{
        GuiControl,, PG, +15
    gosub, SavePreset
        GuiControl,, PG, +40
    GuiControl, disable, 정렬이전
    GuiControl, disable, 정렬다음

    GuiControl, , 큐알순서,
    ;~ GuiControl, , btcode,`
    ControlSetText, edit81, , %WINTITLE%
        GuiControl,, PG, +15
    ControlSetText, edit82, , %WINTITLE%
        GuiControl,, PG, 105
    Sleep, 100
        GuiControl,, PG, 0
    GuiControl, , 정렬다음, 1 ▶
}
return



정렬시작:
{
    GuiControl, enable, 정렬이전
    GuiControl, enable, 정렬다음
    ;~ GuiControl, , 큐알순서, 1
    플큐알순서 = 1
    GuiControl, , 큐알순서, 1
    GuiControl, , 정렬다음, 1번째`n줄 ▶
    gosub, 로캐이션정렬
    Sleep, 100
    ;~ gosub, locachange
}
return



로캐이션정렬:
{
    lvget=2
    rfidcheck = 3
    2selectedloaction =

; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

        ;~ WinMinimize, 화상 키보드
    GuiControl, Choose, tabname, 2
    GuiControl,, PG, +15
    ;~ gosub, LVlocation
}
return




locachange:

gui, l:destroy
gui, l:Default
gui, l:-sysmenu
gui, l:+alwaysontop
Gui, Font, S13 CDefault w700, Malgun Gothic

Gui, l:Add, Button, x45 y20  w100 h40 gll1, 변환후 저장
Gui, l:Add, Button, x+10 w100 h40 gll2, 닫기



Gui, l:Add, Text, x20 y+5 w20 h40 vl#1 Backgroundtrans, #1
Gui, l:Add, Edit, x+5 w170 h40 cE7141B vn1LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 1
Gui, l:Add, Text,x20 y+5 w20 h40 vl#2 backgroundtrans, #2
Gui, l:Add, Edit,  x+5  w170 h40 cE7141B vn2LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 2
Gui, l:Add, Text,x20 y+5 w20 h40 vl#3 backgroundtrans, #3
Gui, l:Add, Edit,x+5  w170 h40 cE7141B vn3LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 3
Gui, l:Add, Text,x20 y+5 w20 h40 vl#4 backgroundtrans, #4
Gui, l:Add, Edit, x+5  w170 h40 cE7141B vn4LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 4
Gui, l:Add, Text,x20 y+5 w20 h40 vl#5 backgroundtrans, #5
Gui, l:Add, Edit,x+5  w170 h40 cE7141B vn5LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 5
Gui, l:Add, Text, x20y+5 w20 h40 vl#6 backgroundtrans, #6
Gui, l:Add, Edit, x+5   w170 h40 cE7141B vn6LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 6
Gui, l:Add, Text,x20 y+5 w20 h40 vl#7 backgroundtrans, #7
Gui, l:Add, Edit,x+5   w170 h40 cE7141B vn7LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 7
Gui, l:Add, Text,x20 y+5 w20 h40 vl#8 backgroundtrans, #8
Gui, l:Add, Edit, x+5  w170 h40 cE7141B vn8LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 8
Gui, l:Add, Text,x20 y+5 w20 h40 vl#9 backgroundtrans, #9
Gui, l:Add, Edit,x+5   w170 h40 cE7141B vn9LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 9
Gui, l:Add, Text,x20 y+5 w20 h40 vl#10 backgroundtrans, #10
Gui, l:Add, Edit,x+5   w170 h40 cE7141B vn10LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 10


2번열=300


Gui, Font, S20 CDefault w700, Malgun Gothic
Gui, l:Add, Edit, Uppercase readonly x335 y20 w90 h40 vRL1 Cred +Right, %newlocation1%
Gui, l:Add, text, x+0 y20 w15 h40 Cred +center, -
Gui, l:Add, Edit, Uppercase readonly x+10 y20 w90 h40 vRL2 Cred +Left, %newlocation2%


Gui, Font, S13 CDefault w700, Malgun Gothic
Gui, l:Add, Text, x%2번열% y65 w35 h40 vl#11 Backgroundtrans, #11
Gui, l:Add, Edit, x+0 w170 h40 cE7141B vn11LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w35 h40 gldelloca, 11
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#12 backgroundtrans, #12
Gui, l:Add, Edit,  x+0  w170 h40 cE7141B vn12LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w35 h40 gldelloca, 12
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#13 backgroundtrans, #13
Gui, l:Add, Edit,x+0  w170 h40 cE7141B vn13LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w35 h40 gldelloca, 13
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#14 backgroundtrans, #14
Gui, l:Add, Edit, x+0  w170 h40 cE7141B vn14LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w35 h40 gldelloca, 14
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#15 backgroundtrans, #15
Gui, l:Add, Edit,x+0  w170 h40 cE7141B vn15LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w35 h40 gldelloca, 15
Gui, l:Add, Text, x%2번열% y+5 w35 h40 vl#16 backgroundtrans, #16
Gui, l:Add, Edit, x+0   w170 h40 cE7141B vn16LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w35 h40 gldelloca, 16
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#17 backgroundtrans, #17
Gui, l:Add, Edit,x+0   w170 h40 cE7141B vn17LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w35 h40 gldelloca, 17
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#18 backgroundtrans, #18
Gui, l:Add, Edit, x+0  w170 h40 cE7141B vn18LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w35 h40 gldelloca, 18
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#19 backgroundtrans, #19
Gui, l:Add, Edit,x+0   w170 h40 cE7141B vn19LOCA1 gll4 Uppercase
Gui, l:Add, Button, x+0   w35 h40 gldelloca, 19

Gui, Font, S12 w700 cred, Malgun Gothic
Gui, l:Add, Text,x%2번열% y+5 w200 h100 backgroundtrans, ※ 주의사항`n- 카드번호만 변경합니다. 로케이션 및 다른 정보 저장시 항시 저장을 누르세요!!!

Gui, Font, S13 CDefault w400, Malgun Gothic

Gui,l:show, x978 y51 , 변환 하기
GuiControl, focus, n1LOCA1
return

ldelloca:   ; 에디트 값 지우기
GuiControlGet, loorder, FocusV
GuiControl, , n%loorder%LOCA1,
;~ MsgBox % OutputVar
return





ll1:
Gui, l:submit, nohide
L=0
Loop, 19
{
	L++
	로카값1 := n%L%LOCA1
	if(로카값1=""){
		break
	}else{

	Loop, % Rows
		{
		 founds:=CSV_Search("data1",로카값1,A_Index)
		 if founds=0
			break
		 founds:=StrSplit(founds,",")
			lx := founds[1]
			ly := founds[2] + 1

			LML := RL1 "-" RL2 "-" L
			CSV_ModifyCell("data1", LML, lx,ly) ; change E350 to Mustang

			r2:=CSV_ReadCell("data1",lx,ly) ; s3

			;~ r0:=CSV_ReadCell("data1",founds[1],1) ; original  rfid
			;~ r29:=CSV_ReadCell("data1",founds[1],29) ; 상품명
			;~ r30:=CSV_ReadCell("data1",founds[1],30) ; 규격
			;~ r31:=CSV_ReadCell("data1",founds[1],31) ; pdt code

			MsgBox, % r2

		}
	}
}

        csv_save(csvfile1,"data1")
		Sleep, 1000
        csv_Load(csvfile1,"data1")

return

ll2:


			;~ r111:=CSV_ReadCell("data1",12,2) ; s3
			;~ r222:=CSV_ReadCell("data1",15,2) ; s3
;~ MsgBox, % r111 "/" r222
WinKill, 변환 하기
gui, l:hide
gui, l:submit
return



ll4:
Sleep, 1000
Gui, l:submit, nohide
GuiControlGet, lolength, FocusV
RegExMatch(lolength, "n(.*)LOCA1", lolength)
MyString := n%lolength1%LOCA1
    Sleep, 800
    코드길이l := StrLen(MyString)
        ;~ MsgBox, % "코드길이l:" 코드길이l "`nlolength1:" lolength1 "`nlolength:" lolength "`nn%lolength1%LOCA1:" n%lolength1%LOCA1 "`n로카값:" 로카값 "`n로카값1:" 로카값1
    if ( 코드길이l = 10 )
    {
        gosub, 한영변환
        GuiControl, , n%lolength1%LOCA1, %MyString%
        Sleep, 200
        Send, {tab 2}
    }
    else
    {
        GuiControl, , n%lolength1%LOCA1,
        SoundBeep, 400, 500
    }

return





recolor:
{


    Gui, submit, nohide
    if(qrloca="1"){
        ControlSend, Combobox1, {ctrl Down}a{ctrl Up}%frmSAVEDPRESET%, %WINTITLE%
    }
    else
    {
        newcolor := ( qrloca - 1 ) * 7 + 1
        Gui, submit, nohide
        ControlGetText, 색깔검색, edit%newcolor%, %WINTITLE%
        ControlSend, Combobox1, {ctrl Down}a{ctrl Up}%색깔검색%, %WINTITLE%
    }
        ;~ GuiControl, , frmSAVEDPRESET, |  ; delete list
        ;~ gosub, UpdatePresetList


}
return


RFID삭제:
{
    카드기록삭제=1
    gosub, Bt2
}

return




Qr:
/*
;~ MsgBox, , , %qrloca%, 1
if (qrloca=""){
    MsgBox, , ,특정 라인이 지정되지 않았습니다,1
    return
}
else
{
gui, q:destroy
gui, q:Default
gui, q:+alwaysontop
Gui, Font, S100 CDefault w700, Malgun Gothic




;~ Gui, Font, S13 CDefault w400, Malgun Gothic

Gui, q:show, , QRCODE



}

*/
return




Bt:
ControlSend, combobox1, {Ctrl Down}a{Ctrl Up}, %WINTITLE%
GuiControl, focus, frmSAVEDPRESET

return











change:

gui, c:destroy
gui, c:Default
gui, c:-sysmenu
gui, c:+alwaysontop
Gui, Font, S13 CDefault w700, Malgun Gothic

Gui, c:Add, Button, x45 y20  w100 h40 gcc1, 변환후 저장
Gui, c:Add, Button, x+10 w100 h40 gcc2, 닫기
Gui, c:Add, Text, x20 y+5 w20 h40 vn#1 Backgroundtrans, #1
Gui, c:Add, Edit, x+5 w170 h40 cE7141B vn1RFID1
Gui, c:Add, Button, x+0   w40 h40 grefridread
Gui, c:Add, Text,x20 y+20 w20 h40 vn#2 backgroundtrans, #2
Gui, c:Add, Edit,  x+5  w170 h40 cE7141B vn2RFID1
Gui, c:Add, Button, x+0   w40 h40 grefridread
Gui, c:Add, Text,x20 y+5 w20 h40 vn#3 backgroundtrans, #3
Gui, c:Add, Edit,x+5  w170 h40 cE7141B vn3RFID1
Gui, c:Add, Button, x+0   w40 h40 grefridread
Gui, c:Add, Text,x20 y+5 w20 h40 vn#4 backgroundtrans, #4
Gui, c:Add, Edit, x+5  w170 h40 cE7141B vn4RFID1
Gui, c:Add, Button, x+0   w40 h40 grefridread
Gui, c:Add, Text,x20 y+5 w20 h40 vn#5 backgroundtrans, #5
Gui, c:Add, Edit,x+5  w170 h40 cE7141B vn5RFID1
Gui, c:Add, Button, x+0   w40 h40 grefridread
Gui, c:Add, Text, x20y+5 w20 h40 vn#6 backgroundtrans, #6
Gui, c:Add, Edit, x+5   w170 h40 cE7141B vn6RFID1
Gui, c:Add, Button, x+0   w40 h40 grefridread
Gui, c:Add, Text,x20 y+5 w20 h40 vn#7 backgroundtrans, #7
Gui, c:Add, Edit,x+5   w170 h40 cE7141B vn7RFID1
Gui, c:Add, Button, x+0   w40 h40 grefridread
Gui, c:Add, Text,x20 y+5 w20 h40 vn#8 backgroundtrans, #8
Gui, c:Add, Edit, x+5  w170 h40 cE7141B vn8RFID1
Gui, c:Add, Button, x+0   w40 h40 grefridread
Gui, c:Add, Text,x20 y+5 w20 h40 vn#9 backgroundtrans, #9
Gui, c:Add, Edit,x+5   w170 h40 cE7141B vn9RFID1
Gui, c:Add, Button, x+0   w40 h40 grefridread

Gui, Font, S12 w700 cred, Malgun Gothic
Gui, c:Add, Text,x20 y+5 w200 h100 backgroundtrans, ※ 주의사항`n- 카드번호만 변경합니다. 로케이션 및 다른 정보 저장시 항시 저장을 누르세요!!!
Gui, c:submit, nohide
GuiControl, c:, n1RFID1, %frmSAVEDPRESET%
GuiControl, c:, n2RFID1, %2RFID1%
GuiControl, c:, n3RFID1, %3RFID1%
GuiControl, c:, n4RFID1, %4RFID1%
GuiControl, c:, n5RFID1, %5RFID1%
GuiControl, c:, n6RFID1, %6RFID1%
GuiControl, c:, n7RFID1, %7RFID1%
GuiControl, c:, n8RFID1, %8RFID1%
GuiControl, c:, n9RFID1, %9RFID1%









Gui, Font, S13 CDefault w400, Malgun Gothic

Gui,c:show, x978 y51 , 변환 하기
return


cc1:
{

Gui, c:submit, nohide
ControlGetText, 바뀐메인, edit1, 변환 하기

CSV_ModifyCell("data1", n1RFID1,Result[1],1) ; change E350 to Mustang

savenum = 4
AA = 2
GuiControl,, PG, +15
Loop, 8
{
    CSV_ModifyCell("data1", n%AA%RFID1,Result[1],savenum) ; change E350 to Mustang
    savenum := savenum + 3
    AA++
}

    ;~ GuiControl, , frmSAVEDPRESET, |  ; delete list
CSV_Save(csvfile1,"data1",1)
data1=

GuiControl,, PG, +15
CSV_Load(csvfile1,"data1")

GuiControl,, PG, +15


gosub, UpdatePresetList
;~ ControlClick, button74, %WINTITLE%
WinKill, 변환 하기
gui, c:hide
gui, c:submit


GuiControl,, PG, +15
Sleep, 100
    ;~ GuiControl, , frmSAVEDPRESET, |  ; delete list


;~ Sleep, 1000
GuiControl,, PG, +15
SoundPlay, %A_ScriptDir%\sound\저장완료.mp3

GuiControl,, PG, 100
MsgBox, 262196,,완료,0.5
        ControlSend, Combobox1, {ctrl Down}a{ctrl Up}%바뀐메인%, %WINTITLE%
        ;~ ControlSend, combobox1, %바뀐메인%, %WINTITLE%

GuiControl,, PG, 0
}
Return


cc2:
WinKill, 변환 하기
gui, c:hide
gui, c:submit
return



;~ 상품검색`  |||||


tabname:
Gui, submit, nohide
Sleep, 10
if (tabname = "상품검색`  "){
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinActivate, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
        ;~ Run, osk.exe
    ;~ }

}

else if (tabname = "▼평면[내부]`  "){
gosub, mapping


            ;~ GuiControl, Choose, tabname, 2
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinMinimize, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
    ;~ }
}

else if (tabname = "▼평면[철물]`  "){
gosub, mapping
            ;~ GuiControl, Choose, tabname, 3
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinMinimize, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
    ;~ }
}

else if (tabname = "▽[K1~K6]`  "){
gosub, mapping
            ;~ GuiControl, Choose, tabname, 3
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinMinimize, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
    ;~ }
}

else if (tabname = "▽[K7~K12]`  "){
gosub, mapping
            ;~ GuiControl, Choose, tabname, 3
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinMinimize, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
    ;~ }
}

else if (tabname = "▽[G14~G9]`  "){
gosub, mapping
            ;~ GuiControl, Choose, tabname, 4
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinMinimize, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
    ;~ }
}

else if (tabname = "▽[G8~7  J4~2]`  "){
gosub, mapping
            ;~ GuiControl, Choose, tabname, 4
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinMinimize, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
    ;~ }
}


else if (tabname = "▼평면[외부]`  "){
gosub, mapping
            ;~ GuiControl, Choose, tabname, 4
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinMinimize, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
    ;~ }
}

else if (tabname = "`      EDSM`       "){
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinMinimize, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
        ;~ WinMinimize, 화상 키보드
    ;~ }

    GuiControl, focus, LVedsm1

}

else
{
	;~ Gui, submit, nohide
}
;~ gui, restore
GuiControl, focus, 실제낱장
return







miner1:
min=1
gosub, miners
return
miner2:
min=2
gosub, miners
return
miner3:
min=3
gosub, miners
return
miner4:
min=4
gosub, miners
return
miner5:
min=5
gosub, miners
return
miner6:
min=6
gosub, miners
return
miner7:
min=7
gosub, miners
return
miner8:
min=8
gosub, miners
return
miner9:
min=9
gosub, miners
return


miners:
{
GuiControl, , %min%RFID1,
GuiControl, , %min%RFID2,
GuiControl, , lo%min%_1,
GuiControl, , lo%min%_2,
GuiControl, , lo%min%_3,
GuiControl, , lo%min%_4,
GuiControl, , %min%RFID3,

Sleep, 100

gosub, delrfid  ; 밴딩해체 라인정렬

return
}



키보드열기:
;~ Run, osk.exe
return


num1:   ;키보드 버튼 제거
;~ GuiControl, disable, A4_1
;~ ; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3
selectedloaction1 =
GuiControlget , selectedloaction, focusv,
MouseGetPos, , , id2, control
WinGetTitle, title, ahk_id %id2%
WinGetClass, class, ahk_id %id2%
ControlGetText, selectedloaction , %control%, %Title%

if (selectedloaction = "<-")
    {
        curCtrl1 := RegExReplace(curCtrl, "\d")  ; 숫자를 제거합니다.
        ;~ curCtrl1 := curCtrl
        if (curCtrl1 = "button") or (curCtrl1 = "sysListview")
        {
            ControlFocus, %curCtrl2%, %Wintitile%
            ;~ ControlFocus, %curCtrl1%, %Wintitile%
            ControlSend, %curCtrl2%, {Backspace}, %Wintitile%
        }
        else
        {

            curCtrl2 := curCtrl
            ControlFocus, %curCtrl2%, %Wintitile%
            ;~ ControlFocus, %curCtrl1%, %Wintitile%
            ControlSend, %curCtrl2%, {Backspace}, %Wintitile%
        }
    }
else if (selectedloaction = "DEL")
    {
        ControlGetFocus, Focused , %Wintitile%
        ControlFocus, %Focused%, %Wintitile%
        Send, {Del}
    }
else if (selectedloaction = "RE")
    {
        ControlGetFocus, Focused , %Wintitile%
        ControlFocus, %Focused%, %Wintitile%
        Send, {ctrl Down}a{ctrl up}{Del}
    }

else
    {
        curCtrl1 := RegExReplace(curCtrl, "\d")  ; 숫자를 제거합니다.
        ;~ curCtrl1 := curCtrl
        if (curCtrl1 = "button") or (curCtrl1 = "sysListview")
        {
            ControlFocus, %curCtrl2%, %Wintitile%
            ;~ ControlFocus, %curCtrl1%, %Wintitile%
            ControlSend, %curCtrl2%, %selectedloaction%, %Wintitile%
        }
        else
        {

            curCtrl2 := curCtrl
            ControlFocus, %curCtrl2%, %Wintitile%
            ;~ ControlFocus, %curCtrl1%, %Wintitile%
            ControlSend, %curCtrl2%, %selectedloaction%, %Wintitile%
        }


    }
;~ tooltip, %curCtrl%`n%curCtrl1%`n%curCtrl2%
;~ MsgBox, %selectedloaction%`n%Focused%`n%control%`n%Title%`n%curCtrl%


;~ GuiControl, enable, A4_1
;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

return



;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

EDSM:



	workdir = \\192.168.0.1\hdd1\일정표 최근\일정표220730
    FormatTime, edsmtoday, YYYYMMDDHH, yyyy-MM-dd
    상태 = EDSM_체크리스트
    ;~ edsmtoday = 2023-08-01


if WinExist(상태)
{
    WinActivate, %상태%
    return
}
else
{

}


    containr = % workdir "\일일재고관리\A" edsmtoday "_B체크 중.CSV"

;~ MsgBox, % containr
    if FileExist(containr)
    {

    FileRead, dataedsm, %containr%
        if not ErrorLevel  ; 성공적으로 적재됨.
        {
            ;~ ; SoundPlay, %A_ScriptDir%\sound\soundopen.mp3
        }
        else
        {
            ; SoundPlay, %A_ScriptDir%\sound\초기화중.mp3
            MsgBox , 262160, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
            ;~ FileRead, data, %contain%
            return

        }

    }
    else
    {
        MsgBox , 262160, 문제발생, 읽기 실패`n오늘 체크할 EDSM이 없습니다, 2
        return
    }

READedsm:
{

;~ ; SoundPlay, %A_ScriptDir%\sound\열때.mp3
Gui, %상태%:Destroy
Gui, %상태%:Default
Gui, %상태%:-SysMenu
Gui, %상태%:+alwaysontop
Gui, %상태%Submit, NoHide

Gui, %상태%:Font, S19 CDefault W400 c0xFF2211, Malgun Gothic
;~ gui, %상태%:Add, progress, smooth y+10 w730 h35 cCCCCFF vPG2, 0
Gui, %상태%:Add, button, x545 y5 w90 h40 c0xFF2211 v저장save g저장save, 저장
Gui, %상태%:Add, button, x640 y5 w90 h40 c0xFF2211 v상태close g상태close, 닫기
Gui, %상태%:Font, S16 CDefault W400, Malgun Gothic
Gui, %상태%:Add, ListView, x10 y+10 w730 h463 grid vLVedsm1 gLVedsm1 hwndHLVedsm1 AltSubmit -ReadOnly WantF2 -Multi NoSortHdr, 첵|상품코드|품명|규격|단위|현재고


    ;~ GuiControl,, PG, +10



;~ Gui, %상태%:Font, S13 CDefault W400 c0xFF2211, Malgun Gothic


GUI, %상태%:Show, x820 y0, %상태%



Gui, %상태%:ListView, LVedsm1
LV_ModifyCol(1, 50)
LV_ModifyCol(2, 100)
LV_ModifyCol(3, 200)
LV_ModifyCol(4, 200)
LV_ModifyCol(5, 70)
LV_ModifyCol(6, "90 Integer" "Integer Right")




    loop, parse, dataedsm, `n
    {
        x:=[]
        loop, parse, A_LoopField, CSV
            x.Insert(A_LoopField)
        LV_Add("", x*)
    }



}
return






lo1:
{
lonum = 1
gosub, losum
return
}
lo2:
{
lonum = 2
gosub, losum
return
}
lo3:
{
lonum = 3
gosub, losum
return
}
lo4:
{
lonum = 4
gosub, losum
return
}
lo5:
{
lonum = 5
gosub, losum
return
}
lo6:
{
lonum = 6
gosub, losum
return
}
lo7:
{
lonum = 7
gosub, losum
return
}
lo8:
{
lonum = 8
gosub, losum
return
}
lo9:
{
lonum = 9
gosub, losum
return
}


losum:
{
    Gui, submit, nohide
    if(lo%lonum%_1 = ""){

        GuiControl, , % lonum "RFID2",
        return
    }
    else
    {
        lo%lonum% := lo%lonum%_1 lo%lonum%_2 "-" lo%lonum%_3 "-" lo%lonum%_4
        GuiControl, , % lonum "RFID2", % lo%lonum%
    }
return
}



저장save:
{

    containr1 = % "\\192.168.0.1\hdd1\일정표 최근\일정표220730\일일재고관리\A" edsmtoday "_B체크 중.CSV"
    ;~ containr1 = % "\\192.168.0.1\hdd1\일정표 최근\일정표220730\일일재고관리\A" edsmtoday "_B체크 중.CSV"

errorlevel =

FileDelete, % containr1
Loop,
{
    IF FileExist(root1){
        FileDelete, % root1
        Sleep, 100
		;~ MsgBox, %containr%`n%containr1%

    }
    else
    {
        break
    }
}


;~ FileMove, %containr%, %containr1%, 1
	;~ if errorlevel = 1
	;~ {
		;~ Sleep, 200
		;~ gosub, 저장save
	;~ }
	;~ else
	;~ {
		;~ Sleep, 200
	;~ }
;~ FileDelete, %containr%






Sleep, 200



makefile:
Gui, ListView, LVedsm1
loop, % LV_GetCount() {

	RowNum := A_Index

	loop, 6
		LV_GetText(col%A_Index% , RowNum, a_index)
	FileAppend, % col1 "," col2 "," col3 "," col4 "," col5 "," col6 ", `n", % containr1
	Sleep, 1
    }
	if erorrlevel = 1
	{
		Sleep, 200
		gosub, makefile
	}
	else
	{
		;~ Sleep, 500
	}


		;~ FileMove, % A_WorkingDir "\A" edsmtoday "_B체크 중.CSV", % containr, 1
		Sleep, 10
		; SoundPlay, %A_ScriptDir%\sound\1.mp3

		CSV_Load(containr1, "rootcsv")
		CSV_Save(containr1, "rootcsv", 1)

;~ containr=

        ;~ gosub, UpdatePresetList
Sleep, 100
; SoundPlay, %A_ScriptDir%\sound\1.mp3

SoundPlay, %A_ScriptDir%\sound\저장완료.mp3
;~ MsgBox, 262196,,완료,1
MsgBox, 262192, 알림, 저장 완료됐습니다, 0.8


return
}



상태close:
{
    ;~ WinKill, %상태%
    ;~ Sleep, 1000
    return
}


카드값초기화:
리더횟수 = 20
카드값초기화재시작:
; SoundPlay, %A_ScriptDir%\sound\sound3_1.mp3

WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
Sleep,100
clipboard :=

WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
Sleep,100
ClipWait, 100



Loop
{
    리더횟수 --
    if (리더횟수 = 0)
    {
        ToolTip
        ; SoundPlay, %A_ScriptDir%\sound\시간종료.mp3
        return
    }
    else
    {
        Sleep, 100
        ToolTip, %리더횟수%
    }
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
    else if (코드길이 = )
    {
        gosub, 카드값초기화재시작
    }
    else
    {
        WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
        Sleep, 200
        clipboard :=
        WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
        Sleep,100
        ClipWait, 100
    }

}
;~ MsgBox, , ,5초 끝, 2
        ToolTip
WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 버퍼 비우기(B)
GUI, SUBMIT, NOHIDE
GuiControl, , RFIDREAD3, %MyString%
GuiControl, , RFIDREAD1, %MyString%
GUI, SUBMIT, NOHIDE
    if (RFIDREAD1 = RFIDREAD2)
    {
        gosub, 카드값초기화재시작
    }
    else
    {
        GUI, SUBMIT, NOHIDE
        GuiControl, , RFIDREAD1, %RFIDREAD1%
        Sleep,10
        GuiControl, , RFIDREAD2, %RFIDREAD1%
        Sleep,10
        GuiControl, , RFIDREAD1, %RFIDREAD2%
        Sleep,10

        ;~ GUI, SUBMIT, NOHIDE
        ;~ GuiControl, ChooseString, frmSAVEDPRESET, %RFIDREAD2%
        ;~ ControlSend, Edit1, {space},  WMS_VER2 2.0
        ;~ Sleep, 100

        ;~ gosub, mapping
    }


    ;~ 초기화값 := RFIDREAD2

;~ MsgBox,,,%RFIDREAD2%, 1

ControlGetText, 초기화값 ,edit48, %WINTITLE%




    Loop, parse, projects, `n ;shows sections
    {
    sect := A_LoopField

    ;~ IniRead, status1, 신흥목재재고파악수정.ini, %sect%, 2RFID1, %A_Space%
    ;~ IniRead, status2, 신흥목재재고파악수정.ini, %sect%, 3RFID1, %A_Space%
    ;~ IniRead, status3, 신흥목재재고파악수정.ini, %sect%, 4RFID1, %A_Space%
    ;~ IniRead, status4, 신흥목재재고파악수정.ini, %sect%, 5RFID1, %A_Space%
    ;~ IniRead, status5, 신흥목재재고파악수정.ini, %sect%, 6RFID1, %A_Space%
    ;~ IniRead, status6, 신흥목재재고파악수정.ini, %sect%, 7RFID1, %A_Space%
    ;~ IniRead, status7, 신흥목재재고파악수정.ini, %sect%, 8RFID1, %A_Space%
    ;~ IniRead, status8, 신흥목재재고파악수정.ini, %sect%, 9RFID1, %A_Space%
    ;~ MsgBox %초기화값%`n%status1%`n%status2%`n%status3%`n%status4%`n%status5%`n%status6%`n%status7%`n%status8%`n%status9%









        Loop, 8
        {

            arr := [2, 3, 4, 5, 6, 7, 8, 9]


            서브조회 := arr[A_index] "RFID1"
            서브조회1 := %서브조회%
            숫자 := arr[A_index]
            ;~ IniRead, status, 신흥목재재고파악수정.ini, %sect%, %서브조회1%, %A_Space%
            IniRead, NFC1, 신흥목재재고파악수정.ini, % sect, %숫자%RFID1, %A_Space%
            ;~ IniRead, status, 신흥목재재고파악수정.ini, %sect%, % arr[A_index] "RFID1", %A_Space%
            ;~ MsgBox, % "배열의 첫번째 요소: " arr[1] ", 배열의 두번째 요소: " arr[2]
            ;~ 숫자 := arr[A_index]
;~ MsgBox, ,,%서브조회1%`n`n%NFC1%, 0.5
ToolTip, 서브:%NFC1%`n카드:%초기화값%
            ;~ if (초기화값 = status1) or (초기화값 = status2) or (초기화값 = status3) or (초기화값 = status4) or (초기화값 = status5) or (초기화값 = status6) or (초기화값 = status7) or (초기화값 = status8) or (초기화값 = status9)
            if (초기화값 = NFC1)
            {
                IniRead, keys, 신흥목재재고파악수정.ini, % sect
                IniRead, company, 신흥목재재고파악수정.ini, % sect, 상품명, %A_Space%
                IniRead, remarks, 신흥목재재고파악수정.ini, % sect, 규격, %A_Space%
                IniRead, status, 신흥목재재고파악수정.ini, % sect, 상품코드, %A_Space%
                IniRead, NFC1, 신흥목재재고파악수정.ini, % sect, %숫자%RFID1, %A_Space%

                ;~ IniRead, status, 신흥목재재고파악수정.ini, % sect, 상품코드, %A_Space%
                ;~ MsgBox, 찾음`n%company%`n%remarks%`n%status%`n%숫자%`n%NFC1%

                ;~ IniWrite, %A_Space%, 신흥목재재고파악수정.ini, % sect, %숫자%RFID1
                ;~ IniWrite, % value, %inifile%, %section%, %vname%

                ;~ ControlSend, Edit1, %sect%, %WINTITLE%
                ;~ Sleep, 100
                ;~ GuiControl, ChooseString, frmSAVEDPRESET, %sect%
                ;~ Sleep, 100

                ;~ IniRead, NFC1, 신흥목재재고파악수정.ini, % sect, %숫자%RFID1, %A_Space%

                MsgBox, ,,찾음`n%company%`n%remarks%`n%status%`n%A_LoopField%`n%NFC1%`n%RFIDREAD2%, 2






                GUI, SUBMIT, NOHIDE
                ControlSetText, Edit1, %A_LoopField%, %WINTITLE%
                Sleep, 50
                ControlSend, Edit1, {End}{Space}{Backspace}, %WINTITLE%
                Sleep, 50

                gosub, mapping

                clipboard :=
                ; SoundPlay, %A_ScriptDir%\sound\sound1_1.mp3
                gosub, READINFORMATION
                ; SoundPlay, %A_ScriptDir%\sound\sound9_2.mp3
                gosub, 판별기


                GuiControl, , RFIDREAD1,
                Sleep,10
                GuiControl, , RFIDREAD2,
                Sleep,10
                GuiControl, , RFIDREAD3,
                Sleep,10
                MsgBox,262196,,조회완료,1
                ToolTip
                return
            }
            else
            {
            }
            ;~ MsgBox,
        }

    }
    ;~ gosub, 판별기
MsgBox,262196,,공카드 입니다,1
ToolTip
                ;~ gosub, SavePreset
return




LVedsm1:

Gui, ListView, lvedsm1
    gui, submit, nohide
    rfidcheck = 2

if (A_GuiEvent = "Normal")
;~ if (A_GuiEvent = "DoubleClick")
{
; SoundPlay, %A_ScriptDir%\sound\SFX_Ui07.mp3
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_GetText(OutputVarC, selectRowNum, 2)
          ;~ WH = 0


GuiControl, , edsmnum, %selectRowNum%
GuiControl, , edsmpdt, %OutputVarC%
}
;~ else if (A_GuiEvent = "DoubleClick")
;~ {
    ;~ gosub, edsmfind
;~ }

return



edsmfind:
{
edsm찾기=1
    gui, submit, nohide
OnMessage(0x44, "WM_COMMNOTIFY") ; msg박스 관련된 함수( 버튼이름 바꾸기)

        Loop, % Rows
            {
            foundrows:=CSV_Search("data1",OutputVarC,A_Index)
             if foundrows=0
                break
             foundrows:=StrSplit(foundrows,",")

                foundrows1:=CSV_ReadCell("data1",foundrows[1],1) ; pdt code
                ;~ MsgBox, % foundrows
            }

            GuiControl, Choose, tabname, 1
        ControlSend, Combobox1, {ctrl Down}a{ctrl Up}%foundrows1%, %WINTITLE%
            ;~ GuiControl, choosestring, frmSAVEDPRESET, %foundrows1%
            ;~ gosub, PresetChange




return
}

edsmcheck:
{
    ;~ winkill, 체크박스
    WinWait, %WINTITLE%,
    IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
    WinWaitActive, %WINTITLE%
    ; SoundPlay, %A_ScriptDir%\sound\SFX_Ui02.mp3
    ControlFocus, SysListView328, %WINTITLE%
    Sleep, 200
    send, {f2}
    Sleep, 100
    Send, ◎{ENTER}
    Sleep, 100
    Send, {Down}

    ;~ ControlSend, SysListView328, {F2}, %WINTITLE%
    ;~ Sleep, 2000
    ;~ ControlSend, SysListView328, ◎{ENTER}, %WINTITLE%
    Sleep, 100



    ;~ gosub, EDSM색상


return
}



edsmcancel:
{
    ;~ winkill, 체크박스
    ;~ WinActivate, %상태%
        WinWait, %WINTITLE%,
        IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
        WinWaitActive, %WINTITLE%
    ; SoundPlay, %A_ScriptDir%\sound\SFX_Ui03.mp3
    ControlFocus, SysListView328, %WINTITLE%
    Sleep, 200
    send, {f2}
    Sleep, 100
    Send, {del 5}{Backspace 5}{ENTER}
    ;~ Sleep, 500
    ;~ ControlSend, SysListView328, {F2}, %WINTITLE%
    ;~ Sleep, 2000
    ;~ ControlSend, SysListView328, {del 5}{Backspace 5}{ENTER}, %WINTITLE%
    ;~ gosub, EDSM색상
;~ WinKill, RFID
    ;~ WinSet, AlwaysOnTop , On, %상태%
return
}













EDSM색상:
{
WinSet, Redraw, , ahk_id %HLVedsm1%
   CLVedsm1.OnMessage()

Gui, Submit, NoHide
If (ColorsOn)
   CLVedsm1.OnMessage()
GuiControl, Focus, %HLVedsm1%

Gui, Submit, NoHide
Gui, ListView, LVedsm1
Loop % LV_GetCount()
{
    LV_GetText(RetrievedText, A_Index)
    if (RetrievedText = "◎"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLVedsm1.ROW(A_Index, 0xFF007F, 0xffffff)
	}
	else if (RetrievedText = "△"){
	;~ LV_GetNext(StartingRowNumber, RowType)
	CLVedsm1.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else if (RetrievedText = "★"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLVedsm1.ROW(A_Index, 0x663399, 0xffffff)
	}
	else
	{
		CLVedsm1.ROW(A_Index, 0x%칼라%, 0x000000)
	}
}
GuiControl, Choose, LVedsm1, 0
Gui, %상태%:Restore
return
}


;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


battery:
run, %A_Desktop%\WMS\battery.ahk
return

검색:


Gui, 2:Destroy
	;~ MsgBox, % OutputVar
Gui, 2:Default
Gui, 2:+alwaysontop
;~ Gui, 2:-SysMenu

Gui, Font, S15 CDefault, Malgun Gothic
	Gui, 2:Submit, NoHide
LVArray := []
Gui, 2:Add, Text, x125 y15,검색 :
Gui, 2:Add, Edit, x+10 w600 vSearchTerm g2Search
Gui, 2:Add, button, x+10 w90 h35 g2Search, Enter
;~ Gui, 2:Add, Edit, y+0 h1 w400 vSearchTerm v2Search2
Gui, 2:Add, ListView, grid NoSortHdr sort r15 x10 y+20 w1000 vLVsearch gLVsearch, 열|상품명|규격|메인로케이션|pdt code|rfid code
Gui, 2:ListView, LVsearch ; 출고 끝



Loop, % Rows
	{
	 ;~ found:=CSV_Search("data1",showloc,A_Index)
	 ;~ if found=0
		;~ break
	 ;~ found:=StrSplit(found,",")
        ;~ rr1 := found[2] - 1
        ;~ rr2 := found[2]
        ;~ rr3 := found[2] + 1
        ;~ r1:=CSV_ReadCell("data1",A_Index,rr1) ; R1
        ;~ r2:=CSV_ReadCell("data1",A_Index,rr2) ; L2
        r2:=CSV_ReadCell("data1",A_Index,2) ; s3
        r0:=CSV_ReadCell("data1",A_Index,1) ; original  rfid
        r29:=CSV_ReadCell("data1",A_Index,29) ; 상품명
        r30:=CSV_ReadCell("data1",A_Index,30) ; 규격
        r31:=CSV_ReadCell("data1",A_Index,31) ; pdt code

        ;~ MsgBox, % r29

            LV_Add("", r31, r29, r30, r2, r31, r0)
}

;~ TotalItems := LVArray.Length()
LV_ModifyCol(1, 0)  ;
LV_ModifyCol(2, 310)  ;
LV_ModifyCol(3, 260) ;
LV_ModifyCol(4, 135)  ;
LV_ModifyCol(5, 130)  ;
LV_ModifyCol(6, 140)  ;
Gui, 2:Add, StatusBar, , % "   " . TotalItems . " of " . TotalItems . " Items"
Gui, 2:Show, , 상품/규격 검색
Return


2Search:
Sleep,50
GuiControlGet, SearchTerm
GuiControl, -Redraw, LVsearch
LV_Delete()

Loop, % Rows
	{
	 founds:=CSV_Search("data1",SearchTerm,A_Index)
	 if founds=0
		break
	 founds:=StrSplit(founds,",")
        r2:=CSV_ReadCell("data1",founds[1],2) ; s3
        r0:=CSV_ReadCell("data1",founds[1],1) ; original  rfid
        r29:=CSV_ReadCell("data1",founds[1],29) ; 상품명
        r30:=CSV_ReadCell("data1",founds[1],30) ; 규격
        r31:=CSV_ReadCell("data1",founds[1],31) ; pdt code
        LV_Add("", r31, r29, r30, r2, r31, r0)
    }
GuiControlGet, SearchTerm
GuiControl, +Redraw, LVsearch
Return


;~ change:
;~ {
    ;~ Winwait, 신흥목재 전산프로그램,
    ;~ IfWinNotActive, 신흥목재 전산프로그램,, WinActivate, 신흥목재 전산프로그램,
    ;~ WinWaitActive, 신흥목재 전산프로그램,
;~ }
;~ return


키보드:
{
    ;~ Run, osk.exe
}
return



LVsearch:
{
    GUI, 2:SUBMIT, NOHIDE
    clipboard :=
    Gui, 2:ListView, LVsearch

    if A_GuiEvent = DoubleClick

    {

        Gui, 2:ListView, LVsearch
            RowNumber = 0
            Loop
            {
                RowNumber := LV_GetNext(RowNumber)

                if not RowNumber
                    break
                selectRowNum := RowNumber
            }

        LV_GetText(searchcode, selectRowNum, 6)
        ;~ MsgBox, % OutputVar

    }

    SetKeyDelay, 1
    Sleep, 100
    ControlSend, combobox1, {ctrl Down}a{ctrl up}%searchcode%, %WINTITLE%
    ;~ ControlSetText, edit82, %searchcode%, %WINTITLE%
    Sleep, 100
    ;~ gosub, 리더기3

SetKeyDelay, 2

WinHide, 상품/규격 검색
WinKill, 상품/규격 검색

}
return


리더기:
{
리더횟수 = 20
리더기재시작:
; SoundPlay, %A_ScriptDir%\sound\sound3_1.mp3

WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
Sleep,100
clipboard :=

WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
Sleep,100
ClipWait, 100



Loop
{
    리더횟수 --
    if (리더횟수 = 0)
    {
        ToolTip
        ; SoundPlay, %A_ScriptDir%\sound\시간종료.mp3
        return
    }
    else
    {
        Sleep, 100
        ToolTip, %리더횟수%
    }

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
    else if (코드길이 = )
    {
        gosub, 리더기재시작
    }
    else
    {
        WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
        Sleep, 200
        clipboard :=
        WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
        Sleep,100
        ClipWait, 100
    }

}
;~ MsgBox, , ,5초 끝, 2
        ToolTip
WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 버퍼 비우기(B)
GUI, SUBMIT, NOHIDE
GuiControl, , RFIDREAD3, %MyString%
GuiControl, , RFIDREAD1, %MyString%
GUI, SUBMIT, NOHIDE
    if (RFIDREAD1 = RFIDREAD2)
    {
        gosub, 리더기
    }
    else
    {
        GuiControl, , RFIDREAD1, %RFIDREAD1%
        Sleep,10
        GuiControl, , RFIDREAD2, %RFIDREAD1%
        Sleep,10
        GuiControl, , RFIDREAD1, %RFIDREAD2%
        Sleep,10


        GUI, SUBMIT, NOHIDE
        ControlSetText, Edit1, %RFIDREAD2%, %WINTITLE%
                Sleep, 50
        ControlSend, Edit1, {Space}, %WINTITLE%
                Sleep, 50
        Sleep, 10

        gosub, mapping
    }
clipboard :=
; SoundPlay, %A_ScriptDir%\sound\sound1_1.mp3
gosub, READINFORMATION
; SoundPlay, %A_ScriptDir%\sound\sound9_2.mp3
gosub, 판별기
GuiControl, focus, 실제낱장
}
return




delrfid:
{
; SoundPlay, %A_ScriptDir%\sound\sound3_1.mp3
/*
WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
Sleep,100
clipboard :=

WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
Sleep,100
ClipWait, 100

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
    else if (코드길이 = )
    {
        gosub, 리더기
    }
    else
    {
        WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
        Sleep, 200
        clipboard :=
        WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
        Sleep,100
        ClipWait, 100
    }
}

WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 버퍼 비우기(B)
GUI, SUBMIT, NOHIDE
GuiControl, , RFIDREAD4, %MyString%
clipboard :=
*/
    ;~ Loop, 2
    ;~ {
    /*
        arr := [2, 3, 4, 5, 6 ,7 ,8 ,9]

        ;~ MsgBox, 하이
        Loop, 8
        {
            findrfid1 = % arr[A_Index] "RFID1"
            findrfid2 = % arr[A_Index] "RFID2"
            findrfid3 = % lo arr[A_Index] "_1"
            findrfid4 = % lo arr[A_Index] "_2"
            findrfid5 = % lo arr[A_Index] "_3"
            findrfid6 = % lo arr[A_Index] "_4"
            findrfid7 = % arr[A_Index] "RFID3"
        ;~ MsgBox, % %findrfid1% %findrfid2% %findrfid3%

            if ( %findrfid1% = MyString){
                GuiControl, , %findrfid1%,
                GuiControl, , %findrfid2%,
                GuiControl, , %findrfid3%,
                GuiControl, , %findrfid4%,
                GuiControl, , %findrfid5%,
                GuiControl, , %findrfid6%,
                GuiControl, , %findrfid7%,
                GuiControl, , RFIDREAD4,
                ;~ MsgBox, 감지됨
                break
            }
            else
            {
                        ;~ MsgBox, 없음
            }
        }
        */

            arr =
            arr := [2, 3, 4, 5, 6 ,7 ,8 ,9]

            Loop, 8
            {
                Loop,8
                {
                    GUI, SUBMIT, NOHIDE
                    ;~ MsgBox, % arr[A_Index]
                    findrfid1 = % arr[A_Index] "RFID1"
                    findrfid2 = % arr[A_Index] "RFID2"
                    findrfid3 = % "lo" arr[A_Index] "_1"
                    findrfid4 = % "lo" arr[A_Index] "_2"
                    findrfid5 = % "lo" arr[A_Index] "_3"
                    findrfid6 = % "lo" arr[A_Index] "_4"
                    findrfid7 = % arr[A_Index] "RFID3"
                    ;~ arr[A_Index] - 1
                    N_INDEX := A_Index + 1
                    ;~ MsgBox, %N_INDEX%

                    ;~ findrfid1 = % arr[A_Index] "RFID1"
                    ;~ findrfid2 = % arr[A_Index] "RFID2"
                    ;~ findrfid3 = % lo arr[A_Index] "_1"
                    ;~ findrfid4 = % lo arr[A_Index] "_2"
                    ;~ findrfid5 = % lo arr[A_Index] "_3"
                    ;~ findrfid6 = % lo arr[A_Index] "_4"
                    ;~ findrfid7 = % arr[A_Index] "RFID3"



                    moverfid1 = % arr[N_INDEX] "RFID1"
                    moverfid2 = % arr[N_INDEX] "RFID2"
                    moverfid3 = % "lo" arr[N_INDEX] "_1"
                    moverfid4 = % "lo" arr[N_INDEX] "_2"
                    moverfid5 = % "lo" arr[N_INDEX] "_3"
                    moverfid6 = % "lo" arr[N_INDEX] "_4"
                    moverfid7 = % arr[N_INDEX] "RFID3"
                ;~ MsgBox, % arr[A_Index] "/" %findrfid1% "/" %findrfid2% "/" %findrfid3% "/" findrfid1 "/" findrfid2 "/" findrfid3
                ;~ MsgBox, % "-" arr[N_INDEX] "/" %moverfid1% "/" %moverfid2% "/" %moverfid3% "/" moverfid1 "/" moverfid2 "/" moverfid3


                        if (%findrfid1% = "") && (%findrfid2% = "") {

                            GuiControl, , %findrfid1%, % %moverfid1%
                            GuiControl, , %findrfid2%, % %moverfid2%
                            GuiControl, , %findrfid3%, % %moverfid3%
                            GuiControl, , %findrfid4%, % %moverfid4%
                            GuiControl, , %findrfid5%, % %moverfid5%
                            GuiControl, , %findrfid6%, % %moverfid6%
                            GuiControl, , %findrfid7%, % %moverfid7%

                            GuiControl, , %moverfid1%,
                            GuiControl, , %moverfid2%,
                            GuiControl, , %moverfid3%,
                            GuiControl, , %moverfid4%,
                            GuiControl, , %moverfid5%,
                            GuiControl, , %moverfid6%,
                            GuiControl, , %moverfid7%,


                        }
                        else
                        {
                        }

                }
            }
    ;~ }
}
; SoundPlay, %A_ScriptDir%\sound\sound9_2.mp3
return




판별기:

{
    GuiControl,, PG, +15
gui, submit, nohide


2FoundCell := 2xl.Range("R:R").Find(상품코드)

;2FoundCell := 2xl.Range("R:R").Find(1FoundCell)
if(2FoundCell = "" )
{
    MsgBox, ,,%상품명% 중복 X, 1
    GuiControl, enable, 전산수정
    GuiControl, enable, 역계산
        SB_SetText(frmSAVEDPRESET 상품명 " 수정 하셔도 됩니다")
;~ ; SoundPlay, %A_ScriptDir%\sound\sound9_2.mp3

GuiControl, Move, colorbutton, x450 y387 w69 h29
;~ Gui, Add, Button, x452 y389 w65 h25 g역계산, 낱장역계산
;~ Sleep, 3000
    ; SoundPlay, %A_ScriptDir%\sound\sound1_3.mp3
}
else
{
    MsgBox, ,,%상품명% 중복 0, 1
    GuiControl, disable, 전산수정
    GuiControl, disable, 역계산
        SB_SetText(frmSAVEDPRESET 상품명 " 오늘 혹은 미래에 제품이 있습니다  내일 시도해 주세요")
    ;~ MsgBox, %상품명% 중복 O
    ; SoundPlay, %A_ScriptDir%\sound\sound9_3.mp3

}
GuiControl,, PG, 100
GuiControl,, PG, 0

SoundBeep, 1000
/*
Process, close, EXCEL.EXE
Sleep, 200
Process, close, EXCEL.EXE

*/
}
return

/*

판별기프린트:
{


gui, submit, nohide
XLS_file_path1 := % A_ScriptDir "\어제자판매리스트.xlsx"
1xl := ComObjCreate("Excel.Application")
1xl.Workbooks.Open(XLS_file_path1)
11xl := 1xl.Workbooks.Open(XLS_file_path1, 3, 0)
1xl.Visible:=false
1xl := 1xl.Sheets("Sheet1")

XLS_file_path2 := % A_ScriptDir "\오늘미래판매리스트.xlsx"
2xl := ComObjCreate("Excel.Application")
2xl.Workbooks.Open(XLS_file_path2)
22xl := 2xl.Workbooks.Open(XLS_file_path2, 3, 0)
2xl.Visible:=false
2xl := 2xl.Sheets("Sheet1")

R = 2
1FoundCell := 1xl.Range("R" R).value
1pdtCell := 1xl.Range("A" R).value
    Loop,
    {

        if(1FoundCell = "" ) and (1pdtCell = "" )
        {
            break
        }
        else
        {
            R ++
            2FoundCell := 2xl.Range("R" R).Find(1FoundCell)
            if(2FoundCell = 1FoundCell)
            {
                1xl.Range(R ":" R).select
                1xl.Range(R ":" R).delect
            }
            else
            {
            }
        }
    }


2xl.close(0)
Process, close, EXCEL.EXE
Sleep, 200

1xl.close(0)
Process, close, EXCEL.EXE


}
return

*/



이전재고:
매출수량:
반입수량:
매입수량:
반출수량:

전산밴딩:
{
Gui, submit, nohide
    jsbd = 1

Loop, 8
{
    jsbd ++
    if (%jsbd%RFID3=""){
        %jsbd%RFID3 = 0

    GuiControl, , %jsbd%RFID3, % %jsbd%RFID3
    }
    else
    {
    }
}


Gui, submit, nohide
전산총수량1 := 이전재고 - 매출수량 - 반출수량 + 매입수량 + 반입수량

GuiControl, , 전산총수량, %전산총수량1%
all전산밴딩 := 2RFID3 + 3RFID3 + 4RFID3 + 5RFID3 + 6RFID3 + 7RFID3 + 8RFID3 + 9RFID3
GuiControl, , 전산밴딩, %all전산밴딩%
new전산낱장 := 전산총수량 - all전산밴딩
GuiControl, , 전산낱장, %new전산낱장%

return
}



;~ b전산낱장:
;~ {
;~ Gui, submit, nohide


;~ }
;~ return


실제낱장:
{

    Gui, submit, nohide


    GuiControl, , 1RFID3, % 실제낱장

return
}




역계산:
{
Gui, submit, nohide
cal실제합계 := 전산밴딩 + 실제낱장 + 매출수량 + 반출수량 - 매입수량 - 반입수량
;~ MsgBox, %실제낱장%`n%전산밴딩%`n%cal실제합계%
GuiControl, , 실제합계, %cal실제합계%
;~ GuiControl, Move, colorbutton, x350 y387 w61 h29
;~ GuiControl, enable, 전산수정
Sleep, 100



return
}


전산수정:
{


;~ csv_Load(csvfile1,"data1")
GuiControl,, PG, 0
Gui, submit, nohide
GuiControl, , 수정값, %실제합계%
 어제날짜=%A_Now%
EnvAdd,어제날짜,-1,days
FormatTime,어제날짜,%어제날짜%,yyyy-MM-dd

    Sleep, 100
    WinShow, ahk_class TfmMain

    Winwait, ahk_class TfmMain
    IfWinNotActive, ahk_class TfmMain, , WinActivate, ahk_class TfmMain
    WinWaitActive, ahk_class TfmMain


    controlclick, TRzEdit2, ahk_class TfmMain, , , , x40 y14     ;윈도우닫기

    if ErrorLevel=1
    {
        Winwait, ahk_class TfmMain
        IfWinNotActive, ahk_class TfmMain, , WinActivate, ahk_class TfmMain
        WinWaitActive, ahk_class TfmMain

        Sleep, 1000
        ControlClick, x5 y5, ahk_exe JedaeroM.exe
        Sleep, 100

        GuiControl,, PG, +10

        send, {esc 10}{alt}{enter}
        Sleep, 100
        send, {down 2}{enter}
        GuiControl,, PG, +10
    }
    else
    {
    }
Sleep, 200

ControlGetText, 어제날짜비교, TRzDateTimeEdit1, ahk_class TfmMain
if( 어제날짜 = 어제날짜비교 )
{
}
else
{
    ControlSend, TRzDateTimeEdit1, {del 20}{BackSpace 20}, ahk_class TfmMain
;~ Send, {ctrl up}{Alt up}{Shift up}
    Sleep,200
    ControlSend, TRzDateTimeEdit1, %어제날짜%, ahk_class TfmMain
    Sleep,200
}



    Clipboard=
    Sleep, 10
    Clipboard := 상품코드
    ControlSend, TRzEdit2, {ctrl Down}v{Ctrl up}{Enter}, ahk_class TfmMain
sleep, 20
ControlClick, TRzPanel4, ahk_class TfmMain, , , , x257 y10
    Sleep, 1000
GuiControl,, PG, +10

    Winwait, ahk_class TfmMain,
    IfWinNotActive, ahk_class TfmMain, ,WinActivate, ahk_class TfmMain,
    WinWaitActive, ahk_class TfmMain
    Sleep, 1000

    send, {f2}
    Sleep, 200
    GuiControlGet, 수정값
    send, %수정값%{ENTER}
    Sleep, 500
GuiControl,, PG, +10
    ControlClick, TAdvToolBar2, ahk_class TfmMain, , , , x144 y23
    Sleep, 100
GuiControl,, PG, +10

    Winwait, 일괄저장,
    IfWinNotActive, 일괄저장, WinActivate, 일괄저장,
    WinWaitActive, 일괄저장

GuiControl,, PG, +10

    Sleep, 200
    controlsend, , {enter}, 일괄저장
    Sleep, 100
          ;~ ; SoundPlay, %A_ScriptDir%\sound\sound22.wav
          ;~ Sleep, 500
          ;~ ; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


    Sleep, 100
        Winwait, ahk_class TMessageForm,
    IfWinNotActive, ahk_class TMessageForm, WinActivate, ahk_class TMessageForm,
    WinWaitActive, ahk_class TMessageForm
        Sleep, 20
    controlsend, , {enter}, ahk_class TMessageForm
        Sleep, 200


    ControlSend, TRzEdit2, {del 20}{BackSpace 20}, ahk_class TfmMain
    ;~ controlclick, TAdvToolBar3, ahk_class TfmMain, , , , x40 y14     ;윈도우닫기
GuiControl,, PG, +10


    SB_SetText(frmSAVEDPRESET " 재고 수량 수정 완료")
; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3
;~ GuiControl, Move, colorbutton, x464 y387 w61 h29


Sleep, 10

    WinWait, %WINTITLE%,
    IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
    WinWaitActive, %WINTITLE%
        Sleep, 20
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinActivate, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
        ;~ Run, osk.exe
    ;~ }

CSV_Save(csvfile1,"data1",1)

data1=
CSV_Load(csvfile1,"data1")


if(edsm찾기="1")
{
    GuiControl, Choose, tabname, 9
    Sleep, 1000
    gosub, edsmcheck
    edsm찾기=
}
else
{
    GuiControl, Choose, tabname, 1
    Sleep, 1000
}



;~ gosub, UpdatePresetList
SoundPlay, %A_ScriptDir%\sound\저장완료.mp3
;~ MsgBox, 262196,,완료,1
MsgBox, 262192, 알림, 변환완료 됐습니다, 1


GuiControl,, PG, 0



/*
    GuiControl, Choose, tabname, 3

;~ Gui, Submit, NoHide
Gui, ListView, LVedsm1

    ;~ GuiControl, Focus, %HLVedsm1%
        ;~ winkill, 체크박스
    ;~ WinWait, %WINTITLE%,
    ;~ IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
    ;~ WinWaitActive, %WINTITLE%
    ;~ ; SoundPlay, %A_ScriptDir%\sound\SFX_Ui02.mp3
    Sleep, 100
    Send, {F2}
    Sleep, 100
    Send, ◎{ENTER}
    Sleep, 100
*/


}
return




b1RFID3:
gosub, 전산밴딩
return

b2RFID3:
gosub, 전산밴딩
return
b3RFID3:
gosub, 전산밴딩
return
b4RFID3:
gosub, 전산밴딩
return
b5RFID3:
gosub, 전산밴딩
return
b6RFID3:
gosub, 전산밴딩
return
b7RFID3:
gosub, 전산밴딩
return
b8RFID3:
gosub, 전산밴딩
return
b9RFID3:
gosub, 전산밴딩
return



READINFORMATION:


READINFORMATION1:

Gui, submit, nohide

      GuiControl,, PG, +30
/*
XLS_file_path3 := % A_ScriptDir "\어제자상품재고정보.xlsx"
3xl := ComObjCreate("Excel.Application")
      GuiControl,, PG, +30
3xl.Workbooks.Open(XLS_file_path3)
33xl := 3xl.Workbooks.Open(XLS_file_path3, 3, 0)
3xl.Visible:=false
      GuiControl,, PG, +30
3xl := 3xl.Sheets("Sheet1")
*/

;~ MsgBox, % 상품코드
    GuiControl, enable, 전산수정
    GuiControl, enable, 역계산

3FoundCell := 3xl.Range("R:R").Find(상품코드)



;~ e이전재고 = % FoundCell.Offset(0, -12).Value

    ;~ e이전재고 := round(e이전재고,0)
;~ MsgBox, % e이전재고

;~ MsgBox, % FoundCell.Offset(0, 1).Value

;~ ValueF :=xl.Range("F" . num ).Value

;~ FoundCell := ComObjActive("Excel.Application").ActiveSheet.Range("A:A").Find(What)
;~ MsgBox, % FoundCell.Offset(0, 1).Value

    ;~ xl := ex.Sheets("sheet1")
    ;~ EX1 = -12
    ;~ EX2 := EX1 - 1

;~ MsgBox, %EX1%`n%EX2%
    ex1 := 3FoundCell.Offset(0, -12).Value ;이전재고
    ex2 := 3FoundCell.Offset(0, 3).Value ;매출수량
    ex3 := 3FoundCell.Offset(0, 4).Value   ;반입수량
    ex4 := 3FoundCell.Offset(0, 5).Value   ;매입수량
    ex5 := 3FoundCell.Offset(0, 6).Value   ;반출수량
    ex6 := 3FoundCell.Offset(0, -13).Value   ;현재수량

    ;~ e수정재고 := FoundCell.Offset(0, ).Value
    ;~ e전산밴딩 := FoundCell.Offset(0, 1).Value
    ;~ e전산낱장 := FoundCell.Offset(0, 1).Value

    ;~ MsgBox, % e이전재고

GuiControl,, PG, +10
    e이전재고 := round(ex1,0)
    e매출수량 := round(ex2,0)
    e반입수량 := round(ex3,0)
    e매입수량 := round(ex4,0)
    e반출수량 := round(ex5,0)
    e현재수량 := round(ex6,0)

;~ MsgBox, % e전산밴딩
Gui, submit, nohide
GuiControl,, 이전재고, %e이전재고%
GuiControl,, 매출수량, %e매출수량%
GuiControl,, 반입수량, %e반입수량%
GuiControl,, 매입수량, %e매입수량%
GuiControl,, 반출수량, %e반출수량%
GuiControl,, 현재수량, %e현재수량%

;~ Z = 2
;~ Loop, 8
;~ {
    ;~ RFIDk = % Z "RFID3"
    ;~ if (RFIDk=""){

    ;~ guicontrol, , Z . "RFID3", 0
    ;~ }
    ;~ else
    ;~ {
    ;~ }
    ;~ Z++
            ;~ MsgBox, % RFIDk
;~ }
    ;~ Z =

if (2RFID3=""){
    guicontrol, , 2RFID3, 0
}
else
{
}

if (3RFID3=""){
    guicontrol, , 3RFID3, 0
}
else
{
}

if (4RFID3=""){
    guicontrol, , 4RFID3, 0
}
else
{
}


if (5RFID3=""){
    guicontrol, , 5RFID3, 0
}
else
{
}


if (6RFID3=""){
    guicontrol, , 6RFID3, 0
}
else
{
}

if (7RFID3=""){
    guicontrol, , 7RFID3, 0
}
else
{
}

if (8RFID3=""){
    guicontrol, , 8RFID3, 0
}
else
{
}

if (9RFID3=""){
    guicontrol, , 9RFID3, 0
}
else
{
}



;~ e전산밴딩 := 2RFID3 + 3RFID3 + 4RFID3 + 5RFID3 + 6RFID3 + 7RFID3 + 8RFID3 + 9RFID3
;~ e전산낱장 := 현재수량 - e전산밴딩
;~ MsgBox, % e전산밴딩
;~ GuiControl,, 전산밴딩, %e전산밴딩%
;~ GuiControl,, 전산낱장, %e전산낱장%
;~ Gui, submit, nohide
/*
33xl.close(0)

;~ xl.Quit(0)

Process, close, EXCEL.EXE

*/
      GuiControl,, PG, 100
      GuiControl,, PG, 0
;~ e이전재고 =
;~ e매출수량 =
;~ e반입수량 =
;~ e매입수량 =
;~ e반출수량 =
;~ e현재수량 =
;~ e전산밴딩 =
;~ e전산낱장 =
gosub, 전산밴딩
;~ gosub, b전산낱장



return





bluetooth:

;~ Sleep, 200


    ;~ Gui, submit, nohide
    ;~ RegExMatch(qrcode, "(.*)-(.*)-(.*)", q)
    ;~ q11 := RegExReplace(q1, "\d")
    ;~ q12 := RegExReplace(q1, "\D")

    ;~ qeditnum1 := ( qrloca * 7 ) - 4
    ;~ qeditnum2 := qeditnum1 + 1
    ;~ qeditnum3 := qeditnum1 + 2
    ;~ qeditnum4 := qeditnum1 + 3




    ;~ ControlSetText, edit%qeditnum1%, %q11%, %WINTITLE%
    ;~ ControlSetText, edit%qeditnum2%, %q12%, %WINTITLE%
    ;~ ControlSetText, edit%qeditnum3%, %q2%, %WINTITLE%
    ;~ ControlSetText, edit%qeditnum4%, %q3%, %WINTITLE%

    ;~ MsgBox, % qeditnum1 "\" q11 q12 q2 q3
;~ winkill, QRCODE
;~ Sleep, 1000

return





한영변환:
{
MyString := StrReplace(MyString, "ㅃ" , "Q")
MyString := StrReplace(MyString, "ㅂ" , "Q")
MyString := StrReplace(MyString, "ㅉ" , "W")
MyString := StrReplace(MyString, "ㅈ" , "W")
MyString := StrReplace(MyString, "ㄸ" , "E")
MyString := StrReplace(MyString, "ㄷ" , "E")
MyString := StrReplace(MyString, "ㄲ" , "R")
MyString := StrReplace(MyString, "ㄱ" , "R")
MyString := StrReplace(MyString, "ㅆ" , "T")
MyString := StrReplace(MyString, "ㅅ" , "T")
MyString := StrReplace(MyString, "ㅛ" , "Y")
MyString := StrReplace(MyString, "ㅕ" , "U")
MyString := StrReplace(MyString, "ㅑ" , "I")
MyString := StrReplace(MyString, "ㅐ" , "O")
MyString := StrReplace(MyString, "ㅒ" , "O")
MyString := StrReplace(MyString, "ㅔ" , "P")
MyString := StrReplace(MyString, "ㅖ" , "P")
MyString := StrReplace(MyString, "ㅁ" , "A")
MyString := StrReplace(MyString, "ㄴ" , "S")
MyString := StrReplace(MyString, "ㅇ" , "D")
MyString := StrReplace(MyString, "ㄹ" , "F")
MyString := StrReplace(MyString, "ㅎ" , "G")
MyString := StrReplace(MyString, "ㅗ" , "H")
MyString := StrReplace(MyString, "ㅓ" , "J")
MyString := StrReplace(MyString, "ㅏ" , "K")
MyString := StrReplace(MyString, "ㅣ" , "L")
MyString := StrReplace(MyString, "ㅋ" , "Z")
MyString := StrReplace(MyString, "ㅌ" , "X")
MyString := StrReplace(MyString, "ㅊ" , "C")
MyString := StrReplace(MyString, "ㅍ" , "V")
MyString := StrReplace(MyString, "ㅠ" , "B")
MyString := StrReplace(MyString, "ㅜ" , "N")
MyString := StrReplace(MyString, "ㅡ" , "M")
StringUpper, MyString, MyString
return
}


return


btread1:
카드기록삭제=
서브리딩=
;~ gosub, Bt2
gosub, Bt2
return
btread2:
카드기록삭제=
서브리딩=1
gosub, Bt2
return
btread3:
카드기록삭제=
서브리딩=1
gosub, Bt2
return
btread4:
카드기록삭제=
서브리딩=1
gosub, Bt2
return
btread5:
카드기록삭제=
서브리딩=1
gosub, Bt2
return
btread6:
카드기록삭제=
서브리딩=1
gosub, Bt2
return
btread7:
카드기록삭제=
서브리딩=1
gosub, Bt2
return
btread8:
카드기록삭제=
서브리딩=1
gosub, Bt2
return
btread9:
카드기록삭제=
서브리딩=1
gosub, Bt2
return















Bt2:

GuiControlGet, btread, FocusV
;~ run, %A_ScriptDir%\%WINTITLE%.ahk

리더기3:
{

    ret := IME_CHECK("A")
    if %ret% <> 0           ; 1 means IME is in Hangul(Korean) mode now.
        {
	          ;~ Send, {Esc}
            Send, {vk15}    ;한글인 경우 Esc키를 입력하고 한영키를 입력해 준다.
        }
    else if %ret% = 0       ; 0 means IME is in English mode now.
        {
	          ;~ Send, {Esc}     ;영문인 경우 Esc키만 입력한다.
        }


;~ GuiControl, focus, btread1
ControlFocus, edit82, %WinTitle%
;~ Sleep, 1000
;~ return
	;~ WinWait, %WINTITLE%,
	;~ IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
	;~ WinWaitActive, %WINTITLE%,

ToolTip, 시작
        GuiControl, , RFIDREAD3,
        GuiControl, , RFIDREAD2,
        GuiControl, , RFIDREAD1,

        renumber := RegExReplace(btread, "B", "")
        renumber := RegExReplace(renumber, "b", "")
        rfidcheck = 1
clipboard =
ControlGetText, MyString, edit82, %WINTITLE%
Loop,60
{
    Sleep, 200
    코드길이 := StrLen(MyString)
    if ( 코드길이 = 10 )
    {
        gosub, 한영변환
        break
    }
    else if (코드길이 > 10 )
    {
        ControlSend, edit82, {ctrl Down}a, %WINTITLE%
        ControlSend, edit82, {ctrl Up}{Del}, %WINTITLE%
        Sleep, 100
        clipboard :=
        ControlGetText, MyString, edit82, %WINTITLE%
    }
    else if (코드길이 < 10)
    {
        Sleep, 100
        ControlGetText, MyString, edit82, %WINTITLE%
    }
    else
    {
        gosub, 리더기3
    }
    카운트다운 := 60 - A_Index
    ToolTip, % "남은 시간 : " 카운트다운
}
    GUI, SUBMIT, NOHIDE
    ControlGetText, locarfid, edit82, %WINTITLE%
    ControlSend, edit82, {ctrl Down}a, %WINTITLE%
    ControlSend, edit82, {ctrl Up}{Del}, %WINTITLE%
    Sleep, 100
    ;~ WinKill, %WINTITLE%
    ToolTip,
if (MyString = "")
    return
else
{
    GUI, SUBMIT, NOHIDE

    GuiControl, , RFIDREAD3, %MyString%
    GuiControl, , RFIDREAD1, %MyString%

    GUI, SUBMIT, NOHIDE
    if (RFIDREAD1 = RFIDREAD2)
    {
        gosub, 리더기3
    }
    else
    {
            ;~ MsgBox, 긁혔다 1
        GuiControl, , RFIDREAD1, %RFIDREAD1%
        Sleep,10
        GuiControl, , RFIDREAD2, %RFIDREAD1%
        Sleep,10
        GuiControl, , RFIDREAD1, %RFIDREAD2%
        Sleep,10

        if (카드기록삭제="1")                                                                             ; <<<<<<<< 여기 수정중 입니다
        {
            Result:=CSV_MatchCell("data1", MyString)
            Result:=StrSplit(Result,",") ; Result[1]=Row, Result[2]=Column
            MsgBox, ,이전기록찾음,% Result[1] "`n" Result[2], 1  ; 삭제예정
            if(Result[1] = ""){
                MsgBox, ,삭제완료,현재 카드 공카드 입니다,1
            }
            else
            {
                erase1 := Result[2] + 1
                erase2 := Result[2] + 2

                ;~ MsgBox, % "현재 카드 내용 :" CSV_ReadCell("data1",Result[1],Result[2]) "`n" Result[1] "," Result[2]
                CSV_ModifyCell("data1", "",Result[1],Result[2]) ; change E350 to Mustang
                CSV_ModifyCell("data1", "",Result[1],erase1) ; change E350 to Mustang
                CSV_ModifyCell("data1", "",Result[1],erase2) ; change E350 to Mustang
                CSV_Save(csvfile1,"data1",1)
                data1=
                CSV_load(csvfile1,"data1")
                gosub, UpdatePresetList
                MsgBox, 현재 카드 공카드 입니다2
            }
            return
        }
        else
        {
        }

            ;~ MsgBox, 긁혔다 2
        GUI, SUBMIT, NOHIDE
        if (서브리딩="") ;;;;;;;;;;;;;;;; 중복 확인 ;;;;;;;;;;;;;;;;
        {
        GuiControl, text, frmSAVEDPRESET, %MyString%
            Loop, % Rows
            {
                foundread:=CSV_Search("data1",RFIDREAD2,A_Index)

                if foundread=0
                {
                    brandnew=1
                    gosub, PresetChange
                    ;~ GuiControl, , radio%ANU%, 0
                    break
                }
                else
                {
                    gosub, PresetChange
                    ;~ GuiControl, , radio%ANU%, 1
                    break
                }

            }

        }
        else
        {
            MsgBox, 긁혔다 3
            Loop, % Rows
            {
                foundread:=CSV_Search("data1",RFIDREAD2,A_Index)

                if foundread=0
                {
                    if(renumber="")
                    {
                        ;~ MsgBox, 1 renumber이 없음 : %renumber%
                        ;~ GuiControl, , ,
                    }
                    else
                    {
                        ;~ MsgBox, 2 renumber이 있음 : %renumber%
                        ;~ GuiControl, , %renumber%RFID1, %RFIDREAD2%
                        ;~ GuiControlGet, highlight1, pos, %renumber%RFID1
                        ;~ highlight1X := highlight1X - 26
                        ;~ highlight1Y := highlight1Y - 35
                        ;~ highlight1W := highlight1W + 18
                        ;~ GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W830 h48
                        ;~ Sleep, 100
                        ;~ GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W830 h48
                        ;~ GuiControl, , radio%ANU%, 1
                    }
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
                                    ;~ GuiControl, , radio%ANU%, 1
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
    }
}

    clipboard =
    rfidcheck =
    서브리딩 =
    brandnew =
    카드기록삭제 =
return
}









refridread:
서브리딩=
gosub, 리더기2
return

refridread2:
서브리딩=1
gosub, 리더기2
return

refridread3:
서브리딩=1
gosub, 리더기2
return

refridread4:
서브리딩=1
gosub, 리더기2
return

refridread5:
서브리딩=1
gosub, 리더기2
return

refridread6:
서브리딩=1
gosub, 리더기2
return

refridread7:
서브리딩=1
gosub, 리더기2
return
refridread8:
서브리딩=1
gosub, 리더기2
return
refridread9:
서브리딩=1
gosub, 리더기2
return

리더기2:
{

; SoundPlay, %A_ScriptDir%\sound\sound3_1.mp3
ToolTip, 시작
        GuiControl, , RFIDREAD3,
        ;~ Sleep,10
        GuiControl, , RFIDREAD2,
        ;~ Sleep,10
        GuiControl, , RFIDREAD1,
        ;~ Sleep,10
GuiControlGet, refridread, FocusV

        renumber := RegExReplace(refridread, "R", "")
        renumber := RegExReplace(renumber, "r", "")
        rfidcheck = 1
        ;~ MsgBox, % renumber
clipboard =
WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
Sleep,100
WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
Sleep,100
;~ ClipWait, 100
;~ MsgBox, % Clipboard
Loop,30
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
        ;~ ClipWait, 100
    }
    else if (코드길이 = )
    {
        gosub, 리더기2
    }
    else
    {
        WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
        Sleep, 200
        clipboard :=
        WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
        Sleep,100
        ;~ ClipWait, 100
    }
    카운트다운 := 30 - A_Index
        ToolTip, % "남은 시간 : " 카운트다운
}

WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 버퍼 비우기(B)

ToolTip,
if (MyString = "")
    return
else
{
    GUI, SUBMIT, NOHIDE

    GuiControl, , RFIDREAD3, %MyString%
    GuiControl, , RFIDREAD1, %MyString%
    GUI, SUBMIT, NOHIDE
        if (RFIDREAD1 = RFIDREAD2)
        {
            gosub, 리더기2
        }
        else
        {
            GuiControl, , RFIDREAD1, %RFIDREAD1%
            Sleep,10
            GuiControl, , RFIDREAD2, %RFIDREAD1%
            Sleep,10
            GuiControl, , RFIDREAD1, %RFIDREAD2%
            Sleep,10

            GUI, SUBMIT, NOHIDE
            ; ;;;;;;;;;;;;;;; 중복 확인 ;;;;;;;;;;;;;;;;
            if (서브리딩="")
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
                        if(renumber="")
                        {
                            MsgBox, 1 renumber이 없음 : %renumber%
                        }
                        else
                        {
                            MsgBox, 2 renumber이 있음 : %renumber%
                            GuiControl, , %renumber%RFID1, %RFIDREAD2%
                            GuiControlGet, highlight1, pos, %renumber%RFID1
                            highlight1X := highlight1X - 26
                            highlight1Y := highlight1Y - 35
                            highlight1W := highlight1W + 18
                            GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W830 h48
                            Sleep, 100
                            GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W830 h48
                        }
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
            ;~ Sleep,10
            GuiControl, , RFIDREAD2,
            ;~ Sleep,10
            GuiControl, , RFIDREAD1,
            ;~ Sleep,10
            GuiControl, , 수정값,
            ;~ Sleep,10
            GuiControl, , 실제합계,
            ;~ Sleep,10

            GuiControl, , 실제낱장,
            Sleep,10
            gosub, mapping
        }
    ; SoundPlay, %A_ScriptDir%\sound\sound1_3.mp3

}
    clipboard =
    rfidcheck =
    서브리딩 =
    brandnew =
;~ MsgBox, 끝
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinActivate, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
        ;~ Run, osk.exe
    ;~ }

return
}

LV1:
Gui, ListView, LV1
if A_GuiEvent = DoubleClick
{
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(lvvar, selectRowNum, 2)
	Sleep, 100
}
;~ MsgBox, % lvvar

SetKeyDelay, 1
            GuiControl, Choose, tabname, 1
    ControlSend, combobox1, {ctrl Down}a{ctrl up}%lvvar%, %WINTITLE%

SetKeyDelay, 2

return


LV2:
Gui, ListView, LV2
if A_GuiEvent = DoubleClick
{
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(lvvar, selectRowNum, 2)
	Sleep, 100
}
;~ MsgBox, % lvvar

SetKeyDelay, 1
            GuiControl, Choose, tabname, 1
    ControlSend, combobox1, {ctrl Down}a{ctrl up}%lvvar%, %WINTITLE%

SetKeyDelay, 2

return


LV3:
Gui, ListView, LV3
if A_GuiEvent = DoubleClick
{
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(lvvar, selectRowNum, 2)
	Sleep, 100
}
;~ MsgBox, % lvvar

SetKeyDelay, 1
            GuiControl, Choose, tabname, 1
    ControlSend, combobox1, {ctrl Down}a{ctrl up}%lvvar%, %WINTITLE%

SetKeyDelay, 2

return



LV4:
Gui, ListView, LV4
if A_GuiEvent = DoubleClick
{
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(lvvar, selectRowNum, 2)
	Sleep, 100
}
;~ MsgBox, % lvvar

SetKeyDelay, 1
            GuiControl, Choose, tabname, 1
    ControlSend, combobox1, {ctrl Down}a{ctrl up}%lvvar%, %WINTITLE%

SetKeyDelay, 2

return



LV5:
Gui, ListView, LV5
if A_GuiEvent = DoubleClick
{
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(lvvar, selectRowNum, 2)
	Sleep, 100
}
;~ MsgBox, % lvvar

SetKeyDelay, 1
            GuiControl, Choose, tabname, 1
    ControlSend, combobox1, {ctrl Down}a{ctrl up}%lvvar%, %WINTITLE%

SetKeyDelay, 2

return



LV6:
Gui, ListView, LV6
if A_GuiEvent = DoubleClick
{
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(lvvar, selectRowNum, 2)
	Sleep, 100
}
;~ MsgBox, % lvvar

SetKeyDelay, 1
            GuiControl, Choose, tabname, 1
    ControlSend, combobox1, {ctrl Down}a{ctrl up}%lvvar%, %WINTITLE%

SetKeyDelay, 2

return



LV7:
Gui, ListView, LV7
if A_GuiEvent = DoubleClick
{
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(lvvar, selectRowNum, 2)
	Sleep, 100
}
;~ MsgBox, % lvvar

SetKeyDelay, 1
            GuiControl, Choose, tabname, 1
    ControlSend, combobox1, {ctrl Down}a{ctrl up}%lvvar%, %WINTITLE%

SetKeyDelay, 2

return





B8_1:
GuiControl, , showlocation, B8_1

gosub, LVlocation
return





LVlocation:
{

    Gui, submit, nohide
    GuiControlGet, showloc, , showlocation
    ;~ MsgBox, % showloc
    if (lvget="1") {
        RegExMatch(showloc, "(.*)_(.*)", newlocation)
        RegExMatch(showloc, "(.*)_(.*)_(.*)", 2newlocation)
        ;~ MsgBox, %

        IF (2newlocation3 = "")
        {
            showloc = % newlocation1 "-" newlocation2 "-"

            selectcar := RegExReplace(newlocation1, "\d")  ; 숫자를 제거합니다.
            selectnum := RegExReplace(newlocation1, "\D")  ; 엉어를 제거합니다.
            ;~ MsgBox, % selectedloaction
            GuiControl, Choose, tabname, 1
            Gui, submit, nohide
                ;~ IfWinExist, 화상 키보드
                ;~ {
                    ;~ WinActivate, 화상 키보드
                ;~ }
                ;~ else
                ;~ {
                    ;~ Run, osk.exe
                ;~ }
            GuiControl, , lo%selnum%_1, % selectcar
            GuiControl, , lo%selnum%_2, % selectnum
            GuiControl, , lo%selnum%_3, % newlocation2
            GuiControl, , lo%selnum%_4,
            GuiControl, focus, lo%selnum%_4
            lvget=
            run, speakerlocation.exe
            return
        }
        else
        {
            showloc = % 2newlocation1 "-" 2newlocation2 "-" 2newlocation3

            2selectcar := RegExReplace(2newlocation1, "\d")  ; 숫자를 제거합니다.
            2selectnum := RegExReplace(2newlocation1, "\D")  ; 엉어를 제거합니다.
            GuiControl, Choose, tabname, 1
            Gui, submit, nohide
                ;~ IfWinExist, 화상 키보드
                ;~ {
                    ;~ WinActivate, 화상 키보드
                ;~ }
                ;~ else
                ;~ {
                    ;~ Run, osk.exe
                ;~ }
            GuiControl, , lo%selnum%_1, % 2selectcar
            GuiControl, , lo%selnum%_2, % 2selectnum
            GuiControl, , lo%selnum%_3, % 2newlocation2
            GuiControl, , lo%selnum%_4, % 2newlocation3
            GuiControl, focus, lo%selnum%_4

            lvget=
            run, speakerlocation.exe
            2newlocation3 =
            return
        }
    }

    else if (lvget="2") {
            ;~ run, set_location.ahk


        RegExMatch(showloc, "(.*)_(.*)", newlocation)
        RegExMatch(showloc, "(.*)_(.*)_(.*)", 2newlocation)
        ;~ MsgBox, %
        IF (2newlocation3 = "")
        {
            showloc = % newlocation1 "-" newlocation2 "-1"

            ;~ selectcar := RegExReplace(newlocation1, "\d")  ; 숫자를 제거합니다.
            ;~ selectnum := RegExReplace(newlocation1, "\D")  ; 엉어를 제거합니다.
            ;~ MsgBox, % selectedloaction
            GuiControl, Choose, tabname, 1
            Gui, submit, nohide
                ;~ IfWinExist, 화상 키보드
                ;~ {
                    ;~ WinActivate, 화상 키보드
                ;~ }
                ;~ else
                ;~ {
                    ;~ Run, osk.exe
                ;~ }
            ControlSetText, edit81, %showloc%, %WINTITLE%
            ;~ ControlSetText, edit1, %selectcar%, set_location
            ;~ ControlSetText, edit2, %selectnum%, set_location
            ;~ ControlSetText, edit3, %newlocation2%, set_location
            ;~ ControlSetText, edit4, 1, set_location


            lvget=
            2newlocation3 =

            MsgBox, 로케이션 정렬을 실시 합니다.`n정렬하려는 로케이션을 고르시오.
            ;~ MsgBox, % newlocation1 "-" newlocation2


            GuiControl, , 큐알순서, 1 ;텍스트 빨간 글씨 입니다
            ;~ gosub, 정렬다음
            ;~ ControlClick, Button56, %WINTITLE%
            gosub, locachange
            return
        }
        else
        {
            MsgBox,  상위 로케이션을 선택해주세요
            lvget=
            WinKill, set_location
            2newlocation3 =
            return


        }



    }

    else   ; 버튼눌러서 로케이션에 있는 정보
    {
        ;~ MyString := StrReplace(Clipboard, "`r`n`r`n", "`r`n", Count)
        ;~ MyString := StrReplace(MyString, A_Space, "")
        ;~ showloc := StrReplace(showloc, "`n", "")
        showloc:=StrSplit(showloc,"_")
        showloc1:=showloc[1] "-" showloc[2]

        ;~ MsgBox, % showloc1
        Gui,SUBMIT, NOHIDE
        IF (tabname = "▼평면[내부]`  ")
        {
        GuiControl, -Redraw, %HLV1%
        Gui, Listview, LV1
        }
        else IF (tabname = "▼평면[철물]`  ")
        {
        GuiControl, -Redraw, %HLV2%
        Gui, Listview, LV2
        }
        else IF (tabname = "▽[K1~K6]`  ")
        {
        GuiControl, -Redraw, %HLV4%
        Gui, Listview, LV4
        }
        else IF (tabname = "▽[K7~K12]`  ")
        {
        GuiControl, -Redraw, %HLV5%
        Gui, Listview, LV5
        }
        else IF (tabname = "▽[G14~G9]`  ")
        {
        GuiControl, -Redraw, %HLV6%
        Gui, Listview, LV6
        }
        else IF (tabname = "▽[G8~7  J4~2]`  ")
        {
        GuiControl, -Redraw, %HLV7%
        Gui, Listview, LV7
        }
        else
        {
        GuiControl, -Redraw, %HLV3%
        Gui, Listview, LV3
        }

        ;~ IF (2newlocation3 = "")
        ;~ {
            ;~ showloc = % 2newlocation1 "-" 2newlocation2 "-" 2newlocation3
        ;~ }
        ;~ else
        GuiControl, show, load1
        GuiControl, show, load2
        GuiControl, show, load3
        GuiControl, show, load4
        GuiControl, show, load5
        GuiControl, show, load6
        GuiControl, show, load7


        LV_Delete()
        Loop,A_LoopField
          LV_Add("", x*)

        Loop, % Rows
            {
            found:=CSV_Search("data1",showloc1,A_Index)
             if found=0
                break
             found:=StrSplit(found,",")
                rr1 := found[2] - 1
                rr2 := found[2]
                rr3 := found[2] + 1
                r1:=CSV_ReadCell("data1",found[1],rr1) ; R1
                r2:=CSV_ReadCell("data1",found[1],rr2) ; L2
                r3:=CSV_ReadCell("data1",found[1],rr3) ; s3
                r0:=CSV_ReadCell("data1",found[1],1) ; original  rfid
                r29:=CSV_ReadCell("data1",found[1],29) ; 상품명
                r30:=CSV_ReadCell("data1",found[1],30) ; 규격
                r31:=CSV_ReadCell("data1",found[1],31) ; pdt code

                RegExMatch(r2, "(.*)-(.*)-(.*)", newr)

                if ((newr3 ="1") or (newr3 ="2") or (newr3 ="3") or (newr3 ="4") or (newr3 ="5") or (newr3 ="6") or (newr3 ="7") or (newr3 ="8") or (newr3 ="9"))
                {
                    newr3 := "0" newr3
                    r2 := newr1 "-" newr2 "-" newr3

                }
                else
                {
                }
                if (rr3 ="3")
                {

                    found2:=CSV_MatchCell("data2",r31)
                    ;~ MsgBox, % found2
                    found2:=StrSplit(found2,",")
                    2sum:=CSV_ReadCell("data2",found2[1],5)
                    2r2:=CSV_ReadCell("data1",found[1],6) ; original  rfid
                    2r3:=CSV_ReadCell("data1",found[1],9) ; original  rfid
                    2r4:=CSV_ReadCell("data1",found[1],12) ; original  rfid
                    2r5:=CSV_ReadCell("data1",found[1],15) ; original  rfid
                    2r6:=CSV_ReadCell("data1",found[1],18) ; original  rfid
                    2r7:=CSV_ReadCell("data1",found[1],21) ; original  rfid
                    2r8:=CSV_ReadCell("data1",found[1],24) ; original  rfid
                    2r9:=CSV_ReadCell("data1",found[1],27) ; original  rfid

                    IF(2r2=""){
                        2r2=0
                    }
                    else
                    {
                    }
                    IF(2r3=""){
                        2r3=0
                    }
                    else
                    {
                    }
                    IF(2r4=""){
                        2r4=0
                    }
                    else
                    {
                    }
                    IF(2r5=""){
                        2r5=0
                    }
                    else
                    {
                    }
                    IF(2r6=""){
                        2r6=0
                    }
                    else
                    {
                    }
                    IF(2r7=""){
                        2r7=0
                    }
                    else
                    {
                    }
                    IF(2r8=""){
                        2r8=0
                    }
                    else
                    {
                    }
                    IF(2r9=""){
                        2r9=0
                    }
                    else
                    {
                    }

                    2now := 2sum - 2r2 - 2r3 - 2r4 - 2r5 - 2r6 - 2r7 - 2r8 - 2r9
                    ;~ MsgBox, % found2[1] "," found2[2] "`n2now:" 2now "`n2sum:" 2sum "`n2r2:" 2r2 "`n2r3:" 2r3 "`n2r4:" 2r4 "`n2r5:" 2r5 "`n2r6:" 2r6 "`n2r7:" 2r7 "`n2r8:" 2r8 "`n2r9:" 2r9
                    LV_Add("", r2, r1, r29, r30, 2now, r31)

                }
                else
                {
                    LV_Add("", r2, r1, r29, r30, r3, r31)
                }
            }


        ;~ GuiControl, enable, LV1
        ;~ GuiControl, enable, LV2
        ;~ GuiControl, enable, LV3
        ;~ GuiControl, enable, LV4
        ;~ GuiControl, enable, LV5
        ;~ GuiControl, enable, LV6
        ;~ GuiControl, enable, LV7
        SB_SetText(frmSAVEDPRESET  " 로케이션고 정보 조회 완료 했습니다")
        GuiControl,, PG, 0
        GuiControl, +Redraw, %HLV1%
        GuiControl, +Redraw, %HLV2%
        GuiControl, +Redraw, %HLV3%
        GuiControl, +Redraw, %HLV4%
        GuiControl, +Redraw, %HLV5%
        GuiControl, +Redraw, %HLV6%
        GuiControl, +Redraw, %HLV7%

        GuiControl, hide, load1
        GuiControl, hide, load2
        GuiControl, hide, load3
        GuiControl, hide, load4
        GuiControl, hide, load5
        GuiControl, hide, load6
        GuiControl, hide, load7
    }
}

연다 = 1
lvget=

return



LVlocation2:
{
    Gui, submit, nohide
    GuiControlGet, showloc, , showlocation
    if (lvget="1") {
        RegExMatch(showloc, "(.*)_(.*)_(.*)", newlocation)
        showloc = % newlocation1 "-" newlocation2 "-" newlocation3

        selectcar := RegExReplace(newlocation1, "\d")  ; 숫자를 제거합니다.
        selectnum := RegExReplace(newlocation1, "\D")  ; 엉어를 제거합니다.
        ;~ MsgBox, % selectedloaction
        GuiControl, Choose, tabname, 1
        Gui, submit, nohide
            ;~ IfWinExist, 화상 키보드
            ;~ {
                ;~ WinActivate, 화상 키보드
            ;~ }
            ;~ else
            ;~ {
                ;~ Run, osk.exe
            ;~ }
        GuiControl, , lo%selnum%_1, % selectcar
        GuiControl, , lo%selnum%_2, % selectnum
        GuiControl, , lo%selnum%_3, % newlocation2
        GuiControl, , lo%selnum%_4, % newlocation3
        GuiControl, focus, lo%selnum%_4
        lvget=
        run, speakerlocation.exe
        return
    }
    else
    {
        showloc:=StrSplit(showloc,"_")
        showloc:=showloc[1] "-" showloc[2]
        Gui,SUBMIT, NOHIDE
        IF (tabname = "▽[K1~K6]`  ")
        {
        GuiControl, -Redraw, %HLV4%
        Gui, Listview, LV4
        }
        else IF (tabname = "▽[K7~K12]`  ")
        {
        GuiControl, -Redraw, %HLV5%
        Gui, Listview, LV5
        }
        else IF (tabname = "▽[G8~7  J4~2]`  ")
        {
        GuiControl, -Redraw, %HLV7%
        Gui, Listview, LV7
        }
        else
        {
        GuiControl, -Redraw, %HLV6%
        Gui, Listview, LV6
        }

        LV_Delete()
        Loop,A_LoopField
          LV_Add("", x*)

        Loop, % Rows
            {
            found:=CSV_Search("data1",showloc,A_Index)
             if found=0
                break
             found:=StrSplit(found,",")
                rr1 := found[2] - 1
                rr2 := found[2]
                rr3 := found[2] + 1
                r1:=CSV_ReadCell("data1",found[1],rr1) ; R1
                r2:=CSV_ReadCell("data1",found[1],rr2) ; L2
                r3:=CSV_ReadCell("data1",found[1],rr3) ; s3
                r0:=CSV_ReadCell("data1",found[1],1) ; original  rfid
                r29:=CSV_ReadCell("data1",found[1],29) ; 상품명
                r30:=CSV_ReadCell("data1",found[1],30) ; 규격
                r31:=CSV_ReadCell("data1",found[1],31) ; pdt code

                RegExMatch(r2, "(.*)-(.*)-(.*)", newr)

                if ((newr3 ="1") or (newr3 ="2") or (newr3 ="3") or (newr3 ="4") or (newr3 ="5") or (newr3 ="6") or (newr3 ="7") or (newr3 ="8") or (newr3 ="9"))
                {
                    newr3 := "0" newr3
                    r2 := newr1 "-" newr2 "-" newr3

                }
                else
                {
                }



                if (rr3 ="3")
                {
                    found2:=CSV_MatchCell("data2",r31)
                    ;~ MsgBox, % found2
                    found2:=StrSplit(found2,",")
                    2sum:=CSV_ReadCell("data2",found2[1],5)
                    2r2:=CSV_ReadCell("data1",found[1],6) ; original  rfid
                    2r3:=CSV_ReadCell("data1",found[1],9) ; original  rfid
                    2r4:=CSV_ReadCell("data1",found[1],12) ; original  rfid
                    2r5:=CSV_ReadCell("data1",found[1],15) ; original  rfid
                    2r6:=CSV_ReadCell("data1",found[1],18) ; original  rfid
                    2r7:=CSV_ReadCell("data1",found[1],21) ; original  rfid
                    2r8:=CSV_ReadCell("data1",found[1],24) ; original  rfid
                    2r9:=CSV_ReadCell("data1",found[1],27) ; original  rfid
                    IF(2r2=""){
                        2r2=0
                    }
                    else
                    {
                    }
                    IF(2r3=""){
                        2r3=0
                    }
                    else
                    {
                    }
                    IF(2r4=""){
                        2r4=0
                    }
                    else
                    {
                    }
                    IF(2r5=""){
                        2r5=0
                    }
                    else
                    {
                    }
                    IF(2r6=""){
                        2r6=0
                    }
                    else
                    {
                    }
                    IF(2r7=""){
                        2r7=0
                    }
                    else
                    {
                    }
                    IF(2r8=""){
                        2r8=0
                    }
                    else
                    {
                    }
                    IF(2r9=""){
                        2r9=0
                    }
                    else
                    {
                    }

                    2now := 2sum - 2r2 - 2r3 - 2r4 - 2r5 - 2r6 - 2r7 - 2r8 - 2r9
                    ;~ MsgBox, % found2[1] "," found2[2] "`n2now:" 2now "`n2sum:" 2sum "`n2r2:" 2r2 "`n2r3:" 2r3 "`n2r4:" 2r4 "`n2r5:" 2r5 "`n2r6:" 2r6 "`n2r7:" 2r7 "`n2r8:" 2r8 "`n2r9:" 2r9
                    LV_Add("", r2, r1, r29, r30, 2now, r31)

                }
                else
                {
                    LV_Add("", r2, r1, r29, r30, r3, r31)
                }
            }
        GuiControl, enable, LV4
        GuiControl, enable, LV5
        GuiControl, enable, LV6
        GuiControl, enable, LV7
        SB_SetText(frmSAVEDPRESET  " 로케이션고 정보 조회 완료 했습니다")
        GuiControl,, PG, 0
        GuiControl, +Redraw, %HLV4%
        GuiControl, +Redraw, %HLV5%
        GuiControl, +Redraw, %HLV6%
        GuiControl, +Redraw, %HLV7%
    }
}

연다 = 1
lvget=
return


select1:
selnum=1
lvget=1
gosub, selectmanual
return

select2:
selnum=2
lvget=1
gosub, selectmanual
return

select3:
selnum=3
lvget=1
gosub, selectmanual
return

select4:
selnum=4
lvget=1
gosub, selectmanual
return

select5:
selnum=5
lvget=1
gosub, selectmanual
return

select6:
selnum=6
lvget=1
gosub, selectmanual
return

select7:
selnum=7
lvget=1
gosub, selectmanual
return

select8:
selnum=8
lvget=1
gosub, selectmanual
return

select9:
selnum=9
lvget=1
gosub, selectmanual
return


selectmanual:
{

selectedloaction =

; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

        WinMinimize, 화상 키보드
    GuiControl, Choose, tabname, 2
    /*
Loop
{
    if GetKeyState("LButton")
    {
        ;~ MouseGetPos, , , id, control
        ;~ WinGetTitle, title, ahk_id %id%
        ;~ WinGetClass, class, ahk_id %id%
        ;~ ControlGetText, selectedloaction , %control%, %Title%
        GuiControlGet, selectedloaction, FocusV
        ;~ MsgBox, ,로케이션번호,% control, 2
        if (selectedloaction="SysTabControl321"){
        }
        else
        {
            break
        }

    }
    else
    {
    }
}

; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

        ;~ MsgBox, % control
    GuiControlget , selectedloaction, focusv,
        RegExMatch(selectedloaction, "(.*)_(.*)", newlocation)
        selectedloaction = % newlocation1 "-" newlocation2 "-"

        selectcar := RegExReplace(newlocation1, "\d")  ; 숫자를 제거합니다.
        selectnum := RegExReplace(newlocation1, "\D")  ; 엉어를 제거합니다.
        ;~ MsgBox, % selectedloaction
    GuiControl, Choose, tabname, 1
        GuiControl, , lo%selnum%_1, % selectcar
        GuiControl, , lo%selnum%_2, % selectnum
        GuiControl, , lo%selnum%_3, % newlocation2
        GuiControl, , lo%selnum%_4,
        GuiControl, focus, lo%selnum%_4
*/
return
}
/*
select4:
연다 =
    selectedloaction =
; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

Loop
{
    if GetKeyState("LButton")
    {
        MouseGetPos, , , id, control
        WinGetTitle, title, ahk_id %id%
        WinGetClass, class, ahk_id %id%
        ControlGetText, selectedloaction , %control%, %Title%
    GuiControlget , selectedloaction, focusv,
        RegExMatch(selectedloaction, "(.*)_(.*)", newlocation)
        selectedloaction = % newlocation1 "-" newlocation2 "-"
            GuiControl, , 4RFID2, %selectedloaction%
    GuiControl, Focus, 4RFID2
    Send, {End}
        run, osk.exe
                winset, alwaysontop, on, ahk_exe osk.exe
        break
    }
    else
    {
    }
}
; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


return
select5:
연다 =
    selectedloaction =
; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

Loop
{
    if GetKeyState("LButton")
    {
        MouseGetPos, , , id, control
        WinGetTitle, title, ahk_id %id%
        WinGetClass, class, ahk_id %id%
        ControlGetText, selectedloaction , %control%, %Title%
    GuiControlget , selectedloaction, focusv,
        RegExMatch(selectedloaction, "(.*)_(.*)", newlocation)
        selectedloaction = % newlocation1 "-" newlocation2 "-"
            GuiControl, , 5RFID2, %selectedloaction%
    GuiControl, Focus, 5RFID2
    Send, {End}
        run, osk.exe
                winset, alwaysontop, on, ahk_exe osk.exe
        break
    }
    else
    {
    }
}
; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


return
select6:
연다 =
    selectedloaction =
; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

Loop
{
    if GetKeyState("LButton")
    {
        MouseGetPos, , , id, control
        WinGetTitle, title, ahk_id %id%
        WinGetClass, class, ahk_id %id%
        ControlGetText, selectedloaction , %control%, %Title%
    GuiControlget , selectedloaction, focusv,
        RegExMatch(selectedloaction, "(.*)_(.*)", newlocation)
        selectedloaction = % newlocation1 "-" newlocation2 "-"

    GuiControl, , 6RFID2, %selectedloaction%
    GuiControl, Focus, 6RFID2
    Send, {End}
        run, osk.exe
                winset, alwaysontop, on, ahk_exe osk.exe
        break
    }
    else
    {
    }
}
; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

return
select7:
연다 =
    selectedloaction =
; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

Loop
{
    if GetKeyState("LButton")
    {
        MouseGetPos, , , id, control
        WinGetTitle, title, ahk_id %id%
        WinGetClass, class, ahk_id %id%
        ControlGetText, selectedloaction , %control%, %Title%
    GuiControlget , selectedloaction, focusv,
        RegExMatch(selectedloaction, "(.*)_(.*)", newlocation)
        selectedloaction = % newlocation1 "-" newlocation2 "-"

    GuiControl, , 7RFID2, %selectedloaction%
    GuiControl, Focus, 7RFID2
    Send, {End}
        run, osk.exe
                winset, alwaysontop, on, ahk_exe osk.exe
        break
    }
    else
    {
    }
}
; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

return
select8:
연다 =
    selectedloaction =
; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

Loop
{
    if GetKeyState("LButton")
    {
        MouseGetPos, , , id, control
        WinGetTitle, title, ahk_id %id%
        WinGetClass, class, ahk_id %id%
        ControlGetText, selectedloaction , %control%, %Title%
    GuiControlget , selectedloaction, focusv,
        RegExMatch(selectedloaction, "(.*)_(.*)", newlocation)
        selectedloaction = % newlocation1 "-" newlocation2 "-"
            GuiControl, , 8RFID2, %selectedloaction%
    GuiControl, Focus, 8RFID2
    Send, {End}
        run, osk.exe
                winset, alwaysontop, on, ahk_exe osk.exe
        break
    }
    else
    {
    }
}
; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


return
select9:
연다 =
    selectedloaction =
; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

Loop
{
    if GetKeyState("LButton")
    {
        MouseGetPos, , , id, control
        WinGetTitle, title, ahk_id %id%
        WinGetClass, class, ahk_id %id%
        ControlGetText, selectedloaction , %control%, %Title%
    GuiControlget , selectedloaction, focusv,
        RegExMatch(selectedloaction, "(.*)_(.*)", newlocation)
        selectedloaction = % newlocation1 "-" newlocation2 "-"
            GuiControl, , 9RFID2, %selectedloaction%
    GuiControl, Focus, 9RFID2
    Send, {End}
        run, osk.exe
                winset, alwaysontop, on, ahk_exe osk.exe
        break
    }
    else
    {
    }
}
; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


return

*/
recordlocation:
; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

Loop
{
    if GetKeyState("LButton")
    {
        MouseGetPos, , , id, control
        WinGetTitle, title, ahk_id %id%
        WinGetClass, class, ahk_id %id%
        ControlGetText, selectedloaction , %control%, %Title%
        RegExMatch(selectedloaction, "(.*)_(.*)", newlocation)
        selectedloaction = % newlocation1 "-" newlocation2 "-"
        ;~ run, osk.exe
        break
    }
    else
    {
    }
}
; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

return



button1:
GuiControl,, PG, 50
GuiControl, ChooseString, frmSAVEDPRESET, 18001B5F42
Sleep, 10
GuiControl,, PG, 100
ControlSend, Edit1, {space},  WMS_VER2 2.0

Sleep, 100

gosub, mapping

return

button22:
; SoundPlay, %A_ScriptDir%\sound\sound5_1.mp3
button2:

Gui, suBMit, nohide

SetKeyDelay, -1
;~ GuiControl, , frmSAVEDPRESET,
ControlSend, combobox1, {ctrl Down}a{ctrl up}, %wintitle%

SetKeyDelay, 2
/*
GuiControl,, PG, 50
Sleep, 1
GuiControl, Move, color1, x10 y10 w0 h0
Sleep, 1
GuiControl, Move, color2, x10 y10 w0 h0
Sleep, 1
GuiControl, Move, color3, x10 y10 w0 h0
Sleep, 1
GuiControl, Move, color4, x10 y10 w0 h0
Sleep, 1
GuiControl, Move, color5, x10 y10 w0 h0
Sleep, 1
GuiControl, Move, color6, x10 y10 w0 h0
Sleep, 1
GuiControl, Move, color7, x10 y10 w0 h0
Sleep, 1
GuiControl, Move, color8, x10 y10 w0 h0
Sleep, 1
GuiControl, Move, color9, x10 y10 w0 h0
Sleep, 1
Gui, submit, nohide
*/




GuiControl,, 이전재고,
GuiControl,, 매출수량,
GuiControl,, 반입수량,
GuiControl,, 매입수량,
GuiControl,, 반출수량,
GuiControl,, 현재수량,
GuiControl,, 전산밴딩,
GuiControl,, 전산낱장,
GuiControl,, 수정값,
GuiControl,, 실제합계,
GuiControl,, 실제낱장,
GuiControl,, RFIDREAD1,
GuiControl,, RFIDREAD2,
GuiControl,, RFIDREAD3,

Gui, Listview, LV1
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
  GuiControl,, PG, +10
GuiControl, , showlocation,
  GuiControl,, PG, 100
    GuiControl,, PG, 0
GuiControl, move, highlight, x0 y0 w0 h0
return


mapping: ;;;;;;;;;;;;;;;;;;1차 이상
gui, submit, nohide
;~ CoordMode, mouse, window
  mapnum = 1
        ;~ AposX =
        ;~ AposY =
        ;~ AposW =
        ;~ AposH =


  Loop, 9
  {
        AposX =
        AposY =
        AposW =
        AposH =
    ctr = % lo%mapnum%_1 lo%mapnum%_2 "_" lo%mapnum%_3

        sAposX =
        sAposY =
        sAposW =
        sAposH =
    2ctr = % lo%mapnum%_1 lo%mapnum%_2 "_" lo%mapnum%_3 "_" lo%mapnum%_4

    ;~ ctr1 = % lo%mapnum%_1 lo%mapnum%_2 "_" lo%mapnum%_3
;~ Sleep, 10
        GuiControlGet, sApos, Pos , %2ctr%
        ;~ GuiControlGet, Apos, Pos , %ctr1%
        ;~ GuiControlGet, Apos1, Pos , A1_1

        ;~ MsgBox, % sAposX "`n"  sAposY "`n"  sAposW "`n"  sAposH
        ;~ MsgBox, % lo%mapnum%_1 "`n" sAposX "`n" sAposY "`n" sAposW "`n" sAposH "`n" ctr

            ;~ MsgBox, x%sAposX% y%sAposY% `n %ctr% `n %ctr1%
        sAposX := sAposX - 5
        sAposY := sAposY - 34
        sAposW := sAposW + 8
        sAposH := sAposH + 8
        GuiControlGet, Apos, Pos , %ctr%
        ;~ GuiControlGet, Apos, Pos , %ctr1%
        ;~ GuiControlGet, Apos1, Pos , A1_1


            ;~ MsgBox, x%AposX% y%AposY% `n %ctr% `n %ctr1%
        AposX := AposX - 5
        AposY := AposY - 34
        AposW := AposW + 8
        AposH := AposH + 8

            ;~ MsgBox, x%AposX% y%AposY% `n %ctr% `n %ctr1%

        ;~ MsgBox, % AposX "`n"  AposY "`n"  AposW "`n"  AposH
        ;~ MsgBox, % sAposX "`n"  sAposY "`n"  sAposW "`n"  sAposH
        ;~ MsgBox, % mapnum "`n" lo%mapnum%_1 "`n" AposX "`n" AposY "`n" AposW "`n" AposH "`n" ctr "`n" 2ctr


        if ( (lo%mapnum%_1 = "A") || (lo%mapnum%_1 = "B") || (lo%mapnum%_1 = "C") || (lo%mapnum%_1 = "D") || (lo%mapnum%_1 = "E") || (lo%mapnum%_1 = "F") || (lo%mapnum%_1 = "G") || (lo%mapnum%_1 = "H") )
        {
            ;~ GuiControl, Choose, tabname, 2
            ;~ MsgBox, x%AposX% y%AposY% `n x%Apos1X% y%Apos1Y%
            ;~ GuiControl, Move, 1color%mapnum%, x700 y300 w100 h50
            GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w%AposW% h%AposH%
            GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w0 h0
            ;~ GuiControl, Move, 4color%mapnum%, x%sAposX% y%sAposY% w0 h0
            ;~ GuiControl, Move, 5color%mapnum%, x%sAposX% y%sAposY% w0 h0
        }
        else if ( (lo%mapnum%_1 = "I") || (lo%mapnum%_1 = "J") || (lo%mapnum%_1 = "K") || (lo%mapnum%_1 = "L")  || (lo%mapnum%_1 = "M") )
        {
            ;~ GuiControl, Choose, tabname, 3
            GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w%AposW% h%AposH%
            GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w0 h0
            ;~ GuiControl, Move, 4color%mapnum%, x%sAposX% y%sAposY% w%sAposW% h%sAposH%
            ;~ GuiControl, Move, 5color%mapnum%, x%sAposX% y%sAposY% w%sAposW% h%sAposH%
        }
        else if ( (lo%mapnum%_1 = "O") || (lo%mapnum%_1 = "P") || (lo%mapnum%_1 = "Q") || (lo%mapnum%_1 = "R")  || (lo%mapnum%_1 = "S")  || (lo%mapnum%_1 = "T")  || (lo%mapnum%_1 = "U") )
        {
            ;~ GuiControl, Choose, tabname, 4
            GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w%AposW% h%AposH%
            GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w0 h0
            ;~ GuiControl, Move, 4color%mapnum%, x%sAposX% y%sAposY% w0 h0
            ;~ GuiControl, Move, 5color%mapnum%, x%sAposX% y%sAposY% w0 h0
        }
        else
        {
            GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w0 h0
            ;~ GuiControl, Move, 4color%mapnum%, x%sAposX% y%sAposY% w0 h0
            ;~ GuiControl, Move, 5color%mapnum%, x%sAposX% y%sAposY% w0 h0
        }



        if ( (lo%mapnum%_1 lo%mapnum%_2 = "K6") || (lo%mapnum%_1 lo%mapnum%_2 = "K5") || (lo%mapnum%_1 lo%mapnum%_2 = "K4") )
        {
            ;~ GuiControl, Choose, tabname, 3
            ;~ GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w%AposW% h%AposH%
            ;~ GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w0 h0
            ;~ GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 4color%mapnum%, x%sAposX% y%sAposY% w%sAposW% h%sAposH%
            GuiControl, Move, 5color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 6color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 7color%mapnum%, x%sAposX% y%sAposY% w0 h0
        }
        else if ( (lo%mapnum%_1 lo%mapnum%_2 = "K3") || (lo%mapnum%_1 lo%mapnum%_2 = "K2") || (lo%mapnum%_1 lo%mapnum%_2 = "K1") )
        {
            ;~ GuiControl, Choose, tabname, 3
            ;~ GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w%AposW% h%AposH%
            ;~ GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w0 h0
            ;~ GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 4color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 5color%mapnum%, x%sAposX% y%sAposY% w%sAposW% h%sAposH%
            GuiControl, Move, 6color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 7color%mapnum%, x%sAposX% y%sAposY% w0 h0
        }
        else if ( (lo%mapnum%_1 lo%mapnum%_2 = "G14") || (lo%mapnum%_1 lo%mapnum%_2 = "G13") || (lo%mapnum%_1 lo%mapnum%_2 = "G12") || (lo%mapnum%_1 lo%mapnum%_2 = "G11") || (lo%mapnum%_1 lo%mapnum%_2 = "G10") || (lo%mapnum%_1 lo%mapnum%_2 = "G9") )
        {
            ;~ GuiControl, Choose, tabname, 3
            ;~ GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w%AposW% h%AposH%
            ;~ GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w0 h0
            ;~ GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 4color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 5color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 6color%mapnum%, x%sAposX% y%sAposY% w%sAposW% h%sAposH%
            GuiControl, Move, 7color%mapnum%, x%sAposX% y%sAposY% w0 h0
        }
        else
        {
            ;~ GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w0 h0
            ;~ GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w0 h0
            ;~ GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 4color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 5color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 6color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 7color%mapnum%, x%sAposX% y%sAposY% w%sAposW% h%sAposH%
        }













        mapnum++
    }



return


mapping2: ;;;;;;;;;;;;;;;;;;1차 이상
gui, submit, nohide
;~ CoordMode, mouse, window
  mapnum = 1
        ;~ sAposX =
        ;~ sAposY =
        ;~ sAposW =
        ;~ sAposH =


  Loop, 9
  {
        sAposX =
        sAposY =
        sAposW =
        sAposH =
    2ctr = % lo%mapnum%_1 lo%mapnum%_2 "_" lo%mapnum%_3 "_" lo%mapnum%_4
    ;~ ctr1 = % lo%mapnum%_1 lo%mapnum%_2 "_" lo%mapnum%_3
;~ Sleep, 10
        GuiControlGet, sApos, Pos , %2ctr%
        ;~ GuiControlGet, Apos, Pos , %ctr1%
        ;~ GuiControlGet, Apos1, Pos , A1_1

        ;~ MsgBox, % sAposX "`n"  sAposY "`n"  sAposW "`n"  sAposH
        ;~ MsgBox, % lo%mapnum%_1 "`n" sAposX "`n" sAposY "`n" sAposW "`n" sAposH "`n" ctr

            ;~ MsgBox, x%sAposX% y%sAposY% `n %ctr% `n %ctr1%
        sAposX := sAposX - 5
        sAposY := sAposY - 34
        sAposW := sAposW + 8
        sAposH := sAposH + 8

            ;~ MsgBox, x%sAposX% y%sAposY% `n %ctr% `n %ctr1%


        if ( (lo%mapnum%_1 = "A") || (lo%mapnum%_1 = "B") || (lo%mapnum%_1 = "C") || (lo%mapnum%_1 = "D") || (lo%mapnum%_1 = "E") || (lo%mapnum%_1 = "F") || (lo%mapnum%_1 = "G") || (lo%mapnum%_1 = "H") )
        {

            GuiControl, Move, 1color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 2color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 3color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 4color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 5color%mapnum%, x%sAposX% y%sAposY% w0 h0
        }
        else if ( (lo%mapnum%_1 = "I") || (lo%mapnum%_1 = "J") || (lo%mapnum%_1 = "K") || (lo%mapnum%_1 = "L")  || (lo%mapnum%_1 = "M") )
        {

            GuiControl, Move, 4color%mapnum%, x%sAposX% y%sAposY% w%sAposW% h%sAposH%
            GuiControl, Move, 5color%mapnum%, x%sAposX% y%sAposY% w%sAposW% h%sAposH%
            GuiControl, Move, 2color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 1color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 3color%mapnum%, x%sAposX% y%sAposY% w0 h0
        }
        else if ( (lo%mapnum%_1 = "O") || (lo%mapnum%_1 = "P") || (lo%mapnum%_1 = "Q") || (lo%mapnum%_1 = "R")  || (lo%mapnum%_1 = "S")  || (lo%mapnum%_1 = "T")  || (lo%mapnum%_1 = "U") )
        {

            GuiControl, Move, 4color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 5color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 3color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 2color%mapnum%, x%sAposX% y%sAposY% w0 h0
            GuiControl, Move, 1color%mapnum%, x%sAposX% y%sAposY% w0 h0
        }

        else
        {
            ;~ GuiControl, Move, 1color%mapnum%, x%sAposX% y%sAposY% w0 h0
            ;~ GuiControl, Move, 2color%mapnum%, x%sAposX% y%sAposY% w0 h0
            ;~ GuiControl, Move, 3color%mapnum%, x%sAposX% y%sAposY% w0 h0
        }
    }
mapnum++


return


btn3:
return








판별기2:

{
    ;~ GuiControl,, PG, +15
gui, submit, nohide



;~ GuiControlGet,판별





        Loop, % Rows4
            {
            foundrows:=CSV_Search("data4",상품코드,A_Index)
             if foundrows=0
                break
             ;~ foundrows:=StrSplit(foundrows,",")

                ;~ foundrows1:=CSV_ReadCell("data1",foundrows[1],1) ; pdt code
                MsgBox, 262160, 수정시 수량 오류 가능성 있음, 오늘 & 내일 출고 예정입니다`n내일 다시 검색해 주세요`n`n수량 수정하지 마세요
                break
            }


return
}















guirestore2:
{
            ;~ MsgBox, 여기5
GuiControl,, PG, 0
Process,close, speak.exe
        GuiControl, hide, highlight
Gui, submit, nohide
    if(rfidcheck = ""){
        rfidcheck = 1
    }
    else
    {
    }
다이렉트리더=1
highlight1X=
highlight1Y=
highlight1W=
highlight1H=
qrloca=
ANU =
ANUM =
arr := [1, 2, 3, 4, 5]

if (rfidcheck = "3"){
    ControlGetText, locarfid, edit82, %WINTITLE%
    frmSAVEDPRESET := locarfid
}
else if (rfidcheck = "2"){
    frmSAVEDPRESET := foundrows1
}
else
{
    ;~ frmSAVEDPRESET := RFIDREAD2
}
ToolTip, % rfidcheck
;~ MsgBox, % foundrows1 "\" rfidcheck "\" brandnew
if (brandnew=1)
{
            GuiControl, text, frmSAVEDPRESET, %RFIDREAD2%
            MsgBox, 등록되지 않은 카드 입니다`n 등록해주세요
            GuiControl, , radio1, 0



    return
}
else
{
    GuiControl, , radio1, 1
    Result := CSV_Search("data1", frmSAVEDPRESET) ; 내에서 텍스트 검색
    Result:=StrSplit(Result,",")
    ;~ Result[1] Result[2]
    GuiControl, , 1RFID2, % CSV_ReadCell("data1",Result[1],2)
    RegExMatch(CSV_ReadCell("data1",Result[1],2), "(.*)-(.*)-(.*)", AA)
    AA11 := RegExReplace(AA1, "\d")
    AA12 := RegExReplace(AA1, "\D")
    GuiControl, , lo1_1, % AA11
    GuiControl, , lo1_2, % AA12
    GuiControl, , lo1_3, % AA2
    GuiControl, , lo1_4, % AA3
    GuiControl, , 1RFID3, % CSV_ReadCell("data1",Result[1],3)
    gosub, radio1

    if (frmSAVEDPRESET = CSV_ReadCell("data1",Result[1],1)){

    }
    else
    {
    }
}



;~ MsgBox, % highlight1X "`n" highlight1Y "`n" highlight1W "`n" highlight1H "`n" ; ;



ANU = 2
ANUM = 3
Loop, 8
{

    ANUM++
GuiControl, , %ANU%RFID1, % CSV_ReadCell("data1",Result[1],ANUM)
    ;~ MsgBox, % "긁힘 4`nrfidcheck" rfidcheck "`nCSV_readcell:" CSV_ReadCell("data1",Result[1],ANUM) "`nfrmSAVEDPRESET : " frmSAVEDPRESET "`nlocarfid : " locarfid "`nANU : " ANU



if (frmSAVEDPRESET = CSV_ReadCell("data1",Result[1],ANUM)){
        GuiControl, , radio%ANU%, 1

        gosub, radio%ANU%

}
else
{
        GuiControl, , radio%ANU%, 0
        ;~ GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W0 h0
}

;~ MsgBox, % qrloca




    ANUM++
GuiControl, , %ANU%RFID2, % CSV_ReadCell("data1",Result[1],ANUM) ;실제낱장


RegExMatch(CSV_ReadCell("data1",Result[1],ANUM), "(.*)-(.*)-(.*)", AA)

AA11 := RegExReplace(AA1, "\d")
AA12 := RegExReplace(AA1, "\D")
GuiControl, , lo%ANU%_1, % AA11
GuiControl, , lo%ANU%_2, % AA12
GuiControl, , lo%ANU%_3, % AA2
GuiControl, , lo%ANU%_4, % AA3


GuiControl,, PG, +3

    ANUM++
GuiControl, , %ANU%RFID3, % CSV_ReadCell("data1",Result[1],ANUM)
    ANU ++
GuiControl,, PG, +5

}



;~ MsgBox, % highlight1X "," highlight1Y

GuiControl, choosestring, frmSAVEDPRESET, % CSV_ReadCell("data1",Result[1],1)


GuiControl, , 상품코드, % CSV_ReadCell("data1",Result[1],31)
GuiControl, , 상품명, % CSV_ReadCell("data1",Result[1],29)
GuiControl, , 규격, % CSV_ReadCell("data1",Result[1],30)
GuiControl, , 비고, % CSV_ReadCell("data1",Result[1],28)

if(mute=""){
run, %A_ScriptDir%\speak.exe
}
else
{
run, %A_ScriptDir%\speakerqrnum.exe
}
mute=
GuiControl,, PG, +10



searchs := CSV_ReadCell("data1",Result[1],31)





;~ Loop, % Rows2
	;~ {
	 found2:=CSV_MatchCell("data2",searchs)
	 ;~ if found2=0
		;~ break
	 found2:=StrSplit(found2,",")
        GuiControl, , 이전재고, % CSV_ReadCell("data2",found2[1],6)
        GuiControl, , 매출수량, % CSV_ReadCell("data2",found2[1],21)
        GuiControl, , 반입수량, % CSV_ReadCell("data2",found2[1],22)
        GuiControl, , 매입수량, % CSV_ReadCell("data2",found2[1],23)
        GuiControl, , 반출수량, % CSV_ReadCell("data2",found2[1],24)
        GuiControl, , 현재수량, % CSV_ReadCell("data2",found2[1],5)
        GuiControl, , 수정값,
        GuiControl, , 실제합계,
        GuiControl, , 실제낱장,
        ;~ GuiControl, , 전산낱장, % CSV_ReadCell("data1",Result[1],)
        ;~ r28:=CSV_ReadCell("data1",found2[1],28) ; 비고

            ;~ LV_Add("", r1, r2, r29, r30, r3, r31)

            ;~ 로케이션|상품명|규격|수량|PRODUCT CODE|RFID CODE|


		;~ MsgBox % found[1] "`n" found[2] "`n" showloc "`n""`n""`n r1" r1 "`n r2"  r2 "`n r3"  r3 "`n r0"  r0
	;~ }
;~ MsgBox, % highlight1X "`n" highlight1Y "`n" highlight1W "`n" highlight1H "`n" ; ;
;~ MouseMove, highlight1X, highlight1Y
if (highlight1X=""){
        GuiControl, move, highlight, x0 y0 W0 h0
    }
    else
    {
    }

GuiControl,, PG, +10

rfidcheck =


        GuiControl, show, highlight

GuiControl,, PG, +10

gosub, 전산밴딩
GuiControl,, PG, 0
;~ gosub, 판별기2
    ;~ IfWinExist, 화상 키보드
    ;~ {
        ;~ WinActivate, 화상 키보드
    ;~ }
    ;~ else
    ;~ {
        ;~ Run, osk.exe
    ;~ }

GuiControl, focus, 실제낱장

return

}






PresetChange:
    SB_SetText(frmSAVEDPRESET " ")
    gui, submit, nohide

                SetKeyDelay, -1
Sleep, 200

;~ gosub, button2

;~ GuiControl, Disable, frmSAVEDPRESET
    ; if drop down text is blank then error message and return
    ;~ if (frmSAVEDPRESET = "")
        ;~ return

    ; save gui values after combobox1 to ini file under given section
    ;~ guirestore("신흥목재재고파악수정.ini",frmSAVEDPRESET)



gosub,guirestore2

;~ gosub, READINFORMATION
 ;~ gosub, mapping
                SetKeyDelay, 2

Sleep, 100

;~ GuiControl, enable, frmSAVEDPRESET
    SB_SetText(frmSAVEDPRESET " 제품 재고 정보 조회 완료 했습니다")

      GuiControl,, PG, 100
      GuiControl,, PG, 0
      ;~ gui, restore
Return

;============================================================
; save preset to presets.ini
;============================================================

SavePreset:
{

Gui, submit, nohide

GuiControlGet, 카드이름,, frmSAVEDPRESET
;~ ControlGetText, 바뀐메인, edit1, 변환 하기
ToolTip, 저장중
CSV_ModifyCell("data1", 1RFID2,Result[1],2) ; change E350 to Mustang
CSV_ModifyCell("data1", 1RFID3,Result[1],3) ; change E350 to Mustang

savenum = 4
AA = 2
Loop, 8
{
    CSV_ModifyCell("data1", %AA%RFID1,Result[1],savenum) ; change E350 to Mustang
    savenum++
    CSV_ModifyCell("data1", %AA%RFID2,Result[1],savenum) ; change E350 to Mustang
    savenum++
    CSV_ModifyCell("data1", %AA%RFID3,Result[1],savenum) ; change E350 to Mustang
    savenum++
    AA++
}

CSV_ModifyCell("data1",상품코드,Result[1],31)
CSV_ModifyCell("data1",상품명,Result[1],29)
CSV_ModifyCell("data1",규격,Result[1],30)
CSV_ModifyCell("data1",비고,Result[1],28)
CSV_Save(csvfile1,"data1",1)

data1=
;~ MsgBox, ,,완료,1
CSV_Load(csvfile1,"data1")
gosub, UpdatePresetList
SoundPlay, %A_ScriptDir%\sound\저장완료.mp3
MsgBox, 262196,,완료,1
        ControlSend, combobox1, {ctrl Down}a{ctrl up}%카드이름%, %WINTITLE%
ToolTip,
}
Return

;============================================================
; delete selected preset section from presets.ini
;============================================================

DeletePreset:
/*
    gui, submit, nohide

    RegExMatch(A_ScriptName, "^(.*?)\.", basename)

    ; if drop down text is blank then error message and return
    if (frmSAVEDPRESET = "") {
        SB_SetText("Preset name required")
        return
    }

    ; delete entire section from ini file
    IniDelete, %A_ScriptDir%\신흥목재재고파악수정.ini, %frmSAVEDPRESET%

    SB_SetText(frmSAVEDPRESET " 삭제됐습니다" )

    GoSub, UpdatePresetList  ; update drop down to show all preset section names in ini file
*/
Return

;============================================================

UpdatePresetList:

    gui, submit, nohide

    ;~ RegExMatch(A_ScriptName, "^(.*?)\.", basename)

    ;~ ; get all section names in ini file
    ;~ IniRead, sectionNames, %A_ScriptDir%\신흥목재재고파악수정.ini
    ;~ sectionNames := RegExReplace(sectionNames , "\n", "|")         ; change newline to pipe
    ;~ sectionNames := RegExReplace(sectionNames , "section1[\|]?", "")    ; exclude section1
    ;~ sectionNames := "|" sectionNames
;~ MsgBox, % sectionNames
    ; update drop down to show all preset section names in ini file
    ;~ GuiControl, , frmSAVEDPRESET, % sectionNames  ; update the control

;~ MsgBox, 22

    GuiControl, , frmSAVEDPRESET, |  ; delete list

Rows:=CSV_TotalRows("data1")
TR1=
real=0
Loop, %Rows%{
    TR1 .= CSV_ReadCell("data1",A_Index,1) "|"
}

    ;~ MsgBox, % TR1
    ;~ GuiControl, , frmSAVEDPRESET,   ; update the control
    GuiControl, , frmSAVEDPRESET, % "|" TR1  ; update the control

Return

;============================================================
; when you click x or close button
;============================================================

GuiClose:

    Gui, Submit, NoHide      ; update control variables
gosub, 인폼받기

    winkill, ahk_exe JedaeroM.exe

    ; use script's basename to define ini file panel position and presets.ini
    RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe


ExitApp


return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;============================================================
; Return window x and y position from ini file.
;============================================================



;============================================================
; save all gui control values for active gui to ini file
;============================================================


GuiSave(inifile,section,begin="",end="")
{
    SplitPath, inifile, file, path, ext, base, drive     ; splitpath expects paths with \

    if (path = "") {   ; if no path given then use default path
        RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe
        inifile := % A_ScriptDir "\신흥목재재고파악수정.ini"
    }

    WinGet, List_controls, ControlList, A    ; get list of all controls active gui

    if (begin = "")
        flag := 0
    else
        flag := 1

    Loop, Parse, List_controls, `n
    {
        ;ControlGet, cid, hWnd,, %A_LoopField%         ; get the id of current control
        GuiControlGet, textvalue,,%A_Loopfield%,Text  ; get associated text
        GuiControlGet, vname, Name, %A_Loopfield%     ; get controls vname

        If (vname = "")   ; only save controls which have a vname
            continue

        if (begin = vname) {
            flag := 0
            continue
        }

        if (flag)
            continue

        if (end = vname)
            break

        GuiControlGet, value ,, %A_Loopfield%         ; get controls value
        value := RegExReplace(value, "`n", "|")       ; convert newlines to pipes (for multiline edit fields, because newlines are not valid for ini file)

        ; todo: truncate edit values to not exceed ini fieldsize limit (1024?)  OR blank (all or nothing)

        IniWrite, % value, %inifile%, %section%, %vname%

    }

   return
}

;============================================================
; Update gui controls with values from ini file.
;============================================================


GuiRestore(inifile,section)
{

    SplitPath, inifile, file, path, ext, base, drive     ; splitpath expects paths with \

    if (path = "") {   ; if no path given then use default path
        RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe
        inifile := % A_ScriptDir "\신흥목재재고파악수정.ini"
    }

    ;============================================================
    ; update gui controls with values from ini file
    ;============================================================

    WinGet, List_controls, ControlList, A   ; get list of all controls for active gui

    Loop, Parse, List_controls, `n
    {

        ;ControlGet, cid, hWnd,, %A_LoopField%         ; get the id of current control
        ;GuiControlGet, textvalue,,%A_Loopfield%,Text  ; get controls associated text
        GuiControlGet, vname, Name, %A_Loopfield%     ; get controls vname
        GuiControlGet, value ,, %A_Loopfield%         ; get controls value
;~ MsgBox, %vname%`n%value%


        If (vname = "")  ; only process controls which have a vname
            continue

        IniRead, value, %inifile%, %section%, %vname%, ERROR

        if (value != "ERROR") {

            value := RegExReplace(value, "\|", "`n")       ; convert pipes to newlines (for multiline edit fields, because newlines are not valid for ini file)

            RegExMatch( A_Loopfield, "(.*?)\d+", name)   ; extract the control name without numbers
            if (name1 = "ComboBox") {
                GuiControl, ChooseString, %A_Loopfield%, %value%   ; select item in dropdownlist
            }
			else if (name1 = "dropdownlist") {
                GuiControl, ChooseString, %A_Loopfield%, %value%   ; select item in dropdownlist
            }
			else {
                GuiControl,  , %A_Loopfield%, %value%    ; update the control
            }
        }

    }

    return

}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


A8_3:
GuiControl, , showlocation, A8_3
gosub, LVlocation
return
A8_2:
GuiControl, , showlocation, A8_2
gosub, LVlocation
return
A8_1:
GuiControl, , showlocation, A8_1
gosub, LVlocation
return

A7_3:
GuiControl, , showlocation, A7_3
gosub, LVlocation
return
A7_2:
GuiControl, , showlocation, A7_2
gosub, LVlocation
return
A7_1:
GuiControl, , showlocation, A7_1
gosub, LVlocation
return
A7_0:
GuiControl, , showlocation, A7_0
gosub, LVlocation
return

A6_3:
GuiControl, , showlocation, A6_3
gosub, LVlocation
return
A6_2:
GuiControl, , showlocation, A6_2
gosub, LVlocation
return
A6_1:
GuiControl, , showlocation, A6_1
gosub, LVlocation
return
A6_0:
GuiControl, , showlocation, A6_0
gosub, LVlocation
return

A5_3:
GuiControl, , showlocation, A5_3
gosub, LVlocation
return
A5_2:
GuiControl, , showlocation, A5_2
gosub, LVlocation
return
A5_1:
GuiControl, , showlocation, A5_1
gosub, LVlocation
return

A4_3:
GuiControl, , showlocation, A4_3
gosub, LVlocation
return
A4_2:
GuiControl, , showlocation, A4_2
gosub, LVlocation
return
A4_1:
GuiControl, , showlocation, A4_1
gosub, LVlocation
return

A3_3:
GuiControl, , showlocation, A3_3
gosub, LVlocation
return
A3_2:
GuiControl, , showlocation, A3_2
gosub, LVlocation
return
A3_1:
GuiControl, , showlocation, A3_1
gosub, LVlocation
return

A2_3:
GuiControl, , showlocation, A2_3
gosub, LVlocation
return
A2_2:
GuiControl, , showlocation, A2_2
gosub, LVlocation
return
A2_1:
GuiControl, , showlocation, A2_1
gosub, LVlocation
return

A1_3:
GuiControl, , showlocation, A1_3
gosub, LVlocation
return
A1_2:
GuiControl, , showlocation, A1_2
gosub, LVlocation
return
A1_1:
GuiControl, , showlocation, A1_1
gosub, LVlocation
return







E2_3:
GuiControl, , showlocation, E2_3
gosub, LVlocation
return
E2_2:
GuiControl, , showlocation, E2_2
gosub, LVlocation
return
E2_1:
GuiControl, , showlocation, E2_1
gosub, LVlocation
return
E1_3:
GuiControl, , showlocation, E1_3
gosub, LVlocation
return

E1_2:
GuiControl, , showlocation, E1_2
gosub, LVlocation
return
E1_1:
GuiControl, , showlocation, E1_1
gosub, LVlocation
return
D1_1:
GuiControl, , showlocation, D1_1
gosub, LVlocation
return
D2_1:
GuiControl, , showlocation, D2_1
gosub, LVlocation
return

D3_1:
GuiControl, , showlocation, D3_1
gosub, LVlocation
return
C4_2:
GuiControl, , showlocation, C4_2
gosub, LVlocation
return
C3_2:
GuiControl, , showlocation, C3_2
gosub, LVlocation
return
C2_2:
GuiControl, , showlocation, C2_2
gosub, LVlocation
return


C6_2:
GuiControl, , showlocation, C6_2
gosub, LVlocation
return
C5_2:
GuiControl, , showlocation, C5_2
gosub, LVlocation
return
C1_2:
GuiControl, , showlocation, C1_2
gosub, LVlocation
return


C9_1:
GuiControl, , showlocation, C9_1
gosub, LVlocation
return
C8_1:
GuiControl, , showlocation, C8_1
gosub, LVlocation
return
C7_1:
GuiControl, , showlocation, C7_1
gosub, LVlocation
return
C9_2:
GuiControl, , showlocation, C9_2
gosub, LVlocation
return
C8_2:
GuiControl, , showlocation, C8_2
gosub, LVlocation
return
C7_2:
GuiControl, , showlocation, C7_2
gosub, LVlocation
return
C6_1:
GuiControl, , showlocation, C6_1
gosub, LVlocation
return

C5_1:
GuiControl, , showlocation, C5_1
gosub, LVlocation
return
C4_1:
GuiControl, , showlocation, C4_1
gosub, LVlocation
return
C3_1:
GuiControl, , showlocation, C3_1
gosub, LVlocation
return
C2_1:
GuiControl, , showlocation, C2_1
gosub, LVlocation
return

C1_1:
GuiControl, , showlocation, C1_1
gosub, LVlocation
return
F4_3:
GuiControl, , showlocation, F4_3
gosub, LVlocation
return
F4_2:
GuiControl, , showlocation, F4_2
gosub, LVlocation
return
F4_1:
GuiControl, , showlocation, F4_1
gosub, LVlocation
return
F4_0:
GuiControl, , showlocation, F4_1
gosub, LVlocation
return

F3_3:
GuiControl, , showlocation, F3_3
gosub, LVlocation
return
F3_2:
GuiControl, , showlocation, F3_2
gosub, LVlocation
return
F3_1:
GuiControl, , showlocation, F3_1
gosub, LVlocation
return
F3_0:
GuiControl, , showlocation, F3_1
gosub, LVlocation
return
F2_3:
GuiControl, , showlocation, F2_3
gosub, LVlocation
return

F2_2:
GuiControl, , showlocation, F2_2
gosub, LVlocation
return
F2_1:
GuiControl, , showlocation, F2_1
gosub, LVlocation
return
F2_0:
GuiControl, , showlocation, F2_1
gosub, LVlocation
return
F1_3:
GuiControl, , showlocation, F1_3
gosub, LVlocation
return
F1_2:
GuiControl, , showlocation, F1_2
gosub, LVlocation
return

F1_1:
GuiControl, , showlocation, F1_1
gosub, LVlocation
return
F1_0:
GuiControl, , showlocation, F1_1
gosub, LVlocation
return







K1_0:
GuiControl, , showlocation, K1_1
gosub, LVlocation
return
K1_1:
GuiControl, , showlocation, K1_1
gosub, LVlocation
return
K1_2:
GuiControl, , showlocation, K1_2
gosub, LVlocation
return
K1_3:
GuiControl, , showlocation, K1_3
gosub, LVlocation
return
K1_4:
GuiControl, , showlocation, K1_4
gosub, LVlocation
return
K1_5:
GuiControl, , showlocation, K2_5
gosub, LVlocation
return

K2_0:
GuiControl, , showlocation, K2_0
gosub, LVlocation
return
K2_1:
GuiControl, , showlocation, K2_1
gosub, LVlocation
return
K2_2:
GuiControl, , showlocation, K2_2
gosub, LVlocation
return
K2_3:
GuiControl, , showlocation, K2_3
gosub, LVlocation
return
K2_4:
GuiControl, , showlocation, K2_4
gosub, LVlocation
return
K2_5:
GuiControl, , showlocation, K2_5
gosub, LVlocation
return


K3_0:
GuiControl, , showlocation, K3_0
gosub, LVlocation
return
K3_1:
GuiControl, , showlocation, K3_1
gosub, LVlocation
return
K3_2:
GuiControl, , showlocation, K3_2
gosub, LVlocation
return
K3_3:
GuiControl, , showlocation, K3_3
gosub, LVlocation
return
K3_4:
GuiControl, , showlocation, K3_4
gosub, LVlocation
return
K3_5:
GuiControl, , showlocation, K3_5
gosub, LVlocation
return



K4_0:
GuiControl, , showlocation, K4_0
gosub, LVlocation
return
K4_1:
GuiControl, , showlocation, K4_1
gosub, LVlocation
return
K4_2:
GuiControl, , showlocation, K4_2
gosub, LVlocation
return
K4_3:
GuiControl, , showlocation, K4_3
gosub, LVlocation
return
K4_4:
GuiControl, , showlocation, K4_4
gosub, LVlocation
return
K4_5:
GuiControl, , showlocation, K4_5
gosub, LVlocation
return



K5_0:
GuiControl, , showlocation, K5_1
gosub, LVlocation
return
K5_1:
GuiControl, , showlocation, K5_1
gosub, LVlocation
return
K5_2:
GuiControl, , showlocation, K5_2
gosub, LVlocation
return
K5_3:
GuiControl, , showlocation, K5_3
gosub, LVlocation
return
K5_4:
GuiControl, , showlocation, K5_4
gosub, LVlocation
return
K5_5:
GuiControl, , showlocation, K5_5
gosub, LVlocation
return


K6_0:
GuiControl, , showlocation, K6_0
gosub, LVlocation
return
K6_1:
GuiControl, , showlocation, K6_1
gosub, LVlocation
return
K6_2:
GuiControl, , showlocation, K6_2
gosub, LVlocation
return
K6_3:
GuiControl, , showlocation, K6_3
gosub, LVlocation
return
K6_4:
GuiControl, , showlocation, K6_4
gosub, LVlocation
return
K6_5:
GuiControl, , showlocation, K6_5
gosub, LVlocation
return




K7_0:
GuiControl, , showlocation, K7_0
gosub, LVlocation
return
K7_1:
GuiControl, , showlocation, K7_1
gosub, LVlocation
return
K7_2:
GuiControl, , showlocation, K7_2
gosub, LVlocation
return
K7_3:
GuiControl, , showlocation, K7_3
gosub, LVlocation
return
K7_4:
GuiControl, , showlocation, K7_4
gosub, LVlocation
return
K7_5:
GuiControl, , showlocation, K7_5
gosub, LVlocation
return




K8_0:
GuiControl, , showlocation, K8_0
gosub, LVlocation
return
K8_1:
GuiControl, , showlocation, K8_1
gosub, LVlocation
return
K8_2:
GuiControl, , showlocation, K8_2
gosub, LVlocation
return
K8_3:
GuiControl, , showlocation, K8_3
gosub, LVlocation
return
K8_4:
GuiControl, , showlocation, K8_4
gosub, LVlocation
return
K8_5:
GuiControl, , showlocation, K8_5
gosub, LVlocation
return




K9_0:
GuiControl, , showlocation, K9_0
gosub, LVlocation
return
K9_1:
GuiControl, , showlocation, K9_1
gosub, LVlocation
return
K9_2:
GuiControl, , showlocation, K9_2
gosub, LVlocation
return
K9_3:
GuiControl, , showlocation, K9_3
gosub, LVlocation
return
K9_4:
GuiControl, , showlocation, K9_4
gosub, LVlocation
return
K9_5:
GuiControl, , showlocation, K9_5
gosub, LVlocation
return




K10_0:
GuiControl, , showlocation, K10_0
gosub, LVlocation
return
K10_1:
GuiControl, , showlocation, K10_1
gosub, LVlocation
return
K10_2:
GuiControl, , showlocation, K10_2
gosub, LVlocation
return
K10_3:
GuiControl, , showlocation, K10_3
gosub, LVlocation
return
K10_4:
GuiControl, , showlocation, K10_4
gosub, LVlocation
return
K10_5:
GuiControl, , showlocation, K10_5
gosub, LVlocation
return




K11_0:
GuiControl, , showlocation, K11_0
gosub, LVlocation
return
K11_1:
GuiControl, , showlocation, K11_1
gosub, LVlocation
return
K11_2:
GuiControl, , showlocation, K11_2
gosub, LVlocation
return
K11_3:
GuiControl, , showlocation, K11_3
gosub, LVlocation
return
K11_4:
GuiControl, , showlocation, K11_4
gosub, LVlocation
return
K11_5:
GuiControl, , showlocation, K11_5
gosub, LVlocation
return




K12_0:
GuiControl, , showlocation, K12_0
gosub, LVlocation
return
K12_1:
GuiControl, , showlocation, K12_1
gosub, LVlocation
return
K12_2:
GuiControl, , showlocation, K12_2
gosub, LVlocation
return
K12_3:
GuiControl, , showlocation, K12_3
gosub, LVlocation
return
K12_4:
GuiControl, , showlocation, K12_4
gosub, LVlocation
return
K12_5:
GuiControl, , showlocation, K12_5
gosub, LVlocation
return




K13_0:
GuiControl, , showlocation, K13_0
gosub, LVlocation
return
K13_1:
GuiControl, , showlocation, K13_1
gosub, LVlocation
return
K13_2:
GuiControl, , showlocation, K13_2
gosub, LVlocation
return
K13_3:
GuiControl, , showlocation, K13_3
gosub, LVlocation
return
K13_4:
GuiControl, , showlocation, K13_4
gosub, LVlocation
return
K13_5:
GuiControl, , showlocation, K13_5
gosub, LVlocation
return




K14_0:
GuiControl, , showlocation, K14_0
gosub, LVlocation
return
K14_1:
GuiControl, , showlocation, K14_1
gosub, LVlocation
return
K14_2:
GuiControl, , showlocation, K14_2
gosub, LVlocation
return
K14_3:
GuiControl, , showlocation, K14_3
gosub, LVlocation
return
K14_4:
GuiControl, , showlocation, K14_4
gosub, LVlocation
return
K14_5:
GuiControl, , showlocation, K14_5
gosub, LVlocation
return







L5_1:
GuiControl, , showlocation, L5_1
gosub, LVlocation
return
L4_1:
GuiControl, , showlocation, L4_1
gosub, LVlocation
return
L3_2:
GuiControl, , showlocation, L3_2
gosub, LVlocation
return
L2_2:
GuiControl, , showlocation, L2_2
gosub, LVlocation
return



L1_2:
GuiControl, , showlocation, L1_2
gosub, LVlocation
return
L1_1:
GuiControl, , showlocation, L1_1
gosub, LVlocation
return
L2_1:
GuiControl, , showlocation, L2_1
gosub, LVlocation
return
L3_1:
GuiControl, , showlocation, L3_1
gosub, LVlocation
return


F0_1:
GuiControl, , showlocation, F0_1
gosub, LVlocation
return
L3_3:
GuiControl, , showlocation, L3_3
gosub, LVlocation
return
L2_3:
GuiControl, , showlocation, L2_3
gosub, LVlocation
return
L1_3:
GuiControl, , showlocation, L1_3
gosub, LVlocation
return




M1_1:
GuiControl, , showlocation, M1_1
gosub, LVlocation
return

J1_1:
GuiControl, , showlocation, J1_1
gosub, LVlocation
return
J1_2:
GuiControl, , showlocation, J1_1
gosub, LVlocation
return
J1_3:
GuiControl, , showlocation, J1_1
gosub, LVlocation
return
J1_4:
GuiControl, , showlocation, J1_1
gosub, LVlocation
return
return

J2_1:
GuiControl, , showlocation, J2_1
gosub, LVlocation
return
J2_2:
GuiControl, , showlocation, J2_2
gosub, LVlocation
return
J2_3:
GuiControl, , showlocation, J2_3
gosub, LVlocation
return

J2_4:
GuiControl, , showlocation, J2_3
gosub, LVlocation
return

J4_1:
GuiControl, , showlocation, J4_1
gosub, LVlocation
return
J4_2:
GuiControl, , showlocation, J4_2
gosub, LVlocation
return
J4_3:
GuiControl, , showlocation, J4_3
gosub, LVlocation
return



J3_1:
GuiControl, , showlocation, J3_1
gosub, LVlocation
return
J3_2:
GuiControl, , showlocation, J3_2
gosub, LVlocation
return
J3_3:
GuiControl, , showlocation, J3_3
gosub, LVlocation
return
J3_4:
GuiControl, , showlocation, J3_4
gosub, LVlocation
return
J3_5:
GuiControl, , showlocation, J3_5
gosub, LVlocation
return
J3_6:
GuiControl, , showlocation, J3_6
gosub, LVlocation
return
H13_2:
GuiControl, , showlocation, H13_2
gosub, LVlocation
return
H14_1:
GuiControl, , showlocation, H14_1
gosub, LVlocation
return
G14_3:
GuiControl, , showlocation, G14_3
gosub, LVlocation
return





H12_2:
GuiControl, , showlocation, H12_2
gosub, LVlocation
return
H11_2:
GuiControl, , showlocation, H11_2
gosub, LVlocation
return
H10_2:
GuiControl, , showlocation, H10_2
gosub, LVlocation
return
G14_2:
GuiControl, , showlocation, G14_2
gosub, LVlocation
return

G14_1:
GuiControl, , showlocation, G14_1
gosub, LVlocation
return
H13_1:
GuiControl, , showlocation, H13_1
gosub, LVlocation
return
G13_3:
GuiControl, , showlocation, G13_3
gosub, LVlocation
return
H14_2:
GuiControl, , showlocation, H14_2
gosub, LVlocation
return



H14_3:
GuiControl, , showlocation, H14_3
gosub, LVlocation
return
H13_3:
GuiControl, , showlocation, H13_3
gosub, LVlocation
return
G13_2:
GuiControl, , showlocation, G13_2
gosub, LVlocation
return
G13_1:
GuiControl, , showlocation, G13_1
gosub, LVlocation
return


H12_3:
GuiControl, , showlocation, H12_3
gosub, LVlocation
return
H12_1:
GuiControl, , showlocation, H12_1
gosub, LVlocation
return
G12_3:
GuiControl, , showlocation, G12_3
gosub, LVlocation
return
G12_2:
GuiControl, , showlocation, G12_2
gosub, LVlocation
return


G12_1:
GuiControl, , showlocation, G12_1
gosub, LVlocation
return
H11_3:
GuiControl, , showlocation, H11_3
gosub, LVlocation
return
H11_1:
GuiControl, , showlocation, H11_1
gosub, LVlocation
return
G11_3:
GuiControl, , showlocation, G11_3
gosub, LVlocation
return


G11_2:
GuiControl, , showlocation, G11_2
gosub, LVlocation
return
G11_1:
GuiControl, , showlocation, G11_1
gosub, LVlocation
return
H10_3:
GuiControl, , showlocation, H10_3
gosub, LVlocation
return
H10_1:
GuiControl, , showlocation, H10_1
gosub, LVlocation
return




G10_3:
GuiControl, , showlocation, G10_3
gosub, LVlocation
return
G10_2:
GuiControl, , showlocation, G10_2
gosub, LVlocation
return
G10_1:
GuiControl, , showlocation, G10_1
gosub, LVlocation
return
H9_2:
GuiControl, , showlocation, H9_2
gosub, LVlocation
return



H8_2:
GuiControl, , showlocation, H8_2
gosub, LVlocation
return
H7_2:
GuiControl, , showlocation, H7_2
gosub, LVlocation
return
H5_2:
GuiControl, , showlocation, H5_2
gosub, LVlocation
return
H4_2:
GuiControl, , showlocation, H4_2
gosub, LVlocation
return




H3_2:
GuiControl, , showlocation, H3_2
gosub, LVlocation
return
H2_2:
GuiControl, , showlocation, H2_2
gosub, LVlocation
return
H1_2:
GuiControl, , showlocation, H1_2
gosub, LVlocation
return
H9_3:
GuiControl, , showlocation, H9_3
gosub, LVlocation
return




H9_1:
GuiControl, , showlocation, H9_1
gosub, LVlocation
return
G9_3:
GuiControl, , showlocation, G9_3
gosub, LVlocation
return
G9_2:
GuiControl, , showlocation, G9_2
gosub, LVlocation
return
G9_1:
GuiControl, , showlocation, G9_1
gosub, LVlocation
return



H8_3:
GuiControl, , showlocation, H8_3
gosub, LVlocation
return
H8_1:
GuiControl, , showlocation, H8_1
gosub, LVlocation
return
G8_3:
GuiControl, , showlocation, G8_3
gosub, LVlocation
return
G8_2:
GuiControl, , showlocation, G8_2
gosub, LVlocation
return


G8_1:
GuiControl, , showlocation, G8_1
gosub, LVlocation
return
H7_3:
GuiControl, , showlocation, H7_3
gosub, LVlocation
return
H7_1:
GuiControl, , showlocation, H7_1
gosub, LVlocation
return
G7_3:
GuiControl, , showlocation, G7_3
gosub, LVlocation
return

G7_2:
GuiControl, , showlocation, G7_2
gosub, LVlocation
return
G7_1:
GuiControl, , showlocation, G7_1
gosub, LVlocation
return
H6_3:
GuiControl, , showlocation, H6_3
gosub, LVlocation
return
H6_2:
GuiControl, , showlocation, H6_2
gosub, LVlocation
return



H6_1:
GuiControl, , showlocation, H6_1
gosub, LVlocation
return
G6_3:
GuiControl, , showlocation, G6_3
gosub, LVlocation
return
G6_2:
GuiControl, , showlocation, G6_2
gosub, LVlocation
return
G6_1:
GuiControl, , showlocation, G6_1
gosub, LVlocation
return




H5_3:
GuiControl, , showlocation, H5_3
gosub, LVlocation
return
H5_1:
GuiControl, , showlocation, H5_1
gosub, LVlocation
return
G5_3:
GuiControl, , showlocation, G5_3
gosub, LVlocation
return
G5_2:
GuiControl, , showlocation, G5_2
gosub, LVlocation
return




G5_1:
GuiControl, , showlocation, G5_1
gosub, LVlocation
return
H4_3:
GuiControl, , showlocation, H4_3
gosub, LVlocation
return
H4_1:
GuiControl, , showlocation, H4_1
gosub, LVlocation
return
H3_3:
GuiControl, , showlocation, H3_3
gosub, LVlocation
return

H3_1:
GuiControl, , showlocation, H3_1
gosub, LVlocation
return
G4_3:
GuiControl, , showlocation, G4_3
gosub, LVlocation
return
G4_2:
GuiControl, , showlocation, G4_2
gosub, LVlocation
return
G4_1:
GuiControl, , showlocation, G4_1
gosub, LVlocation
return

G3_3:
GuiControl, , showlocation, G3_3
gosub, LVlocation
return
G3_2:
GuiControl, , showlocation, G3_2
gosub, LVlocation
return
G3_1:
GuiControl, , showlocation, G3_1
gosub, LVlocation
return
H2_3:
GuiControl, , showlocation, H2_3
gosub, LVlocation
return




H2_1:
GuiControl, , showlocation, H2_1
gosub, LVlocation
return
G2_3:
GuiControl, , showlocation, G2_3
gosub, LVlocation
return
G2_2:
GuiControl, , showlocation, G2_2
gosub, LVlocation
return
G2_1:
GuiControl, , showlocation, G2_1
gosub, LVlocation
return



H1_3:
GuiControl, , showlocation, H1_3
gosub, LVlocation
return
H1_1:
GuiControl, , showlocation, H1_1
gosub, LVlocation
return
G1_3:
GuiControl, , showlocation, G1_3
gosub, LVlocation
return
G1_2:
GuiControl, , showlocation, G1_2
gosub, LVlocation
return
G1_1:
GuiControl, , showlocation, G1_1
gosub, LVlocation
return



G14_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G14_3_1
gosub, LVlocation
return
G14_3_2:
GuiControl, , showlocation, G14_3_2
gosub, LVlocation
return
G14_3_3:
GuiControl, , showlocation, G14_3_3
gosub, LVlocation
return
G14_3_4:
GuiControl, , showlocation, G14_3_4
gosub, LVlocation
return
G14_3_5:
GuiControl, , showlocation, G14_3_5
gosub, LVlocation
return
G14_3_6:
GuiControl, , showlocation, G14_3_6
gosub, LVlocation
return
G14_3_7:
GuiControl, , showlocation, G14_3_7
gosub, LVlocation
return
G14_3_8:
GuiControl, , showlocation, G14_3_8
gosub, LVlocation
return
G14_3_9:
GuiControl, , showlocation, G14_3_9
gosub, LVlocation
return
G14_3_10:
GuiControl, , showlocation, G14_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G13_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G13_3_1
gosub, LVlocation
return
G13_3_2:
GuiControl, , showlocation, G13_3_2
gosub, LVlocation
return
G13_3_3:
GuiControl, , showlocation, G13_3_3
gosub, LVlocation
return
G13_3_4:
GuiControl, , showlocation, G13_3_4
gosub, LVlocation
return
G13_3_5:
GuiControl, , showlocation, G13_3_5
gosub, LVlocation
return
G13_3_6:
GuiControl, , showlocation, G13_3_6
gosub, LVlocation
return
G13_3_7:
GuiControl, , showlocation, G13_3_7
gosub, LVlocation
return
G13_3_8:
GuiControl, , showlocation, G13_3_8
gosub, LVlocation
return
G13_3_9:
GuiControl, , showlocation, G13_3_9
gosub, LVlocation
return
G13_3_10:
GuiControl, , showlocation, G13_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


G12_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G12_3_1
gosub, LVlocation
return
G12_3_2:
GuiControl, , showlocation, G12_3_2
gosub, LVlocation
return
G12_3_3:
GuiControl, , showlocation, G12_3_3
gosub, LVlocation
return
G12_3_4:
GuiControl, , showlocation, G12_3_4
gosub, LVlocation
return
G12_3_5:
GuiControl, , showlocation, G12_3_5
gosub, LVlocation
return
G12_3_6:
GuiControl, , showlocation, G12_3_6
gosub, LVlocation
return
G12_3_7:
GuiControl, , showlocation, G12_3_7
gosub, LVlocation
return
G12_3_8:
GuiControl, , showlocation, G12_3_8
gosub, LVlocation
return
G12_3_9:
GuiControl, , showlocation, G12_3_9
gosub, LVlocation
return
G12_3_10:
GuiControl, , showlocation, G12_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G11_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G11_3_1
gosub, LVlocation
return
G11_3_2:
GuiControl, , showlocation, G11_3_2
gosub, LVlocation
return
G11_3_3:
GuiControl, , showlocation, G11_3_3
gosub, LVlocation
return
G11_3_4:
GuiControl, , showlocation, G11_3_4
gosub, LVlocation
return
G11_3_5:
GuiControl, , showlocation, G11_3_5
gosub, LVlocation
return
G11_3_6:
GuiControl, , showlocation, G11_3_6
gosub, LVlocation
return
G11_3_7:
GuiControl, , showlocation, G11_3_7
gosub, LVlocation
return
G11_3_8:
GuiControl, , showlocation, G11_3_8
gosub, LVlocation
return
G11_3_9:
GuiControl, , showlocation, G11_3_9
gosub, LVlocation
return
G11_3_10:
GuiControl, , showlocation, G11_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





G14_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G14_2_1
gosub, LVlocation
return
G14_2_2:
GuiControl, , showlocation, G14_2_2
gosub, LVlocation
return
G14_2_3:
GuiControl, , showlocation, G14_2_3
gosub, LVlocation
return
G14_2_4:
GuiControl, , showlocation, G14_2_4
gosub, LVlocation
return
G14_2_5:
GuiControl, , showlocation, G14_2_5
gosub, LVlocation
return
G14_2_6:
GuiControl, , showlocation, G14_2_6
gosub, LVlocation
return
G14_2_7:
GuiControl, , showlocation, G14_2_7
gosub, LVlocation
return
G14_2_8:
GuiControl, , showlocation, G14_2_8
gosub, LVlocation
return
G14_2_9:
GuiControl, , showlocation, G14_2_9
gosub, LVlocation
return
G14_2_10:
GuiControl, , showlocation, G14_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G13_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G13_2_1
gosub, LVlocation
return
G13_2_2:
GuiControl, , showlocation, G13_2_2
gosub, LVlocation
return
G13_2_3:
GuiControl, , showlocation, G13_2_3
gosub, LVlocation
return
G13_2_4:
GuiControl, , showlocation, G13_2_4
gosub, LVlocation
return
G13_2_5:
GuiControl, , showlocation, G13_2_5
gosub, LVlocation
return
G13_2_6:
GuiControl, , showlocation, G13_2_6
gosub, LVlocation
return
G13_2_7:
GuiControl, , showlocation, G13_2_7
gosub, LVlocation
return
G13_2_8:
GuiControl, , showlocation, G13_2_8
gosub, LVlocation
return
G13_2_9:
GuiControl, , showlocation, G13_2_9
gosub, LVlocation
return
G13_2_10:
GuiControl, , showlocation, G13_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


G12_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G12_2_1
gosub, LVlocation
return
G12_2_2:
GuiControl, , showlocation, G12_2_2
gosub, LVlocation
return
G12_2_3:
GuiControl, , showlocation, G12_2_3
gosub, LVlocation
return
G12_2_4:
GuiControl, , showlocation, G12_2_4
gosub, LVlocation
return
G12_2_5:
GuiControl, , showlocation, G12_2_5
gosub, LVlocation
return
G12_2_6:
GuiControl, , showlocation, G12_2_6
gosub, LVlocation
return
G12_2_7:
GuiControl, , showlocation, G12_2_7
gosub, LVlocation
return
G12_2_8:
GuiControl, , showlocation, G12_2_8
gosub, LVlocation
return
G12_2_9:
GuiControl, , showlocation, G12_2_9
gosub, LVlocation
return
G12_2_10:
GuiControl, , showlocation, G12_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G11_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G11_2_1
gosub, LVlocation
return
G11_2_2:
GuiControl, , showlocation, G11_2_2
gosub, LVlocation
return
G11_2_3:
GuiControl, , showlocation, G11_2_3
gosub, LVlocation
return
G11_2_4:
GuiControl, , showlocation, G11_2_4
gosub, LVlocation
return
G11_2_5:
GuiControl, , showlocation, G11_2_5
gosub, LVlocation
return
G11_2_6:
GuiControl, , showlocation, G11_2_6
gosub, LVlocation
return
G11_2_7:
GuiControl, , showlocation, G11_2_7
gosub, LVlocation
return
G11_2_8:
GuiControl, , showlocation, G11_2_8
gosub, LVlocation
return
G11_2_9:
GuiControl, , showlocation, G11_2_9
gosub, LVlocation
return
G11_2_10:
GuiControl, , showlocation, G11_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~






G14_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G14_1_1
gosub, LVlocation
return
G14_1_2:
GuiControl, , showlocation, G14_1_2
gosub, LVlocation
return
G14_1_3:
GuiControl, , showlocation, G14_1_3
gosub, LVlocation
return
G14_1_4:
GuiControl, , showlocation, G14_1_4
gosub, LVlocation
return
G14_1_5:
GuiControl, , showlocation, G14_1_5
gosub, LVlocation
return
G14_1_6:
GuiControl, , showlocation, G14_1_6
gosub, LVlocation
return
G14_1_7:
GuiControl, , showlocation, G14_1_7
gosub, LVlocation
return
G14_1_8:
GuiControl, , showlocation, G14_1_8
gosub, LVlocation
return
G14_1_9:
GuiControl, , showlocation, G14_1_9
gosub, LVlocation
return
G14_1_10:
GuiControl, , showlocation, G14_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G13_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G13_1_1
gosub, LVlocation
return
G13_1_2:
GuiControl, , showlocation, G13_1_2
gosub, LVlocation
return
G13_1_3:
GuiControl, , showlocation, G13_1_3
gosub, LVlocation
return
G13_1_4:
GuiControl, , showlocation, G13_1_4
gosub, LVlocation
return
G13_1_5:
GuiControl, , showlocation, G13_1_5
gosub, LVlocation
return
G13_1_6:
GuiControl, , showlocation, G13_1_6
gosub, LVlocation
return
G13_1_7:
GuiControl, , showlocation, G13_1_7
gosub, LVlocation
return
G13_1_8:
GuiControl, , showlocation, G13_1_8
gosub, LVlocation
return
G13_1_9:
GuiControl, , showlocation, G13_1_9
gosub, LVlocation
return
G13_1_10:
GuiControl, , showlocation, G13_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


G12_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G12_1_1
gosub, LVlocation
return
G12_1_2:
GuiControl, , showlocation, G12_1_2
gosub, LVlocation
return
G12_1_3:
GuiControl, , showlocation, G12_1_3
gosub, LVlocation
return
G12_1_4:
GuiControl, , showlocation, G12_1_4
gosub, LVlocation
return
G12_1_5:
GuiControl, , showlocation, G12_1_5
gosub, LVlocation
return
G12_1_6:
GuiControl, , showlocation, G12_1_6
gosub, LVlocation
return
G12_1_7:
GuiControl, , showlocation, G12_1_7
gosub, LVlocation
return
G12_1_8:
GuiControl, , showlocation, G12_1_8
gosub, LVlocation
return
G12_1_9:
GuiControl, , showlocation, G12_1_9
gosub, LVlocation
return
G12_1_10:
GuiControl, , showlocation, G12_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G11_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G11_1_1
gosub, LVlocation
return
G11_1_2:
GuiControl, , showlocation, G11_1_2
gosub, LVlocation
return
G11_1_3:
GuiControl, , showlocation, G11_1_3
gosub, LVlocation
return
G11_1_4:
GuiControl, , showlocation, G11_1_4
gosub, LVlocation
return
G11_1_5:
GuiControl, , showlocation, G11_1_5
gosub, LVlocation
return
G11_1_6:
GuiControl, , showlocation, G11_1_6
gosub, LVlocation
return
G11_1_7:
GuiControl, , showlocation, G11_1_7
gosub, LVlocation
return
G11_1_8:
GuiControl, , showlocation, G11_1_8
gosub, LVlocation
return
G11_1_9:
GuiControl, , showlocation, G11_1_9
gosub, LVlocation
return
G11_1_10:
GuiControl, , showlocation, G11_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







G10_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G10_3_1
gosub, LVlocation
return
G10_3_2:
GuiControl, , showlocation, G10_3_2
gosub, LVlocation
return
G10_3_3:
GuiControl, , showlocation, G10_3_3
gosub, LVlocation
return
G10_3_4:
GuiControl, , showlocation, G10_3_4
gosub, LVlocation
return
G10_3_5:
GuiControl, , showlocation, G10_3_5
gosub, LVlocation
return
G10_3_6:
GuiControl, , showlocation, G10_3_6
gosub, LVlocation
return
G10_3_7:
GuiControl, , showlocation, G10_3_7
gosub, LVlocation
return
G10_3_8:
GuiControl, , showlocation, G10_3_8
gosub, LVlocation
return
G10_3_9:
GuiControl, , showlocation, G10_3_9
gosub, LVlocation
return
G10_3_10:
GuiControl, , showlocation, G10_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G9_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G9_3_1
gosub, LVlocation
return
G9_3_2:
GuiControl, , showlocation, G9_3_2
gosub, LVlocation
return
G9_3_3:
GuiControl, , showlocation, G9_3_3
gosub, LVlocation
return
G9_3_4:
GuiControl, , showlocation, G9_3_4
gosub, LVlocation
return
G9_3_5:
GuiControl, , showlocation, G9_3_5
gosub, LVlocation
return
G9_3_6:
GuiControl, , showlocation, G9_3_6
gosub, LVlocation
return
G9_3_7:
GuiControl, , showlocation, G9_3_7
gosub, LVlocation
return
G9_3_8:
GuiControl, , showlocation, G9_3_8
gosub, LVlocation
return
G9_3_9:
GuiControl, , showlocation, G9_3_9
gosub, LVlocation
return
G9_3_10:
GuiControl, , showlocation, G9_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







G10_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G10_2_1
gosub, LVlocation
return
G10_2_2:
GuiControl, , showlocation, G10_2_2
gosub, LVlocation
return
G10_2_3:
GuiControl, , showlocation, G10_2_3
gosub, LVlocation
return
G10_2_4:
GuiControl, , showlocation, G10_2_4
gosub, LVlocation
return
G10_2_5:
GuiControl, , showlocation, G10_2_5
gosub, LVlocation
return
G10_2_6:
GuiControl, , showlocation, G10_2_6
gosub, LVlocation
return
G10_2_7:
GuiControl, , showlocation, G10_2_7
gosub, LVlocation
return
G10_2_8:
GuiControl, , showlocation, G10_2_8
gosub, LVlocation
return
G10_2_9:
GuiControl, , showlocation, G10_2_9
gosub, LVlocation
return
G10_2_10:
GuiControl, , showlocation, G10_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G9_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G9_2_1
gosub, LVlocation
return
G9_2_2:
GuiControl, , showlocation, G9_2_2
gosub, LVlocation
return
G9_2_3:
GuiControl, , showlocation, G9_2_3
gosub, LVlocation
return
G9_2_4:
GuiControl, , showlocation, G9_2_4
gosub, LVlocation
return
G9_2_5:
GuiControl, , showlocation, G9_2_5
gosub, LVlocation
return
G9_2_6:
GuiControl, , showlocation, G9_2_6
gosub, LVlocation
return
G9_2_7:
GuiControl, , showlocation, G9_2_7
gosub, LVlocation
return
G9_2_8:
GuiControl, , showlocation, G9_2_8
gosub, LVlocation
return
G9_2_9:
GuiControl, , showlocation, G9_2_9
gosub, LVlocation
return
G9_2_10:
GuiControl, , showlocation, G9_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~








G10_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G10_1_1
gosub, LVlocation
return
G10_1_2:
GuiControl, , showlocation, G10_1_2
gosub, LVlocation
return
G10_1_3:
GuiControl, , showlocation, G10_1_3
gosub, LVlocation
return
G10_1_4:
GuiControl, , showlocation, G10_1_4
gosub, LVlocation
return
G10_1_5:
GuiControl, , showlocation, G10_1_5
gosub, LVlocation
return
G10_1_6:
GuiControl, , showlocation, G10_1_6
gosub, LVlocation
return
G10_1_7:
GuiControl, , showlocation, G10_1_7
gosub, LVlocation
return
G10_1_8:
GuiControl, , showlocation, G10_1_8
gosub, LVlocation
return
G10_1_9:
GuiControl, , showlocation, G10_1_9
gosub, LVlocation
return
G10_1_10:
GuiControl, , showlocation, G10_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G9_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G9_1_1
gosub, LVlocation
return
G9_1_2:
GuiControl, , showlocation, G9_1_2
gosub, LVlocation
return
G9_1_3:
GuiControl, , showlocation, G9_1_3
gosub, LVlocation
return
G9_1_4:
GuiControl, , showlocation, G9_1_4
gosub, LVlocation
return
G9_1_5:
GuiControl, , showlocation, G9_1_5
gosub, LVlocation
return
G9_1_6:
GuiControl, , showlocation, G9_1_6
gosub, LVlocation
return
G9_1_7:
GuiControl, , showlocation, G9_1_7
gosub, LVlocation
return
G9_1_8:
GuiControl, , showlocation, G9_1_8
gosub, LVlocation
return
G9_1_9:
GuiControl, , showlocation, G9_1_9
gosub, LVlocation
return
G9_1_10:
GuiControl, , showlocation, G9_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







G8_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G8_3_1
gosub, LVlocation
return
G8_3_2:
GuiControl, , showlocation, G8_3_2
gosub, LVlocation
return
G8_3_3:
GuiControl, , showlocation, G8_3_3
gosub, LVlocation
return
G8_3_4:
GuiControl, , showlocation, G8_3_4
gosub, LVlocation
return
G8_3_5:
GuiControl, , showlocation, G8_3_5
gosub, LVlocation
return
G8_3_6:
GuiControl, , showlocation, G8_3_6
gosub, LVlocation
return
G8_3_7:
GuiControl, , showlocation, G8_3_7
gosub, LVlocation
return
G8_3_8:
GuiControl, , showlocation, G8_3_8
gosub, LVlocation
return
G8_3_9:
GuiControl, , showlocation, G8_3_9
gosub, LVlocation
return
G8_3_10:
GuiControl, , showlocation, G8_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G7_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G7_3_1
gosub, LVlocation
return
G7_3_2:
GuiControl, , showlocation, G7_3_2
gosub, LVlocation
return
G7_3_3:
GuiControl, , showlocation, G7_3_3
gosub, LVlocation
return
G7_3_4:
GuiControl, , showlocation, G7_3_4
gosub, LVlocation
return
G7_3_5:
GuiControl, , showlocation, G7_3_5
gosub, LVlocation
return
G7_3_6:
GuiControl, , showlocation, G7_3_6
gosub, LVlocation
return
G7_3_7:
GuiControl, , showlocation, G7_3_7
gosub, LVlocation
return
G7_3_8:
GuiControl, , showlocation, G7_3_8
gosub, LVlocation
return
G7_3_9:
GuiControl, , showlocation, G7_3_9
gosub, LVlocation
return
G7_3_10:
GuiControl, , showlocation, G7_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







G8_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G8_2_1
gosub, LVlocation
return
G8_2_2:
GuiControl, , showlocation, G8_2_2
gosub, LVlocation
return
G8_2_3:
GuiControl, , showlocation, G8_2_3
gosub, LVlocation
return
G8_2_4:
GuiControl, , showlocation, G8_2_4
gosub, LVlocation
return
G8_2_5:
GuiControl, , showlocation, G8_2_5
gosub, LVlocation
return
G8_2_6:
GuiControl, , showlocation, G8_2_6
gosub, LVlocation
return
G8_2_7:
GuiControl, , showlocation, G8_2_7
gosub, LVlocation
return
G8_2_8:
GuiControl, , showlocation, G8_2_8
gosub, LVlocation
return
G8_2_9:
GuiControl, , showlocation, G8_2_9
gosub, LVlocation
return
G8_2_10:
GuiControl, , showlocation, G8_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G7_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G7_2_1
gosub, LVlocation
return
G7_2_2:
GuiControl, , showlocation, G7_2_2
gosub, LVlocation
return
G7_2_3:
GuiControl, , showlocation, G7_2_3
gosub, LVlocation
return
G7_2_4:
GuiControl, , showlocation, G7_2_4
gosub, LVlocation
return
G7_2_5:
GuiControl, , showlocation, G7_2_5
gosub, LVlocation
return
G7_2_6:
GuiControl, , showlocation, G7_2_6
gosub, LVlocation
return
G7_2_7:
GuiControl, , showlocation, G7_2_7
gosub, LVlocation
return
G7_2_8:
GuiControl, , showlocation, G7_2_8
gosub, LVlocation
return
G7_2_9:
GuiControl, , showlocation, G7_2_9
gosub, LVlocation
return
G7_2_10:
GuiControl, , showlocation, G7_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~








G8_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G8_1_1
gosub, LVlocation
return
G8_1_2:
GuiControl, , showlocation, G8_1_2
gosub, LVlocation
return
G8_1_3:
GuiControl, , showlocation, G8_1_3
gosub, LVlocation
return
G8_1_4:
GuiControl, , showlocation, G8_1_4
gosub, LVlocation
return
G8_1_5:
GuiControl, , showlocation, G8_1_5
gosub, LVlocation
return
G8_1_6:
GuiControl, , showlocation, G8_1_6
gosub, LVlocation
return
G8_1_7:
GuiControl, , showlocation, G8_1_7
gosub, LVlocation
return
G8_1_8:
GuiControl, , showlocation, G8_1_8
gosub, LVlocation
return
G8_1_9:
GuiControl, , showlocation, G8_1_9
gosub, LVlocation
return
G8_1_10:
GuiControl, , showlocation, G8_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G7_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G7_1_1
gosub, LVlocation
return
G7_1_2:
GuiControl, , showlocation, G7_1_2
gosub, LVlocation
return
G7_1_3:
GuiControl, , showlocation, G7_1_3
gosub, LVlocation
return
G7_1_4:
GuiControl, , showlocation, G7_1_4
gosub, LVlocation
return
G7_1_5:
GuiControl, , showlocation, G7_1_5
gosub, LVlocation
return
G7_1_6:
GuiControl, , showlocation, G7_1_6
gosub, LVlocation
return
G7_1_7:
GuiControl, , showlocation, G7_1_7
gosub, LVlocation
return
G7_1_8:
GuiControl, , showlocation, G7_1_8
gosub, LVlocation
return
G7_1_9:
GuiControl, , showlocation, G7_1_9
gosub, LVlocation
return
G7_1_10:
GuiControl, , showlocation, G7_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


J4_4_1:
GuiControl, , showlocation, J4_4_1
gosub, LVlocation
return

J4_3_1:
GuiControl, , showlocation, J4_3_1
gosub, LVlocation
return
J4_3_2:
GuiControl, , showlocation, J4_3_2
gosub, LVlocation
return
J4_3_3:
GuiControl, , showlocation, J4_3_3
gosub, LVlocation
return
J4_3_4:
GuiControl, , showlocation, J4_3_4
gosub, LVlocation
return
J4_3_5:
GuiControl, , showlocation, J4_3_5
gosub, LVlocation
return

J4_2_1:
GuiControl, , showlocation, J4_2_1
gosub, LVlocation
return
J4_2_2:
GuiControl, , showlocation, J4_2_2
gosub, LVlocation
return
J4_2_3:
GuiControl, , showlocation, J4_2_3
gosub, LVlocation
return
J4_2_4:
GuiControl, , showlocation, J4_2_4
gosub, LVlocation
return
J4_2_5:
GuiControl, , showlocation, J4_2_5
gosub, LVlocation
return

J4_1_1:
GuiControl, , showlocation, J4_1_1
gosub, LVlocation
return
J4_1_2:
GuiControl, , showlocation, J4_1_2
gosub, LVlocation
return
J4_1_3:
GuiControl, , showlocation, J4_1_3
gosub, LVlocation
return
J4_1_4:
GuiControl, , showlocation, J4_1_4
gosub, LVlocation
return
J4_1_5:
GuiControl, , showlocation, J4_1_5
gosub, LVlocation
return




; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


J2_4_1:
GuiControl, , showlocation, J2_4_1
gosub, LVlocation
return

J2_3_1:
GuiControl, , showlocation, J2_3_1
gosub, LVlocation
return
J2_3_2:
GuiControl, , showlocation, J2_3_2
gosub, LVlocation
return
J2_3_3:
GuiControl, , showlocation, J2_3_3
gosub, LVlocation
return
J2_3_4:
GuiControl, , showlocation, J2_3_4
gosub, LVlocation
return
J2_3_5:
GuiControl, , showlocation, J2_3_5
gosub, LVlocation
return

J2_2_1:
GuiControl, , showlocation, J2_2_1
gosub, LVlocation
return
J2_2_2:
GuiControl, , showlocation, J2_2_2
gosub, LVlocation
return
J2_2_3:
GuiControl, , showlocation, J2_2_3
gosub, LVlocation
return
J2_2_4:
GuiControl, , showlocation, J2_2_4
gosub, LVlocation
return
J2_2_5:
GuiControl, , showlocation, J2_2_5
gosub, LVlocation
return

J2_1_1:
GuiControl, , showlocation, J2_1_1
gosub, LVlocation
return
J2_1_2:
GuiControl, , showlocation, J2_1_2
gosub, LVlocation
return
J2_1_3:
GuiControl, , showlocation, J2_1_3
gosub, LVlocation
return
J2_1_4:
GuiControl, , showlocation, J2_1_4
gosub, LVlocation
return
J2_1_5:
GuiControl, , showlocation, J2_1_5
gosub, LVlocation
return




; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


J3_5_1:
GuiControl, , showlocation, J3_5_1
gosub, LVlocation
return
J3_5_2:
GuiControl, , showlocation, J3_5_2
gosub, LVlocation
return
J3_5_3:
GuiControl, , showlocation, J3_5_3
gosub, LVlocation

J3_4_1:
GuiControl, , showlocation, J3_4_1
gosub, LVlocation
return
J3_4_2:
GuiControl, , showlocation, J3_4_2
gosub, LVlocation
return
J3_4_3:
GuiControl, , showlocation, J3_4_3
gosub, LVlocation

J3_3_1:
GuiControl, , showlocation, J3_3_1
gosub, LVlocation
return
J3_3_2:
GuiControl, , showlocation, J3_3_2
gosub, LVlocation
return
J3_3_3:
GuiControl, , showlocation, J3_3_3
gosub, LVlocation

J3_2_1:
GuiControl, , showlocation, J3_2_1
gosub, LVlocation
return
J3_2_2:
GuiControl, , showlocation, J3_2_2
gosub, LVlocation
return
J3_2_3:
GuiControl, , showlocation, J3_2_3
gosub, LVlocation
return

J3_1_1:
GuiControl, , showlocation, J3_1_1
gosub, LVlocation
return
J3_1_2:
GuiControl, , showlocation, J3_1_2
gosub, LVlocation
return
J3_1_3:
GuiControl, , showlocation, J3_1_3
gosub, LVlocation
return

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


I3_4_3:
GuiControl, , showlocation, I3_4_3
gosub, LVlocation
return
I2_4_2:
GuiControl, , showlocation, I2_4_2
gosub, LVlocation
return
I1_4_1:
GuiControl, , showlocation, I1_4_1
gosub, LVlocation

I3_3_3:
GuiControl, , showlocation, I3_3_3
gosub, LVlocation
return
I2_3_2:
GuiControl, , showlocation, I2_3_2
gosub, LVlocation
return
I1_3_1:
GuiControl, , showlocation, I1_3_1
gosub, LVlocation

I3_2_3:
GuiControl, , showlocation, I3_2_3
gosub, LVlocation
return
I2_2_2:
GuiControl, , showlocation, I2_2_2
gosub, LVlocation
return
I1_2_1:
GuiControl, , showlocation, I1_2_1
gosub, LVlocation
return

I3_1_3:
GuiControl, , showlocation, I3_1_3
gosub, LVlocation
return
I2_1_2:
GuiControl, , showlocation, I2_1_2
gosub, LVlocation
return
I1_1_1:
GuiControl, , showlocation,  I1_1_1
gosub, LVlocation
return

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




N5_1:
GuiControl, , showlocation, N5_1
gosub, LVlocation
return

N4_1:
GuiControl, , showlocation, N4_1
gosub, LVlocation
return

N3_1:
GuiControl, , showlocation, N3_1
gosub, LVlocation
return

N2_1:
GuiControl, , showlocation, N2_1
gosub, LVlocation
return

N1_1:
GuiControl, , showlocation, N1_1
gosub, LVlocation
return


O4_1:
GuiControl, , showlocation, O4_1
gosub, LVlocation
return

O3_1:
GuiControl, , showlocation, O3_1
gosub, LVlocation
return

O2_1:
GuiControl, , showlocation, O2_1
gosub, LVlocation
return

O1_1:
GuiControl, , showlocation, O1_1
gosub, LVlocation
return

P6_1:
GuiControl, , showlocation, P6_1
gosub, LVlocation
return
P5_1:
GuiControl, , showlocation, P5_1
gosub, LVlocation
return
P4_1:
GuiControl, , showlocation, P4_1
gosub, LVlocation
return
P3_1:
GuiControl, , showlocation, P3_1
gosub, LVlocation
return
P2_1:
GuiControl, , showlocation, P2_1
gosub, LVlocation
return
P1_1:
GuiControl, , showlocation, P1_1
gosub, LVlocation
return

Q3_1:
GuiControl, , showlocation, Q3_1
gosub, LVlocation
return
Q2_1:
GuiControl, , showlocation, Q2_1
gosub, LVlocation
return
Q1_1:
GuiControl, , showlocation, Q1_1
gosub, LVlocation
return



R3_1:
GuiControl, , showlocation, R3_1
gosub, LVlocation
return
R2_1:
GuiControl, , showlocation, R2_1
gosub, LVlocation
return
R1_1:
GuiControl, , showlocation, R1_1
gosub, LVlocation
return


I1_1:
GuiControl, , showlocation, I1_1
gosub, LVlocation
return


I2_1:
GuiControl, , showlocation, I2_1
gosub, LVlocation
return


I3_1:
GuiControl, , showlocation, I3_1
gosub, LVlocation
return


I4_1:
GuiControl, , showlocation, I4_1
gosub, LVlocation
return


I5_1:
GuiControl, , showlocation, I5_1
gosub, LVlocation
return



 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;



K1_1_1:
GuiControl, , showlocation, K1_1_1
gosub, LVlocation
return
K1_1_2:
GuiControl, , showlocation, K1_1_2
gosub, LVlocation
return
K1_1_3:
GuiControl, , showlocation, K1_1_3
gosub, LVlocation
return
K1_1_4:
GuiControl, , showlocation, K1_1_4
gosub, LVlocation
return
K1_2_1:
GuiControl, , showlocation, K1_2_1
gosub, LVlocation
return
K1_2_2:
GuiControl, , showlocation, K1_2_2
gosub, LVlocation
return
K1_2_3:
GuiControl, , showlocation, K1_2_3
gosub, LVlocation
return
K1_2_4:
GuiControl, , showlocation, K1_2_4
gosub, LVlocation
return
K1_3_1:
GuiControl, , showlocation, K1_3_1
gosub, LVlocation
return
K1_3_2:
GuiControl, , showlocation, K1_3_2
gosub, LVlocation
return
K1_3_3:
GuiControl, , showlocation, K1_3_3
gosub, LVlocation
return
K1_3_4:
GuiControl, , showlocation, K1_3_4
gosub, LVlocation
return
K1_4_1:
GuiControl, , showlocation, K1_4_1
gosub, LVlocation
return
K1_4_2:
GuiControl, , showlocation, K1_4_2
gosub, LVlocation
return
K1_4_3:
GuiControl, , showlocation, K1_4_3
gosub, LVlocation
return
K1_4_4:
GuiControl, , showlocation, K1_4_4
gosub, LVlocation
return
K1_1_5:
GuiControl, , showlocation, K1_1_5
gosub, LVlocation
return


K2_1_1:
GuiControl, , showlocation, K2_1_1
gosub, LVlocation
return
K2_1_2:
GuiControl, , showlocation, K2_1_2
gosub, LVlocation
return
K2_1_3:
GuiControl, , showlocation, K2_1_3
gosub, LVlocation
return
K2_1_4:
GuiControl, , showlocation, K2_1_4
gosub, LVlocation
return
K2_2_1:
GuiControl, , showlocation, K2_2_1
gosub, LVlocation
return
K2_2_2:
GuiControl, , showlocation, K2_2_2
gosub, LVlocation
return
K2_2_3:
GuiControl, , showlocation, K2_2_3
gosub, LVlocation
return
K2_2_4:
GuiControl, , showlocation, K2_2_4
gosub, LVlocation
return
K2_3_1:
GuiControl, , showlocation, K2_3_1
gosub, LVlocation
return
K2_3_2:
GuiControl, , showlocation, K2_3_2
gosub, LVlocation
return
K2_3_3:
GuiControl, , showlocation, K2_3_3
gosub, LVlocation
return
K2_3_4:
GuiControl, , showlocation, K2_3_4
gosub, LVlocation
return
K2_4_1:
GuiControl, , showlocation, K2_4_1
gosub, LVlocation
return
K2_4_2:
GuiControl, , showlocation, K2_4_2
gosub, LVlocation
return
K2_4_3:
GuiControl, , showlocation, K2_4_3
gosub, LVlocation
return
K2_4_4:
GuiControl, , showlocation, K2_4_4
gosub, LVlocation
return
K2_1_5:
GuiControl, , showlocation, K2_1_5
gosub, LVlocation
return



K3_1_1:
GuiControl, , showlocation, K3_1_1
gosub, LVlocation
return
K3_1_2:
GuiControl, , showlocation, K3_1_2
gosub, LVlocation
return
K3_1_3:
GuiControl, , showlocation, K3_1_3
gosub, LVlocation
return
K3_1_4:
GuiControl, , showlocation, K3_1_4
gosub, LVlocation
return
K3_2_1:
GuiControl, , showlocation, K3_2_1
gosub, LVlocation
return
K3_2_2:
GuiControl, , showlocation, K3_2_2
gosub, LVlocation
return
K3_2_3:
GuiControl, , showlocation, K3_2_3
gosub, LVlocation
return
K3_2_4:
GuiControl, , showlocation, K3_2_4
gosub, LVlocation
return
K3_3_1:
GuiControl, , showlocation, K3_3_1
gosub, LVlocation
return
K3_3_2:
GuiControl, , showlocation, K3_3_2
gosub, LVlocation
return
K3_3_3:
GuiControl, , showlocation, K3_3_3
gosub, LVlocation
return
K3_3_4:
GuiControl, , showlocation, K3_3_4
gosub, LVlocation
return
K3_4_1:
GuiControl, , showlocation, K3_4_1
gosub, LVlocation
return
K3_4_2:
GuiControl, , showlocation, K3_4_2
gosub, LVlocation
return
K3_4_3:
GuiControl, , showlocation, K3_4_3
gosub, LVlocation
return
K3_4_4:
GuiControl, , showlocation, K3_4_4
gosub, LVlocation
return
K3_1_5:
GuiControl, , showlocation, K3_1_5
gosub, LVlocation
return


K4_1_1:
GuiControl, , showlocation, K4_1_1
gosub, LVlocation
return
K4_1_2:
GuiControl, , showlocation, K4_1_2
gosub, LVlocation
return
K4_1_3:
GuiControl, , showlocation, K4_1_3
gosub, LVlocation
return
K4_1_4:
GuiControl, , showlocation, K4_1_4
gosub, LVlocation
return
K4_2_1:
GuiControl, , showlocation, K4_2_1
gosub, LVlocation
return
K4_2_2:
GuiControl, , showlocation, K4_2_2
gosub, LVlocation
return
K4_2_3:
GuiControl, , showlocation, K4_2_3
gosub, LVlocation
return
K4_2_4:
GuiControl, , showlocation, K4_2_4
gosub, LVlocation
return
K4_3_1:
GuiControl, , showlocation, K4_3_1
gosub, LVlocation
return
K4_3_2:
GuiControl, , showlocation, K4_3_2
gosub, LVlocation
return
K4_3_3:
GuiControl, , showlocation, K4_3_3
gosub, LVlocation
return
K4_3_4:
GuiControl, , showlocation, K4_3_4
gosub, LVlocation
return
K4_4_1:
GuiControl, , showlocation, K4_4_1
gosub, LVlocation
return
K4_4_2:
GuiControl, , showlocation, K4_4_2
gosub, LVlocation
return
K4_4_3:
GuiControl, , showlocation, K4_4_3
gosub, LVlocation
return
K4_4_4:
GuiControl, , showlocation, K4_4_4
gosub, LVlocation
return
K4_1_5:
GuiControl, , showlocation, K4_1_5
gosub, LVlocation
return



K5_1_1:
GuiControl, , showlocation, K5_1_1
gosub, LVlocation
return
K5_1_2:
GuiControl, , showlocation, K5_1_2
gosub, LVlocation
return
K5_1_3:
GuiControl, , showlocation, K5_1_3
gosub, LVlocation
return
K5_1_4:
GuiControl, , showlocation, K5_1_4
gosub, LVlocation
return
K5_2_1:
GuiControl, , showlocation, K5_2_1
gosub, LVlocation
return
K5_2_2:
GuiControl, , showlocation, K5_2_2
gosub, LVlocation
return
K5_2_3:
GuiControl, , showlocation, K5_2_3
gosub, LVlocation
return
K5_2_4:
GuiControl, , showlocation, K5_2_4
gosub, LVlocation
return
K5_3_1:
GuiControl, , showlocation, K5_3_1
gosub, LVlocation
return
K5_3_2:
GuiControl, , showlocation, K5_3_2
gosub, LVlocation
return
K5_3_3:
GuiControl, , showlocation, K5_3_3
gosub, LVlocation
return
K5_3_4:
GuiControl, , showlocation, K5_3_4
gosub, LVlocation
return
K5_4_1:
GuiControl, , showlocation, K5_4_1
gosub, LVlocation
return
K5_4_2:
GuiControl, , showlocation, K5_4_2
gosub, LVlocation
return
K5_4_3:
GuiControl, , showlocation, K5_4_3
gosub, LVlocation
return
K5_4_4:
GuiControl, , showlocation, K5_4_4
gosub, LVlocation
return
K5_1_5:
GuiControl, , showlocation, K5_1_5
gosub, LVlocation
return


K6_1_1:
GuiControl, , showlocation, K6_1_1
gosub, LVlocation
return
K6_1_2:
GuiControl, , showlocation, K6_1_2
gosub, LVlocation
return
K6_1_3:
GuiControl, , showlocation, K6_1_3
gosub, LVlocation
return
K6_1_4:
GuiControl, , showlocation, K6_1_4
gosub, LVlocation
return
K6_2_1:
GuiControl, , showlocation, K6_2_1
gosub, LVlocation
return
K6_2_2:
GuiControl, , showlocation, K6_2_2
gosub, LVlocation
return
K6_2_3:
GuiControl, , showlocation, K6_2_3
gosub, LVlocation
return
K6_2_4:
GuiControl, , showlocation, K6_2_4
gosub, LVlocation
return
K6_3_1:
GuiControl, , showlocation, K6_3_1
gosub, LVlocation
return
K6_3_2:
GuiControl, , showlocation, K6_3_2
gosub, LVlocation
return
K6_3_3:
GuiControl, , showlocation, K6_3_3
gosub, LVlocation
return
K6_3_4:
GuiControl, , showlocation, K6_3_4
gosub, LVlocation
return
K6_4_1:
GuiControl, , showlocation, K6_4_1
gosub, LVlocation
return
K6_4_2:
GuiControl, , showlocation, K6_4_2
gosub, LVlocation
return
K6_4_3:
GuiControl, , showlocation, K6_4_3
gosub, LVlocation
return
K6_4_4:
GuiControl, , showlocation, K6_4_4
gosub, LVlocation
return
K6_1_5:
GuiControl, , showlocation, K6_1_5
gosub, LVlocation
return



 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

K7_1_1:
GuiControl, , showlocation, K7_1_1
gosub, LVlocation
return
K7_1_2:
GuiControl, , showlocation, K7_1_2
gosub, LVlocation
return
K7_1_3:
GuiControl, , showlocation, K7_1_3
gosub, LVlocation
return
K7_1_4:
GuiControl, , showlocation, K7_1_4
gosub, LVlocation
return
K7_2_1:
GuiControl, , showlocation, K7_2_1
gosub, LVlocation
return
K7_2_2:
GuiControl, , showlocation, K7_2_2
gosub, LVlocation
return
K7_2_3:
GuiControl, , showlocation, K7_2_3
gosub, LVlocation
return
K7_2_4:
GuiControl, , showlocation, K7_2_4
gosub, LVlocation
return
K7_3_1:
GuiControl, , showlocation, K7_3_1
gosub, LVlocation
return
K7_3_2:
GuiControl, , showlocation, K7_3_2
gosub, LVlocation
return
K7_3_3:
GuiControl, , showlocation, K7_3_3
gosub, LVlocation
return
K7_3_4:
GuiControl, , showlocation, K7_3_4
gosub, LVlocation
return
K7_4_1:
GuiControl, , showlocation, K7_4_1
gosub, LVlocation
return
K7_4_2:
GuiControl, , showlocation, K7_4_2
gosub, LVlocation
return
K7_4_3:
GuiControl, , showlocation, K7_4_3
gosub, LVlocation
return
K7_4_4:
GuiControl, , showlocation, K7_4_4
gosub, LVlocation
return
K7_1_5:
GuiControl, , showlocation, K7_1_5
gosub, LVlocation
return


K8_1_1:
GuiControl, , showlocation, K8_1_1
gosub, LVlocation
return
K8_1_2:
GuiControl, , showlocation, K8_1_2
gosub, LVlocation
return
K8_1_3:
GuiControl, , showlocation, K8_1_3
gosub, LVlocation
return
K8_1_4:
GuiControl, , showlocation, K8_1_4
gosub, LVlocation
return
K8_2_1:
GuiControl, , showlocation, K8_2_1
gosub, LVlocation
return
K8_2_2:
GuiControl, , showlocation, K8_2_2
gosub, LVlocation
return
K8_2_3:
GuiControl, , showlocation, K8_2_3
gosub, LVlocation
return
K8_2_4:
GuiControl, , showlocation, K8_2_4
gosub, LVlocation
return
K8_3_1:
GuiControl, , showlocation, K8_3_1
gosub, LVlocation
return
K8_3_2:
GuiControl, , showlocation, K8_3_2
gosub, LVlocation
return
K8_3_3:
GuiControl, , showlocation, K8_3_3
gosub, LVlocation
return
K8_3_4:
GuiControl, , showlocation, K8_3_4
gosub, LVlocation
return
K8_4_1:
GuiControl, , showlocation, K8_4_1
gosub, LVlocation
return
K8_4_2:
GuiControl, , showlocation, K8_4_2
gosub, LVlocation
return
K8_4_3:
GuiControl, , showlocation, K8_4_3
gosub, LVlocation
return
K8_4_4:
GuiControl, , showlocation, K8_4_4
gosub, LVlocation
return
K8_1_5:
GuiControl, , showlocation, K8_1_5
gosub, LVlocation
return



K9_1_1:
GuiControl, , showlocation, K9_1_1
gosub, LVlocation
return
K9_1_2:
GuiControl, , showlocation, K9_1_2
gosub, LVlocation
return
K9_1_3:
GuiControl, , showlocation, K9_1_3
gosub, LVlocation
return
K9_1_4:
GuiControl, , showlocation, K9_1_4
gosub, LVlocation
return
K9_2_1:
GuiControl, , showlocation, K9_2_1
gosub, LVlocation
return
K9_2_2:
GuiControl, , showlocation, K9_2_2
gosub, LVlocation
return
K9_2_3:
GuiControl, , showlocation, K9_2_3
gosub, LVlocation
return
K9_2_4:
GuiControl, , showlocation, K9_2_4
gosub, LVlocation
return
K9_3_1:
GuiControl, , showlocation, K9_3_1
gosub, LVlocation
return
K9_3_2:
GuiControl, , showlocation, K9_3_2
gosub, LVlocation
return
K9_3_3:
GuiControl, , showlocation, K9_3_3
gosub, LVlocation
return
K9_3_4:
GuiControl, , showlocation, K9_3_4
gosub, LVlocation
return
K9_4_1:
GuiControl, , showlocation, K9_4_1
gosub, LVlocation
return
K9_4_2:
GuiControl, , showlocation, K9_4_2
gosub, LVlocation
return
K9_4_3:
GuiControl, , showlocation, K9_4_3
gosub, LVlocation
return
K9_4_4:
GuiControl, , showlocation, K9_4_4
gosub, LVlocation
return
K9_1_5:
GuiControl, , showlocation, K9_1_5
gosub, LVlocation
return


K10_1_1:
GuiControl, , showlocation, K10_1_1
gosub, LVlocation
return
K10_1_2:
GuiControl, , showlocation, K10_1_2
gosub, LVlocation
return
K10_1_3:
GuiControl, , showlocation, K10_1_3
gosub, LVlocation
return
K10_1_4:
GuiControl, , showlocation, K10_1_4
gosub, LVlocation
return
K10_2_1:
GuiControl, , showlocation, K10_2_1
gosub, LVlocation
return
K10_2_2:
GuiControl, , showlocation, K10_2_2
gosub, LVlocation
return
K10_2_3:
GuiControl, , showlocation, K10_2_3
gosub, LVlocation
return
K10_2_4:
GuiControl, , showlocation, K10_2_4
gosub, LVlocation
return
K10_3_1:
GuiControl, , showlocation, K10_3_1
gosub, LVlocation
return
K10_3_2:
GuiControl, , showlocation, K10_3_2
gosub, LVlocation
return
K10_3_3:
GuiControl, , showlocation, K10_3_3
gosub, LVlocation
return
K10_3_4:
GuiControl, , showlocation, K10_3_4
gosub, LVlocation
return
K10_4_1:
GuiControl, , showlocation, K10_4_1
gosub, LVlocation
return
K10_4_2:
GuiControl, , showlocation, K10_4_2
gosub, LVlocation
return
K10_4_3:
GuiControl, , showlocation, K10_4_3
gosub, LVlocation
return
K10_4_4:
GuiControl, , showlocation, K10_4_4
gosub, LVlocation
return
K10_1_5:
GuiControl, , showlocation, K10_1_5
gosub, LVlocation
return



K11_1_1:
GuiControl, , showlocation, K11_1_1
gosub, LVlocation
return
K11_1_2:
GuiControl, , showlocation, K11_1_2
gosub, LVlocation
return
K11_1_3:
GuiControl, , showlocation, K11_1_3
gosub, LVlocation
return
K11_1_4:
GuiControl, , showlocation, K11_1_4
gosub, LVlocation
return
K11_2_1:
GuiControl, , showlocation, K11_2_1
gosub, LVlocation
return
K11_2_2:
GuiControl, , showlocation, K11_2_2
gosub, LVlocation
return
K11_2_3:
GuiControl, , showlocation, K11_2_3
gosub, LVlocation
return
K11_2_4:
GuiControl, , showlocation, K11_2_4
gosub, LVlocation
return
K11_3_1:
GuiControl, , showlocation, K11_3_1
gosub, LVlocation
return
K11_3_2:
GuiControl, , showlocation, K11_3_2
gosub, LVlocation
return
K11_3_3:
GuiControl, , showlocation, K11_3_3
gosub, LVlocation
return
K11_3_4:
GuiControl, , showlocation, K11_3_4
gosub, LVlocation
return
K11_4_1:
GuiControl, , showlocation, K11_4_1
gosub, LVlocation
return
K11_4_2:
GuiControl, , showlocation, K11_4_2
gosub, LVlocation
return
K11_4_3:
GuiControl, , showlocation, K11_4_3
gosub, LVlocation
return
K11_4_4:
GuiControl, , showlocation, K11_4_4
gosub, LVlocation
return
K11_1_5:
GuiControl, , showlocation, K11_1_5
gosub, LVlocation
return


K12_1_1:
GuiControl, , showlocation, K12_1_1
gosub, LVlocation
return
K12_1_2:
GuiControl, , showlocation, K12_1_2
gosub, LVlocation
return
K12_1_3:
GuiControl, , showlocation, K12_1_3
gosub, LVlocation
return
K12_1_4:
GuiControl, , showlocation, K12_1_4
gosub, LVlocation
return
K12_2_1:
GuiControl, , showlocation, K12_2_1
gosub, LVlocation
return
K12_2_2:
GuiControl, , showlocation, K12_2_2
gosub, LVlocation
return
K12_2_3:
GuiControl, , showlocation, K12_2_3
gosub, LVlocation
return
K12_2_4:
GuiControl, , showlocation, K12_2_4
gosub, LVlocation
return
K12_3_1:
GuiControl, , showlocation, K12_3_1
gosub, LVlocation
return
K12_3_2:
GuiControl, , showlocation, K12_3_2
gosub, LVlocation
return
K12_3_3:
GuiControl, , showlocation, K12_3_3
gosub, LVlocation
return
K12_3_4:
GuiControl, , showlocation, K12_3_4
gosub, LVlocation
return
K12_4_1:
GuiControl, , showlocation, K12_4_1
gosub, LVlocation
return
K12_4_2:
GuiControl, , showlocation, K12_4_2
gosub, LVlocation
return
K12_4_3:
GuiControl, , showlocation, K12_4_3
gosub, LVlocation
return
K12_4_4:
GuiControl, , showlocation, K12_4_4
gosub, LVlocation
return
K12_1_5:
GuiControl, , showlocation, K12_1_5
gosub, LVlocation
return




;~ K1_1_1:
;~ GuiControl, , showlocation, K1_1_1
;~ gosub, LVlocation
;~ return
;~ K1_1_2:
;~ GuiControl, , showlocation, K1_1_2
;~ gosub, LVlocation
;~ return
;~ K1_1_3:
;~ GuiControl, , showlocation, K1_1_3
;~ gosub, LVlocation
;~ return
;~ K1_1_4:
;~ GuiControl, , showlocation, K1_1_4
;~ gosub, LVlocation
;~ return
;~ K1_1_5:
;~ GuiControl, , showlocation, K1_1_5
;~ gosub, LVlocation
;~ return
;~ K1_1_6:
;~ GuiControl, , showlocation, K1_1_6
;~ gosub, LVlocation
;~ return
;~ K1_1_7:
;~ GuiControl, , showlocation, K1_1_7
;~ gosub, LVlocation
;~ return
;~ K1_1_8:
;~ GuiControl, , showlocation, K1_1_8
;~ gosub, LVlocation
;~ return

;~ K1_2_1:
;~ GuiControl, , showlocation, K1_2_1
;~ gosub, LVlocation
;~ return
;~ K1_2_2:
;~ GuiControl, , showlocation, K1_2_2
;~ gosub, LVlocation
;~ return
;~ K1_2_3:
;~ GuiControl, , showlocation, K1_2_3
;~ gosub, LVlocation
;~ return
;~ K1_2_4:
;~ GuiControl, , showlocation, K1_2_4
;~ gosub, LVlocation
;~ return
;~ K1_2_5:
;~ GuiControl, , showlocation, K1_2_5
;~ gosub, LVlocation
;~ return
;~ K1_2_6:
;~ GuiControl, , showlocation, K1_2_6
;~ gosub, LVlocation
;~ return
;~ K1_2_7:
;~ GuiControl, , showlocation, K1_2_7
;~ gosub, LVlocation
;~ return
;~ K1_2_8:
;~ GuiControl, , showlocation, K1_2_8
;~ gosub, LVlocation
;~ return


;~ K1_3_1:
;~ GuiControl, , showlocation, K1_3_1
;~ gosub, LVlocation
;~ return
;~ K1_3_2:
;~ GuiControl, , showlocation, K1_3_2
;~ gosub, LVlocation
;~ return
;~ K1_3_3:
;~ GuiControl, , showlocation, K1_3_3
;~ gosub, LVlocation
;~ return
;~ K1_3_4:
;~ GuiControl, , showlocation, K1_3_4
;~ gosub, LVlocation
;~ return
;~ K1_3_5:
;~ GuiControl, , showlocation, K1_3_5
;~ gosub, LVlocation
;~ return
;~ K1_3_6:
;~ GuiControl, , showlocation, K1_3_6
;~ gosub, LVlocation
;~ return
;~ K1_3_7:
;~ GuiControl, , showlocation, K1_3_7
;~ gosub, LVlocation
;~ return
;~ K1_3_8:
;~ GuiControl, , showlocation, K1_3_8
;~ gosub, LVlocation
;~ return


;~ K1_4_1:
;~ GuiControl, , showlocation, K1_4_1
;~ gosub, LVlocation
;~ return
;~ K1_4_2:
;~ GuiControl, , showlocation, K1_4_2
;~ gosub, LVlocation
;~ return
;~ K1_4_3:
;~ GuiControl, , showlocation, K1_4_3
;~ gosub, LVlocation
;~ return
;~ K1_4_4:
;~ GuiControl, , showlocation, K1_4_4
;~ gosub, LVlocation
;~ return
;~ K1_4_5:
;~ GuiControl, , showlocation, K1_4_5
;~ gosub, LVlocation
;~ return
;~ K1_4_6:
;~ GuiControl, , showlocation, K1_4_6
;~ gosub, LVlocation
;~ return
;~ K1_4_7:
;~ GuiControl, , showlocation, K1_4_7
;~ gosub, LVlocation
;~ return
;~ K1_4_8:
;~ GuiControl, , showlocation, K1_4_8
;~ gosub, LVlocation
;~ return

;~ K2_0_1:
;~ GuiControl, , showlocation, K2_0_1
;~ gosub, LVlocation
;~ return

;~ K2_1_1:
;~ GuiControl, , showlocation, K2_1_1
;~ gosub, LVlocation
;~ return
;~ K2_1_2:
;~ GuiControl, , showlocation, K2_1_2
;~ gosub, LVlocation
;~ return
;~ K2_1_3:
;~ GuiControl, , showlocation, K2_1_3
;~ gosub, LVlocation
;~ return
;~ K2_1_4:
;~ GuiControl, , showlocation, K2_1_4
;~ gosub, LVlocation
;~ return
;~ K2_1_5:
;~ GuiControl, , showlocation, K2_1_5
;~ gosub, LVlocation
;~ return
;~ K2_1_6:
;~ GuiControl, , showlocation, K2_1_6
;~ gosub, LVlocation
;~ return
;~ K2_1_7:
;~ GuiControl, , showlocation, K2_1_7
;~ gosub, LVlocation
;~ return
;~ K2_1_8:
;~ GuiControl, , showlocation, K2_1_8
;~ gosub, LVlocation
;~ return

;~ K2_2_1:
;~ GuiControl, , showlocation, K2_2_1
;~ gosub, LVlocation
;~ return
;~ K2_2_2:
;~ GuiControl, , showlocation, K2_2_2
;~ gosub, LVlocation
;~ return
;~ K2_2_3:
;~ GuiControl, , showlocation, K2_2_3
;~ gosub, LVlocation
;~ return
;~ K2_2_4:
;~ GuiControl, , showlocation, K2_2_4
;~ gosub, LVlocation
;~ return
;~ K2_2_5:
;~ GuiControl, , showlocation, K2_2_5
;~ gosub, LVlocation
;~ return
;~ K2_2_6:
;~ GuiControl, , showlocation, K2_2_6
;~ gosub, LVlocation
;~ return
;~ K2_2_7:
;~ GuiControl, , showlocation, K2_2_7
;~ gosub, LVlocation
;~ return
;~ K2_2_8:
;~ GuiControl, , showlocation, K2_2_8
;~ gosub, LVlocation
;~ return

;~ K2_3_1:
;~ GuiControl, , showlocation, K2_3_1
;~ gosub, LVlocation
;~ return
;~ K2_3_2:
;~ GuiControl, , showlocation, K2_3_2
;~ gosub, LVlocation
;~ return
;~ K2_3_3:
;~ GuiControl, , showlocation, K2_3_3
;~ gosub, LVlocation
;~ return
;~ K2_3_4:
;~ GuiControl, , showlocation, K2_3_4
;~ gosub, LVlocation
;~ return
;~ K2_3_5:
;~ GuiControl, , showlocation, K2_3_5
;~ gosub, LVlocation
;~ return
;~ K2_3_6:
;~ GuiControl, , showlocation, K2_3_6
;~ gosub, LVlocation
;~ return
;~ K2_3_7:
;~ GuiControl, , showlocation, K2_3_7
;~ gosub, LVlocation
;~ return
;~ K2_3_8:
;~ GuiControl, , showlocation, K2_3_8
;~ gosub, LVlocation
;~ return

;~ K2_4_1:
;~ GuiControl, , showlocation, K2_4_1
;~ gosub, LVlocation
;~ return
;~ K2_4_2:
;~ GuiControl, , showlocation, K2_4_2
;~ gosub, LVlocation
;~ return
;~ K2_4_3:
;~ GuiControl, , showlocation, K2_4_3
;~ gosub, LVlocation
;~ return
;~ K2_4_4:
;~ GuiControl, , showlocation, K2_4_4
;~ gosub, LVlocation
;~ return
;~ K2_4_5:
;~ GuiControl, , showlocation, K2_4_5
;~ gosub, LVlocation
;~ return
;~ K2_4_6:
;~ GuiControl, , showlocation, K2_4_6
;~ gosub, LVlocation
;~ return
;~ K2_4_7:
;~ GuiControl, , showlocation, K2_4_7
;~ gosub, LVlocation
;~ return
;~ K2_4_8:
;~ GuiControl, , showlocation, K2_4_8
;~ gosub, LVlocation
;~ return

;~ K2_1_5:
;~ GuiControl, , showlocation, K2_1_5
;~ gosub, LVlocation
;~ return
;~ K2_5_2:
;~ GuiControl, , showlocation, K2_5_2
;~ gosub, LVlocation
;~ return
;~ K2_5_3:
;~ GuiControl, , showlocation, K2_5_3
;~ gosub, LVlocation
;~ return
;~ K2_5_4:
;~ GuiControl, , showlocation, K2_5_4
;~ gosub, LVlocation
;~ return
;~ K2_5_5:
;~ GuiControl, , showlocation, K2_5_5
;~ gosub, LVlocation
;~ return
;~ K2_5_6:
;~ GuiControl, , showlocation, K2_5_6
;~ gosub, LVlocation
;~ return
;~ K2_5_7:
;~ GuiControl, , showlocation, K2_5_7
;~ gosub, LVlocation
;~ return
;~ K2_5_8:
;~ GuiControl, , showlocation, K2_5_8
;~ gosub, LVlocation
;~ return

;~ K1_1_5:
;~ GuiControl, , showlocation, K2_1_5
;~ gosub, LVlocation
;~ return
;~ K1_5_2:
;~ GuiControl, , showlocation, K2_5_2
;~ gosub, LVlocation
;~ return
;~ K1_5_3:
;~ GuiControl, , showlocation, K2_5_3
;~ gosub, LVlocation
;~ return
;~ K1_5_4:
;~ GuiControl, , showlocation, K2_5_4
;~ gosub, LVlocation
;~ return
;~ K1_5_5:
;~ GuiControl, , showlocation, K2_5_5
;~ gosub, LVlocation
;~ return
;~ K1_5_6:
;~ GuiControl, , showlocation, K2_5_6
;~ gosub, LVlocation
;~ return
;~ K1_5_7:
;~ GuiControl, , showlocation, K2_5_7
;~ gosub, LVlocation
;~ return
;~ K1_5_8:
;~ GuiControl, , showlocation, K2_5_8
;~ gosub, LVlocation
;~ return


;~ K3_1_1:
;~ GuiControl, , showlocation, K3_1_1
;~ gosub, LVlocation
;~ return
;~ K3_1_2:
;~ GuiControl, , showlocation, K3_1_2
;~ gosub, LVlocation
;~ return
;~ K3_1_3:
;~ GuiControl, , showlocation, K3_1_3
;~ gosub, LVlocation
;~ return
;~ K3_1_4:
;~ GuiControl, , showlocation, K3_1_4
;~ gosub, LVlocation
;~ return
;~ K3_1_5:
;~ GuiControl, , showlocation, K3_1_5
;~ gosub, LVlocation
;~ return
;~ K3_1_6:
;~ GuiControl, , showlocation, K3_1_6
;~ gosub, LVlocation
;~ return
;~ K3_1_7:
;~ GuiControl, , showlocation, K3_1_7
;~ gosub, LVlocation
;~ return
;~ K3_1_8:
;~ GuiControl, , showlocation, K3_1_8
;~ gosub, LVlocation
;~ return





;~ K3_2_1:
;~ GuiControl, , showlocation, K3_2_1
;~ gosub, LVlocation
;~ return
;~ K3_2_2:
;~ GuiControl, , showlocation, K3_2_2
;~ gosub, LVlocation
;~ return
;~ K3_2_3:
;~ GuiControl, , showlocation, K3_2_3
;~ gosub, LVlocation
;~ return
;~ K3_2_4:
;~ GuiControl, , showlocation, K3_2_4
;~ gosub, LVlocation
;~ return
;~ K3_2_5:
;~ GuiControl, , showlocation, K3_2_5
;~ gosub, LVlocation
;~ return
;~ K3_2_6:
;~ GuiControl, , showlocation, K3_2_6
;~ gosub, LVlocation
;~ return
;~ K3_2_7:
;~ GuiControl, , showlocation, K3_2_7
;~ gosub, LVlocation
;~ return
;~ K3_2_8:
;~ GuiControl, , showlocation, K3_2_8
;~ gosub, LVlocation
;~ return

;~ K3_3_1:
;~ GuiControl, , showlocation, K3_3_1
;~ gosub, LVlocation
;~ return
;~ K3_3_2:
;~ GuiControl, , showlocation, K3_3_2
;~ gosub, LVlocation
;~ return
;~ K3_3_3:
;~ GuiControl, , showlocation, K3_3_3
;~ gosub, LVlocation
;~ return
;~ K3_3_4:
;~ GuiControl, , showlocation, K3_3_4
;~ gosub, LVlocation
;~ return
;~ K3_3_5:
;~ GuiControl, , showlocation, K3_3_5
;~ gosub, LVlocation
;~ return
;~ K3_3_6:
;~ GuiControl, , showlocation, K3_3_6
;~ gosub, LVlocation
;~ return
;~ K3_3_7:
;~ GuiControl, , showlocation, K3_3_7
;~ gosub, LVlocation
;~ return
;~ K3_3_8:
;~ GuiControl, , showlocation, K3_3_8
;~ gosub, LVlocation
;~ return

;~ K3_4_1:
;~ GuiControl, , showlocation, K3_4_1
;~ gosub, LVlocation
;~ return
;~ K3_4_2:
;~ GuiControl, , showlocation, K3_4_2
;~ gosub, LVlocation
;~ return
;~ K3_4_3:
;~ GuiControl, , showlocation, K3_4_3
;~ gosub, LVlocation
;~ return
;~ K3_4_4:
;~ GuiControl, , showlocation, K3_4_4
;~ gosub, LVlocation
;~ return
;~ K3_4_5:
;~ GuiControl, , showlocation, K3_4_5
;~ gosub, LVlocation
;~ return
;~ K3_4_6:
;~ GuiControl, , showlocation, K3_4_6
;~ gosub, LVlocation
;~ return
;~ K3_4_7:
;~ GuiControl, , showlocation, K3_4_7
;~ gosub, LVlocation
;~ return
;~ K3_4_8:
;~ GuiControl, , showlocation, K3_4_8
;~ gosub, LVlocation
;~ return

;~ K4_0_1:
;~ GuiControl, , showlocation, K4_0_1
;~ gosub, LVlocation
;~ return

;~ K4_1_1:
;~ GuiControl, , showlocation, K4_1_1
;~ gosub, LVlocation
;~ return
;~ K4_1_2:
;~ GuiControl, , showlocation, K4_1_2
;~ gosub, LVlocation
;~ return
;~ K4_1_3:
;~ GuiControl, , showlocation, K4_1_3
;~ gosub, LVlocation
;~ return
;~ K4_1_4:
;~ GuiControl, , showlocation, K4_1_4
;~ gosub, LVlocation
;~ return
;~ K4_1_5:
;~ GuiControl, , showlocation, K4_1_5
;~ gosub, LVlocation
;~ return
;~ K4_1_6:
;~ GuiControl, , showlocation, K4_1_6
;~ gosub, LVlocation
;~ return
;~ K4_1_7:
;~ GuiControl, , showlocation, K4_1_7
;~ gosub, LVlocation
;~ return
;~ K4_1_8:
;~ GuiControl, , showlocation, K4_1_8
;~ gosub, LVlocation
;~ return

;~ K4_2_1:
;~ GuiControl, , showlocation, K4_2_1
;~ gosub, LVlocation
;~ return
;~ K4_2_2:
;~ GuiControl, , showlocation, K4_2_2
;~ gosub, LVlocation
;~ return
;~ K4_2_3:
;~ GuiControl, , showlocation, K4_2_3
;~ gosub, LVlocation
;~ return
;~ K4_2_4:
;~ GuiControl, , showlocation, K4_2_4
;~ gosub, LVlocation
;~ return
;~ K4_2_5:
;~ GuiControl, , showlocation, K4_2_5
;~ gosub, LVlocation
;~ return
;~ K4_2_6:
;~ GuiControl, , showlocation, K4_2_6
;~ gosub, LVlocation
;~ return
;~ K4_2_7:
;~ GuiControl, , showlocation, K4_2_7
;~ gosub, LVlocation
;~ return
;~ K4_2_8:
;~ GuiControl, , showlocation, K4_2_8
;~ gosub, LVlocation
;~ return

;~ K4_3_1:
;~ GuiControl, , showlocation, K4_3_1
;~ gosub, LVlocation
;~ return
;~ K4_3_2:
;~ GuiControl, , showlocation, K4_3_2
;~ gosub, LVlocation
;~ return
;~ K4_3_3:
;~ GuiControl, , showlocation, K4_3_3
;~ gosub, LVlocation
;~ return
;~ K4_3_4:
;~ GuiControl, , showlocation, K4_3_4
;~ gosub, LVlocation
;~ return
;~ K4_3_5:
;~ GuiControl, , showlocation, K4_3_5
;~ gosub, LVlocation
;~ return
;~ K4_3_6:
;~ GuiControl, , showlocation, K4_3_6
;~ gosub, LVlocation
;~ return
;~ K4_3_7:
;~ GuiControl, , showlocation, K4_3_7
;~ gosub, LVlocation
;~ return
;~ K4_3_8:
;~ GuiControl, , showlocation, K4_3_8
;~ gosub, LVlocation
;~ return

;~ K4_4_1:
;~ GuiControl, , showlocation, K4_4_1
;~ gosub, LVlocation
;~ return
;~ K4_4_2:
;~ GuiControl, , showlocation, K4_4_2
;~ gosub, LVlocation
;~ return
;~ K4_4_3:
;~ GuiControl, , showlocation, K4_4_3
;~ gosub, LVlocation
;~ return
;~ K4_4_4:
;~ GuiControl, , showlocation, K4_4_4
;~ gosub, LVlocation
;~ return
;~ K4_4_5:
;~ GuiControl, , showlocation, K4_4_5
;~ gosub, LVlocation
;~ return
;~ K4_4_6:
;~ GuiControl, , showlocation, K4_4_6
;~ gosub, LVlocation
;~ return
;~ K4_4_7:
;~ GuiControl, , showlocation, K4_4_7
;~ gosub, LVlocation
;~ return
;~ K4_4_8:
;~ GuiControl, , showlocation, K4_4_8
;~ gosub, LVlocation
;~ return

;~ K4_1_5:
;~ GuiControl, , showlocation, K4_1_5
;~ gosub, LVlocation
;~ return
;~ K4_5_2:
;~ GuiControl, , showlocation, K4_5_2
;~ gosub, LVlocation
;~ return
;~ K4_5_3:
;~ GuiControl, , showlocation, K4_5_3
;~ gosub, LVlocation
;~ return
;~ K4_5_4:
;~ GuiControl, , showlocation, K4_5_4
;~ gosub, LVlocation
;~ return
;~ K4_5_5:
;~ GuiControl, , showlocation, K4_5_5
;~ gosub, LVlocation
;~ return
;~ K4_5_6:
;~ GuiControl, , showlocation, K4_5_6
;~ gosub, LVlocation
;~ return
;~ K4_5_7:
;~ GuiControl, , showlocation, K4_5_7
;~ gosub, LVlocation
;~ return
;~ K4_5_8:
;~ GuiControl, , showlocation, K4_5_8
;~ gosub, LVlocation
;~ return

;~ K3_1_5:
;~ GuiControl, , showlocation, K3_1_5
;~ gosub, LVlocation
;~ return
;~ K3_5_2:
;~ GuiControl, , showlocation, K3_5_2
;~ gosub, LVlocation
;~ return
;~ K3_5_3:
;~ GuiControl, , showlocation, K3_5_3
;~ gosub, LVlocation
;~ return
;~ K3_5_4:
;~ GuiControl, , showlocation, K3_5_4
;~ gosub, LVlocation
;~ return
;~ K3_5_5:
;~ GuiControl, , showlocation, K3_5_5
;~ gosub, LVlocation
;~ return
;~ K3_5_6:
;~ GuiControl, , showlocation, K3_5_6
;~ gosub, LVlocation
;~ return
;~ K3_5_7:
;~ GuiControl, , showlocation, K3_5_7
;~ gosub, LVlocation
;~ return
;~ K3_5_8:
;~ GuiControl, , showlocation, K3_5_8
;~ gosub, LVlocation
;~ return

;~ K5_1_1:
;~ GuiControl, , showlocation, K5_1_1
;~ gosub, LVlocation
;~ return
;~ K5_1_2:
;~ GuiControl, , showlocation, K5_1_2
;~ gosub, LVlocation
;~ return
;~ K5_1_3:
;~ GuiControl, , showlocation, K5_1_3
;~ gosub, LVlocation
;~ return
;~ K5_1_4:
;~ GuiControl, , showlocation, K5_1_4
;~ gosub, LVlocation
;~ return
;~ K5_1_5:
;~ GuiControl, , showlocation, K5_1_5
;~ gosub, LVlocation
;~ return
;~ K5_1_6:
;~ GuiControl, , showlocation, K5_1_6
;~ gosub, LVlocation
;~ return
;~ K5_1_7:
;~ GuiControl, , showlocation, K5_1_7
;~ gosub, LVlocation
;~ return
;~ K5_1_8:
;~ GuiControl, , showlocation, K5_1_8
;~ gosub, LVlocation
;~ return

;~ K5_2_1:
;~ GuiControl, , showlocation, K5_2_1
;~ gosub, LVlocation
;~ return
;~ K5_2_2:
;~ GuiControl, , showlocation, K5_2_2
;~ gosub, LVlocation
;~ return
;~ K5_2_3:
;~ GuiControl, , showlocation, K5_2_3
;~ gosub, LVlocation
;~ return
;~ K5_2_4:
;~ GuiControl, , showlocation, K5_2_4
;~ gosub, LVlocation
;~ return
;~ K5_2_5:
;~ GuiControl, , showlocation, K5_2_5
;~ gosub, LVlocation
;~ return
;~ K5_2_6:
;~ GuiControl, , showlocation, K5_2_6
;~ gosub, LVlocation
;~ return
;~ K5_2_7:
;~ GuiControl, , showlocation, K5_2_7
;~ gosub, LVlocation
;~ return
;~ K5_2_8:
;~ GuiControl, , showlocation, K5_2_8
;~ gosub, LVlocation
;~ return

;~ K5_3_1:
;~ GuiControl, , showlocation, K5_3_1
;~ gosub, LVlocation
;~ return
;~ K5_3_2:
;~ GuiControl, , showlocation, K5_3_2
;~ gosub, LVlocation
;~ return
;~ K5_3_3:
;~ GuiControl, , showlocation, K5_3_3
;~ gosub, LVlocation
;~ return
;~ K5_3_4:
;~ GuiControl, , showlocation, K5_3_4
;~ gosub, LVlocation
;~ return
;~ K5_3_5:
;~ GuiControl, , showlocation, K5_3_5
;~ gosub, LVlocation
;~ return
;~ K5_3_6:
;~ GuiControl, , showlocation, K5_3_6
;~ gosub, LVlocation
;~ return
;~ K5_3_7:
;~ GuiControl, , showlocation, K5_3_7
;~ gosub, LVlocation
;~ return
;~ K5_3_8:
;~ GuiControl, , showlocation, K5_3_8
;~ gosub, LVlocation
;~ return

;~ K5_4_1:
;~ GuiControl, , showlocation, K5_4_1
;~ gosub, LVlocation
;~ return
;~ K5_4_2:
;~ GuiControl, , showlocation, K5_4_2
;~ gosub, LVlocation
;~ return
;~ K5_4_3:
;~ GuiControl, , showlocation, K5_4_3
;~ gosub, LVlocation
;~ return
;~ K5_4_4:
;~ GuiControl, , showlocation, K5_4_4
;~ gosub, LVlocation
;~ return
;~ K5_4_5:
;~ GuiControl, , showlocation, K5_4_5
;~ gosub, LVlocation
;~ return
;~ K5_4_6:
;~ GuiControl, , showlocation, K5_4_6
;~ gosub, LVlocation
;~ return
;~ K5_4_7:
;~ GuiControl, , showlocation, K5_4_7
;~ gosub, LVlocation
;~ return
;~ K5_4_8:
;~ GuiControl, , showlocation, K5_4_8
;~ gosub, LVlocation
;~ return

;~ K6_0_1:
;~ GuiControl, , showlocation, K6_0_1
;~ gosub, LVlocation
;~ return

;~ K6_1_1:
;~ GuiControl, , showlocation, K6_1_1
;~ gosub, LVlocation
;~ return
;~ K6_1_2:
;~ GuiControl, , showlocation, K6_1_2
;~ gosub, LVlocation
;~ return
;~ K6_1_3:
;~ GuiControl, , showlocation, K6_1_3
;~ gosub, LVlocation
;~ return
;~ K6_1_4:
;~ GuiControl, , showlocation, K6_1_4
;~ gosub, LVlocation
;~ return
;~ K6_1_5:
;~ GuiControl, , showlocation, K6_1_5
;~ gosub, LVlocation
;~ return
;~ K6_1_6:
;~ GuiControl, , showlocation, K6_1_6
;~ gosub, LVlocation
;~ return
;~ K6_1_7:
;~ GuiControl, , showlocation, K6_1_7
;~ gosub, LVlocation
;~ return
;~ K6_1_8:
;~ GuiControl, , showlocation, K6_1_8
;~ gosub, LVlocation
;~ return

;~ K6_2_1:
;~ GuiControl, , showlocation, K6_2_1
;~ gosub, LVlocation
;~ return
;~ K6_2_2:
;~ GuiControl, , showlocation, K6_2_2
;~ gosub, LVlocation
;~ return
;~ K6_2_3:
;~ GuiControl, , showlocation, K6_2_3
;~ gosub, LVlocation
;~ return
;~ K6_2_4:
;~ GuiControl, , showlocation, K6_2_4
;~ gosub, LVlocation
;~ return
;~ K6_2_5:
;~ GuiControl, , showlocation, K6_2_5
;~ gosub, LVlocation
;~ return
;~ K6_2_6:
;~ GuiControl, , showlocation, K6_2_6
;~ gosub, LVlocation
;~ return
;~ K6_2_7:
;~ GuiControl, , showlocation, K6_2_7
;~ gosub, LVlocation
;~ return
;~ K6_2_8:
;~ GuiControl, , showlocation, K6_2_8
;~ gosub, LVlocation
;~ return

;~ K6_3_1:
;~ GuiControl, , showlocation, K6_3_1
;~ gosub, LVlocation
;~ return
;~ K6_3_2:
;~ GuiControl, , showlocation, K6_3_2
;~ gosub, LVlocation
;~ return
;~ K6_3_3:
;~ GuiControl, , showlocation, K6_3_3
;~ gosub, LVlocation
;~ return
;~ K6_3_4:
;~ GuiControl, , showlocation, K6_3_4
;~ gosub, LVlocation
;~ return
;~ K6_3_5:
;~ GuiControl, , showlocation, K6_3_5
;~ gosub, LVlocation
;~ return
;~ K6_3_6:
;~ GuiControl, , showlocation, K6_3_6
;~ gosub, LVlocation
;~ return
;~ K6_3_7:
;~ GuiControl, , showlocation, K6_3_7
;~ gosub, LVlocation
;~ return
;~ K6_3_8:
;~ GuiControl, , showlocation, K6_3_8
;~ gosub, LVlocation
;~ return

;~ K6_4_1:
;~ GuiControl, , showlocation, K6_4_1
;~ gosub, LVlocation
;~ return
;~ K6_4_2:
;~ GuiControl, , showlocation, K6_4_2
;~ gosub, LVlocation
;~ return
;~ K6_4_3:
;~ GuiControl, , showlocation, K6_4_3
;~ gosub, LVlocation
;~ return
;~ K6_4_4:
;~ GuiControl, , showlocation, K6_4_4
;~ gosub, LVlocation
;~ return
;~ K6_4_5:
;~ GuiControl, , showlocation, K6_4_5
;~ gosub, LVlocation
;~ return
;~ K6_4_6:
;~ GuiControl, , showlocation, K6_4_6
;~ gosub, LVlocation
;~ return
;~ K6_4_7:
;~ GuiControl, , showlocation, K6_4_7
;~ gosub, LVlocation
;~ return
;~ K6_4_8:
;~ GuiControl, , showlocation, K6_4_8
;~ gosub, LVlocation
;~ return

;~ K6_1_5:
;~ GuiControl, , showlocation, K6_1_5
;~ gosub, LVlocation
;~ return
;~ K6_5_2:
;~ GuiControl, , showlocation, K6_5_2
;~ gosub, LVlocation
;~ return
;~ K6_5_3:
;~ GuiControl, , showlocation, K6_5_3
;~ gosub, LVlocation
;~ return
;~ K6_5_4:
;~ GuiControl, , showlocation, K6_5_4
;~ gosub, LVlocation
;~ return
;~ K6_5_5:
;~ GuiControl, , showlocation, K6_5_5
;~ gosub, LVlocation
;~ return
;~ K6_5_6:
;~ GuiControl, , showlocation, K6_5_6
;~ gosub, LVlocation
;~ return
;~ K6_5_7:
;~ GuiControl, , showlocation, K6_5_7
;~ gosub, LVlocation
;~ return
;~ K6_5_8:
;~ GuiControl, , showlocation, K6_5_8
;~ gosub, LVlocation
;~ return

;~ K5_1_5:
;~ GuiControl, , showlocation, K5_1_5
;~ gosub, LVlocation
;~ return
;~ K5_5_2:
;~ GuiControl, , showlocation, K5_5_2
;~ gosub, LVlocation
;~ return
;~ K5_5_3:
;~ GuiControl, , showlocation, K5_5_3
;~ gosub, LVlocation
;~ return
;~ K5_5_4:
;~ GuiControl, , showlocation, K5_5_4
;~ gosub, LVlocation
;~ return
;~ K5_5_5:
;~ GuiControl, , showlocation, K5_5_5
;~ gosub, LVlocation
;~ return
;~ K5_5_6:
;~ GuiControl, , showlocation, K5_5_6
;~ gosub, LVlocation
;~ return
;~ K5_5_7:
;~ GuiControl, , showlocation, K5_5_7
;~ gosub, LVlocation
;~ return
;~ K5_5_8:
;~ GuiControl, , showlocation, K5_5_8
;~ gosub, LVlocation
;~ return

 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;


!^9::
ControlClick, Button5, %WINTITLE% ;검색
return


!^5::
ControlClick, Button9, %WINTITLE% ;초기화
return

!^6::
Reload
return

인폼받기:
timer:

Gui, submit, nohide
            ToolTip, 서버에서 인폼 받는 중
FormatTime, now, , mmss
csvfile2 = %A_ScriptDir%\상품정보\판매정보.CSV

csvfile4 = %A_ScriptDir%\상품정보\오늘이후판매리스트.CSV

csvfile5 = %A_ScriptDir%\상품정보\전산상품정보.CSV

csvfile6 = %A_ScriptDir%\상품정보\어제판매리스트.CSV





;~ FileDelete, % csvfile1
FileDelete, % csvfile2
FileDelete, % csvfile4
FileDelete, % csvfile5
FileDelete, % csvfile6


filecopyloop1:
;~ if (A_UserName = "지게차용")
;~ {
    ;~ csv_Save(csvfile1,"data1")
    ;~ FileCopy, %csvfile1%, \\192.168.0.1\hdd1\WMS\상품정보\상품정보.CSV, 1
;~ }


;~ else
;~ {
    ;~ FileDelete,  % csvfile1
    ;~ Sleep, 1000
    ;~ FileCopy, \\192.168.0.1\hdd1\WMS\상품정보\상품정보.CSV, %csvfile1%, 1
        ;~ if ErrorLevel = 1
        ;~ {
            ;~ gosub, filecopyloop1
        ;~ }
        ;~ else
        ;~ {
        ;~ }
    ;~ csv_Load(csvfile1,"data1")
    gosub, UpdatePresetList
;~ }






    csv_Save(csvfile1,"data1")
    csv_Load(csvfile1,"data1")




    gosub, UpdatePresetList

    Sleep, 1000



        ControlSend, combobox1, {ctrl Down}a{ctrl up}%frmSAVEDPRESET%, %WINTITLE%


    filecopyloop2:

    Sleep, 1000
    FileCopy, \\192.168.0.1\hdd1\WMS\상품정보\판매정보.CSV, %csvfile2%, 1
    FileCopy, \\192.168.0.1\hdd1\WMS\상품정보\오늘이후판매리스트.CSV, %csvfile4%, 1
    FileCopy, \\192.168.0.1\hdd1\WMS\상품정보\전산상품정보.CSV, %csvfile5%, 1
    FileCopy, \\192.168.0.1\hdd1\WMS\상품정보\어제판매리스트.CSV, %csvfile6%, 1

    if ErrorLevel = 1
    {
        gosub, filecopyloop2
    }
    else
    {
    }


    Loop
    {
        if ( FileExist(csvfile1) && FileExist(csvfile2) && FileExist(csvfile4) && FileExist(csvfile5) && FileExist(csvfile6) )
        {
            csv_Load(csvfile2,"data2")
            Rows2:=CSV_TotalRows("data2")
            csv_Load(csvfile4,"data4")
            Rows4:=CSV_TotalRows("data4")
            csv_Load(csvfile5,"data5")
            Rows5:=CSV_TotalRows("data5")
            FileRead, data3, % csvfile1
            break
        }
        else
        {
        }
    }


        ToolTip,

return

/*

;~ MsgBox, % now
;~ run, explorer, \\192.168.0.1\hdd1\일정표 최근\WMS\
;~ Loop
;~ {
    if (now = "0000") or (now = "1000") or (now = "2000") or (now = "3000") or (now = "4000") or (now = "5000")
    {
        Sleep, 1000

        {
            ToolTip, 서버에서 인폼 받는 중

            GuiControl,, PG, 0


            Loop, 20
        {

        Process, close, EXCEL.EXE
        Sleep, 10
        }
        Sleep, 1000
            FileDelete, %A_ScriptDir%\*.xlsx
            if ErrorLevel = 1
            {
                filemove,  %A_ScriptDir%\어제자상품재고정보.xlsx, %A_ScriptDir%\복사본\어제자상품재고정보.xlsx, 1
                filemove,  %A_ScriptDir%\어제판매리스트.xlsx, %A_ScriptDir%\복사본\어제판매리스트.xlsx, 1
                filemove,  %A_ScriptDir%\오늘미래판매리스트.xlsx, %A_ScriptDir%\복사본\오늘미래판매리스트.xlsx, 1
            }
            else
            {
            }
        Sleep, 200
        ;~ MsgBox, 파일 삭제 됐는지 확인 해야 함
        FileCopy, \\192.168.0.1\hdd1\일정표 최근\WMS\어제자상품재고정보.xlsx, %A_ScriptDir%\어제자상품재고정보.xlsx, 1
        GuiControl,, PG, +10
        ;~ Sleep,500
        FileCopy, \\192.168.0.1\hdd1\일정표 최근\WMS\어제판매리스트.xlsx, %A_ScriptDir%\어제판매리스트.xlsx, 1
        GuiControl,, PG, +10
        ;~ Sleep,500
        FileCopy, \\192.168.0.1\hdd1\일정표 최근\WMS\오늘미래판매리스트.xlsx, %A_ScriptDir%\오늘미래판매리스트.xlsx, 1
        GuiControl,, PG, +10
        GuiControl,, PG, +10

        Sleep, 1000
        XLS_file_path1 := % A_ScriptDir "\어제판매리스트.xlsx"
        1xl := ComObjCreate("Excel.Application")
        GuiControl,, PG, +10
        1xl.Workbooks.Open(XLS_file_path1)
        11xl := 1xl.Workbooks.Open(XLS_file_path1, 3, 0)
        1xl.Visible:=false
        GuiControl,, PG, +10
        1xl := 1xl.Sheets("Sheet1")
        GuiControl,, PG, +10
        XLS_file_path2 := % A_ScriptDir "\오늘미래판매리스트.xlsx"
        2xl := ComObjCreate("Excel.Application")
        GuiControl,, PG, +10
        2xl.Workbooks.Open(XLS_file_path2)
        22xl := 2xl.Workbooks.Open(XLS_file_path2, 3, 0)
        2xl.Visible:=false
        2xl := 2xl.Sheets("Sheet1")
        GuiControl,, PG, +10
        XLS_file_path3 := % A_ScriptDir "\어제자상품재고정보.xlsx"
        3xl := ComObjCreate("Excel.Application")
              GuiControl,, PG, +10
        3xl.Workbooks.Open(XLS_file_path3)
        33xl := 3xl.Workbooks.Open(XLS_file_path3, 3, 0)
        3xl.Visible:=false
              GuiControl,, PG, +10
        3xl := 3xl.Sheets("Sheet1")
        ToolTip
        GuiControl,, PG, 100
        GuiControl,, PG, 0
        }
         ;~ Sleep, 60000
    }
    else
    {
        }
    }
*/
    return




WM_COMMNOTIFY(wParam) {
    if (wParam = 1027) { ; AHK_DIALOG
        Process, Exist
        DetectHiddenWindows, On
        if WinExist("RFID ahk_class #32770 ahk_pid " . ErrorLevel) {
          ControlSetText, Button1, &RFID 체크
          ControlSetText, Button2, &◎ 체크확인
          ControlSetText, Button3, &X 체크취소
        }
    }
}








/*
  IME check
*/
IME_CHECK(WinTitle) {
  WinGet,hWnd,ID,%WinTitle%
  Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}
Send_ImeControl(DefaultIMEWnd, wParam, lParam) {
  DetectSave := A_DetectHiddenWindows
  DetectHiddenWindows,ON
   SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
  if (DetectSave <> A_DetectHiddenWindows)
      DetectHiddenWindows,%DetectSave%
  return ErrorLevel
}
ImmGetDefaultIMEWnd(hWnd) {
  return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}

/*
GuiSize:
;~ Gui %hGui%:Default
if !horzMargin
	return
SetTimer, Update, % A_EventInfo=1 ? "Off" : "On" ; Suspend on minimize
ctrlW := A_GuiWidth - horzMargin
list = Title,MousePos,Ctrl,Pos,SBText,VisText,AllText,Freeze
Loop, Parse, list, `,
	GuiControl, Move, Ctrl_%A_LoopField%, w%ctrlW%
return

Update:

;~ Gui %hGui%:Defau`lt
GuiControlGet, Ctrl_FollowMouse
CoordMode, Mouse, Relative
MouseGetPos, msX, msY, msWin, msCtrl
actWin := WinExist("A")
if Ctrl_FollowMouse
{
	curWin := msWin
	curCtrl := msCtrl
	WinExist("ahk_id " curWin)
}
else
{
	curWin := actWin
	ControlGetFocus, curCtrl
}
WinGetTitle, t1
WinGetClass, t2
if (curWin = hGui || t2 = "MultitaskingViewFrame") ; Our Gui || Alt-tab
{
	UpdateText("Ctrl_Freeze", txtFrozen)
	return
}
UpdateText("Ctrl_Freeze", txtNotFrozen)
WinGet, t3, ProcessName
WinGet, t4, PID
UpdateText("Ctrl_Title", t1 "`nahk_class " t2 "`nahk_exe " t3 "`nahk_pid " t4)
CoordMode, Mouse, Relative
MouseGetPos, mrX, mrY
CoordMode, Mouse, Client
MouseGetPos, mcX, mcY
PixelGetColor, mClr, %msX%, %msY%, RGB
mClr := SubStr(mClr, 3)
UpdateText("Ctrl_MousePos", "Screen:`t" msX ", " msY " (less often used)`nWindow:`t" mrX ", " mrY " (default)`nClient:`t" mcX ", " mcY " (recommended)"
	. "`nColor:`t" mClr " (Red=" SubStr(mClr, 1, 2) " Green=" SubStr(mClr, 3, 2) " Blue=" SubStr(mClr, 5) ")")
UpdateText("Ctrl_CtrlLabel", (Ctrl_FollowMouse ? txtMouseCtrl : txtFocusCtrl) ":")
if (curCtrl)
{
	ControlGetText, ctrlTxt, %curCtrl%
	cText := "ClassNN:`t" curCtrl "`nText:`t" textMangle(ctrlTxt)
    ControlGetPos cX, cY, cW, cH, %curCtrl%
    cText .= "`n`tx: " cX "`ty: " cY "`tw: " cW "`th: " cH
    WinToClient(curWin, cX, cY)
	ControlGet, curCtrlHwnd, Hwnd,, % curCtrl
    GetClientSize(curCtrlHwnd, cW, cH)
    cText .= "`nClient:`tx: " cX "`ty: " cY "`tw: " cW "`th: " cH
}
else
	cText := ""
UpdateText("Ctrl_Ctrl", cText)
WinGetPos, wX, wY, wW, wH
GetClientSize(curWin, wcW, wcH)
UpdateText("Ctrl_Pos", "`tx: " wX "`ty: " wY "`tw: " wW "`th: " wH "`nClient:`tx: 0`ty: 0`tw: " wcW "`th: " wcH)
sbTxt := ""

return





WinGetTextFast(detect_hidden)
{
	; WinGetText ALWAYS uses the "Slow" mode - TitleMatchMode only affects the
	; WinText/ExcludeText parameters.  In "Fast" mode, GetWindowText() is used
	; to retrieve the text of each control.
	WinGet controls, ControlListHwnd
	static WINDOW_TEXT_SIZE := 32767 ; Defined in AutoHotkey source.
	VarSetCapacity(buf, WINDOW_TEXT_SIZE * (A_IsUnicode ? 2 : 1))
	text := ""
	Loop Parse, controls, `n
	{
		if !detect_hidden && !DllCall("IsWindowVisible", "ptr", A_LoopField)
			continue
		if !DllCall("GetWindowText", "ptr", A_LoopField, "str", buf, "int", WINDOW_TEXT_SIZE)
			continue
		text .= buf "`r`n"
	}
	return text
}

UpdateText(ControlID, NewText)
{
	; Unlike using a pure GuiControl, this function causes the text of the
	; controls to be updated only when the text has changed, preventing periodic
	; flickering (especially on older systems).
	static OldText := {}
	global hGui
	if (OldText[ControlID] != NewText)
	{
		GuiControl, %hGui%:, % ControlID, % NewText
		OldText[ControlID] := NewText
	}
}

GetClientSize(hWnd, ByRef w := "", ByRef h := "")
{
	VarSetCapacity(rect, 16)
	DllCall("GetClientRect", "ptr", hWnd, "ptr", &rect)
	w := NumGet(rect, 8, "int")
	h := NumGet(rect, 12, "int")
}

WinToClient(hWnd, ByRef x, ByRef y)
{
    WinGetPos wX, wY,,, ahk_id %hWnd%
    x += wX, y += wY
    VarSetCapacity(pt, 8), NumPut(y, NumPut(x, pt, "int"), "int")
    if !DllCall("ScreenToClient", "ptr", hWnd, "ptr", &pt)
        return false
    x := NumGet(pt, 0, "int"), y := NumGet(pt, 4, "int")
    return true
}

textMangle(x)
{
	if pos := InStr(x, "`n")
		x := SubStr(x, 1, pos-1), elli := true
	if StrLen(x) > 40
	{
		StringLeft, x, x, 40
		elli := true
	}
	if elli
		x .= " (...)"
	return x
}

~*Ctrl::
~*Shift::
SetTimer, Update, Off
UpdateText("Ctrl_Freeze", txtFrozen)
return

~*Ctrl up::
~*Shift up::
SetTimer, Update, On

return
