#NoENV
#SingleInstance, Force
#InstallMouseHook
;~ #MaxMem 512  ; that's a large chunk of memory for a script

;~ Process, Priority,, High
;~ SetBatchLines, -1  ; affects CPU utilization... script will run at max speed
;~ ListLines Off  ; helps with speed
#Include, %A_WorkingDir%\Class_LV_InCellEdit.ahk
#Include, %A_WorkingDir%\Class_LV_Colors.ahk
#Include, %A_WorkingDir%\csv.ahk
#Include, %A_WorkingDir%\screencapture.ahk
연다 = 0

CoordMode, Pixel, screen

;~ SetKeyDelay, -1
;~ SetKeyDelay, -1
;~ SetMouseDelay, -1
;~ SetWinDelay, -1
;~ SetControlDelay, -1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;~ /*

SetTimer , timer, 1000
Loop, 20
{

Process, close, EXCEL.EXE
Sleep, 10
}


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
VERSION := 2.0
RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe
WINTITLE := basename1 " " VERSION
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


SoundPlay, %A_ScriptDir%\sound\sound22.wav
Sleep, 500
SoundPlay, %A_ScriptDir%\sound\sound0_1.mp3


;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////







RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath
gui, destroy
gui, Default
Gui, +alwaysontop


Gui, Add, Picture, x306 y198 w25 h30 v1color1, %A_ScriptDir%\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x306 y289 w25 h30 v1color2, %A_ScriptDir%\blue.png
Gui, Add, Picture, x306 y319 w25 h30 v1color3, %A_ScriptDir%\colour1.png
Gui, Add, Picture, x306 y349 w25 h30 v1color4, %A_ScriptDir%\colour2.png
Gui, Add, Picture, x306 y379 w25 h30 v1color5, %A_ScriptDir%\colour3.png
Gui, Add, Picture, x306 y409 w25 h30 v1color6, %A_ScriptDir%\colour4.png
Gui, Add, Picture, x306 y439 w25 h30  v1color7, %A_ScriptDir%\colour5.png
Gui, Add, Picture, x306 y469 w25 h30 v1color8, %A_ScriptDir%\colour6.png
Gui, Add, Picture, x306 y499 w25 h30 v1color9, %A_ScriptDir%\colour7.png
Gui, Add, Picture, x10 y10 w0 h0 v1colorbutton, %A_ScriptDir%\red.png

Gui, Add, Picture, x10 y10 w0 h0 v2colorbutton, %A_ScriptDir%\red.png

Gui, Add, Picture, x10 y10 w0 h0 v3colorbutton, %A_ScriptDir%\colour4.png


Gui, Add, Picture, x610 y435 w0 h0 vcolorbutton, %A_ScriptDir%\red.png

Gui, Font, S10 CDefault, Malgun Gothic
Gui, Add, GroupBox, x85 y74 w255 h70 , [RFID CODE]       [PRODUCT CODE]
Gui, Add, ComboBox, x90 y104 w110 h30 r10 section vfrmSAVEDPRESET gPresetChange,
Gui, Font, S8 CDefault, Malgun Gothic
Gui, Add, GroupBox, x80 y9 w455 h695 , 제품 재고 정보

GuiControl, Move, 2colorbutton, x202 y37 w55 h29
GuiControl, Move, 3colorbutton, x308 y37 w55 h29

Gui, Add, Button, x90 y39 w51 h25 gSavePreset, 저장
Gui, Add, Button, x+2 y39 w51 h25 gDeletePreset vDELETEBUTTON, 삭제
Gui, Add, Button, x+10 y39 w51 h25 g리더기, #1 리딩
Gui, Add, Button, x+2 y39 w51 h25 g키보드, 키보드
Gui, Add, Button, x+2 y39 w51 h25 gEDSM, EDSM
Gui, Add, Button, x+2 y39 w51 h25 g인폼받기, 인폼받기
Gui, Add, Button, x+2 y39 w51 h25 gbutton22, 초기화
Gui, Add, Button, x+2 y39 w51 h25 gbutton3, 맵에표시
Gui, Font, S10 CDefault, Malgun Gothic
Gui, Add, GroupBox, x347 y74 w180 h110 , [상품명 / 규격]
Gui, Add, Edit, x205 y104 w125 h30 -vscroll v상품코드,
Gui, Add, Edit, x352 y104 w170 h30 -vscroll v상품명,
Gui, Add, Edit, x352 y144 w170 h30 -vscroll v규격,
Gui, Font, S8 CDefault, Malgun Gothic
Gui, Add, GroupBox, x85 y149 w255 h90 , [로케이션]
Gui, Add, Text, x90 y179 w230 h17 , 라인          칸                줄               칸
Gui, Font, S13 CDefault, Malgun Gothic
Gui, Add, Edit, x90 y199 w50 h30 -vscroll Uppercase +right v1RFID1,
Gui, Add, Edit, x140 y199 w50 h30 -vscroll Number +right v1RFID2,
Gui, Add, UpDown,,
Gui, Add, Edit, x192 y199 w50 h30 -vscroll Number +right v1RFID3,
Gui, Add, UpDown,,
Gui, Add, Edit, x246 y199 w60 h30 -vscroll Number +right v1RFID4,
Gui, Add, UpDown,,1
Gui, Font, S8 CDefault, Malgun Gothic
Gui, Add, Button, x308 y200 w21 h26 gselect1, ★

Gui, Add, GroupBox, x85 y244 w255 h300 , [기타 로케이션]
Gui, Add, Text, x90 y269 w260 h20 , 기타RFID코드            로케이션       수량
Gui, Add, Text, x77 y294 w15 h20 , #2
Gui, Add, Text, x77 y324 w20 h30 , #3
Gui, Add, Text, x77 y354 w20 h30 , #4
Gui, Add, Text, x77 y384 w20 h30 , #5
Gui, Add, Text, x77 y414 w20 h30 , #6
Gui, Add, Text, x77 y444 w20 h30 , #7
Gui, Add, Text, x77 y474 w20 h30 , #8
Gui, Add, Text, x77 y504 w20 h30 , #9
Gui, Font, S10 CDefault, Malgun Gothic




Gui, Add, Edit, x90 y289 w85 h30 -vscroll Uppercase v2RFID1,
Gui, Add, Edit, x200 y289 w65 h30 -vscroll Uppercase v2RFID2,
Gui, Add, Edit, x266 y289 w40 h30 -vscroll Uppercase +right v2RFID3 gb2RFID3,
Gui, Add, Edit, x90 y319 w85 h30 -vscroll Uppercase v3RFID1,
Gui, Add, Edit, x200 y319 w65 h30 -vscroll Uppercase v3RFID2,
Gui, Add, Edit, x266 y319 w40 h30 -vscroll Uppercase +right v3RFID3 gb3RFID3,
Gui, Add, Edit, x90 y349 w85 h30 -vscroll Uppercase v4RFID1,
Gui, Add, Edit, x200 y349 w65 h30 -vscroll Uppercase v4RFID2,
Gui, Add, Edit, x266 y349 w40 h30 -vscroll Uppercase +right v4RFID3 gb4RFID3,
Gui, Add, Edit, x90 y379 w85 h30 -vscroll Uppercase v5RFID1,
Gui, Add, Edit, x200 y379 w65 h30 -vscroll Uppercase v5RFID2,
Gui, Add, Edit, x266 y379 w40 h30 -vscroll Uppercase +right v5RFID3 gb5RFID3,
Gui, Add, Edit, x90 y409 w85 h30 -vscroll Uppercase v6RFID1,
Gui, Add, Edit, x200 y409 w65 h30 -vscroll Uppercase v6RFID2,
Gui, Add, Edit, x266 y409 w40 h30 -vscroll Uppercase +right v6RFID3 gb6RFID3,
Gui, Add, Edit, x90 y439 w85 h30 -vscroll Uppercase v7RFID1,
Gui, Add, Edit, x200 y439 w65 h30 -vscroll Uppercase v7RFID2,
Gui, Add, Edit, x266 y439 w40 h30 -vscroll Uppercase +right v7RFID3 gb7RFID3,
Gui, Add, Edit, x90 y469 w85 h30 -vscroll Uppercase v8RFID1,
Gui, Add, Edit, x200 y469 w65 h30 -vscroll Uppercase v8RFID2,
Gui, Add, Edit, x266 y469 w40 h30 -vscroll Uppercase +right v8RFID3 gb8RFID3,
Gui, Add, Edit, x90 y499 w85 h30 -vscroll Uppercase v9RFID1,
Gui, Add, Edit, x200 y499 w65 h30 -vscroll Uppercase v9RFID2,
Gui, Add, Edit, x266 y499 w40 h30 -vscroll Uppercase +right v9RFID3 gb9RFID3,
Gui, Font, S8 CDefault, Malgun Gothic

Gui, Add, Button, x175 y289 w25 h30 grefridread2, R2
Gui, Add, Button, x175 y319 w25 h30 grefridread3, R3
Gui, Add, Button, x175 y349 w25 h30 grefridread4, R4
Gui, Add, Button, x175 y379 w25 h30 grefridread5, R5
Gui, Add, Button, x175 y409 w25 h30 grefridread6, R6
Gui, Add, Button, x175 y439 w25 h30 grefridread7, R7
Gui, Add, Button, x175 y469 w25 h30 grefridread8, R8
Gui, Add, Button, x175 y499 w25 h30 grefridread9, R9


Gui, Add, Button, x308 y291 w21 h26 gselect2, ★
Gui, Add, Button, x308 y321 w21 h26 gselect3, ★
Gui, Add, Button, x308 y351 w21 h26 gselect4, ★
Gui, Add, Button, x308 y381 w21 h26 gselect5, ★
Gui, Add, Button, x308 y411 w21 h26 gselect6, ★
Gui, Add, Button, x308 y441 w21 h26 gselect7, ★
Gui, Add, Button, x308 y471 w21 h26 gselect8, ★
Gui, Add, Button, x308 y501 w21 h26 gselect9, ★
Gui, Add, GroupBox, x347 y184 w180 h240 , [재고량]
Gui, Add, Text, x352 y205 w170 h15 , 이전재고    매출수량   반입수량
Gui, Add, Text, x352 y250 w170 h15 , `               매입수량   반출수량
Gui, Add, Text, x352 y295 w170 h15 , 전산총수량 - 전산밴딩 = 전산낱장
Gui, Add, Text, x352 y340 w170 h15 , 수정값       #실제합계 #실제낱장
Gui, Font, S8 CDefault, Malgun Gothic




Gui, Add, GroupBox, x347 y429 w180 h240 , [비고]
Gui, Add, Edit, x352 y564 w170 h100 v비고,

Gui, Font, S9 W1000 CDefault, Malgun Gothic
Gui, Add, button, x352 y449 w39 h32 gnum1, 7
Gui, Add, button, x+5 w39 h32 gnum1, 8
Gui, Add, button, x+5 w39 h32 gnum1, 9

Gui, Font, S8 W400 CDefault, Malgun Gothic
Gui, Add, button, x+5 w39 h32 gnum1, ←

Gui, Font, S9 W1000 CDefault, Malgun Gothic
Gui, Add, button, x352 y485 w39 h32 gnum1, 4
Gui, Add, button, x+5 w39 h32 gnum1, 5
Gui, Add, button, x+5 w39 h32 gnum1, 6

Gui, Font, S8 W400 CDefault, Malgun Gothic
Gui, Add, button, x+5 w39 h32 gnum1, DEL

Gui, Font, S9 W1000 CDefault, Malgun Gothic
Gui, Add, button, x352 y521 w39 h32 gnum1, 1
Gui, Add, button, x+5 w39 h32 gnum1, 2
Gui, Add, button, x+5 w39 h32 gnum1, 3

Gui, Font, S8 W400 CDefault, Malgun Gothic
Gui, Add, button, x+5 w39 h32 gnum1, RE

Gui, Font, S8 W400 CDefault, Malgun Gothic

Gui, Add, GroupBox, x85 y544 w255 h125 , [수정로그]
Gui, Add, Edit, x90 y564 w245 h100,


Gui, Font, S11 CDefault, Malgun Gothic
Gui, Add, Edit, x352 y219 w57 h25 -vscroll +right v이전재고,
Gui, Add, Edit, x409 y219 w57 h25 -vscroll +right v매출수량,
Gui, Add, Edit, x466 y219 w57 h25 -vscroll +right v반입수량,

;~ Gui, Add, Edit, x317 y264 w70 h25 -vscroll ,
Gui, Add, Edit, x409 y264 w57 h25 -vscroll +right v매입수량,
Gui, Add, Edit, x466 y264 w57 h25 -vscroll +right v반출수량,

Gui, Add, Edit, x352 y309 w57 h25 -vscroll +right v현재수량,
Gui, Add, Edit, x409 y309 w57 h25 -vscroll +right v전산밴딩 gb전산밴딩,
Gui, Add, Edit, x466 y309 w57 h25 -vscroll +right v전산낱장,

Gui, Add, Edit, x352 y354 w57 h25 -vscroll +right v수정값,
Gui, Add, Edit, x409 y354 w57 h25 -vscroll +right v실합계,
Gui, Add, Edit, x466 y354 w57 h25 -vscroll +right v실낱장,







Gui, Add, Progress, vPG x85 y670 w442 h20 , 0
Gui, Add, StatusBar



;~ GuiControl, Move, colorbutton, x315 y387 w74 h29

GuiControl, Move, colorbutton, x463 y387 w64 h31

Gui, Add, Button, x466 y389 w57 h25 vbcallast gbcallast, 낱장`n역계산
Gui, Add, Button, x352 y389 w57 h25 vbcaledit gbcaledit, 전산수정
Gui, Font, S5 CDefault, Malgun Gothic
Gui, Add, Button, x480 y70 w40 h30 g검색, 검색
Gui, Font, S8 CDefault, Malgun Gothic
;~ Gui, Add, Button, x387 y389 w65 h25 , 총-밴딩

;~ GuiControl, disable, bcaledit
;~ GuiControl, disable, bcallast

GuiControl, disable, DELETEBUTTON


Gui, Add, Button, x270 y238 w65 h30 gdelrfid, 밴딩해체`n라인정렬 ;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
Gui, Add, Edit, y+0 w75 h1 vRFIDREAD4,


Gui, Add, Button, x1185 y5 w80 h26 gbattery, 베터리 잔량
Gui, Add, Button, x+0 y5 w80 h26 gchange, TMS







 ;~ Background0xFF00FF

Gui, Font, S8 W900 cFF2211, Malgun Gothic

Gui, Add, Tab3, x547 y9 w800 h695 , 로케이션[창고내부]|`      EDSM`       |
Gui, Tab, 로케이션[창고내부],,


Gui, Add, GroupBox, x547 y9 w800 h695 , [창고 2D 평면도]


Gui, Font, S8 CDefault W400, Malgun Gothic





Gui, Color, FFFFFF
Gui, Add, Picture, x640 y225 w312 h95 vdivi1, %A_ScriptDir%\divi.png
Gui, Add, Picture, x1122 y201 w62 h170 vdivi2, %A_ScriptDir%\divi.png
Gui, Add, Picture, x610 y435 w345 h75 vdivi3, %A_ScriptDir%\divi.png
Gui, Add, Picture, x758 y34 w585 h80 vdivi4, %A_ScriptDir%\divi.png
Gui, Add, Picture, x1045 y461 w100 h47 vdivi5, %A_ScriptDir%\divi.png

Gui, Add, Picture, x610 y435 w0 h0 vcolor1, %A_ScriptDir%\red.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
Gui, Add, Picture, x610 y435 w0 h0 vcolor2, %A_ScriptDir%\blue.png
Gui, Add, Picture, x610 y435 w0 h0 vcolor3, %A_ScriptDir%\colour1.png
Gui, Add, Picture, x610 y435 w0 h0 vcolor4, %A_ScriptDir%\colour2.png
Gui, Add, Picture, x610 y435 w0 h0 vcolor5, %A_ScriptDir%\colour3.png
Gui, Add, Picture, x610 y435 w0 h0 vcolor6, %A_ScriptDir%\colour4.png
Gui, Add, Picture, x610 y435 w0 h0 vcolor7, %A_ScriptDir%\colour5.png
Gui, Add, Picture, x610 y435 w0 h0 vcolor8, %A_ScriptDir%\colour6.png
Gui, Add, Picture, x610 y435 w0 h0 vcolor9, %A_ScriptDir%\colour7.png









Gui, Add, Button, x647 y369 w29 h40 gB8_1, B8_1
Gui, Add, Button, x647 y324 w29 h40 gB8_2, B8_2
Gui, Add, Button, x647 y229 w29 h40 gA8_1, A8_1
Gui, Add, Button, x647 y274 w29 h40 gA8_2, A8_2

Gui, Add, Button, x678 y229 w29 h40 gA7_1, A7_1
Gui, Add, Button, x678 y274 w29 h40 gA7_2, A7_2
Gui, Add, Button, x678 y369 w29 h40 gB7_1, B7_1
Gui, Add, Button, x678 y324 w29 h40 gB7_2, B7_2

Gui, Add, Button, x727 y229 w29 h40 gA6_1, A6_1
Gui, Add, Button, x727 y274 w29 h40 gA6_2, A6_2
Gui, Add, Button, x727 y369 w29 h40 gB6_1, B6_1
Gui, Add, Button, x727 y324 w29 h40 gB6_2, B6_2

Gui, Add, Button, x758 y229 w29 h40 gA5_1, A5_1
Gui, Add, Button, x758 y274 w29 h40 gA5_2, A5_2
Gui, Add, Button, x758 y369 w29 h40 gB5_1, B5_1
Gui, Add, Button, x758 y324 w29 h40 gB5_2, B5_2

Gui, Add, Button, x807 y229 w29 h40 gA4_1, A4_1
Gui, Add, Button, x807 y274 w29 h40 gA4_2, A4_2
Gui, Add, Button, x807 y369 w29 h40 gB4_1, B4_1
Gui, Add, Button, x807 y324 w29 h40 gB4_2, B4_2

Gui, Add, Button, x838 y229 w29 h40 gA3_1, A3_1
Gui, Add, Button, x838 y274 w29 h40 gA3_2, A3_2
Gui, Add, Button, x838 y324 w29 h40 gB3_1, B3_1

Gui, Add, Button, x887 y229 w29 h40 gA2_1, A2_1
Gui, Add, Button, x887 y274 w29 h40 gA2_2, A2_2
Gui, Add, Button, x887 y324 w29 h40 gB2_1, B2_1

Gui, Add, Button, x918 y229 w29 h40 gA1_1, A1_1
Gui, Add, Button, x918 y274 w29 h40 gA1_2, A1_2
Gui, Add, Button, x918 y324 w29 h40 gB1_1, B1_1


Gui, Add, Button, x557 y149 w20 h40 gE2_3, E2_3
Gui, Add, Button, x+2 y149 w20 h40 gE2_2, E2_2
Gui, Add, Button, x+2 y149 w20 h40 gE2_1, E2_1
Gui, Add, Button, x557 y194 w20 h40 gE1_3, E1_3
Gui, Add, Button, x+2 y194 w20 h40 gE1_2, E1_2
Gui, Add, Button, x+2 y194 w20 h40 gE1_1, E1_1

Gui, Add, Button, x557 y464 w30 h40 gD1_1, D1_1
Gui, Add, Button, x557 y419 w30 h40 gD2_1, D2_1
Gui, Add, Button, x557 y374 w30 h40 gD3_1, D3_1

Gui, Add, Button, x616 y439 w29 h30 gC9_1, C9_1
Gui, Add, Button, x616 y474 w29 h30 gC9_2, C9_2
Gui, Add, Button, x647 y439 w29 h30 gC8_1, C8_1
Gui, Add, Button, x647 y474 w29 h30 gC8_2, C8_2
Gui, Add, Button, x678 y439 w29 h30 gC7_1, C7_1
Gui, Add, Button, x678 y474 w29 h30 gC7_2, C7_2




Gui, Add, Button, x727 y439 w29 h30 gC6_1, C6_1
Gui, Add, Button, x727 y474 w29 h30 gC6_2, C6_2
Gui, Add, Button, x758 y439 w29 h30 gC5_1, C5_1
Gui, Add, Button, x758 y474 w29 h30 gC5_2, C5_2
Gui, Add, Button, x807 y439 w29 h30 gC4_1, C4_1
Gui, Add, Button, x807 y474 w29 h30 gC4_2, C4_2
Gui, Add, Button, x838 y439 w29 h30 gC3_1, C3_1
Gui, Add, Button, x838 y474 w29 h30 gC3_2, C3_2
Gui, Add, Button, x887 y439 w29 h30 gC2_1, C2_1
Gui, Add, Button, x887 y474 w29 h30 gC2_2, C2_2
Gui, Add, Button, x918 y439 w29 h30 gC1_1, C1_1
Gui, Add, Button, x918 y474 w29 h30 gC1_2, C1_2

Gui, Add, Button, x557 y39 w39 h20 gF4_3, F4_3
Gui, Add, Button, x557 y64 w39 h20 gF4_2, F4_2
Gui, Add, Button, x557 y89 w39 h20 gF4_1, F4_1

Gui, Add, Button, x598 y39 w39 h20 gF3_3, F3_3
Gui, Add, Button, x598 y64 w39 h20 gF3_2, F3_2
Gui, Add, Button, x598 y89 w39 h20 gF3_1, F3_1

Gui, Add, Button, x647 y39 w39 h20 gF2_3, F2_3
Gui, Add, Button, x647 y64 w39 h20 gF2_2, F2_2
Gui, Add, Button, x647 y89 w39 h20 gF2_1, F2_1

Gui, Add, Button, x688 y39 w39 h20 gF1_3, F1_3
Gui, Add, Button, x688 y64 w39 h20 gF1_2, F1_2
Gui, Add, Button, x688 y89 w39 h20 gF1_1, F1_1

Gui, Add, Button, x1307 y229 w30 h30 gI3_1, I3_1
Gui, Add, Button, x1307 y266 w30 h30 gI2_1, I2_1
Gui, Add, Button, x1307 y304 w30 h30 gI1_1, I1_1



Gui, Add, Button, x1216 y227 w25 h28 gK1_4, K1_4
Gui, Add, Button, x1216 y257 w25 h28 gK1_3, K1_3
Gui, Add, Button, x1216 y287 w25 h28 gK1_2, K1_2
Gui, Add, Button, x1216 y317 w25 h28 gK1_1, K1_1

Gui, Add, Button, x1189 y205 w52 h20 gK2_5, K2_5
Gui, Add, Button, x1189 y227 w25 h28 gK2_4, K2_4
Gui, Add, Button, x1189 y257 w25 h28 gK2_4, K2_3
Gui, Add, Button, x1189 y287 w25 h28 gK2_2, K2_2
Gui, Add, Button, x1189 y317 w25 h28 gK2_1, K2_1
Gui, Add, Button, x1189 y347 w52 h20 gK2_0, K2_0


Gui, Add, Button, x1154 y227 w25 h28 gK3_4, K3_4
Gui, Add, Button, x1154 y257 w25 h28 gK3_3, K3_3
Gui, Add, Button, x1154 y287 w25 h28 gK3_2, K3_2
Gui, Add, Button, x1154 y317 w25 h28 gK3_1, K3_1


Gui, Add, Button, x1127 y205 w52 h20 gK4_5, K4_5
Gui, Add, Button, x1127 y227 w25 h28 gK4_4, K4_4
Gui, Add, Button, x1127 y257 w25 h28 gK4_4, K4_3
Gui, Add, Button, x1127 y287 w25 h28 gK4_2, K4_2
Gui, Add, Button, x1127 y317 w25 h28 gK4_1, K4_1
Gui, Add, Button, x1127 y347 w52 h20 gK4_0, K4_0




Gui, Add, Button, x1092 y227 w25 h28 gK5_4, K5_4
Gui, Add, Button, x1092 y257 w25 h28 gK5_3, K5_3
Gui, Add, Button, x1092 y287 w25 h28 gK5_2, K5_2
Gui, Add, Button, x1092 y317 w25 h28 gK5_1, K5_1


Gui, Add, Button, x1065 y205 w52 h20 gK6_5, K6_5
Gui, Add, Button, x1065 y227 w25 h28 gK6_4, K6_4
Gui, Add, Button, x1065 y257 w25 h28 gK6_4, K6_3
Gui, Add, Button, x1065 y287 w25 h28 gK6_2, K6_2
Gui, Add, Button, x1065 y317 w25 h28 gK6_1, K6_1
Gui, Add, Button, x1065 y347 w52 h20 gK6_0, K6_0



Gui, Add, Button, x1030 y284 w25 h50 gK7_1, K7_1
Gui, Add, Button, x1030 y229 w25 h50 gK7_2, K7_2


Gui, Add, Button, x997 y229 w30 h50 gL5_1, L5_1
Gui, Add, Button, x997 y284 w30 h50 gL4_1, L4_1


Gui, Add, Button, x1111 y374 w29 h40 gL3_3, L3_3
Gui, Add, Button, x1080 y374 w29 h40 gL3_2, L3_2
Gui, Add, Button, x1049 y374 w29 h40 gL3_1, L3_1

Gui, Add, Button, x1111 y419 w29 h40 gL2_3, L2_3
Gui, Add, Button, x1080 y419 w29 h40 gL2_2, L2_2
Gui, Add, Button, x1049 y419 w29 h40 gL2_1, L2_1

Gui, Add, Button, x1111 y464 w29 h40 gL1_3, L1_3
Gui, Add, Button, x1080 y464 w29 h40 gL1_2, L1_2
Gui, Add, Button, x1049 y464 w29 h40 gL1_1, L1_1

Gui, Add, Button, x737 y39 w15 h70 gF0_1, F0_1
 Gui, Add, Button, x1142 y374 w195 h130 gM1_1, M1_1

Gui, Add, Button, x1257 y304 w40 h30 gJ1_1, J1_1
Gui, Add, Button, x1277 y264 w20 h35 gJ2_1, J2_1
Gui, Add, Button, x1257 y229 w40 h30 gJ3_1, J3_1
Gui, Add, Button, x1257 y264 w20 h35 gJ4_1, J4_1


Gui, Add, Button, x762 y39 w39 h20 gH14_3, H14_3
Gui, Add, Button, x762 y64 w39 h20 gH14_2, H14_2
Gui, Add, Button, x762 y89 w39 h20 gH14_1, H14_1
Gui, Add, Button, x762 y124 w39 h20 gG14_3, G14_3
Gui, Add, Button, x762 y149 w39 h20 gG14_2, G14_2
Gui, Add, Button, x762 y174 w39 h20 gG14_1, G14_1

Gui, Add, Button, x803 y39 w39 h20 gH13_3, H13_3
Gui, Add, Button, x803 y64 w39 h20 gH13_2, H13_2
Gui, Add, Button, x803 y89 w39 h20 gH13_1, H13_1
Gui, Add, Button, x803 y124 w39 h20 gG13_3, G13_3
Gui, Add, Button, x803 y149 w39 h20 gG13_2, G13_2
Gui, Add, Button, x803 y174 w39 h20 gG13_1, G13_1


Gui, Add, Button, x852 y64 w39 h20 gH12_2, H12_2
Gui, Add, Button, x852 y39 w39 h20 gH12_3, H12_3
Gui, Add, Button, x852 y89 w39 h20 gH12_1, H12_1
Gui, Add, Button, x852 y124 w39 h20 gG12_3, G12_3
Gui, Add, Button, x852 y149 w39 h20 gG12_2, G12_2
Gui, Add, Button, x852 y174 w39 h20 gG12_1, G12_1

Gui, Add, Button, x893 y39 w39 h20 gH11_3, H11_3
Gui, Add, Button, x893 y64 w39 h20 gH11_2, H11_2
Gui, Add, Button, x893 y89 w39 h20 gH11_1, H11_1
Gui, Add, Button, x893 y124 w39 h20 gG11_3, G11_3
Gui, Add, Button, x893 y149 w39 h20 gG11_2, G11_2
Gui, Add, Button, x893 y174 w39 h20 gG11_1, G11_1

Gui, Add, Button, x942 y39 w39 h20 gH10_3, H10_3
Gui, Add, Button, x942 y64 w39 h20 gH10_2, H10_2
Gui, Add, Button, x942 y89 w39 h20 gH10_1, H10_1
Gui, Add, Button, x942 y124 w39 h20 gG10_3, G10_3
Gui, Add, Button, x942 y149 w39 h20 gG10_2, G10_2
Gui, Add, Button, x942 y174 w39 h20 gG10_1, G10_1

Gui, Add, Button, x983 y39 w34 h20 gH9_3, H9_3
Gui, Add, Button, x983 y64 w34 h20 gH9_2, H9_2
Gui, Add, Button, x983 y89 w34 h20 gH9_1, H9_1
Gui, Add, Button, x983 y124 w34 h20 gG9_3, G9_3
Gui, Add, Button, x983 y149 w34 h20 gG9_2, G9_2
Gui, Add, Button, x983 y174 w34 h20 gG9_1, G9_1

Gui, Add, Button, x1027 y124 w34 h20 gG8_3, G8_3
Gui, Add, Button, x1027 y149 w34 h20 gG8_2, G8_2
Gui, Add, Button, x1027 y174 w34 h20 gG8_1, G8_1
Gui, Add, Button, x1027 y39 w34 h20 gH8_3, H8_3
Gui, Add, Button, x1027 y64 w34 h20 gH8_2, H8_2
Gui, Add, Button, x1027 y89 w34 h20 gH8_1, H8_1

Gui, Add, Button, x1063 y39 w34 h20 gH7_3, H7_3
Gui, Add, Button, x1063 y64 w34 h20 gH7_2, H7_2
Gui, Add, Button, x1063 y89 w34 h20 gH7_1, H7_1
Gui, Add, Button, x1063 y124 w34 h20 gG7_3, G7_3
Gui, Add, Button, x1063 y149 w34 h20 gG7_2, G7_2
Gui, Add, Button, x1063 y174 w34 h20 gG7_1, G7_1

Gui, Add, Button, x1107 y39 w34 h20 gH6_3, H6_3
Gui, Add, Button, x1107 y64 w34 h20 gH6_2, H6_2
Gui, Add, Button, x1107 y89 w34 h20 gH6_1, H6_1
Gui, Add, Button, x1107 y124 w34 h20 gG6_3, G6_3
Gui, Add, Button, x1107 y149 w34 h20 gG6_2, G6_2
Gui, Add, Button, x1107 y174 w34 h20 gG6_1, G6_1

Gui, Add, Button, x1143 y39 w34 h20 gH5_3, H5_3
Gui, Add, Button, x1143 y64 w34 h20 gH5_2, H5_2
Gui, Add, Button, x1143 y89 w34 h20 gH5_1, H5_1
Gui, Add, Button, x1143 y124 w34 h20 gG5_3, G5_3
Gui, Add, Button, x1143 y149 w34 h20 gG5_2, G5_2
Gui, Add, Button, x1143 y174 w34 h20 gG5_1, G5_1

Gui, Add, Button, x1187 y39 w34 h20 gH4_3, H4_3
Gui, Add, Button, x1187 y64 w34 h20 gH4_2, H4_2
Gui, Add, Button, x1187 y89 w34 h20 gH4_1, H4_1
Gui, Add, Button, x1187 y124 w34 h20 gG4_3, G4_3
Gui, Add, Button, x1187 y149 w34 h20 gG4_2, G4_2
Gui, Add, Button, x1187 y174 w34 h20 gG4_1, G4_1

Gui, Add, Button, x1223 y39 w34 h20 gH3_3, H3_3
Gui, Add, Button, x1223 y64 w34 h20 gH3_2, H3_2
Gui, Add, Button, x1223 y89 w34 h20 gH3_1, H3_1
Gui, Add, Button, x1223 y124 w34 h20 gG3_3, G3_3
Gui, Add, Button, x1223 y149 w34 h20 gG3_2, G3_2
Gui, Add, Button, x1223 y174 w34 h20 gG3_1, G3_1

Gui, Add, Button, x1267 y39 w34 h20 gH2_3, H2_3
Gui, Add, Button, x1267 y64 w34 h20 gH2_2, H2_2
Gui, Add, Button, x1267 y89 w34 h20 gH2_1, H2_1
Gui, Add, Button, x1267 y124 w34 h20 gG2_3, G2_3
Gui, Add, Button, x1267 y149 w34 h20 gG2_2, G2_2
Gui, Add, Button, x1267 y174 w34 h20 gG2_1, G2_1

Gui, Add, Button, x1303 y39 w34 h20 gH1_3, H1_3
Gui, Add, Button, x1303 y64 w34 h20 gH1_2, H1_2
Gui, Add, Button, x1303 y89 w34 h20 gH1_1, H1_1
Gui, Add, Button, x1303 y124 w34 h20 gG1_3, G1_3
Gui, Add, Button, x1303 y149 w34 h20 gG1_2, G1_2
Gui, Add, Button, x1303 y174 w34 h20 gG1_1, G1_1

Gui, Add, GroupBox, x562 y515 w780 h185 , 각 로케이션 별 제품 정보
Gui, Add, Text, x572 y535 w70 h20 , 로케이션 번호



Gui, Add, GroupBox, x562 y515 w780 h185 , 각 로케이션 별 제품 정보
Gui, Add, Text, x572 y535 w70 h12 , 로케이션 번호
Gui, Add, Text, x+20 w200 h12 cred vshowlocation, 로케이션 번호
Gui, Add, Edit, x+20 w100 h12 vRFIDREAD1,
Gui, Add, Edit, x+20 w100 h12 vRFIDREAD2,
Gui, Add, Edit, x+20 w100 h12 vRFIDREAD3,

Gui, Add, Listview, x573 y555 w760 h140 vLV1 gLV1 hwndHLV1, RFID CODE|PRODUCT CODE|상품명|규격|수량|로케이션







Gui, Tab, `      EDSM`       ,,




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
            SoundPlay, %A_WorkingDir%\sound\soundopen.mp3
        }
        else
        {
            SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
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
Gui, Add, ListView,  x550 y+10 w785 h620 grid vLVedsm1 gLVedsm1 hwndHLVedsm1 -ReadOnly WantF2 -Multi NoSortHdr, 첵|상품코드|품명|규격|단위|현재고


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






Gui, Show, x-120 y0 w1366 h730, %WINTITLE%
;~ Gui, Add, GroupBox, x315 y357 w74 h29,  ;;;;;;;;;;;;;;;;;;;;;
 ;~ x317 y389 w70 h25

IniRead, projects, 신흥목재재고파악수정.ini
GoSub, UpdatePresetList
return



num1:
;~ GuiControl, disable, A4_1
;~ SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3
selectedloaction1 =
GuiControlget , selectedloaction, focusv,
MouseGetPos, , , id2, control
WinGetTitle, title, ahk_id %id2%
WinGetClass, class, ahk_id %id2%
ControlGetText, selectedloaction , %control%, %Title%

if (selectedloaction = "←")
    {
        GuiControl, Focus, 실낱장
        Send, {Backspace}
    }
else if (selectedloaction = "DEL")
    {
        GuiControl, Focus, 실낱장
        Send, {Del}
    }
else if (selectedloaction = "RE")
    {
        GuiControl, Focus, 실낱장
        Send, {ctrl Down}a{ctrl up}{Del}
    }

else
    {
        GuiControl, Focus, 실낱장
        Send, %selectedloaction%
    }

;~ GuiControl, enable, A4_1
;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

return



;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

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
            SoundPlay, %A_WorkingDir%\sound\soundopen.mp3
        }
        else
        {
            SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
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

;~ SoundPlay, %A_WorkingDir%\sound\열때.mp3
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
		SoundPlay, %A_WorkingDir%\sound\1.mp3
		CSV_Load(containr, "rootcsv")
		CSV_Save(containr, "rootcsv", 1)


Sleep, 100
SoundPlay, %A_WorkingDir%\sound\1.mp3
MsgBox, 262192, 알림, 저장 완료됐습니다, 0.8


return
}



상태close:
{
    WinKill, %상태%
    Sleep, 1000
    return
}




LVedsm1:

Gui, ListView, lvedsm1
    gui, submit, nohide
if (A_GuiEvent = "DoubleClick")
{
SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
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

OnMessage(0x44, "WM_COMMNOTIFY")
MsgBox, 262147, RFID, 선택 해주세요:
IfMsgBox, YES
{


    ;~ winkill, 체크박스
    Loop, parse, projects, `n ;shows sections
    {
    sect := A_LoopField
    IniRead, status, 신흥목재재고파악수정.ini, %sect%, 상품코드, %A_Space%

        if (OutputVarC = status){
        GuiControl, ChooseString, frmSAVEDPRESET, %sect%
        Sleep, 10
        ;~ ControlSend, Edit1, {Alt down}f{Alt up}, WMS_VER2 2.0
        ControlSend, Edit1, {Del 10}{Backspace 10}, %WINTITLE%
        Sleep, 100
        ControlSend, Edit1, %sect%, %WINTITLE%
        Sleep, 100
        ControlFocus, Edit1, %WINTITLE%
        Send, {End}{Space}{Backspace}

        Sleep, 100

        GuiControl, ChooseString, frmSAVEDPRESET, %sect%
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
    SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
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
    SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
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
Gui, 1:ListView, LVedsm1
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


;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


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
Gui, 2:Add, ListView, grid r20 w400 vLVsearch gLVsearch, 코드_____상품/규격| dmdm?
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
            WinWait, %WINTITILE%
        IfWinNotActive, %WINTITILE%, , WinActivate, %WINTITILE%,
        WinWaitActive, %WINTITILE%,
    ;~ Sleep, 100
ControlSetText, edit1, , %WINTITLE%
    ;~ Sleep, 100
    Control, choosestring, %1output1%, combobox1, %WINTITLE%
;~ ControlSetText, edit1, %1output1%, %WINTITLE%
    Sleep, 100



;~ ControlSend, edit1, {End}{home}{End}, %WINTITLE%
ControlSend, edit1, {Tab}{shift down}{tab}{shift up}{Space}, %WINTITLE%
;~ MsgBox, %1output1%


;~ gosub, PresetChange
;~ GuiControl, ChooseString, frmSAVEDPRESET, %1output1%
;~ ControlSetText, %1output1%, frmSAVEDPRESET, WMS_VER2 2.0
;~ ControlSend, Edit1, {space},  WMS_VER2 2.0
;~ Sleep, 100

;~ gosub, button3
    }
;~ SoundPlay, %A_ScriptDir%\sound\sound1_1.mp3
;~ gosub, READINFORMATION
;~ SoundPlay, %A_ScriptDir%\sound\sound9_2.mp3
;~ gosub, 판별기
;~ GuiControl, focus, 실낱장
SoundPlay, %A_ScriptDir%\sound\sound2_2 (1).mp3
}

return


리더기:
{
SoundPlay, %A_ScriptDir%\sound\sound3_1.mp3

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
        GuiControl, ChooseString, frmSAVEDPRESET, %RFIDREAD2%
        ControlSend, Edit1, {space},  WMS_VER2 2.0
        Sleep, 100

        gosub, button3
    }
clipboard :=
SoundPlay, %A_ScriptDir%\sound\sound1_1.mp3
gosub, READINFORMATION
SoundPlay, %A_ScriptDir%\sound\sound9_2.mp3
gosub, 판별기
GuiControl, focus, 실낱장
}
return




delrfid:
{
SoundPlay, %A_ScriptDir%\sound\sound3_1.mp3

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

SoundPlay, %A_ScriptDir%\sound\sound9_2.mp3
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
    ;~ MsgBox, %상품명% 중복 X
    GuiControl, enable, bcaledit
    GuiControl, enable, bcallast
        SB_SetText(frmSAVEDPRESET 상품명 " 수정 하셔도 됩니다")
SoundPlay, %A_ScriptDir%\sound\sound9_2.mp3

GuiControl, Move, colorbutton, x450 y387 w69 h29
;~ Gui, Add, Button, x452 y389 w65 h25 gbcallast, 낱장역계산

    SoundPlay, %A_ScriptDir%\sound\sound1_3.mp3
}
else
{
    GuiControl, disable, bcaledit
    GuiControl, disable, bcallast
        SB_SetText(frmSAVEDPRESET 상품명 " 오늘 혹은 미래에 제품이 있습니다  내일 시도해 주세요")
    ;~ MsgBox, %상품명% 중복 O
    SoundPlay, %A_ScriptDir%\sound\sound9_3.mp3
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
SoundPlay, %A_ScriptDir%\sound\sound2_1.mp3
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

    Sleep,200
    ControlSend, TRzDateTimeEdit1, %어제날짜%, ahk_class TfmMain
    Sleep,200
    Controlsend, TRzEdit2, %상품코드%{Enter}, ahk_class TfmMain
; Sleep, 20
; ControlClick, TRzPanel4, ahk_class TfmMain, , , , x257 y10
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
          ;~ SoundPlay, %A_ScriptDir%\sound\sound22.wav
          ;~ Sleep, 500
          ;~ SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3




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
SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3
GuiControl, Move, colorbutton, x464 y387 w61 h29
    ;~ WinWait, %WINTITILE%
        ;~ IfWinNotActive, %WINTITILE%, , WinActivate, %WINTITILE%,
        ;~ WinWaitActive, %WINTITILE%,
;~ Sleep, 100

;~ gosub, button22

Sleep, 100

GuiControl, Focus, 실낱장






}

return




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
e전산밴딩 := 2RFID3 + 3RFID3 + 4RFID3 + 5RFID3 + 6RFID3 + 7RFID3 + 8RFID3 + 9RFID3
GuiControl, , 전산밴딩, %e전산밴딩%
e전산낱장 := 현재수량 - 전산밴딩
GuiControl, , 전산낱장, %e전산낱장%
}
return




;~ b전산낱장:
;~ {
;~ Gui, submit, nohide


;~ }
;~ return





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




refridread2:
gosub, 리더기2

return
refridread3:
gosub, 리더기2
return
refridread4:
gosub, 리더기2
return
refridread5:
gosub, 리더기2
return
refridread6:
gosub, 리더기2
return
refridread7:
gosub, 리더기2
return
refridread8:
gosub, 리더기2
return
refridread9:
gosub, 리더기2
return

리더기2:
SoundPlay, %A_ScriptDir%\sound\sound3_1.mp3

        GuiControl, , RFIDREAD3,
        Sleep,10
        GuiControl, , RFIDREAD2,
        Sleep,10
        GuiControl, , RFIDREAD1,
        Sleep,10
GuiControlGet, refridread, FocusV

        renumber := RegExReplace(refridread, "[^0-9]", "")
        ;~ MsgBox, % renumber
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
        gosub, 리더기2
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
        ;~ GuiControl, ChooseString, frmSAVEDPRESET, %RFIDREAD2%
        refridex := % renumber "RFID1"
                    ;~ MsgBox, % refridex
        if (refridex="2RFID1"){
            GuiControl, , 2RFID1, %RFIDREAD2%

        }
        ELSE if (refridex="3RFID1"){
            GuiControl, , 3RFID1, %RFIDREAD2%
        }
        ELSE if (refridex="4RFID1"){
            GuiControl, , 4RFID1, %RFIDREAD2%
        }
        ELSE if (refridex="5RFID1"){
            GuiControl, , 5RFID1, %RFIDREAD2%
        }
        ELSE if (refridex="6RFID1"){
            GuiControl, , 6RFID1, %RFIDREAD2%
        }
        ELSE if (refridex="7RFID1"){
            GuiControl, , 7RFID1, %RFIDREAD2%
        }
        ELSE if (refridex="8RFID1"){
            GuiControl, , 8RFID1, %RFIDREAD2%
        }
        ELSE if (refridex="9RFID1"){
            GuiControl, , 9RFID1, %RFIDREAD2%
        }
        else
        {
         return
        }





        Sleep, 100
        GuiControl, , RFIDREAD3,
        Sleep,10
        GuiControl, , RFIDREAD2,
        Sleep,10
        GuiControl, , RFIDREAD1,
        Sleep,10
        gosub, button3
    }
SoundPlay, %A_ScriptDir%\sound\sound1_3.mp3
clipboard :=
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
	LV_GetText(OutputVar, selectRowNum)
	Sleep, 100


    Loop, parse, projects, `n ;shows sections
    {
        sect := A_LoopField
        IniRead, keys, 신흥목재재고파악수정.ini, % sect
        IniRead, status, 신흥목재재고파악수정.ini, % sect, 상품코드, %A_Space%

        if (status = OutputVar)
        {
            ;~ GuiControl,, PG, 50
            GuiControl, ChooseString, frmSAVEDPRESET, %sect%
            Sleep, 10
            ;~ MsgBox, %sect%
            ControlSend, Edit1, {space},  WMS_VER2 2.0

            Sleep, 100

            gosub, button3
            break
        }
        else
        {
        }
    }
}
return




B8_1:
GuiControl, , showlocation, B8_1

gosub, LVlocation
return





LVlocation:
{
if(연다 = "1")
    {
        Gui, suBMit, nohide
        GuiControl, -Redraw, %HLV1%

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



            if (2RFID2 = 1쇼로케이션) or (2RFID2 = 2쇼로케이션) or (2RFID2 = 3쇼로케이션) or (2RFID2 = 4쇼로케이션) or (2RFID2 = 5쇼로케이션) or (2RFID2 = 6쇼로케이션) or (2RFID2 = 7쇼로케이션) or (2RFID2 = 8쇼로케이션) or (2RFID2 = 9쇼로케이션) or (2RFID2 = 10쇼로케이션) or (2RFID2 = 11쇼로케이션) or (2RFID2 = 12쇼로케이션) or (2RFID2 = 13쇼로케이션)
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
GuiControl, enable, LV1
    SB_SetText(frmSAVEDPRESET  " 로케이션고 정보 조회 완료 했습니다")
    GuiControl,, PG, 0
        GuiControl, +Redraw, %HLV1%
}
else
{
}
연다 = 1

}
return


select1:
연다 =
GuiControl, disable, A4_1
SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3
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
SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

return

/*
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
*/


select2:
연다 =
    selectedloaction =
SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

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
SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


return
select3:
연다 =
    selectedloaction =
SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

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
            GuiControl, , 3RFID2, %selectedloaction%
    GuiControl, Focus, 3RFID2
    Send, {End}
        run, osk.exe
                winset, alwaysontop, on, ahk_exe osk.exe
        break
    }
    else
    {
    }
}
SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


return
select4:
연다 =
    selectedloaction =
SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

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
SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


return
select5:
연다 =
    selectedloaction =
SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

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
SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


return
select6:
연다 =
    selectedloaction =
SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

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
SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

return
select7:
연다 =
    selectedloaction =
SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

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
SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

return
select8:
연다 =
    selectedloaction =
SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

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
SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


return
select9:
연다 =
    selectedloaction =
SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

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
SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3


return


recordlocation:
SoundPlay, %A_ScriptDir%\sound\sound_0_0.mp3

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
SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3

return



button1:
GuiControl,, PG, 50
GuiControl, ChooseString, frmSAVEDPRESET, 18001B5F42
Sleep, 10
GuiControl,, PG, 100
ControlSend, Edit1, {space},  WMS_VER2 2.0

Sleep, 100

gosub, button3

return

button22:
SoundPlay, %A_ScriptDir%\sound\sound5_1.mp3
button2:

Gui, suBMit, nohide
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
return


button3: ;;;;;;;;;;;;;;;;;;1차 이상
gui, submit, nohide
  GuiControl,, PG, 10
ctr = % 1RFID1 1RFID2 "_" 1RFID3
IF (ctr = "_")
{
}
else
{
CoordMode, mouse, Client
GuiControlGet, Apos, Pos , %ctr%
AposX := AposX - 551
AposY := AposY - 33
AposW := AposW + 4
AposH := AposH + 4
GuiControl, Move, color1, x%AposX% y%AposY% w%AposW% h%AposH%
;~ GuiControl, Move, color1, x80 y100 w40 h50
  GuiControl,, PG, 20
;~ Loop, 1
;~ {
MouseGetPos, mx, my
AposX := AposX + 8
AposY := AposY + 8
;~ MouseMove, %AposX%, %AposY% ,0
AposX := AposX - 8
AposY := AposY - 8
Sleep, 100
;~ MouseMove, %mx%, %my% ,0
}

;~ MsgBox,  x%AposX% y%AposY% w%AposW% h%AposH%

;~ 555  37  43   24


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
        AposY := AposY - 33
        AposW := AposW + 4
        AposH := AposH + 4
        GuiControl, Move, color%AA%, x%AposX% y%AposY% w%AposW% h%AposH%

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
return


btn3:



return




PresetChange:
    SB_SetText(frmSAVEDPRESET " ")
    gui, submit, nohide




gosub, button2

GuiControl, Disable, frmSAVEDPRESET
    ; if drop down text is blank then error message and return
    if (frmSAVEDPRESET = "")
        return

    ; save gui values after combobox1 to ini file under given section
    guirestore("신흥목재재고파악수정.ini",frmSAVEDPRESET)

gosub, READINFORMATION
 gosub, button3


GuiControl, enable, frmSAVEDPRESET
    SB_SetText(frmSAVEDPRESET " 제품 재고 정보 조회 완료 했습니다")

      GuiControl,, PG, 100
      GuiControl,, PG, 0
Return

;============================================================
; save preset to presets.ini
;============================================================

SavePreset:
      GuiControl,, PG, 0
    gui, submit, nohide

    ; if drop down text is blank then error message and return
    if (frmSAVEDPRESET = "") {
        SB_SetText("Preset name required")
        return
    }
      GuiControl,, PG, 100
    guisave("신흥목재재고파악수정.ini", frmSAVEDPRESET, "DELETEBUTTON", "이전재고")

    GoSub, UpdatePresetList  ; update drop down to show all preset section names in ini file
;~ Sleep, 1
    GuiControl, Text, frmSAVEDPRESET, %frmSAVEDPRESET%  ; update the control
      ;~ GuiControl,, PG, 100
;~ MsgBox, % frmSAVEDPRESET
    SB_SetText(frmSAVEDPRESET " 수정된 사항을 저장했습니다")

    FileCopy,  %A_ScriptDir%\신흥목재재고파악수정.ini, \\192.168.0.1\hdd2\일정표 최근\WMS\신흥목재재고파악수정.ini, 1


      SoundPlay, %A_ScriptDir%\sound\sound2_2.mp3
      GuiControl,, PG, 0
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

    RegExMatch(A_ScriptName, "^(.*?)\.", basename)

    ; get all section names in ini file
    IniRead, sectionNames, %A_ScriptDir%\신흥목재재고파악수정.ini
    sectionNames := RegExReplace(sectionNames , "\n", "|")         ; change newline to pipe
    sectionNames := RegExReplace(sectionNames , "section1[\|]?", "")    ; exclude section1
    sectionNames := "|" sectionNames
;~ MsgBox, % sectionNames
    ; update drop down to show all preset section names in ini file
    GuiControl, , frmSAVEDPRESET, % sectionNames  ; update the control
    ;~ GuiControl, , frmSAVEDPRESET, % sectionNames  ; update the control

;~ MsgBox, 22
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

    return
}



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