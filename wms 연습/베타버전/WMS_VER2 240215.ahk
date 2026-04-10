#NoENV
#SingleInstance, Force
#InstallMouseHook
#MaxMem 512  ; that's a large chunk of memory for a script

;~ Process, Priority,, High
;~ SetBatchLines, -1  ; affects CPU utilization... script will run at max speed
;~ ListLines Off  ; helps with speed
#Include, %A_WorkingDir%\Class_LV_InCellEdit.ahk
#Include, %A_WorkingDir%\Class_LV_Colors.ahk
#Include, %A_WorkingDir%\csv.ahk
#Include, %A_WorkingDir%\screencapture.ahk
연다 = 0

;~ CoordMode, Pixel, screen
;~ CoordMode, mouse, screen
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gosub, 인폼받기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SetTitleMatchMode, 1
SetTitleMatchMode, slow
SetKeyDelay, 2
SetMouseDelay, -1
SetWinDelay, -1
SetControlDelay, -1

VERSION := 2.0
RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe
WINTITLE := basename1 " " VERSION

;~ txtNotFrozen := "(Hold Ctrl or Shift to suspend updates)"
;~ txtFrozen := "(Updates suspended)"
;~ txtMouseCtrl := "Control Under Mouse Position"
;~ txtFocusCtrl := "Focused Control"
;~ GetClientSize(hGui, temp)
;~ horzMargin := temp*96//A_ScreenDPI - 320
;~ SetTimer, Update, 250
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/*
if (A_UserName = "shwoodnew") or (A_UserName = "taeju")
{
}
else
{

SetTimer , timer, 1000
Loop, 20
{

Process, close, EXCEL.EXE
Sleep, 10
}


        ;~ FileDelete, %A_ScriptDir%\*.xlsx
        ;~ if ErrorLevel = 1
        ;~ {
            ;~ filemove,  %A_ScriptDir%\어제자상품재고정보.xlsx, %A_ScriptDir%\복사본\어제자상품재고정보.xlsx, 1
            ;~ filemove,  %A_ScriptDir%\어제판매리스트.xlsx, %A_ScriptDir%\복사본\어제판매리스트.xlsx, 1
            ;~ filemove,  %A_ScriptDir%\오늘미래판매리스트.xlsx, %A_ScriptDir%\복사본\오늘미래판매리스트.xlsx, 1
        ;~ }
        ;~ else
        ;~ {
        ;~ }
    Sleep, 200
    ;~ MsgBox, 파일 삭제 됐는지 확인 해야 함
    FileCopy, \\192.168.0.1\hdd2\일정표 최근\WMS\어제자상품재고정보.xlsx, %A_ScriptDir%\어제자상품재고정보.xlsx, 1
    GuiControl,, PG, +10
    ;~ Sleep,500
    FileCopy, \\192.168.0.1\hdd2\일정표 최근\WMS\어제판매리스트.xlsx, %A_ScriptDir%\어제판매리스트.xlsx, 1
    GuiControl,, PG, +10
    ;~ Sleep,500
    FileCopy, \\192.168.0.1\hdd2\일정표 최근\WMS\오늘미래판매리스트.xlsx, %A_ScriptDir%\오늘미래판매리스트.xlsx, 1
    GuiControl,, PG, +10

    GuiControl,, PG, +10













Loop,2
{
WinKill, ahk_exe ttermpro.exe
Sleep,10
winkill, ahk_exe JedaeroM.exe
Sleep,10
}

run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M
    WinKill, ahk_exe ttermpro.exe

Sleep, 500

		WinWait, ahk_exe JedaeroM.exe,
		IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
		WinWaitActive, ahk_exe JedaeroM.exe,
Sleep, 500

ControlSetText, TRzEdit2, 0415660571, ahk_exe JedaeroM.exe
ControlSetText, TRzEdit1, 0415660571, ahk_exe JedaeroM.exe
ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe

run, ttermpro.exe, C:\Program Files (x86)\teraterm
Sleep,100
		WinWait, Tera Term: 새 연결,
		IfWinNotActive, Tera Term: 새 연결, , WinActivate, Tera Term: 새 연결,
		WinWaitActive, Tera Term: 새 연결,


Sleep, 500
control, Check, , Button11, Tera Term: 새 연결

Sleep,200,
control, choose, 1, ComboBox4, Tera Term: 새 연결
Sleep, 200,

ControlSend, Button5, {enter}, Tera Term: 새 연결
Sleep, 1000

WinMaximize, ahk_exe JedaeroM.exe

ListLines Off       ; a debugging option

어제날짜=%A_Now%
EnvAdd,어제날짜,-1,days
FormatTime,어제날짜,%어제날짜%,yyyy-MM-dd


        ToolTip, 서버에서 인폼 받는 중

        GuiControl,, PG, 0


        Loop, 20
    {

    Process, close, EXCEL.EXE
    Sleep, 10
    }
    ;~ Sleep, 1000

    ;~ Sleep, 1000
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



winset, alwaysontop, on , ahk_exe ttermpro.exe
}

; SoundPlay, %A_ScriptDir%\sound\sound22.wav
Sleep, 500
; SoundPlay, %A_ScriptDir%\sound\sound0_1.mp3


;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


*/




RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath
gui, destroy
gui, Default
;~ Gui, +alwaysontop




 ;~ Background0xFF00FF
Gui, Font, S13 CDefault w700, Malgun Gothic
Gui, Add, Tab3, x0 y0 w1281 h731 vtabname gtabname, 상품검색|로케이션[창고내부]|로케이션[창고철물]|로케이션[외부마당]|`      EDSM`       |
Gui, Tab, 상품검색,,Exact


Gui, Add, Picture, y+1 w0 h0 vhighlight, %A_ScriptDir%\highlight.png   ; 하이라이트


Gui, Add, Picture, x608 y113 w44 h44 vcolor1, %A_ScriptDir%\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, y+16 w44 h44 vcolor2, %A_ScriptDir%\blue.png
Gui, Add, Picture, y+1 w44 h44 vcolor3, %A_ScriptDir%\colour1.png
Gui, Add, Picture, y+1 w44 h44 vcolor4, %A_ScriptDir%\colour2.png
Gui, Add, Picture, y+1 w44 h44 vcolor5, %A_ScriptDir%\colour3.png
Gui, Add, Picture, y+1 w44 h44 vcolor6, %A_ScriptDir%\colour4.png
Gui, Add, Picture, y+1 w44 h44  vcolor7, %A_ScriptDir%\colour5.png
Gui, Add, Picture, y+1 w44 h44 vcolor8, %A_ScriptDir%\colour6.png
Gui, Add, Picture, y+1 w44 h44 vcolor9, %A_ScriptDir%\colour7.png




;~ Gui, Add, Picture, x610 y435 w0 h0 vcolorbutton, %A_ScriptDir%\red.png
;~ Gui, Add, Picture, x10 y10 w0 h0 v1colorbutton, %A_ScriptDir%\red.png
;~ Gui, Add, Picture, x10 y10 w0 h0 v2colorbutton, %A_ScriptDir%\red.png
;~ Gui, Add, Picture, x10 y10 w0 h0 v3colorbutton, %A_ScriptDir%\colour4.png
;~ Gui, Add, Picture, x10 y10 w0 h0 v4colorbutton, %A_ScriptDir%\colour6.png



Gui, Font, S13 CDefault w700, Malgun Gothic


Gui, Add, Text, x20 y120 w20 h40 Backgroundtrans, #1
Gui, Add, Text, y+20 w20 h40 backgroundtrans, #2
Gui, Add, Text, y+5 w20 h40 backgroundtrans, #3
Gui, Add, Text, y+5 w20 h40 backgroundtrans, #4
Gui, Add, Text, y+5 w20 h40 backgroundtrans, #5
Gui, Add, Text, y+5 w20 h40 backgroundtrans, #6
Gui, Add, Text, y+5 w20 h40 backgroundtrans, #7
Gui, Add, Text, y+5 w20 h40 backgroundtrans, #8
Gui, Add, Text, y+5 w20 h40 backgroundtrans, #9

Gui, Font, S13 CDefault w400, Malgun Gothic
Gui, Add, GroupBox, x15 y85 w860 h450 ,    `   [RFID CODE]                    [LOCATION CODE]
Gui, Font, S15 CDefault, Malgun Gothic
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 01   01   01
Gui, Add, ComboBox, x42 y115 w170 h40 r10 cE7141B section vfrmSAVEDPRESET gPresetChange,%TR1%
Gui, Add, Button, x+0   w40 h40 grefridread, R1 ; RRRRRRRRRRRR
Gui, Add, Edit, x+8  w100 h40 +ReadOnly cE7141B -vscroll Uppercase v1RFID2,
;~ Gui, Add, Edit, x+10  w40 h40 -vscroll Uppercase +center v1RFID1,
Gui, Add, Edit, x+10  w40 h40 cE7141B -vscroll Uppercase +center  vlo1_1 glo1,
;~ Gui, Add, Edit, x+0 w50 h40 -vscroll Number +center v1RFID2,
Gui, Add, Edit, x+0 w50 h40 cE7141B -vscroll Number +center Limit20 vlo1_2 glo1,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
;~ Gui, Add, Edit, x+0 w50 h40 -vscroll Number +center v1RFID3,
Gui, Add, Edit, x+0 w50 h40 cE7141B -vscroll Number +center Limit20 vlo1_3 glo1,
Gui, Add, UpDown,,
Gui, Add, Text, x+0 w20 h40 +center, -
;~ Gui, Add, Edit, x+0 w50 h40 -vscroll Number +center v1RFID4,
Gui, Add, Edit, x+0 w50 h40 cE7141B -vscroll Number +center Limit20 vlo1_4 glo1,
Gui, Add, UpDown,Range00-20 ,1
Gui, Add, Button, x+10 y115 w40 h40 gselect1, L1
Gui, Add, Edit, x+20 y115 w60 h40 cE7141B -vscroll Uppercase +right v1RFID3 gb1RFID3,
Gui, Add, Button, x+10 y115 w40 h40 cE7141B -vscroll Uppercase gminer1, -1  ;★☆★☆★☆★☆
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 02   02   02
;~ x: 42	y: 175
Gui, Add, Edit, x42 y+20 w170 h40 c0000FF -vscroll +ReadOnly Uppercase v2RFID1,
Gui, Add, Button, X+0   w40 h40 grefridread2, R2
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

Gui, Add, Button, x+10 y175 w40 h40 gselect2, L2
Gui, Add, Edit, x+20 y175 w60 h40 c0000FF -vscroll Uppercase +right v2RFID3 gb2RFID3,
Gui, Add, Button, x+10 w40 h40 cE7141B -vscroll Uppercase gminer2, -2  ;★☆★☆★☆★☆
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 03   03   03
Gui, Add, Edit, x42 y+5 w170 h40 cFF7F27 -vscroll +ReadOnly Uppercase v3RFID1,
Gui, Add, Button, x+0 w40 h40 grefridread3, R3
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


Gui, Add, Button, x+10  w40 h40 gselect3, L3
Gui, Add, Edit, x+20 w60 h40 cFF7F27 -vscroll Uppercase +right v3RFID3 gb3RFID3,
Gui, Add, Button, x+10 w40 h40 cE7141B -vscroll Uppercase gminer3, -3  ;★☆★☆★☆★☆
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 04   04   04
Gui, Add, Edit, x42 y+5 w170 h40 cFF00FF -vscroll +ReadOnly Uppercase v4RFID1,
Gui, Add, Button,  x+0 w40 h40 grefridread4, R4
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


Gui, Add, Button, x+10 w40 h40 gselect4, L3
Gui, Add, Edit, x+20 w60 h40 -vscroll Uppercase +right v4RFID3 gb4RFID3,
Gui, Add, Button, x+10 w40 h40 cE7141B -vscroll Uppercase gminer4, -4  ;★☆★☆★☆★☆
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 05   05   05
Gui, Add, Edit, x42 y+5 w170 h40 c68E4E6 -vscroll +ReadOnly Uppercase v5RFID1,
Gui, Add, Button,  x+0 w40 h40 grefridread5, R5
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


Gui, Add, Button, x+10 w40 h40 gselect5, L5
Gui, Add, Edit, x+20 w60 h40 c68E4E6 -vscroll Uppercase +right v5RFID3 gb5RFID3,
Gui, Add, Button, x+10 w40 h40 cE7141B -vscroll Uppercase gminer5, -5  ;★☆★☆★☆★☆
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 06   06   06
Gui, Add, Edit,  x42 y+5 w170 h40 c00E800 -vscroll +ReadOnly Uppercase v6RFID1,
Gui, Add, Button,   x+0 w40 h40 grefridread6, R6
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
Gui, Add, Button, x+10 w40 h40 cE7141B -vscroll Uppercase gminer6, -6  ;★☆★☆★☆★☆
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 07   07   07
Gui, Add, Edit,x42 y+5 w170 h40 cC4C400 -vscroll +ReadOnly Uppercase v7RFID1,
Gui, Add, Button,  x+0 w40 h40 grefridread7, R7
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


Gui, Add, Button, x+10 w40 h40 gselect7, L7
Gui, Add, Edit,  x+20 w60 h40 cC4C400  -vscroll Uppercase +right v7RFID3 gb7RFID3,
Gui, Add, Button, x+10 w40 h40 cE7141B -vscroll Uppercase gminer7, -7  ;★☆★☆★☆★☆
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 08   08   08
Gui, Add, Edit,x42 y+5 w170 h40 cA349A4 -vscroll +ReadOnly Uppercase v8RFID1,
Gui, Add, Button, x+0 w40 h40 grefridread8, R8
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


Gui, Add, Button, x+10 w40 h40 gselect8, L8
Gui, Add, Edit, x+20 w60 h40 cA349A4  -vscroll Uppercase +right v8RFID3 gb8RFID3,
Gui, Add, Button, x+10 w40 h40 cE7141B -vscroll Uppercase gminer8, -8  ;★☆★☆★☆★☆
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 09   09   09
Gui, Add, Edit, x42 y+5 w170 h40  c6B6B00 -vscroll +ReadOnly Uppercase v9RFID1,
Gui, Add, Button,  x+0 w40 h40 grefridread9, R9
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


Gui, Add, Button, x+10 w40 h40 gselect9, L9
Gui, Add, Edit, x+20 w60 h40  c6B6B00 -vscroll Uppercase +right v9RFID3 gb9RFID3,
Gui, Add, Button, x+10 w40 h40 cE7141B -vscroll Uppercase gminer9, -9  ;★☆★☆★☆★☆
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~










GuiControl, Move, 2colorbutton, x202 y37 w55 h29
GuiControl, Move, 3colorbutton, x308 y37 w55 h29
GuiControl, Move, 4colorbutton, x416 y37 w55 h29

Gui, Font, S13 CDefault, Malgun Gothic
Gui, Add, Button, x42 y45 w80 h25 gSavePreset, 저장
Gui, Add, Button, x+2 w80 h25 gDeletePreset vDELETEBUTTON, 삭제
Gui, Add, Button, x+10 w80 h25 g리더기, #1 리딩
Gui, Add, Button, x+2 w80 h25 g키보드, 키보드
Gui, Add, Button, x+2 w80 h25 gbutton2, 초기화
Gui, Add, Button, x+2 w80 h25 g인폼받기, 인폼받기
Gui, Add, Button, x+2 w80 h25 g카드값초기화, 서브카드
Gui, Add, Button, x+2  w80 h25 gmapping, 맵에표시
Gui, Add, Button, x+2  w160 h25 gdelrfid, 밴딩해체 라인정렬
Gui, Add, Edit, y+0 w75 h1 vRFIDREAD4,

Gui, Add, Progress, vPG x990 y45 w210 h22 cred, 0
Gui, Add, StatusBar



;~ Gui, Add, GroupBox, x85 y149 w255 h90 , [로케이션]


;~ Gui, Add, Text, x90 y179 w230 h17 , 라인          칸                줄               칸
Gui, Font, S13 CDefault, Malgun Gothic
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

Gui, Add, Button, x900 y42 w80 h25 g검색, 빠른검색

Gui, Font, S13 CDefault, Malgun Gothic
Gui, Add, GroupBox, x889 y80 w315 h147 , [상품명 / 규격]
Gui, Font, S15 CDefault, Malgun Gothic
Gui, Add, Edit, x1095 y70 w100 h40 -vscroll  v상품코드,
Gui, Add, Edit, x900 y115 w295 h40 -vscroll v상품명,
Gui, Add, Edit, x900 y+20 w295 h40 -vscroll v규격,



;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

Gui, Font, S11 CDefault, Malgun Gothic
Gui, Add, GroupBox,  x889 y230 w315 h305 , ` 어제재고        매출수량        반입수량

;~ 1205, 535 (

;~ Gui, Add, GroupBox, x347 y184 w180 h240 , [재고량]
;~ Gui, Add, Text, x352 y205 w170 h15 ,
;~ Gui, Font, S13 CDefault, Malgun Gothic
Gui, Add, Text, x900 y295 w290 h18 , ` 매입수량        반출수량
Gui, Add, Text, x900 y355 w290 h18 , ` 전산총수량  - 전산밴딩   =   전산낱장
Gui, Add, Text, x900 y415 w290 h18 , ` 수정값          #실제합계       #실제낱장


Gui, Font, S15 CDefault, Malgun Gothic
Gui, Add, Edit, x900  y254 w95 h40 -vscroll +right v이전재고,
Gui, Add, Edit, x+5 w95 h40 -vscroll +right v매출수량,
Gui, Add, Edit, x+5  w95 h40 -vscroll +right v반입수량,

;~ Gui, Add, Edit, x317 y264 w70 h25 -vscroll ,
Gui, Add, Edit, x900 y314 w95 h40 -vscroll +right v매입수량,
Gui, Add, Edit, x+5  w95 h40 -vscroll +right v반출수량,

Gui, Add, Edit, x900 y374 w95 h40 -vscroll +right v현재수량,
Gui, Add, Edit, x+5  w95 h40 -vscroll +right v전산밴딩 gb전산밴딩,
Gui, Add, Edit, x+5  w95 h40 -vscroll +right v전산낱장,

Gui, Add, Edit,  x900  y434 w95 h40 -vscroll +right v수정값,
Gui, Add, Edit,  x+5  w95 h40 -vscroll +right v실합계,
Gui, Add, Edit,  x+5  w95 h40 -vscroll +right v실낱장,


Gui, Font, S13 CDefault, Malgun Gothic

Gui, Add, Button, x900 y490 w95 h40 vbcaledit gbcaledit, 전산수정
Gui, Add, Button, x+100  w100 h40 vbcallast gbcallast, 낱장 역계산

Gui, Add, GroupBox, x889 y533  w315 h147 , [수정로그]
Gui, Add, Edit, x900 y564 w295 h110 v비고,


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




;~ GuiControl, Move, colorbutton, x315 y387 w74 h29

GuiControl, Move, colorbutton, x463 y387 w64 h31


;~ Gui, Add, Button, x387 y389 w65 h25 , 총-밴딩

;~ GuiControl, disable, bcaledit
;~ GuiControl, disable, bcallast

GuiControl, disable, DELETEBUTTON


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

















Gui, Tab, 로케이션[창고내부],,Exact

Gui, Font, S10 W900 cFF2211, Malgun Gothic
Gui, Add, Listview, x800 y340 w400 h340 vLV1 gLV1 hwndHLV1, RFID CODE|로케이션|상품명|규격|수량|PRODUCT CODE


Gui, ListView, lv1
LV_ModifyCol(1, 0)  ;
LV_ModifyCol(2, 60) ;
LV_ModifyCol(3, 140)  ;
LV_ModifyCol(4, 140)  ;
LV_ModifyCol(5, "40 Integer" "Integer Right")  ;
LV_ModifyCol(6, 0)  ;
;~ Gui, Add, GroupBox, x547 y9 w800 h695 , [창고 2D 평면도]



Gui, Font, S11 CDefault W400, Malgun Gothic





Gui, Color, FFFFFF
;~ Gui, Add, Picture, x640 y225 w312 h95 vdivi1, %A_ScriptDir%\divi.png
;~ Gui, Add, Picture, x1122 y201 w62 h170 vdivi2, %A_ScriptDir%\divi.png
;~ Gui, Add, Picture, x610 y435 w345 h75 vdivi3, %A_ScriptDir%\divi.png
;~ Gui, Add, Picture, x758 y34 w585 h80 vdivi4, %A_ScriptDir%\divi.png
;~ Gui, Add, Picture, x1045 y461 w100 h47 vdivi5, %A_ScriptDir%\divi.png

Gui, Add, Picture, x0 y0 w0 h0 v1color1, %A_ScriptDir%\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x0 y0 w0 h0 v1color2, %A_ScriptDir%\blue.png
Gui, Add, Picture, x0 y0 w0 h0 v1color3, %A_ScriptDir%\colour1.png
Gui, Add, Picture, x0 y0 w0 h0 v1color4, %A_ScriptDir%\colour2.png
Gui, Add, Picture, x0 y0 w0 h0 v1color5, %A_ScriptDir%\colour3.png
Gui, Add, Picture, x0 y0 w0 h0 v1color6, %A_ScriptDir%\colour4.png
Gui, Add, Picture, x0 y0 w0 h0 v1color7, %A_ScriptDir%\colour5.png
Gui, Add, Picture, x0 y0 w0 h0 v1color8, %A_ScriptDir%\colour6.png
Gui, Add, Picture, x0 y0 w0 h0 v1color9, %A_ScriptDir%\colour7.png






Gui, Add, Button, x22 y50 w70 h30 gF4_3, F4_3
Gui, Add, Button,  y+4 w70 h30 gF4_2, F4_2
Gui, Add, Button,  y+4 w70 h30 gF4_1, F4_1

Gui, Add, Button, x+4 y50 w70 h30 gF3_3, F3_3
Gui, Add, Button,  y+4 w70 h30 gF3_2, F3_2
Gui, Add, Button,  y+4 w70 h30 gF3_1, F3_1

Gui, Add, Button, x+8 y50 w70 h30 gF2_3, F2_3
Gui, Add, Button, y+4 w70 h30 gF2_2, F2_2
Gui, Add, Button, y+4 w70 h30 gF2_1, F2_1

Gui, Add, Button, x+4 y50 w70 h30 gF1_3, F1_3
Gui, Add, Button, y+4 w70 h30 gF1_2, F1_2
Gui, Add, Button, y+4 w70 h30 gF1_1, F1_1


Gui, Add, Button, x+8 y50 w30 h99 gF0_1, F0_1



Gui, Add, Button, x+8 y50 w50 h30 gH14_3, H14_3
Gui, Add, Button, y+4 w50 h30 gH14_2, H14_2
Gui, Add, Button, y+4 w50 h30 gH14_1, H14_1
Gui, Add, Button, y+8 w50 h30 gG14_3, G14_3
Gui, Add, Button, y+4 w50 h30 gG14_2, G14_2
Gui, Add, Button, y+4 w50 h30 gG14_1, G14_1

Gui, Add, Button, x+8 y50 w50 h30 gH13_3, H13_3
Gui, Add, Button, y+4  w50 h30 gH13_2, H13_2
Gui, Add, Button, y+4  w50 h30 gH13_1, H13_1
Gui, Add, Button, y+8  w50 h30 gG13_3, G13_3
Gui, Add, Button, y+4  w50 h30 gG13_2, G13_2
Gui, Add, Button, y+4  w50 h30 gG13_1, G13_1


Gui, Add, Button, x+16 y50 w50 h30 gH12_2, H12_2
Gui, Add, Button, y+4  w50 h30 gH12_3, H12_3
Gui, Add, Button, y+4  w50 h30 gH12_1, H12_1
Gui, Add, Button, y+8  w50 h30 gG12_3, G12_3
Gui, Add, Button, y+4  w50 h30 gG12_2, G12_2
Gui, Add, Button, y+4  w50 h30 gG12_1, G12_1

Gui, Add, Button, x+8 y50 w50 h30 gH11_3, H11_3
Gui, Add, Button, y+4  w50 h30 gH11_2, H11_2
Gui, Add, Button, y+4  w50 h30 gH11_1, H11_1
Gui, Add, Button, y+8  w50 h30 gG11_3, G11_3
Gui, Add, Button, y+4  w50 h30 gG11_2, G11_2
Gui, Add, Button, y+4  w50 h30 gG11_1, G11_1

Gui, Add, Button, x+16 y50 w50 h30 gH10_3, H10_3
Gui, Add, Button, y+4  w50 h30 gH10_2, H10_2
Gui, Add, Button, y+4  w50 h30 gH10_1, H10_1
Gui, Add, Button, y+8  w50 h30 gG10_3, G10_3
Gui, Add, Button, y+4  w50 h30 gG10_2, G10_2
Gui, Add, Button, y+4  w50 h30 gG10_1, G10_1

Gui, Add, Button, x+8 y50 w50 h30 gH9_3, H9_3
Gui, Add, Button, y+4  w50 h30 gH9_2, H9_2
Gui, Add, Button, y+4  w50 h30 gH9_1, H9_1
Gui, Add, Button, y+8  w50 h30 gG9_3, G9_3
Gui, Add, Button, y+4  w50 h30 gG9_2, G9_2
Gui, Add, Button, y+4  w50 h30 gG9_1, G9_1

Gui, Add, Button, x+16 y50 w50 h30 gH8_3, H8_3
Gui, Add, Button, y+4  w50 h30 gH8_2, H8_2
Gui, Add, Button, y+4  w50 h30 gH8_1, H8_1
Gui, Add, Button, y+8  w50 h30 gG8_3, G8_3
Gui, Add, Button, y+4  w50 h30 gG8_2, G8_2
Gui, Add, Button, y+4  w50 h30 gG8_1, G8_1

Gui, Add, Button, x+8 y50 w50 h30 gH7_3, H7_3
Gui, Add, Button, y+4  w50 h30 gH7_2, H7_2
Gui, Add, Button, y+4  w50 h30 gH7_1, H7_1
Gui, Add, Button, y+8  w50 h30 gG7_3, G7_3
Gui, Add, Button, y+4  w50 h30 gG7_2, G7_2
Gui, Add, Button, y+4  w50 h30 gG7_1, G7_1

Gui, Add, Button, x+16 y50 w50 h30 gH6_3, H6_3
Gui, Add, Button, y+4  w50 h30 gH6_2, H6_2
Gui, Add, Button, y+4  w50 h30 gH6_1, H6_1
Gui, Add, Button, y+8  w50 h30 gG6_3, G6_3
Gui, Add, Button, y+4  w50 h30 gG6_2, G6_2
Gui, Add, Button, y+4  w50 h30 gG6_1, G6_1

Gui, Add, Button, x+8 y50 w50 h30 gH5_3, H5_3
Gui, Add, Button, y+4  w50 h30 gH5_2, H5_2
Gui, Add, Button, y+4  w50 h30 gH5_1, H5_1
Gui, Add, Button, y+8  w50 h30 gG5_3, G5_3
Gui, Add, Button, y+4  w50 h30 gG5_2, G5_2
Gui, Add, Button, y+4  w50 h30 gG5_1, G5_1

Gui, Add, Button, x+16 y50 w50 h30 gH4_3, H4_3
Gui, Add, Button, y+4  w50 h30 gH4_2, H4_2
Gui, Add, Button, y+4  w50 h30 gH4_1, H4_1
Gui, Add, Button, y+8  w50 h30 gG4_3, G4_3
Gui, Add, Button, y+4  w50 h30 gG4_2, G4_2
Gui, Add, Button, y+4  w50 h30 gG4_1, G4_1

Gui, Add, Button, x+8 y50 w50 h30 gH3_3, H3_3
Gui, Add, Button, y+4  w50 h30 gH3_2, H3_2
Gui, Add, Button, y+4  w50 h30 gH3_1, H3_1
Gui, Add, Button, y+8  w50 h30 gG3_3, G3_3
Gui, Add, Button, y+4  w50 h30 gG3_2, G3_2
Gui, Add, Button, y+4  w50 h30 gG3_1, G3_1

Gui, Add, Button, x+16 y50 w50 h30 gH2_3, H2_3
Gui, Add, Button, y+4  w50 h30 gH2_2, H2_2
Gui, Add, Button, y+4  w50 h30 gH2_1, H2_1
Gui, Add, Button, y+8  w50 h30 gG2_3, G2_3
Gui, Add, Button, y+4  w50 h30 gG2_2, G2_2
Gui, Add, Button, y+4  w50 h30 gG2_1, G2_1

Gui, Add, Button, x+8 y50 w50 h30 gH1_3, H1_3
Gui, Add, Button, y+4 w50 h30 gH1_2, H1_2
Gui, Add, Button, y+4 w50 h30 gH1_1, H1_1
Gui, Add, Button, y+8 w50 h30 gG1_3, G1_3
Gui, Add, Button, y+4 w50 h30 gG1_2, G1_2
Gui, Add, Button, y+4 w50 h30 gG1_1, G1_1




;227, 265

Gui, Add, Button, x200 y340 w60 h40 gA8_1, A8_1
Gui, Add, Button,  y+4 w60 h40 gA8_2, A8_2
Gui, Add, Button,  y+8 w60 h40 gB8_2, B8_2
Gui, Add, Button,  y+4 w60 h40 gB8_1, B8_1

Gui, Add, Button, x+8 y340 w60 h40 gA7_1, A7_1
Gui, Add, Button, y+4  w60 h40 gA7_2, A7_2
Gui, Add, Button, y+8 w60 h40 gB7_2, B7_2
Gui, Add, Button, y+4 w60 h40 gB7_1, B7_1

Gui, Add, Button, x+16 y340 w60 h40 gA6_1, A6_1
Gui, Add, Button, y+4 w60 h40 gA6_2, A6_2
Gui, Add, Button, y+8 w60 h40 gB6_2, B6_2
Gui, Add, Button,y+4 w60 h40 gB6_1, B6_1

Gui, Add, Button, x+8 y340 w60 h40 gA5_1, A5_1
Gui, Add, Button, y+4 w60 h40 gA5_2, A5_2
Gui, Add, Button, y+8 w60 h40 gB5_2, B5_2
Gui, Add, Button, y+4 w60 h40 gB5_1, B5_1

Gui, Add, Button, x+16 y340 w60 h40 gA4_1, A4_1
Gui, Add, Button, y+4 w60 h40 gA4_2, A4_2
Gui, Add, Button, y+8 w60 h40 gB4_2, B4_2
Gui, Add, Button, y+4 w60 h40 gB4_1, B4_1

Gui, Add, Button, x+8 y340 w60 h40 gA3_1, A3_1
Gui, Add, Button, y+4 w60 h40 gA3_2, A3_2
Gui, Add, Button,y+8 w60 h40 gB3_1, B3_1

Gui, Add, Button, x+16 y340 w60 h40 gA2_1, A2_1
Gui, Add, Button, y+4 w60 h40 gA2_2, A2_2
Gui, Add, Button, y+8 w60 h40 gB2_1, B2_1

Gui, Add, Button, x+8 y340 w60 h40 gA1_1, A1_1
Gui, Add, Button, y+4 w60 h40 gA1_2, A1_2
Gui, Add, Button, y+8 w60 h40 gB1_1, B1_1


Gui, Add, Button, x22 y200 w40 h90 gE2_3, E2_3
Gui, Add, Button, x+4  w40 h90 gE2_2, E2_2
Gui, Add, Button, x+4  w40 h90 gE2_1, E2_1
Gui, Add, Button, x22 y+8 w40 h90 gE1_3, E1_3
Gui, Add, Button, x+4 w40 h90 gE1_2, E1_2
Gui, Add, Button, x+4 w40 h90 gE1_1, E1_1

Gui, Add, Button, x22 y566 w60 h40 gD1_1, D1_1
Gui, Add, Button,  y+4 w60 h40 gD2_1, D2_1
Gui, Add, Button,  y+4 w60 h40 gD3_1, D3_1





Gui, Add, Button, x150 y610 w60 h40 gC9_1, C9_1
Gui, Add, Button, y+4 w60 h40 gC9_2, C9_2
Gui, Add, Button, x+4 y610 w60 h40 gC8_1, C8_1
Gui, Add, Button, y+4 w60 h40 gC8_2, C8_2
Gui, Add, Button, x+4 y610 w60 h40 gC7_1, C7_1
Gui, Add, Button, y+4 w60 h40 gC7_2, C7_2

Gui, Add, Button, x+16 y610 w60 h40 gC6_1, C6_1
Gui, Add, Button, y+4 w60 h40 gC6_2, C6_2
Gui, Add, Button, x+4 y610 w60 h40 gC5_1, C5_1
Gui, Add, Button, y+4 w60 h40 gC5_2, C5_2
Gui, Add, Button, x+16 y610 w60 h40 gC4_1, C4_1
Gui, Add, Button, y+4 w60 h40 gC4_2, C4_2
Gui, Add, Button, x+4 y610 w60 h40 gC3_1, C3_1
Gui, Add, Button, y+4 w60 h40 gC3_2, C3_2
Gui, Add, Button, x+16 y610 w60 h40 gC2_1, C2_1
Gui, Add, Button, y+4 w60 h40 gC2_2, C2_2
Gui, Add, Button, x+4 y610 w60 h40 gC1_1, C1_1
Gui, Add, Button, y+4 w60 h40 gC1_2, C1_2





Gui, Tab, 로케이션[창고철물],,Exact
Gui, Font, S9 CDefault W400, Malgun Gothic
Gui, Add, Picture, x610 y435 w0 h0 v2color1, %A_ScriptDir%\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x610 y435 w0 h0 v2color2, %A_ScriptDir%\blue.png
Gui, Add, Picture, x610 y435 w0 h0 v2color3, %A_ScriptDir%\colour1.png
Gui, Add, Picture, x610 y435 w0 h0 v2color4, %A_ScriptDir%\colour2.png
Gui, Add, Picture, x610 y435 w0 h0 v2color5, %A_ScriptDir%\colour3.png
Gui, Add, Picture, x610 y435 w0 h0 v2color6, %A_ScriptDir%\colour4.png
Gui, Add, Picture, x610 y435 w0 h0 v2color7, %A_ScriptDir%\colour5.png
Gui, Add, Picture, x610 y435 w0 h0 v2color8, %A_ScriptDir%\colour6.png
Gui, Add, Picture, x610 y435 w0 h0 v2color9, %A_ScriptDir%\colour7.png



Gui, Add, Listview, x800 y340 w400 h340 vLV2 gLV1 hwndHLV1,  로케이션|상품명|규격|수량|PRODUCT CODE|RFID CODE



Gui, Font, S12 CDefault W400, Malgun Gothic



Gui, Add, Button, x40 y60 w40 h105 gL5_1, L5_1
Gui, Add, Button, y+4 w40 h105 gL4_1, L4_1

;899, 437
Gui, Add, Button, x40 y350 w60 h105  gL3_3, L3_3
Gui, Add, Button, x+4 w60 h105  gL3_2, L3_2
Gui, Add, Button, x+4 w60 h105  gL3_1, L3_1


Gui, Add, Button, x40 y+4 w60 h105  gL2_3, L2_3
Gui, Add, Button, x+4 w60 h105  gL2_2, L2_2
Gui, Add, Button, x+4 w60 h105  gL2_1, L2_1

Gui, Add, Button, x40 y+18 w60 h105  gL1_3, L1_3
Gui, Add, Button, x+4 w60 h105  gL1_2, L1_2
Gui, Add, Button, x+4 w60 h105  gL1_1, L1_1

Gui, Add, Button, x+4	y350 w60 h337 gM1_1, M1_1




Gui, Add, Button, x84 y60 w40 h105 gK7_1, K7_1
Gui, Add, Button, y+4 w40 h105 gK7_2, K7_2


Gui, Add, Button, x+20 y60 w30 h185 gK6_1, K6_1
Gui, Add, Button, x+4  w30 h185 gK6_2, K6_2
Gui, Add, Button, x+4  w30 h185 gK6_3, K6_3
Gui, Add, Button, x+4  w30 h185 gK6_4, K6_4

Gui, Add, Button, x+4  w30 h185 gK6_5, K6_5
Gui, Add, Button, x+8  w30 h185 gK6_5, K6_5

Gui, Add, Button, x+4 y60 w30 h185 gK5_4, K5_4
Gui, Add, Button, x+4 w30 h185 gK5_3, K5_3
Gui, Add, Button, x+4 w30 h185 gK5_2, K5_2
Gui, Add, Button, x+4 w30 h185 gK5_1, K5_1

Gui, Add, Button, x+20 y60 w30 h185 gK4_1, K4_1
Gui, Add, Button, x+4 w30 h185 gK4_2, K4_2
Gui, Add, Button, x+4 w30 h185 gK4_3, K4_3
Gui, Add, Button, x+4 w30 h185 gK4_4, K4_4

Gui, Add, Button, x+4 w30 h185 gK4_5, K4_5
Gui, Add, Button, x+8 w30 h185 gK4_5, K4_5

Gui, Add, Button, x+4 y60 w30 h185 gK3_4, K3_4
Gui, Add, Button, x+4 w30 h185 gK3_3, K3_3
Gui, Add, Button, x+4 w30 h185 gK3_2, K3_2
Gui, Add, Button, x+4 w30 h185 gK3_1, K3_1

Gui, Add, Button, x+20 y60 w30 h185 gK2_1, K2_1
Gui, Add, Button, x+4 w30 h185 gK2_2, K2_2
Gui, Add, Button, x+4 w30 h185 gK2_3, K2_3
Gui, Add, Button, x+4 w30 h185 gK2_4, K2_4

Gui, Add, Button, x+4 w232 w30 h185 gK2_5, K2_5
Gui, Add, Button, x+8 w232 w30 h185 gK2_5, K2_5

Gui, Add, Button, x+4 y60 w30 h185 gK1_4, K1_4
Gui, Add, Button, x+4  w30 h185 gK1_3, K1_3
Gui, Add, Button, x+4   w30 h185 gK1_2, K1_2
Gui, Add, Button, x+4   w30 h185 gK1_1, K1_1



Gui, Add, Button, x144 y250 w340 h25 gK6_0, K6_0
Gui, Add, Button, x504 y254 w340 h25 gK4_0, K4_0
Gui, Add, Button, x864 y254 w340 h25 gK2_0, K2_0






;~ 472, 392

Gui, Add, Button, x370 y350	 w202 h30 gJ3_1, J3_1
Gui, Add, Button,  y+4 w202 h30 gJ3_1, J3_1
Gui, Add, Button,  y+4 w202 h30 gJ3_1, J3_1
Gui, Add, Button,  y+4 w202 h30 gJ3_1, J3_1
Gui, Add, Button,  y+4 w202 h30 gJ3_1, J3_1
Gui, Add, Button,  y+4 w202 h30 gJ3_1, J3_1
Gui, Add, Button, x370 y+4 w30 h100 gJ1_1, J1_1
Gui, Add, Button, x+4 w30 h100 gJ2_1, J2_1
Gui, Add, Button, x+4 w30 h100 gJ2_1, J2_1
Gui, Add, Button, x+8 w30 h100 gJ2_1, J2_1
Gui, Add, Button, x+4 w30 h100 gJ2_1, J2_1
Gui, Add, Button, x+4 w30 h100 gJ2_1, J2_1
Gui, Add, Button, x370 y+4 w202 h30 gJ1_1, J1_1

;~ 749,

Gui, Add, Button, x640 y350  w45 h110 gI3_1, I3_1
Gui, Add, Button, x+4 w45 h110 gI3_1, I3_1
Gui, Add, Button, x+4 w45 h110 gI3_1, I3_1
Gui, Add, Button, x640 y+4  w45 h110 gI2_1, I2_1
Gui, Add, Button, x+4 w45 h110 gI2_1, I2_1
Gui, Add, Button, x+4 w45 h110 gI2_1, I2_1
Gui, Add, Button, x640 y+4  w45 h110 gI1_1, I1_1
Gui, Add, Button, x+4  w45 h110 gI1_1, I1_1
Gui, Add, Button, x+4  w45 h110 gI1_1, I1_1









Gui, Tab, 로케이션[외부마당],,Exact


Gui, Add, GroupBox, x547 y9 w800 h695 , [창고 2D 평면도]


Gui, Font, S10 CBLUE W600, Malgun Gothic





Gui, Color, FFFFFF
Gui, Add, Picture, x590 y50 w482 h246 v2divi5, %A_ScriptDir%\창고.png



Gui, Add, Picture, x590 y440 w306 h60 v2divi1, %A_ScriptDir%\divi.png
Gui, Add, GroupBox, x590 y430 w306 h70 , < 4 번 천막 >

Gui, Add, Picture, x590 y310 w234 h60 v2divi2, %A_ScriptDir%\divi.png
Gui, Add, GroupBox, x590 y300 w234 h70 , < 3 번 천막 >

Gui, Add, Picture, x880 y310 w224 h60 v2divi3, %A_ScriptDir%\divi.png
Gui, Add, GroupBox, x880 y300 w224 h70 , < 2 번 천막 >

Gui, Add, Picture, x1110 y40 w90 h270 v2divi4, %A_ScriptDir%\divi.png
Gui, Add, GroupBox, x1110 y30 w90 h280 , < 1 번 천막 >
Gui, Add, Picture, x610 y435 w0 h0 v3color1, %A_ScriptDir%\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x610 y435 w0 h0 v3color2, %A_ScriptDir%\blue.png
Gui, Add, Picture, x610 y435 w0 h0 v3color3, %A_ScriptDir%\colour1.png
Gui, Add, Picture, x610 y435 w0 h0 v3color4, %A_ScriptDir%\colour2.png
Gui, Add, Picture, x610 y435 w0 h0 v3color5, %A_ScriptDir%\colour3.png
Gui, Add, Picture, x610 y435 w0 h0 v3color6, %A_ScriptDir%\colour4.png
Gui, Add, Picture, x610 y435 w0 h0 v3color7, %A_ScriptDir%\colour5.png
Gui, Add, Picture, x610 y435 w0 h0 v3color8, %A_ScriptDir%\colour6.png
Gui, Add, Picture, x610 y435 w0 h0 v3color9, %A_ScriptDir%\colour7.png



Gui, Font, S8 Cblack W400, Malgun Gothic


Gui, Add, Button, x600 y320 w70 h40 gN5_1, N5_1
Gui, Add, Button, x+2 w70 h40 gN4_1, N4_1
Gui, Add, Button, x+2 w70 h40 gN3_1, N3_1

Gui, Add, Button, x+74 w70 h40 gN2_1, N2_1
Gui, Add, Button, x+2 w70 h40 gN1_1, N1_1
Gui, Add, Button, x+22 w40 h40 gM1_1, M1_1



Gui, Add, Button, x600 y450 w70 h40 gO4_1, O4_1
Gui, Add, Button, x+2 w70 h40 gO3_1, O3_1
Gui, Add, Button, x+2 w70 h40 gO2_1, O2_1
Gui, Add, Button, x+2 w70 h40 gO1_1, O1_1





Gui, Add, Button, x1120 y50 w70 h40  gP6_1, P6_1
Gui, Add, Button, y+2 w70 h40 gP5_1, P5_1
Gui, Add, Button, y+2 w70 h40 gP4_1, P4_1
Gui, Add, Button, y+2 w70 h40 gP3_1, P3_1
Gui, Add, Button, y+2 w70 h40 gP2_1, P2_1
Gui, Add, Button, y+2 w70 h40 gP1_1, P1_1


Gui, Tab, `      EDSM`       ,,


/*

	workdir = \\192.168.0.1\hdd2\일정표 최근\일정표220730
    FormatTime, edsmtoday, YYYYMMDDHH, yyyy-MM-dd
    상태 = EDSM_체크리스트
    ;~ edsmtoday = 2023-08-01



    containr = % workdir "\일일재고관리\A" edsmtoday "_B체크 중.CSV"

;~ MsgBox, % containr
    if FileExist(containr)
    {

    FileRead, dataedsm, %containr%
        if not ErrorLevel  ; 성공적으로 적재됨.
        {
            ;~ ; SoundPlay, %A_WorkingDir%\sound\soundopen.mp3
        }
        else
        {
            ; SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
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



Gui, Font, S15 CDefault W400 c0xFF2211, Malgun Gothic
;~ gui, Add, progress, smooth y+10 w730 h35 cCCCCFF vPG2, 0
Gui, Add, button, x+0 y+10 w90 h30 c0xFF2211 v저장save g저장save, 저장
Gui, Add, button, x+0 w90 h30 c0xFF2211 v상태close g상태close, 닫기
Gui, Font, S14 CDefault W400, Malgun Gothic
Gui, Add, ListView,  x550 y+10 w785 h420 grid vLVedsm1 gLVedsm1 hwndHLVedsm1 -ReadOnly WantF2 -Multi NoSortHdr, 첵|상품코드|품명|규격|단위|현재고


    ;~ GuiControl,, PG, +10



;~ Gui, Font, S13 CDefault W400 c0xFF2211, Malgun Gothic


;~ GUI, Show, x820 y0, %상태%



Gui, ListView, LVedsm1
LV_ModifyCol(1, 40)
LV_ModifyCol(2, 120)
LV_ModifyCol(3, 220)
LV_ModifyCol(4, 220)
LV_ModifyCol(5, 60)
LV_ModifyCol(6, "70 Integer" "Integer Right")




loop, parse, dataedsm, `n
{
	x:=[]
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	LV_Add("", x*)
}



*/
;~ : 	y:

;~ Gui, Show, x100 y100 w1366 h730, %WINTITLE%
Gui, Show, x1282 y0 w1280 h730, %WINTITLE%
;~ Gui, Add, GroupBox, x315 y357 w74 h29,  ;;;;;;;;;;;;;;;;;;;;;
 ;~ x317 y389 w70 h25

;~ IniRead, projects, 신흥목재재고파악수정.ini
GoSub, UpdatePresetList
return







;~ 상품검색|||||


tabname:
Gui, submit, nohide
Sleep, 10
if (tabname = "상품검색"){
}

else if (tabname = "로케이션[창고내부]"){
gosub, mapping


            GuiControl, Choose, tabname, 2

}

else if (tabname = "로케이션[창고철물]"){
gosub, mapping
            GuiControl, Choose, tabname, 3
}

else if (tabname = "로케이션[외부마당]"){
gosub, mapping
            GuiControl, Choose, tabname, 4
}

else if (tabname = "`      EDSM`       "){
}

else
{
	;~ Gui, submit, nohide
}
;~ gui, restore
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
return
}






num1:
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



	workdir = \\192.168.0.1\hdd2\일정표 최근\일정표220730
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
            ;~ ; SoundPlay, %A_WorkingDir%\sound\soundopen.mp3
        }
        else
        {
            ; SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
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

;~ ; SoundPlay, %A_WorkingDir%\sound\열때.mp3
Gui, %상태%:Destroy
Gui, %상태%:Default
Gui, %상태%:-SysMenu
Gui, %상태%:+alwaysontop
Gui, Submit, NoHide

Gui, %상태%:Font, S19 CDefault W400 c0xFF2211, Malgun Gothic
;~ gui, %상태%:Add, progress, smooth y+10 w730 h35 cCCCCFF vPG2, 0
Gui, %상태%:Add, button, x545 y5 w90 h40 c0xFF2211 v저장save g저장save, 저장
Gui, %상태%:Add, button, x640 y5 w90 h40 c0xFF2211 v상태close g상태close, 닫기
Gui, %상태%:Font, S16 CDefault W400, Malgun Gothic
Gui, %상태%:Add, ListView, x10 y+10 w730 h463 grid vLVedsm1 gLVedsm1 hwndHLVedsm1 -ReadOnly WantF2 -Multi NoSortHdr, 첵|상품코드|품명|규격|단위|현재고


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

    containr1 = % workdir "\일일재고관리\삭제\A" edsmtoday "_B체크 중.CSV"



FileMove, %containr%, %containr1%, 1
	if errorlevel = 1
	{
		Sleep, 200
		gosub, 저장save
	}
	else
	{
		Sleep, 200
	}
FileDelete, %containr%
FileDelete, %containr%
FileDelete, %containr%





Sleep, 200



makefile:
Gui, ListView, LVedsm1
loop, % LV_GetCount() {

	RowNum := A_Index

	loop, 6
		LV_GetText(col%A_Index% , RowNum, a_index)
	FileAppend, % col1 "," col2 "," col3 "," col4 "," col5 "," col6 ", `n", % A_MyDocuments "\A" edsmtoday "_B체크 중.CSV"
	Sleep, 1
    }
	if erorrlevel = 0
	{
		Sleep, 500
		gosub, makefile
	}
	else
	{
		Sleep, 500
	}


		FileMove, % A_MyDocuments "\A" edsmtoday "_B체크 중.CSV", % containr, 1
		Sleep, 200
		; SoundPlay, %A_WorkingDir%\sound\1.mp3
		CSV_Load(containr, "rootcsv")
		CSV_Save(containr, "rootcsv", 1)


Sleep, 100
; SoundPlay, %A_WorkingDir%\sound\1.mp3
MsgBox, 262192, 알림, 저장 완료됐습니다, 0.8


return
}



상태close:
{
    WinKill, %상태%
    Sleep, 1000
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
                MsgBox,,,조회완료,1
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
MsgBox,,,공카드 입니다,1
ToolTip
                ;~ gosub, SavePreset
return




LVedsm1:

Gui, ListView, lvedsm1
    gui, submit, nohide
if (A_GuiEvent = "DoubleClick")
{
; SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
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

}

OnMessage(0x44, "WM_COMMNOTIFY") ; msg박스 관련된 함수( 버튼이름 바꾸기)
MsgBox, 262147, RFID, 선택 해주세요:
IfMsgBox, YES
{


    ;~ winkill, 체크박스
    Loop, parse, projects, `n ;shows sections
    {
    sect := A_LoopField
    IniRead, status, 신흥목재재고파악수정.ini, %sect%, 상품코드, %A_Space%

        if (OutputVarC = status){
        ControlSend, Edit1, {ctrl Down}a{ctrl Up}%sect%, %WINTITLE%
        Sleep, 100
        ;~ ControlSend, Edit1, {End}{Space}{Backspace}, %WINTITLE%
        ;~ ControlSend, ChooseString, frmSAVEDPRESET, %sect%
        Sleep, 100
        break
        }
        else
        {
        }
    }
    gosub, 판별기


;~ WinSet, AlwaysOnTop , On, %상태%
return
}

else IfMsgBox, NO

{
    ;~ winkill, 체크박스
    WinWait, %WINTITLE%,
    IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
    WinWaitActive, %WINTITLE%
    ; SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
    Sleep, 100
    Send, {F2}
    Sleep, 100
    Send, ◎{ENTER}
    Sleep, 100



    ;~ gosub, EDSM색상


return
}
else

{
    ;~ winkill, 체크박스
    ;~ WinActivate, %상태%
        WinWait, %WINTITLE%,
        IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
        WinWaitActive, %WINTITLE%
    ; SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
    Sleep, 100
    Send, {F2}
    Sleep, 100
    SEND, {del 5}{Backspace 5}{ENTER}
    Sleep, 100
    ;~ gosub, EDSM색상
WinKill, RFID
    ;~ WinSet, AlwaysOnTop , On, %상태%
return

}




return












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
	Gui, Submit, NoHide
LVArray := []
Gui, 2:Add, Text, ,Search:
Gui, 2:Add, Edit, w400 vSearchTerm g2Search
;~ Gui, 2:Add, Edit, y+0 h1 w400 vSearchTerm v2Search2
Gui, 2:Add, ListView, grid NoSortHdr r20 w400 vLVsearch gLVsearch, 코드_____상품/규격| dmdm?
Gui, 2:ListView, LVsearch ; 출고 끝

Loop, parse, projects, `n ;shows sections
{
    sect := A_LoopField
    IniRead, company, 신흥목재재고파악수정.ini, % sect, 상품명, %A_Space%
    IniRead, remarks, 신흥목재재고파악수정.ini, % sect, 규격, %A_Space%
    IniRead, keys, 신흥목재재고파악수정.ini, % sect
    feild := sect "_____" company "/" remarks

   LV_Add("", feild,remarks)
   LVArray.Push(feild)
}

TotalItems := LVArray.Length()
LV_ModifyCol()
Gui, 2:Add, StatusBar, , % "   " . TotalItems . " of " . TotalItems . " Items"
Gui, 2:Show, , 상품/규격 검색
Return


2Search:

GuiControlGet, SearchTerm
GuiControl, -Redraw, LVsearch
LV_Delete()



For Each, FileName In LVArray
{
   If (SearchTerm != "")
   {

      ;~ If (InStr(FileName, SearchTerm) = 1) ; for matching at the start
      If InStr(FileName, SearchTerm) ; for overall matching
            ;~ FileName := sect feild
         LV_Add("", FileName, company)
   }
   Else
      LV_Add("", FileName, company)
}
Items := LV_GetCount()
SB_SetText("   " . Items . " 중에 " . TotalItems . " 총갯수")
GuiControl, +Redraw, LVsearch
Return


change:
{
    Winwait, 신흥목재 전산프로그램,
    IfWinNotActive, 신흥목재 전산프로그램,, WinActivate, 신흥목재 전산프로그램,
    WinWaitActive, 신흥목재 전산프로그램,
}
return


키보드:
{
    Run, osk.exe
}
return



LVsearch:
{
    GUI, SUBMIT, NOHIDE
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
	LV_GetText(OutputVar, selectRowNum)
    RegExMatch(OutputVar, "(.*)_____(.*)" , 1output)
;~ MsgBox, %1output1%
	Sleep, 100
    WinClose, 상품/규격 검색
            WinWait, %WINTITLE%
        IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
        WinWaitActive, %WINTITLE%,
    Sleep, 100
;~ ControlSetText, edit1, , %WINTITLE%
    ;~ Sleep, 100
    Control, ChooseString, %1output1%, combobox1, %WINTITLE%
    ;~ MsgBox, % 1output1
    ;~ GuiControl, choosestring, frmSAVEDPRESET, %1output1%
;~ ControlSetText, edit1, %1output1%, %WINTITLE%
    Sleep, 100



;~ ControlSend, edit1, {End}{home}{End}, %WINTITLE%
;~ ControlSend, edit1, {Tab}{shift down}{tab}{shift up}{Space}, %WINTITLE%
;~ MsgBox, %1output1%


;~ gosub, PresetChange
;~ GuiControl, ChooseString, frmSAVEDPRESET, %1output1%
;~ ControlSetText, %1output1%, frmSAVEDPRESET, WMS_VER2 2.0
;~ ControlSend, Edit1, {space},  WMS_VER2 2.0
;~ Sleep, 100

;~ gosub, mapping
    }
;~ ; SoundPlay, %A_ScriptDir%\sound\sound1_1.mp3
;~ gosub, READINFORMATION
;~ ; SoundPlay, %A_ScriptDir%\sound\sound9_2.mp3
;~ gosub, 판별기
;~ GuiControl, focus, 실낱장
; SoundPlay, %A_ScriptDir%\sound\sound2_2 (1).mp3
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
GuiControl, focus, 실낱장
}
return




delrfid:
{
; SoundPlay, %A_ScriptDir%\sound\sound3_1.mp3

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
arr := [2, 3, 4, 5, 6 ,7 ,8 ,9]

;~ MsgBox, 하이
Loop, 8
{
    findrfid1 = % arr[A_Index] "RFID1"
    findrfid2 = % arr[A_Index] "RFID2"
    findrfid3 = % arr[A_Index] "RFID3"
;~ MsgBox, % %findrfid1% %findrfid2% %findrfid3%

    if ( %findrfid1% = MyString){
        GuiControl, , %findrfid1%,
        GuiControl, , %findrfid2%,
        GuiControl, , %findrfid3%,
        GuiControl, , RFIDREAD4,
        ;~ MsgBox, 감지됨
        break
    }
    else
    {
                ;~ MsgBox, 없음
    }
}
    arr =
    arr := [2, 3, 4, 5, 6 ,7 ,8 ,9]

    Loop, 8
    {
        Loop,8
        {
            ;~ MsgBox, % arr[A_Index]
            findrfid1 = % arr[A_Index] "RFID1"
            findrfid2 = % arr[A_Index] "RFID2"
            findrfid3 = % arr[A_Index] "RFID3"
            ;~ arr[A_Index] - 1
            N_INDEX := A_Index + 1
            ;~ MsgBox, %N_INDEX%
            moverfid1 = % arr[N_INDEX] "RFID1"
            moverfid2 = % arr[N_INDEX] "RFID2"
            moverfid3 = % arr[N_INDEX] "RFID3"
        ;~ MsgBox, % arr[A_Index] "/" %findrfid1% "/" %findrfid2% "/" %findrfid3% "/" findrfid1 "/" findrfid2 "/" findrfid3
        ;~ MsgBox, % "-" arr[N_INDEX] "/" %moverfid1% "/" %moverfid2% "/" %moverfid3% "/" moverfid1 "/" moverfid2 "/" moverfid3


                if (%findrfid1% = "") && (%findrfid2% = "") {

                    GuiControl, , %findrfid1%, % %moverfid1%
                    GuiControl, , %findrfid2%, % %moverfid2%
                    GuiControl, , %findrfid3%, % %moverfid3%
                    GUI, SUBMIT, NOHIDE
                    GuiControl, , %moverfid1%,
                    GuiControl, , %moverfid2%,
                    GuiControl, , %moverfid3%,


                }
                else
                {
                }

        }
    }
}

; SoundPlay, %A_ScriptDir%\sound\sound9_2.mp3
return




판별기:

{
    GuiControl,, PG, +15
gui, submit, nohide

;~ XLS_file_path1 := % A_ScriptDir "\어제판매리스트.xlsx"
;~ 1xl := ComObjCreate("Excel.Application")
;~ GuiControl,, PG, +15
;~ 1xl.Workbooks.Open(XLS_file_path1)
;~ 11xl := 1xl.Workbooks.Open(XLS_file_path1, 3, 0)
;~ 1xl.Visible:=false
;~ GuiControl,, PG, +15
;~ 1xl := 1xl.Sheets("Sheet1")
;~ GuiControl,, PG, +15

;~ XLS_file_path2 := % A_ScriptDir "\오늘미래판매리스트.xlsx"
;~ 2xl := ComObjCreate("Excel.Application")
;~ GuiControl,, PG, +15
;~ 2xl.Workbooks.Open(XLS_file_path2)
;~ 22xl := 2xl.Workbooks.Open(XLS_file_path2, 3, 0)
;~ 2xl.Visible:=false
;~ GuiControl,, PG, +15
;~ 2xl := 2xl.Sheets("Sheet1")

;~ 상품코드 = D020006

;~ R = 2
;~ 1FoundCell := 1xl.Range("R" R).value
;~ 1pdtCell := 1xl.Range("A" R).value
;endCol := 2xl.UsedRange.Columns.Count
2FoundCell := 2xl.Range("R:R").Find(상품코드)

;2FoundCell := 2xl.Range("R:R").Find(1FoundCell)
if(2FoundCell = "" )
{
    MsgBox, ,,%상품명% 중복 X, 1
    GuiControl, enable, bcaledit
    GuiControl, enable, bcallast
        SB_SetText(frmSAVEDPRESET 상품명 " 수정 하셔도 됩니다")
;~ ; SoundPlay, %A_ScriptDir%\sound\sound9_2.mp3

GuiControl, Move, colorbutton, x450 y387 w69 h29
;~ Gui, Add, Button, x452 y389 w65 h25 gbcallast, 낱장역계산
;~ Sleep, 3000
    ; SoundPlay, %A_ScriptDir%\sound\sound1_3.mp3
}
else
{
    MsgBox, ,,%상품명% 중복 0, 1
    GuiControl, disable, bcaledit
    GuiControl, disable, bcallast
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
XLS_file_path1 := % A_WorkingDir "\어제자판매리스트.xlsx"
1xl := ComObjCreate("Excel.Application")
1xl.Workbooks.Open(XLS_file_path1)
11xl := 1xl.Workbooks.Open(XLS_file_path1, 3, 0)
1xl.Visible:=false
1xl := 1xl.Sheets("Sheet1")

XLS_file_path2 := % A_WorkingDir "\오늘미래판매리스트.xlsx"
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


bcaledit:
{
gosub, bcaledit1
}
return

bcaledit1:
{

MsgBox, %HLVedsm1%


; SoundPlay, %A_ScriptDir%\sound\sound2_1.mp3
Gui, submit, nohide
수정재고 := 실합계 + 매출수량 - 반입수량 + 매입수량 - 반출수량
GuiControl, , 수정값, %수정재고%


Gui, submit, nohide

    Winwait, ahk_exe JedaeroM.exe
    IfWinNotActive, ahk_exe JedaeroM.exe,
    WinActivate, ahk_exe JedaeroM.exe

    Sleep, 1000
    ControlClick, x21 y39, ahk_exe JedaeroM.exe


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
    ControlSend, TRzEdit2, %상품코드%{Enter}, ahk_class TfmMain
sleep, 20
ControlClick, TRzPanel4, ahk_class TfmMain, , , , x257 y10
    Sleep, 1000
GuiControl,, PG, +10

    Winwait, ahk_class TfmMain,
    IfWinNotActive, ahk_class TfmMain, WinActivate, ahk_class TfmMain,
    WinWaitActive, ahk_class TfmMain
    Sleep, 1000

;~ MsgBox, %수정재고%

;~ ControlSend, TDBGridEh1, {f2}, ahk_class TfmMain
;~ Sleep, 100
;~ ControlSend, TDBGridEh1, %수정재고%{Right}, ahk_class TfmMain
    ;~ ControlSend, TDBGridEh1, %수정재고%{ENTER}, ahk_class TfmMain
    ;~ Sleep, 500
    send, {f2}%수정재고%{ENTER}
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
        Sleep, 200
    controlsend, , {enter}, ahk_class TMessageForm
        Sleep, 200
    controlclick, TAdvToolBar3, ahk_class TfmMain, , , , x40 y14
GuiControl,, PG, +10
GuiControl,, PG, 0
    SB_SetText(frmSAVEDPRESET " 재고 수량 수정 완료")
; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3
GuiControl, Move, colorbutton, x464 y387 w61 h29


Sleep, 100

    WinWaitActive, %WINTITLE%
        Sleep, 200

;~ GuiControl, Focus, 실낱장


    GuiControl, Choose, tabname, 3

;~ Gui, Submit, NoHide
Gui, ListView, LVedsm1

    ;~ GuiControl, Focus, %HLVedsm1%
        ;~ winkill, 체크박스
    ;~ WinWait, %WINTITLE%,
    ;~ IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
    ;~ WinWaitActive, %WINTITLE%
    ;~ ; SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
    Sleep, 100
    Send, {F2}
    Sleep, 100
    Send, ◎{ENTER}
    Sleep, 100



return


}




bcallast:
{
Gui, submit, nohide
cal실합계 := 전산밴딩 + 실낱장
;~ MsgBox, %실낱장%`n%전산밴딩%`n%cal실합계%
GuiControl, , 실합계, %cal실합계%
GuiControl, Move, colorbutton, x350 y387 w61 h29
GuiControl, enable, bcaledit
Sleep, 100
return
}









b전산밴딩:
{
Gui, submit, nohide
    jsbd = 1

Loop, 8
{
    jsbd ++
    if (%jsbd%RFID3=""){
        %jsbd%RFID3 = 0
    }
    else
    {
    }
}




e전산밴딩 := 2RFID3 + 3RFID3 + 4RFID3 + 5RFID3 + 6RFID3 + 7RFID3 + 8RFID3 + 9RFID3
GuiControl, , 전산밴딩, %e전산밴딩%
e전산낱장 := 현재수량 - e전산밴딩
GuiControl, , 전산낱장, %e전산낱장%
}
return




;~ b전산낱장:
;~ {
;~ Gui, submit, nohide


;~ }
;~ return



b1RFID3:
gosub, b전산밴딩
return

b2RFID3:
gosub, b전산밴딩
return
b3RFID3:
gosub, b전산밴딩
return
b4RFID3:
gosub, b전산밴딩
return
b5RFID3:
gosub, b전산밴딩
return
b6RFID3:
gosub, b전산밴딩
return
b7RFID3:
gosub, b전산밴딩
return
b8RFID3:
gosub, b전산밴딩
return
b9RFID3:
gosub, b전산밴딩
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
    GuiControl, enable, bcaledit
    GuiControl, enable, bcallast

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
gosub, b전산밴딩
;~ gosub, b전산낱장



return




refridread:
리딩확인=
gosub, 리더기2

return
refridread2:
리딩확인=1
gosub, 리더기2

return
refridread3:
리딩확인=1
gosub, 리더기2
return
refridread4:
리딩확인=1
gosub, 리더기2
return
refridread5:
리딩확인=1
gosub, 리더기2
return
refridread6:
리딩확인=1
gosub, 리더기2
return
refridread7:
리딩확인=1
gosub, 리더기2
return
refridread8:
리딩확인=1
gosub, 리더기2
return
refridread9:
리딩확인=1
gosub, 리더기2
return

리더기2:
; SoundPlay, %A_ScriptDir%\sound\sound3_1.mp3
ToolTip, 시작
        GuiControl, , RFIDREAD3,
        Sleep,10
        GuiControl, , RFIDREAD2,
        Sleep,10
        GuiControl, , RFIDREAD1,
        Sleep,10
GuiControlGet, refridread, FocusV

        renumber := RegExReplace(refridread, "R", "")
        ;~ MsgBox, % renumber
WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 화면 선택(E)
Sleep,100
clipboard :=
WinMenuSelectItem, ahk_exe ttermpro.exe, , 수정(E), 복사(C)
Sleep,100
;~ ClipWait, 100

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
            if (리딩확인="1")
            {
                Loop, % Rows
                {
                    foundread:=CSV_Search("data1",RFIDREAD2,A_Index)
                    if foundread=0
                        break
                        rfidcheck = 1
                        MsgBox, 262196, 중복 발견 , 이전에 기록된 정보가 있습니다`n이전 기록으로 가시겠습니까?,

                        {
                            IfMsgBox Yes
                            {
                                MsgBox, 262196, 카드 초기화, 이전 기록있는 라인을 삭제해주세요
                                {
                                    IfMsgBox Yes
                                    {
                                        ;~ MsgBox, % RFIDREAD2
                                        gosub, PresetChange
                                        return
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
            else
            {
            }
            if (renumber="1"){
                SetKeyDelay, 1
                GuiControl, Choose, tabname, 1
                ControlSend, combobox1, {Del 10}{Backspace 10}%RFIDREAD2%, %WINTITLE%
                SetKeyDelay, 2
            }

            else
            {

                GuiControl, , %renumber%RFID1, %RFIDREAD2%
            }





            Sleep, 100
            GuiControl, , RFIDREAD3,
            Sleep,10
            GuiControl, , RFIDREAD2,
            Sleep,10
            GuiControl, , RFIDREAD1,
            Sleep,10
            gosub, mapping
        }
    ; SoundPlay, %A_ScriptDir%\sound\sound1_3.mp3

}
    clipboard :=
    rfidcheck =
    리딩확인 =

return


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
	LV_GetText(lvvar, selectRowNum)
	Sleep, 100
}
;~ MsgBox, % lvvar

SetKeyDelay, 1
            GuiControl, Choose, tabname, 1
    ControlSend, combobox1, {Del 10}{Backspace 10}%lvvar%, %WINTITLE%


SetKeyDelay, 2




/*
    Loop, parse, projects, `n ;shows sections
    {
        sect := A_LoopField
        IniRead, keys, 신흥목재재고파악수정.ini, % sect
        IniRead, status, 신흥목재재고파악수정.ini, % sect, 상품코드, %A_Space%

        if (status = OutputVar)
        {
        ControlSend, Edit1, %sect%, %WINTITLE%
        Sleep, 100
        GuiControl, ChooseString, frmSAVEDPRESET, %sect%
        Sleep, 10
        ;~ ControlSend, Edit1, {Del 10}{Backspace 10}, %WINTITLE%
        ;~ Sleep, 100

        ;~ ControlFocus, Edit1, %WINTITLE%
        ;~ Send, {End}{Space}{Backspace}

        Sleep, 100

        ;~ GuiControl, ChooseString, frmSAVEDPRESET, %sect%














            gosub, mapping
            gosub, 판별기
            break

















        }
        else
        {
        }
    }
    */


return





B8_1:
GuiControl, , showlocation, B8_1

gosub, LVlocation
return





LVlocation:
{
;~ if(연다 = "1")
    ;~ {
        Gui, submit, nohide

        GuiControlGet, showloc, , showlocation
        showloc:=StrSplit(showloc,"_")
        showloc:=showloc[1] "-" showloc[2]


        ;~ MsgBox, % showloc
        GuiControl, -Redraw, %HLV1%
        Gui, Listview, LV1
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
        ;~ r28:=CSV_ReadCell("data1",found[1],28) ; 비고

            LV_Add("", r1, r2, r29, r30, r3, r31)

            ;~ 로케이션|상품명|규격|수량|PRODUCT CODE|RFID CODE|


		;~ MsgBox % found[1] "`n" found[2] "`n" showloc "`n""`n""`n r1" r1 "`n r2"  r2 "`n r3"  r3 "`n r0"  r0
	}




/*
        GuiControl,, PG, 5
        GuiControl, Move, color1, x10 y10 w0 h0
        GuiControl, Move, color2, x10 y10 w0 h0
        GuiControl, Move, color3, x10 y10 w0 h0
        GuiControl, Move, color4, x10 y10 w0 h0
        GuiControl, Move, color5, x10 y10 w0 h0
        GuiControl, Move, color6, x10 y10 w0 h0
        GuiControl, Move, color7, x10 y10 w0 h0
        GuiControl, Move, color8, x10 y10 w0 h0
        GuiControl, Move, color9, x10 y10 w0 h0

        Sleep, 100



        GuiControlGet, 쇼로케이션, , showlocation
        GuiControl, disable, LV1
        Gui, Listview, LV1
        LV_Delete()
        Loop,A_LoopField
          LV_Add("", x*)
          WH = 0



        Loop, parse, projects, `n ;shows sections
        {
            WH++
            arr := [1, 2, 3, 4, 5, 6, 7, 8, 9]
            IniRead, status, 신흥목재재고파악수정.ini, %sect%, % arr[A_index] "RFID1", %A_Space%

            ;~ IniRead, OutputVar, Filename, Section, Key , Default
            sect := A_LoopField
            IniRead, keys, 신흥목재재고파악수정.ini, % sect
            IniRead, company, 신흥목재재고파악수정.ini, % sect, 상품명, %A_Space%
            IniRead, remarks, 신흥목재재고파악수정.ini, % sect, 규격, %A_Space%
            IniRead, status, 신흥목재재고파악수정.ini, % sect, 상품코드, %A_Space%
            IniRead, 2RFID2, 신흥목재재고파악수정.ini, % sect, 2RFID2, %A_Space%
            IniRead, 3RFID2, 신흥목재재고파악수정.ini, % sect, 3RFID2, %A_Space%
            IniRead, 4RFID2, 신흥목재재고파악수정.ini, % sect, 4RFID2, %A_Space%
            IniRead, 5RFID2, 신흥목재재고파악수정.ini, % sect, 5RFID2, %A_Space%
            IniRead, 6RFID2, 신흥목재재고파악수정.ini, % sect, 6RFID2, %A_Space%
            IniRead, 7RFID2, 신흥목재재고파악수정.ini, % sect, 7RFID2, %A_Space%
            IniRead, 8RFID2, 신흥목재재고파악수정.ini, % sect, 8RFID2, %A_Space%
            IniRead, 9RFID2, 신흥목재재고파악수정.ini, % sect, 9RFID2, %A_Space%
            IniRead, 1RFID1, 신흥목재재고파악수정.ini, % sect, 1RFID1, %A_Space%
            IniRead, 1RFID2, 신흥목재재고파악수정.ini, % sect, 1RFID2, %A_Space%
            IniRead, 1RFID3, 신흥목재재고파악수정.ini, % sect, 1RFID3, %A_Space%
            IniRead, 1RFID4, 신흥목재재고파악수정.ini, % sect, 1RFID4, %A_Space%

            IniRead, 2RFID3, 신흥목재재고파악수정.ini, % sect, 2RFID3, %A_Space%
            IniRead, 3RFID3, 신흥목재재고파악수정.ini, % sect, 3RFID3, %A_Space%
            IniRead, 4RFID3, 신흥목재재고파악수정.ini, % sect, 4RFID3, %A_Space%
            IniRead, 5RFID3, 신흥목재재고파악수정.ini, % sect, 5RFID3, %A_Space%
            IniRead, 6RFID3, 신흥목재재고파악수정.ini, % sect, 6RFID3, %A_Space%
            IniRead, 7RFID3, 신흥목재재고파악수정.ini, % sect, 7RFID3, %A_Space%
            IniRead, 8RFID3, 신흥목재재고파악수정.ini, % sect, 8RFID3, %A_Space%
            IniRead, 9RFID3, 신흥목재재고파악수정.ini, % sect, 9RFID3, %A_Space%







            RegExMatch(2RFID2, "(.*)-(.*)-(.*)" , RFIDLOCA2)
            RegExMatch(3RFID2, "(.*)-(.*)-(.*)" , RFIDLOCA3)
            RegExMatch(4RFID2, "(.*)-(.*)-(.*)" , RFIDLOCA4)
            RegExMatch(5RFID2, "(.*)-(.*)-(.*)" , RFIDLOCA5)
            RegExMatch(6RFID2, "(.*)-(.*)-(.*)" , RFIDLOCA6)
            RegExMatch(7RFID2, "(.*)-(.*)-(.*)" , RFIDLOCA7)
            RegExMatch(8RFID2, "(.*)-(.*)-(.*)" , RFIDLOCA8)
            RegExMatch(9RFID2, "(.*)-(.*)-(.*)" , RFIDLOCA9)
        ;~ MsgBox, %2RFID2%`n%3RFID2%`n%4RFID2%`n%5RFID2%`n%6RFID2%`n%7RFID2%`n%8RFID2%`n%9RFID2%

            RegExMatch(쇼로케이션, "(.*)_(.*)" , 쇼1로케이션)
            쇼2로케이션 = % 쇼1로케이션1 "-" 쇼1로케이션2
            1쇼로케이션 = % 쇼2로케이션 "-1"
            2쇼로케이션 = % 쇼2로케이션 "-2"
            3쇼로케이션 = % 쇼2로케이션 "-3"
            4쇼로케이션 = % 쇼2로케이션 "-4"
            5쇼로케이션 = % 쇼2로케이션 "-5"
            6쇼로케이션 = % 쇼2로케이션 "-6"
            7쇼로케이션 = % 쇼2로케이션 "-7"
            8쇼로케이션 = % 쇼2로케이션 "-8"
            9쇼로케이션 = % 쇼2로케이션 "-9"
            10쇼로케이션 = % 쇼2로케이션 "-10"
            11쇼로케이션 = % 쇼2로케이션 "-11"
            12쇼로케이션 = % 쇼2로케이션 "-12"
            13쇼로케이션 = % 쇼2로케이션 "-13"

        ;~ MsgBox, %2RFID2%
            ;~ 1RFID0 = % 1RFID1 1RFID2 "-" 1RFID3
            1RFID00 = % 1RFID1 1RFID2 "-" 1RFID3 "-" 1RFID4
            if (1RFID00 = 1쇼로케이션) or (1RFID00 = 2쇼로케이션) or (1RFID00 = 3쇼로케이션) or (1RFID00 = 4쇼로케이션) or (1RFID00 = 5쇼로케이션) or (1RFID00 = 6쇼로케이션) or (1RFID00 = 7쇼로케이션) or (1RFID00 = 8쇼로케이션) or (1RFID00 = 9쇼로케이션) or (1RFID00 = 10쇼로케이션) or (1RFID00 = 11쇼로케이션) or (1RFID00 = 12쇼로케이션) or (1RFID00 = 13쇼로케이션)
            {
            ;~ 2RFID2 = % RFIDLOCA21 "-" RFIDLOCA22
            LV_Add("", status, sect, company, remarks, "메인RFID", 1RFID00)
            }

            else if (2RFID2 = 1쇼로케이션) or (2RFID2 = 2쇼로케이션) or (2RFID2 = 3쇼로케이션) or (2RFID2 = 4쇼로케이션) or (2RFID2 = 5쇼로케이션) or (2RFID2 = 6쇼로케이션) or (2RFID2 = 7쇼로케이션) or (2RFID2 = 8쇼로케이션) or (2RFID2 = 9쇼로케이션) or (2RFID2 = 10쇼로케이션) or (2RFID2 = 11쇼로케이션) or (2RFID2 = 12쇼로케이션) or (2RFID2 = 13쇼로케이션)
            {
            ;~ 2RFID2 = % RFIDLOCA21 "-" RFIDLOCA22
            LV_Add("", status, sect, company, remarks, 2RFID3, 2RFID2)
            }
            else if (3RFID2 = 1쇼로케이션) or (3RFID2 = 2쇼로케이션) or (3RFID2 = 3쇼로케이션) or (3RFID2 = 4쇼로케이션) or (3RFID2 = 5쇼로케이션) or (3RFID2 = 6쇼로케이션) or (3RFID2 = 7쇼로케이션) or (3RFID2 = 8쇼로케이션) or (3RFID2 = 9쇼로케이션) or (3RFID2 = 10쇼로케이션) or (3RFID2 = 11쇼로케이션) or (3RFID2 = 12쇼로케이션) or (3RFID2 = 13쇼로케이션)
            {
            ;~ 3RFID2 = % RFIDLOCA31 "-" RFIDLOCA32
            LV_Add("", status, sect, company, remarks, 3RFID3, 3RFID2)
            }
            else if (4RFID2 = 1쇼로케이션) or (4RFID2 = 2쇼로케이션) or (4RFID2 = 3쇼로케이션) or (4RFID2 = 4쇼로케이션) or (4RFID2 = 5쇼로케이션) or (4RFID2 = 6쇼로케이션) or (4RFID2 = 7쇼로케이션) or (4RFID2 = 8쇼로케이션) or (4RFID2 = 9쇼로케이션) or (4RFID2 = 10쇼로케이션) or (4RFID2 = 11쇼로케이션) or (4RFID2 = 12쇼로케이션) or (4RFID2 = 13쇼로케이션)
            {
            ;~ 4RFID2 = % RFIDLOCA41 "-" RFIDLOCA42
            LV_Add("", status, sect, company, remarks, 4RFID3, 4RFID2)
            }
            else if (5RFID2 = 1쇼로케이션) or (5RFID2 = 2쇼로케이션) or (5RFID2 = 3쇼로케이션) or (5RFID2 = 4쇼로케이션) or (5RFID2 = 5쇼로케이션) or (5RFID2 = 6쇼로케이션) or (5RFID2 = 7쇼로케이션) or (5RFID2 = 8쇼로케이션) or (5RFID2 = 9쇼로케이션) or (5RFID2 = 10쇼로케이션) or (5RFID2 = 11쇼로케이션) or (5RFID2 = 12쇼로케이션) or (5RFID2 = 13쇼로케이션)
            {
            ;~ 5RFID2 = % RFIDLOCA51 "-" RFIDLOCA52
            LV_Add("", status, sect, company, remarks, 5RFID3, 5RFID2)
            }
            else if (6RFID2 = 1쇼로케이션) or (6RFID2 = 2쇼로케이션) or (6RFID2 = 3쇼로케이션) or (6RFID2 = 4쇼로케이션) or (6RFID2 = 5쇼로케이션) or (6RFID2 = 6쇼로케이션) or (6RFID2 = 7쇼로케이션) or (6RFID2 = 8쇼로케이션) or (6RFID2 = 9쇼로케이션) or (6RFID2 = 10쇼로케이션) or (6RFID2 = 11쇼로케이션) or (6RFID2 = 12쇼로케이션) or (6RFID2 = 13쇼로케이션)
            {
            ;~ 6RFID2 = % RFIDLOCA61 "-" RFIDLOCA62
            LV_Add("", status, sect, company, remarks, 6RFID3, 6RFID2)
            }
            else if (7RFID2 = 1쇼로케이션) or (7RFID2 = 2쇼로케이션) or (7RFID2 = 3쇼로케이션) or (7RFID2 = 4쇼로케이션) or (7RFID2 = 5쇼로케이션) or (7RFID2 = 6쇼로케이션) or (7RFID2 = 7쇼로케이션) or (7RFID2 = 8쇼로케이션) or (7RFID2 = 9쇼로케이션) or (7RFID2 = 10쇼로케이션) or (7RFID2 = 11쇼로케이션) or (7RFID2 = 12쇼로케이션) or (7RFID2 = 13쇼로케이션)
            {
            ;~ 7RFID2 = % RFIDLOCA71 "-" RFIDLOCA72
            LV_Add("", status, sect, company, remarks, 7RFID3, 7RFID2)
            }
            else if (8RFID2 = 1쇼로케이션) or (8RFID2 = 2쇼로케이션) or (8RFID2 = 3쇼로케이션) or (8RFID2 = 4쇼로케이션) or (8RFID2 = 5쇼로케이션) or (8RFID2 = 6쇼로케이션) or (8RFID2 = 7쇼로케이션) or (8RFID2 = 8쇼로케이션) or (8RFID2 = 9쇼로케이션) or (8RFID2 = 10쇼로케이션) or (8RFID2 = 11쇼로케이션) or (8RFID2 = 12쇼로케이션) or (8RFID2 = 13쇼로케이션)
            {
            ;~ 8RFID2 = % RFIDLOCA81 "-" RFIDLOCA82
            LV_Add("", status, sect, company, remarks, 8RFID3, 8RFID2)
            }
            else if (9RFID2 = 1쇼로케이션) or (9RFID2 = 2쇼로케이션) or (9RFID2 = 3쇼로케이션) or (9RFID2 = 4쇼로케이션) or (9RFID2 = 5쇼로케이션) or (9RFID2 = 6쇼로케이션) or (9RFID2 = 7쇼로케이션) or (9RFID2 = 8쇼로케이션) or (9RFID2 = 9쇼로케이션) or (9RFID2 = 10쇼로케이션) or (9RFID2 = 11쇼로케이션) or (9RFID2 = 12쇼로케이션) or (9RFID2 = 13쇼로케이션)
            {
            ;~ 9RFID2 = % RFIDLOCA91 "-" RFIDLOCA92
            LV_Add("", status, sect, company, remarks, 9RFID3, 9RFID2)
            }
            else
            {
            }

        ;~ MsgBox, %1쇼로케이션%`n%2쇼로케이션%`n%3쇼로케이션%`n%4쇼로케이션%`n%5쇼로케이션%`n%6쇼로케이션%`n%7쇼로케이션%`n
            if ( WH = "100") or ( WH = "200") or ( WH = "300") or ( WH = "400") or ( WH = "500") or ( WH = "600") or ( WH = "700") or ( WH = "800") or ( WH = "900") or ( WH = "1000") or ( WH = "1100") or ( WH = "133") or ( WH = "166") or ( WH = "233") or ( WH = "266") or ( WH = "333") or ( WH = "366") or ( WH = "433") or ( WH = "466") or ( WH = "533") or ( WH = "566") or ( WH = "633") or ( WH = "666") or ( WH = "733") or ( WH = "766") or ( WH = "833") or ( WH = "866") or ( WH = "933") or ( WH = "966") or ( WH = "1033") or ( WH = "1066") or ( WH = "1133") or ( WH = "1166") or ( WH = "1200")
            {
            GuiControl,, PG, +5
            }
            else
            {
            }
        }



GuiControl,, PG, 100

Loop, % LV_GetCount("Col")
    LV_ModifyCol(A_Index, "autoHdr")
*/


GuiControl, enable, LV1
    SB_SetText(frmSAVEDPRESET  " 로케이션고 정보 조회 완료 했습니다")
    GuiControl,, PG, 0
        GuiControl, +Redraw, %HLV1%
;~ }
;~ else
;~ {
;~ }





}


연다 = 1

;~ MsgBox,,11,22
return




/*
연다 =
GuiControl, disable, A4_1
; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3
selectedloaction =
Loop
{

    if GetKeyState("LButton")
    {
            MouseGetPos, , , id, control
        WinGetTitle, title, ahk_id %id%
        WinGetClass, class, ahk_id %id%
       ; ControlGetText, selectedloaction , %control%, %Title%
    GuiControlget , selectedloaction, focusv,
        RegExMatch(selectedloaction, "(.*)_(.*)", newlocation)
        selectedloaction = % newlocation1 "-" newlocation2 "-"
        new1rfid1 := RegExReplace(newlocation1, "[0-9]", "")
        new1rfid2 := RegExReplace(newlocation1, "[^0-9]", "")
        GuiControl,, 1RFID1, %new1rfid1%
        GuiControl,, 1RFID2, %new1rfid2%
        GuiControl,, 1RFID3, %newlocation2%
        GuiControl, Focus, 1RFID4
        winset, alwaysontop, on, ahk_exe osk.exe
        break
    }
    else
    {
    }
}

GuiControl, enable, A4_1
; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

return


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
        break
    }
    else
    {
    }
}
return


select2:
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

        GuiControl, , 2RFID2, %selectedloaction%
        GuiControl, Focus, 2RFID2
        ;~ ControlSend, 2RFID2, {End}, %WINTITLE%
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

select1:
selnum=1
gosub, selectmanual
return

select2:
selnum=2
gosub, selectmanual
return

select3:
selnum=3
gosub, selectmanual
return

select4:
selnum=4
gosub, selectmanual
return

select5:
selnum=5
gosub, selectmanual
return

select6:
selnum=6
gosub, selectmanual
return

select7:
selnum=7
gosub, selectmanual
return

select8:
selnum=8
gosub, selectmanual
return

select9:
selnum=9
gosub, selectmanual
return


selectmanual:
{
연다 =
selectedloaction =

; SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

    GuiControl, Choose, tabname, 2
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

        selectcar := RegExReplace(newlocation1, "\d")  ; 숫자를 제거합니다.
        selectnum := RegExReplace(newlocation1, "\D")  ; 엉어를 제거합니다.
        ;~ MsgBox, % selectedloaction
    GuiControl, Choose, tabname, 1
        GuiControl, , lo%selnum%_1, % selectcar
        GuiControl, , lo%selnum%_2, % selectnum
        GuiControl, , lo%selnum%_3, % newlocation2
        GuiControl, , lo%selnum%_4,
        GuiControl, focus, lo%selnum%_4

        break
    }
    else
    {
    }
}
; SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


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
        run, osk.exe
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
ControlSend, combobox1, {Backspace 10}{Del 10}, %wintitle%

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
GuiControl,, 실합계,
GuiControl,, 실낱장,
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
CoordMode, mouse, window
  mapnum = 1
        AposX =
        AposY =
        AposW =
        AposH =


  Loop, 9
  {

    ctr = % lo%mapnum%_1 lo%mapnum%_2 "_" lo%mapnum%_3
    ;~ ctr1 = % lo%mapnum%_1 lo%mapnum%_2 "_" lo%mapnum%_3

        GuiControlGet, Apos, Pos , %ctr%
        ;~ GuiControlGet, Apos, Pos , %ctr1%
        ;~ GuiControlGet, Apos1, Pos , A1_1

        ;~ MsgBox, % AposX "`n"  AposY "`n"  AposW "`n"  AposH
        ;~ MsgBox, % lo%mapnum%_1 "`n" AposX "`n" AposY "`n" AposW "`n" AposH "`n" ctr

            ;~ MsgBox, x%AposX% y%AposY% `n %ctr% `n %ctr1%
        AposX := AposX - 6
        AposY := AposY - 36
        AposW := AposW + 8
        AposH := AposH + 8

            ;~ MsgBox, x%AposX% y%AposY% `n %ctr% `n %ctr1%


        if ( (lo%mapnum%_1 = "A") || (lo%mapnum%_1 = "B") || (lo%mapnum%_1 = "C") || (lo%mapnum%_1 = "D") || (lo%mapnum%_1 = "E") || (lo%mapnum%_1 = "F") || (lo%mapnum%_1 = "G") || (lo%mapnum%_1 = "H") )
        {
            ;~ GuiControl, Choose, tabname, 2
            ;~ MsgBox, x%AposX% y%AposY% `n x%Apos1X% y%Apos1Y%
            ;~ GuiControl, Move, 1color%mapnum%, x700 y300 w100 h50
            GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w%AposW% h%AposH%
            GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w0 h0
        }
        else if ( (lo%mapnum%_1 = "I") || (lo%mapnum%_1 = "J") || (lo%mapnum%_1 = "K") || (lo%mapnum%_1 = "L")  || (lo%mapnum%_1 = "M") )
        {
            ;~ GuiControl, Choose, tabname, 3
            GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w%AposW% h%AposH%
            GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w0 h0
        }
        else if ( (lo%mapnum%_1 = "O") || (lo%mapnum%_1 = "P") || (lo%mapnum%_1 = "Q") || (lo%mapnum%_1 = "R")  || (lo%mapnum%_1 = "S")  || (lo%mapnum%_1 = "T")  || (lo%mapnum%_1 = "U") )
        {
            ;~ GuiControl, Choose, tabname, 4
            GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w%AposW% h%AposH%
            GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w0 h0
        }

        else
        {
            GuiControl, Move, 1color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 2color%mapnum%, x%AposX% y%AposY% w0 h0
            GuiControl, Move, 3color%mapnum%, x%AposX% y%AposY% w0 h0
        }

        ;~ IF (lo%mapnum% = "")
        ;~ {
        ;~ MsgBox, % "1`n" lo%mapnum%
        ;~ }
        ;~ else
        ;~ {

        ;~ MsgBox, % "2`n" lo%mapnum%
        ;~ }



        ;~ if ( (lo1_1 = "A") || (lo1_1 = "B") || (lo1_1 = "C") || (lo1_1 = "D") || (lo1_1 = "E") || (lo1_1 = "F") || (lo1_1 = "G") || (lo1_1 = "H") )
        ;~ {
        ;~ }
        ;~ else if ( (lo1_1 = "I") || (lo1_1 = "J") || (lo1_1 = "K") || (lo1_1 = "L")  || (lo1_1 = "M") )
        ;~ {
        ;~ }

        ;~ else
        ;~ {
        ;~ }




        ;~ GuiControl, Move, color1, x80 y100 w40 h50
          ;~ GuiControl,, PG, 20
        ;~ Loop, 1
        ;~ {
        ;~ MouseGetPos, mx, my
        ;~ AposX := AposX + 8
        ;~ AposY := AposY + 8
        ;~ MouseMove, %AposX%, %AposY% ,0
        ;~ AposX := AposX - 8
        ;~ AposY := AposY - 8
        ;~ Sleep, 10
        ;~ }
;~ MouseMove, %mx%, %my% ,0
        mapnum++


    }
;~ MsgBox,  x%AposX% y%AposY% w%AposW% h%AposH%

;~ 555  37  43   24

/*
;;;;;;;;;;;;;;;;;;2차 이상
AA = 1

Loop,8
{
      GuiControl,, PG, +10
    AA++
    0RFID2 := %AA%RFID2


RegExMatch(0RFID2, "(.*)-(.*)-(.*)" , RFIDLOCA)
ctr = % RFIDLOCA1 "_" RFIDLOCA2
    if (RFIDLOCA1 = ""){
        ;~ MsgBox, % 0RFID2
        ;~ break
    }
    else
    {
        ;~ MsgBox, % ctr
        GuiControlGet, Apos, Pos , %ctr%
        AposX := AposX - 551
        AposY := AposY - 34
        AposW := AposW + 6
        AposH := AposH + 6





if ( (lo1_1 = "A") || (lo1_1 = "B") || (lo1_1 = "C") || (lo1_1 = "D") || (lo1_1 = "E") || (lo1_1 = "F") || (lo1_1 = "G") || (lo1_1 = "H") || (lo1_1 = "I") || (lo1_1 = "J") || (lo1_1 = "K") || (lo1_1 = "L") )
{
        GuiControl, Move, color%AA%, x%AposX% y%AposY% w%AposW% h%AposH%
}
else
{
        GuiControl, Move, 2color%AA%, x%AposX% y%AposY% w%AposW% h%AposH%
}









        ;~ Loop, 1
        ;~ {
        ;~ MouseGetPos, mx, my
        ;~ AposX := AposX + 8
        ;~ AposY := AposY + 8
        ;~ MouseMove, %AposX%, %AposY% ,0
        ;~ AposX := AposX - 8
        ;~ AposY := AposY - 8
        ;~ Sleep, 100
        ;~ MouseMove, %mx%, %my% ,0
        ;~ }
    }
}
      GuiControl,, PG, 100
      GuiControl,, PG, 0

*/


return


btn3:



return



guirestore2:
{
GuiControl,, PG, 0


        GuiControl, hide, highlight
Gui, submit, nohide
highlight1X=
highlight1Y=
highlight1W=
highlight1H=

arr := [1, 2, 3, 4, 5]

if (rfidcheck = "1"){
    frmSAVEDPRESET := RFIDREAD2
}
else
{
}
;~ MsgBox, % frmSAVEDPRESET "/" RFIDREAD2
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

if (frmSAVEDPRESET = CSV_ReadCell("data1",Result[1],1)){
        GuiControlGet, highlight1, pos, frmSAVEDPRESET
        ;~ MsgBox, % highlight1X "\" highlight1Y


        highlight1X := highlight1X - 26
        highlight1Y := highlight1Y - 35

        highlight1W := highlight1W + 18


        GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W830 h48
}
else
{
}



;~ MsgBox, % highlight1X "`n" highlight1Y "`n" highlight1W "`n" highlight1H "`n" ; ;




ANU = 2
ANUM = 3
Loop, 8
{
    ANUM++
GuiControl, , %ANU%RFID1, % CSV_ReadCell("data1",Result[1],ANUM)
if (frmSAVEDPRESET = CSV_ReadCell("data1",Result[1],ANUM)){
        GuiControlGet, highlight1, pos, %ANU%RFID1
        ;~ MsgBox, % highlight1X "\" highlight1Y


        highlight1X := highlight1X - 26
        highlight1Y := highlight1Y - 35

        highlight1W := highlight1W + 18


        GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W830 h48

}
else
{
        ;~ GuiControl, move, highlight, x%highlight1X% y%highlight1Y% W0 h0
}



    ANUM++
GuiControl, , %ANU%RFID2, % CSV_ReadCell("data1",Result[1],ANUM)


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


}




GuiControl, choosestring, frmSAVEDPRESET, % CSV_ReadCell("data1",Result[1],1)


GuiControl, , 상품코드, % CSV_ReadCell("data1",Result[1],31)
GuiControl, , 상품명, % CSV_ReadCell("data1",Result[1],29)
GuiControl, , 규격, % CSV_ReadCell("data1",Result[1],30)
GuiControl, , 비고, % CSV_ReadCell("data1",Result[1],28)


GuiControl,, PG, +10



searchs := CSV_ReadCell("data1",Result[1],31)

;~ Rows2:=CSV_TotalRows("data2")



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

GuiControl,, PG, +30

gosub, b전산밴딩

return
}






PresetChange:
    SB_SetText(frmSAVEDPRESET " ")
    gui, submit, nohide




;~ gosub, button2

GuiControl, Disable, frmSAVEDPRESET
    ; if drop down text is blank then error message and return
    ;~ if (frmSAVEDPRESET = "")
        ;~ return

    ; save gui values after combobox1 to ini file under given section
    ;~ guirestore("신흥목재재고파악수정.ini",frmSAVEDPRESET)
gosub,guirestore2

;~ gosub, READINFORMATION
 ;~ gosub, mapping


Sleep, 100

GuiControl, enable, frmSAVEDPRESET
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

CSV_Save(csvfile,"data1",1)
Sleep, 1000
MsgBox, ,,완료,1
CSV_Load(csvfile,"data1")
}
Return

;============================================================
; delete selected preset section from presets.ini
;============================================================

DeletePreset:

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

Rows:=CSV_TotalRows("data1")
TR1=`
real=0
Loop, %Rows%{
    TR1 .= CSV_ReadCell("data1",A_Index,1) "|"
    ;~ MsgBox, % TR1
}

    GuiControl, , frmSAVEDPRESET, % "|" TR1  ; update the control

Return

;============================================================
; when you click x or close button
;============================================================

GuiClose:

    Gui, Submit, NoHide      ; update control variables

    ; use script's basename to define ini file panel position and presets.ini
    RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe


ExitApp

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



;~ B8_1:
;~ GuiControl, , showlocation, B8-1
;~ gosub, LVlocation
;~ return
B8_2:
GuiControl, , showlocation, B8_2
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
A7_1:
GuiControl, , showlocation, A7_1
gosub, LVlocation
return

A7_2:
GuiControl, , showlocation, A7_2
gosub, LVlocation
return
B7_2:
GuiControl, , showlocation, B7_2
gosub, LVlocation
return
B7_1:
GuiControl, , showlocation, B7_1
gosub, LVlocation
return
B6_1:
GuiControl, , showlocation, B6_1
gosub, LVlocation
return

A6_1:
GuiControl, , showlocation, A6_1
gosub, LVlocation
return
A6_2:
GuiControl, , showlocation, A6_2
gosub, LVlocation
return
B6_2:
GuiControl, , showlocation, B6_2
gosub, LVlocation
return
A5_1:
GuiControl, , showlocation, A5_1
gosub, LVlocation
return

A4_1:
GuiControl, , showlocation, A4_1
gosub, LVlocation
return
A3_1:
GuiControl, , showlocation, A3_1
gosub, LVlocation
return
A2_1:
GuiControl, , showlocation, A2_1
gosub, LVlocation
return
A1_1:
GuiControl, , showlocation, A1_1
;~ MsgBox, % showlocation
gosub, LVlocation
return

A2_2:
GuiControl, , showlocation, A2_2
gosub, LVlocation
return
A3_2:
GuiControl, , showlocation, A3_2
gosub, LVlocation
return
A4_2:
GuiControl, , showlocation, A4_2
gosub, LVlocation
return
A5_2:
GuiControl, , showlocation, A5_2
gosub, LVlocation
return

B5_2:
GuiControl, , showlocation, B5_2
gosub, LVlocation
return
B5_1:
GuiControl, , showlocation, B5_1
gosub, LVlocation
return
B4_2:
GuiControl, , showlocation, B4_2
gosub, LVlocation
return
B3_1:
GuiControl, , showlocation, B3_1
gosub, LVlocation
return

B4_1:
GuiControl, , showlocation, B4_1
gosub, LVlocation
return
B2_1:
GuiControl, , showlocation, B2_1
gosub, LVlocation
return
A1_2:
GuiControl, , showlocation, A1_2
gosub, LVlocation
return
B1_1:
GuiControl, , showlocation, B1_1
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
I3_1:
GuiControl, , showlocation, I3_1
gosub, LVlocation
return
I2_1:
GuiControl, , showlocation, I2_1
gosub, LVlocation
return
I1_1:
GuiControl, , showlocation, I1_1
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

K7_1:
GuiControl, , showlocation, K7_1
gosub, LVlocation
return
K7_2:
GuiControl, , showlocation, K7_2
gosub, LVlocation
return
;~ K8_1:
;~ GuiControl, , showlocation, K8_1
;~ gosub, LVlocation
;~ return
;~ K8_2:
;~ GuiControl, , showlocation, K8_2
;~ gosub, LVlocation
;~ return

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
J4_1:
GuiControl, , showlocation, J4_1
gosub, LVlocation
return
J2_1:
GuiControl, , showlocation, J2_1
gosub, LVlocation
return



J3_1:
GuiControl, , showlocation, J3_1
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

Q1_1:
GuiControl, , showlocation, Q1_1
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
{
FormatTime, now, , mmss

csvfile = %A_Desktop%\WMS\상품정보\상품정보.csv
csv_Load(csvfile,"data1")
csvfile = %A_Desktop%\WMS\상품정보\판매정보.csv
csv_Load(csvfile,"data2")

}
/*
;~ MsgBox, % now
;~ run, explorer, \\192.168.0.1\hdd2\일정표 최근\WMS\
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
        FileCopy, \\192.168.0.1\hdd2\일정표 최근\WMS\어제자상품재고정보.xlsx, %A_ScriptDir%\어제자상품재고정보.xlsx, 1
        GuiControl,, PG, +10
        ;~ Sleep,500
        FileCopy, \\192.168.0.1\hdd2\일정표 최근\WMS\어제판매리스트.xlsx, %A_ScriptDir%\어제판매리스트.xlsx, 1
        GuiControl,, PG, +10
        ;~ Sleep,500
        FileCopy, \\192.168.0.1\hdd2\일정표 최근\WMS\오늘미래판매리스트.xlsx, %A_ScriptDir%\오늘미래판매리스트.xlsx, 1
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
/*
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
*/
return
