; 스크립트 시작 부분에 추가
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")

; 다중 모니터 전체 화면 좌표 (가상 스크린)
SysGet, VirtualX, 76   ; 가상 스크린 X 시작점
SysGet, VirtualY, 77   ; 가상 스크린 Y 시작점
SysGet, VirtualW, 78   ; 가상 스크린 너비
SysGet, VirtualH, 79   ; 가상 스크린 높이
VirtualX2 := VirtualX + VirtualW
VirtualY2 := VirtualY + VirtualH

;~ ListLines, Off
;~ Process, Priority, , High
Menu, TRAY, Icon, %A_Desktop%\오토핫키2\Mushroom - Boo.ico
SetWorkingDir %A_ScriptDir%
#WinActivateForce
#Persistent
#SingleInstance, Force
#Include, %A_ScriptDir%\screencapture.ahk
#Include, %A_ScriptDir%\csv.ahk
;~ SetBatchLines, -1  ; affects CPU utilization... script will run at max speed
SetKeyDelay, 1

SetTitleMatchMode, 3
SetTitleMatchMode, slow
WINTITLE = 배송문자 시스템  -by shwood-   ;제목

CoordMode, Mouse, Screen

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INI 파일에서 좌표 설정 읽기
IniFile := A_ScriptDir "\s누르기2_좌표.ini"

; INI 파일 존재 여부 확인
if !FileExist(IniFile) {
    MsgBox, 16, 오류, INI 파일이 없습니다!`n%IniFile%`n`n좌표 설정 파일을 먼저 만들어주세요.
    ExitApp
}

; GuiMain 좌표
IniRead, GuiMain_x, %IniFile%, GuiMain, x
IniRead, GuiMain_y, %IniFile%, GuiMain, y

; Gui2 도어회사선택 좌표
IniRead, Gui2_x, %IniFile%, Gui2, x
IniRead, Gui2_y, %IniFile%, Gui2, y

; Gui3 재단유무 좌표
IniRead, Gui3_x, %IniFile%, Gui3, x
IniRead, Gui3_y, %IniFile%, Gui3, y

; Gui4 배송자선택 좌표
IniRead, Gui4_x, %IniFile%, Gui4, x
IniRead, Gui4_y, %IniFile%, Gui4, y

; MouseMove 좌표
IniRead, Mouse_door_x, %IniFile%, MouseMove, door_x
IniRead, Mouse_door_y, %IniFile%, MouseMove, door_y
IniRead, Mouse_cut_x, %IniFile%, MouseMove, cut_x
IniRead, Mouse_cut_y, %IniFile%, MouseMove, cut_y
IniRead, Mouse_extract_x, %IniFile%, MouseMove, extract_x
IniRead, Mouse_extract_y, %IniFile%, MouseMove, extract_y
IniRead, Mouse_delivery_x, %IniFile%, MouseMove, delivery_x
IniRead, Mouse_delivery_y, %IniFile%, MouseMove, delivery_y

; CaptureScreen 좌표
IniRead, Capture_store1_x1, %IniFile%, CaptureScreen, store1_x1
IniRead, Capture_store1_y1, %IniFile%, CaptureScreen, store1_y1
IniRead, Capture_store1_x2, %IniFile%, CaptureScreen, store1_x2
IniRead, Capture_store1_y2, %IniFile%, CaptureScreen, store1_y2
IniRead, Capture_store2_x1, %IniFile%, CaptureScreen, store2_x1
IniRead, Capture_store2_y1, %IniFile%, CaptureScreen, store2_y1
IniRead, Capture_store2_x2, %IniFile%, CaptureScreen, store2_x2
IniRead, Capture_store2_y2, %IniFile%, CaptureScreen, store2_y2
IniRead, Capture_delivery_x1, %IniFile%, CaptureScreen, delivery_x1
IniRead, Capture_delivery_y1, %IniFile%, CaptureScreen, delivery_y1
IniRead, Capture_delivery_x2, %IniFile%, CaptureScreen, delivery_x2
IniRead, Capture_delivery_y2, %IniFile%, CaptureScreen, delivery_y2

; WinMove 좌표
IniRead, WinMove_recv1_x, %IniFile%, WinMove, recv1_x
IniRead, WinMove_recv1_y, %IniFile%, WinMove, recv1_y
IniRead, WinMove_recv2_x, %IniFile%, WinMove, recv2_x
IniRead, WinMove_recv2_y, %IniFile%, WinMove, recv2_y
IniRead, WinMove_sales_x, %IniFile%, WinMove, sales_x
IniRead, WinMove_sales_y, %IniFile%, WinMove, sales_y
IniRead, WinMove_whale_x, %IniFile%, WinMove, whale_x
IniRead, WinMove_whale_y, %IniFile%, WinMove, whale_y

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Include MySQL.ahk
/*
태준컴화면x =
태준컴화면y =
태준마우스1x =
태준마우스1y =
태준마우스2x =
태준마우스2y =

태예컴화면x =
태예컴화면y =
태예마우스1x =
태예마우스1y =
태예마우스2x =
태예마우스2y =
*/


host := "192.168.0.23"
;~ host := "59.27.187.25"
user := "root"
pw := "tlsgmdahrwo12#"
database := "mydatabase"

sql_start()
global myDB := dbConnect(host, user, pw, database)
if(myDB = "error"){
	MsgBox, % myDB
}
dbQuery(myDB, "set character set euckr")

; 스크립트 종료 시 리소스 정리
OnExit("CleanUpOnExit")

CleanUpOnExit() {
    global myDB, XL, hModule

    ; 최대 속도로 정리 작업 수행
    SetBatchLines, -1

    ; Excel COM 객체 정리
    if (XL != "" && IsObject(XL)) {
        try {
            XL.DisplayAlerts := false
        }
        try {
            XL.ActiveWorkbook.Close(0)
        }
        try {
            XL.Quit()
        }
        XL := ""
    }

    ; MySQL 연결 정리
    if (myDB != "" && myDB != 0) {
        try {
            dbDisConnect(myDB)
        }
        myDB := ""
    }

    ; DLL 해제 (한 번만)
    if (hModule != "" && hModule != 0) {
        try {
            DllCall("FreeLibrary", "ptr", hModule)
        }
        hModule := ""
    }

    return 0
}


IfWinExist, ahk_class TfmEstimate2
{
		받는분=신흥목재매입 					;;교체해야하는것
					;~ 받는분=김태준 					;;교체해야하는것
					;~ 받는분=신흥목재N100
}
;~ else if ( WinExist("ahk_class TfmChitSale") )
else
{
			받는분=신흥목재카톡방 					;;교체해야하는것
			;~ 받는분=김태준 					;;교체해야하는것
			;~ 받는분=지게차피씨
			;~ 받는분=신흥목재N100
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Gui, +AlwaysOnTop
Gui, Font, CDefault W400, Malgun Gothic
Gui, Add, GroupBox, x5 y0 w200 h840 ,
Gui, Add, Text, x10 y13 w110 h20 , 문자 받는 분
Gui, Add, Edit, y+0 w190 h30 -VScroll vtofrom, %받는분%
Gui, Add, Text, y+5 w110 h20 , 거래처명
Gui, Add, Edit, y+0 w190 h30 -VScroll v1, ;거래처명
Gui, Add, Text, y+5 w110 h20 , 배송날짜
Gui, Add, Edit, y+0 w190 h30 -VScroll v2, ;배송날짜
Gui, Add, Text, y+5 w110 h20 , 출발/도착 시각
Gui, Add, Edit, y+0 w190 h30 -VScroll v3, ;출발/도착 시각
Gui, Add, Text, y+5 w110 h20 , 배송지
Gui, Add, Edit, y+0 w190 h30 -VScroll v4, ;배송지
Gui, Add, Text, y+5 w110 h20 , 기타메모
Gui, Add, Edit, y+0 w190 h40 -VScroll v5, ;기타메모
Gui, Add, Text, y+5 w110 h20 , 품목 내용
Gui, Add, Edit, y+0 w190 h40 -VScroll v6, ;품목 내용
Gui, Add, Text, y+5 w110 h20 , 전화번호
Gui, Add, Edit, y+0 w190 h30 -VScroll v7, ;전화번호
Gui, Add, Text, y+5 w110 h20 , 조합 내용
Gui, Add, Edit, y+0 w190 h150 -VScroll v8,

Gui, Font, W800 Cblue, Malgun Gothic
Gui, Add, Text, x10 y+5 w90 h20 , 도어회사
Gui, Font, W800 CFF00FF, Malgun Gothic
Gui, Add, Text, x+10 w90 h20 , 재단 유무
Gui, Font, CDefault W400, Malgun Gothic
Gui, Add, DropDownList, x10 y+0 w90 h20 -VScroll r5 vddl Cred, |예림|우딘|재현|크로스
Gui, Add, dropdownlist, x+10 w90 h20 -VScroll r2 vddl2, |컷
Gui, Add, DropDownList, x10 y+0 w90 h20 -VScroll r3 vtrans Cred, |조|여|김

Gui, Add, Button, x10 y+10 w60 h50 g추출 v추출, 추출
Gui, Add, Button, x+5 w60 h50 g조합 v조합, 조합
Gui, Add, Button, x+5 w60 h50 g캘린더 v캘린더, 캘린더
Gui, Add, Button, x10 y+5 w60 h50 g발송1 v발송1, 발송`n(매장)
Gui, Font, CDefault W700, Malgun Gothic
Gui, Add, Button, x+5 w60 h50 g배송자확인 v발송2, 발송`n(배 송)
Gui, Add, Button, x+5 w60 h50 g초기화 v초기화, 초기화

If WinExist("ahk_class TfmChitSale"){
	Gui, Font, W800 Cred, Malgun Gothic
}else{
	Gui, Font, W800 Cblue, Malgun Gothic
}
Gui, Add, Edit, x10 y+5 w190 h20 -VScroll v9


Gui, Font, CDefault W400, Malgun Gothic
Gui, Add, GroupBox, x5 y870 w200 h435 ,
Gui, Add, Text, x10 y883 w180 h20 , 손님용 출고 SMS 내용
Gui, Add, Edit, x10 y+0 w190 h150 -VScroll v10,

;~ Gui, Add, Button, x10 y+10 w190 h50 g추출, 추출

;~ Gui, Add, Button, x10 y+15 w90 h40 g거래처원장 v거래처원장 , 거래처원장`n서버에올리기
;~ Gui, Font, CDefault W700, Malgun Gothic
;~ Gui, Add, Button, x+9 w90 h40 g거래처원장_상세 v거래처원장_상세, 거래처원장`n상세올리기
;~ Gui, Font, CDefault W400, Malgun Gothic

; 최근 출고지 (fb_chittop 에서 G_NAME 일치 검색) — 더블클릭 시 셀 값 클립보드 복사
Gui, Add, Text, x10 y+15 w180 h20 , 최근 출고지 (더블클릭=복사)
Gui, Add, ListView, x10 y+0 w190 h140 -Multi -HScroll gRecentShipmentsEvent vRecentShipmentsLV, 내역|출고지

Gui, Add, Button, x10 y+15 w90 h40 g조합1 v조합1 Hidden, (매장손님)`n조합
Gui, Font, CDefault W700, Malgun Gothic
Gui, Add, Button, xp yp w90 h40 g조합2 v조합2 Hidden, (배송손님)`n조합
Gui, Font, CDefault W400, Malgun Gothic

Gui, Add, Button, xp yp w90 h60 g문자발송1 v문자발송1 Hidden, (매장손님)`n문자발송
Gui, Font, CDefault W700, Malgun Gothic
Gui, Add, Button, xp yp w90 h60 g문자발송2 v문자발송2 Hidden, (배송손님)`n문자발송
Gui, Font, CDefault W400, Malgun Gothic


Gui, Add, Button, xp yp w90 h40 g완료조합1 v완료조합1 Hidden, (매장완료)`n조합
Gui, Font, CDefault W700, Malgun Gothic
Gui, Add, Button, xp yp w90 h40 g완료조합2 v완료조합2 Hidden, (배송완료)`n조합
Gui, Font, CDefault W400, Malgun Gothic


Gui, Add, Button, xp yp w90 h60 g완료발송1 v완료발송1 Hidden, (매장손님)`n출고완료`n문자발송
Gui, Font, CDefault W700, Malgun Gothic
Gui, Add, Button, xp yp w90 h60 g완료발송2 v완료발송2 Hidden, (배송손님)`n배송완료`n문자발송



Gui, Add, Text, x10 y+30 w180 h20 , 방송하기
Gui, Add, Edit, x10 y+0 w190 h150 -VScroll v11,

Gui, Add, Button, x10 y+5 w90 h40 g방송내용, 지금바로`n상차요청
Gui, Font, CDefault W700, Malgun Gothic
Gui, Add, Button, x+9 w90 h40 g방송하기, 매장에`n방송하기




Gui, Font, CDefault W400, Malgun Gothic

GuiControl, disable, tofrom


GuiControl, disable, 조합
GuiControl, disable, 캘린더
GuiControl, disable, 발송1
GuiControl, disable, 발송2

GuiControl, disable, 문자발송1
GuiControl, disable, 문자발송2
GuiControl, disable, 완료발송1
GuiControl, disable, 완료발송2
GuiControl, disable, 조합1
GuiControl, disable, 조합2
GuiControl, disable, 완료조합1
GuiControl, disable, 완료조합2

	IfWinNotExist, %WINTITLE%
	{
		Gui, Show, x%GuiMain_x% y%GuiMain_y% w210 h1610, %WINTITLE% ;  w478 h584
		Sleep, 1
	}
	IfWinExist, %WINTITLE%
	{
		Sleep, 1
	}
		Sleep, 500

; 매출전표/견적서 창 종료 감시: 창이 사라지면 Edit/DropDownList 초기화
SetTimer, WatchSourceWindows, 500
;~ WinActivate, ahk_exe JedaeroM.exe
;~ SoundBeep, 100, 10
;~ SoundBeep, 100, 10


IfWinExist, ahk_class TfmChitSale
{
	받는분=신흥목재카톡방 					;;교체해야하는것
	;~ 받는분=지게차피씨 					;;교체해야하는것
	상태 = 매출
	GuiControl, , 9, 매출
	ControlGetText, 배송지, TRzDBEdit14, ahk_class TfmChitSale

ControlGetText, 거래처, TRzEdit8, ahk_class TfmChitSale
ControlSetText, Edit2, %거래처%, %WINTITLE%


	if (배송지 = ""){
	ControlClick, TRzDBEdit14, ahk_class TfmChitSale
	ControlSend, TRzDBEdit14, {Home}매장출고, ahk_class TfmChitSale
	ControlFocus, TRzEdit8, ahk_class TfmChitSale
	}
	else{
	}
	Control, Style, +0x1, TRzDBEdit14, ahk_class TfmChitSale
	WinActivate, ahk_class TfmChitSale
}

else if ( WinExist("ahk_class TfmEstimate2") )
{
	;~ 받는분=신흥목재매입 					;;교체해야하는것
	받는분=김태준 					;;교체해야하는것
	상태 = 매입
		GuiControl, , 9, 매입
}

else
{
}



			;~ Sleep, 10
			;~ WinWait, s누르기
			;~ WinActivate, ahk_class TfmChitSale

return
SetControlDelay, 20

;~///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


조합1:
{
SetKeyDelay, 0
ControlsetText, edit11, 	,  %WINTITLE%
ControlGetText, 거래처명1, 	Edit2,  %WINTITLE%
ControlGetText, 배송날짜1, 	Edit3,  %WINTITLE%
ControlGetText, 출발시각1, 	Edit4,  %WINTITLE%
ControlGetText, 배송지1, 	Edit5,  %WINTITLE%
ControlGetText, 기타메모1, 	Edit6,  %WINTITLE%
ControlGetText, 내용1, 	Edit7,  %WINTITLE%
ControlGetText, 전화번호1, Edit8, %WINTITLE%
gosub, 거래처명정리


조합1내용=
(
[신흥목재 알림]
%거래처명1% 고객님 주문하신 제품이 신흥목재에 준비완료됐습니다

▶ 출 고 지 : %배송지1%

▶ 내     용 : %내용1% 외

▶ 오시는길 [카카오네비]
Https://kko.to/Uv3821BtiT
)




Controlsend, Edit11,  %조합1내용%, %WINTITLE%
;~ Controlsend, Edit11, [신흥목재 알림]{Shift}{Enter}%거래처명1% 고객님 주문하신 제품이 신흥목재에 준비완료됐습니다{Shift}{Enter}{Shift}{Enter}▶ 출 고 지 : %배송지1%{Shift}{Enter}▶ 내     용 : %내용1% 외{Shift}{Enter} ▶ 오시는길 [카카오네비]{Shift}{Enter}Https://kko.to/Uv3821BtiT , %WINTITLE%
GuiControl, enable, 문자발송1
GuiControl, disable, 문자발송2
GuiControl, disable, 완료발송1
GuiControl, disable, 완료발송2
SetKeyDelay, 1
}
return

조합2:
{
SetKeyDelay, 0
ControlsetText, edit11, 	,  %WINTITLE%
ControlGetText, 거래처명1, 	Edit2,  %WINTITLE%
ControlGetText, 배송날짜1, 	Edit3,  %WINTITLE%
ControlGetText, 출발시각1, 	Edit4,  %WINTITLE%
ControlGetText, 배송지1, 	Edit5,  %WINTITLE%
ControlGetText, 기타메모1, 	Edit6,  %WINTITLE%
ControlGetText, 내용1, 	Edit7,  %WINTITLE%
ControlGetText, 전화번호1, Edit8, %WINTITLE%
gosub, 거래처명정리


조합2내용=
(
[신흥목재 알림]
%거래처명1%  고객님 주문하신 제품이 신흥목재에서 출발했습니다

▶ 도 착 지 : %배송지1%

▶ 내     용 : %내용1% 외
)




;~ Controlsend, Edit11, [신흥목재 알림]{Shift}{Enter}%거래처명1% 고객님 주문하신 제품이 신흥목재에서 출발했습니다{Shift}{Enter}{Shift}{Enter}▶ 도 착 지 : %배송지1%{Shift}{Enter}▶ 내     용 : %내용1% 외, %WINTITLE%
Controlsend, Edit11, %조합2내용%, %WINTITLE%
GuiControl, enable, 문자발송2
GuiControl, disable, 문자발송1
GuiControl, disable, 완료발송1
GuiControl, disable, 완료발송2
SetKeyDelay, 1
}
return

방송내용:
{


ControlGetText, 거래처명1, 	Edit2,  %WINTITLE%

Controlsend, Edit12, %거래처명1%`n제품 출고해주세요`n%거래처명1%`n제품 출고해주세요`n, %WINTITLE%


	return
}

방송하기:
{

run, \\192.168.0.1\hdd1\일정표 최근\일정표220730\readerspeaker2.ahk

return
}



문자발송1:
{
WinActivate, 휴대폰과 연결
Gui, submit, nohide

ControlGetText, 전화번호1, Edit8, %WINTITLE%

if (A_UserName = "shwoodnew")
{
}

else
{

}
;~ 전화번호1=01020866129
SetKeyDelay, 2
controlsend, Edit11, {Ctrl Down}ac{Ctrl Up}, %WINTITLE%
Sleep, 300
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
Sleep, 100
	Loop, 100  ; 최대 100번 시도 (10초 타임아웃)
	{
		ImageSearch, n42x, n42y, %VirtualX%, %VirtualY%, %VirtualX2%, %VirtualY2%, *100 %A_ScriptDir%\IMAGESEARCH\sms1.bmp
		if (errorlevel = 1)
		{
			sleep 100
		}
		else if (errorlevel = 2)
		{
			msgbox, 이미지 파일을 찾을 수 없음: sms1.bmp
			break
		}
		else
		{
			break
		}
	}
	if (A_Index >= 100) {
		MsgBox, sms1.bmp 이미지를 찾을 수 없습니다 (타임아웃)
		return
	}
	;~ MouseMove, %n42x%, %n42y%
MouseGetPos, RX, RY
MouseClick, l, %n42x%, %n42y%, 3, 0
Sleep, 10
MouseClick, l, %n42x%, %n42y%, 3, 0
MouseMove, %RX%, %RY%
Sleep, 10

;~ send, {tab 3}  ; 나중에 없어질 수 도 있음

Sleep, 1000

send, {Space}{Backspace}
Sleep, 1000
send, %전화번호1%
Sleep, 500
send, {Enter}
Sleep, 500
Sleep, 2000
send, {Tab 2}
Sleep, 500
send, {Ctrl Down}v{Ctrl Up}
Sleep, 2000
send, {Tab 5}
Sleep, 500
send, {Enter}
Sleep, 500

;~ ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {tab 2}, 휴대폰과 연결
/*
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Space}{Backspace}, 휴대폰과 연결
;~ ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {tab 2}, 휴대폰과 연결
Sleep, 1000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, %전화번호1%, 휴대폰과 연결
Sleep, 500
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Enter}, 휴대폰과 연결
Sleep, 500
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Tab 2}, 휴대폰과 연결
Sleep, 500
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Ctrl Down}v{Ctrl Up}, 휴대폰과 연결
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Tab 4}, 휴대폰과 연결
Sleep, 500
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Enter}, 휴대폰과 연결
Sleep, 500
*/


ControlsetText, edit11, 	,  %WINTITLE%
GuiControl, disable, 문자발송1

SetKeyDelay, 1
}
return



문자발송2:
{


if (A_UserName = "shwoodnew")
{
}

else
{

}
;~ 전화번호1=01020866129

SetKeyDelay, 2
controlsend, Edit11, {Ctrl Down}ac{Ctrl Up}, %WINTITLE%
Sleep, 300
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
Sleep, 100
	Loop, 100  ; 최대 100번 시도 (10초 타임아웃)
	{
		ImageSearch, n42x, n42y, %VirtualX%, %VirtualY%, %VirtualX2%, %VirtualY2%, *100 %A_ScriptDir%\IMAGESEARCH\sms1.bmp
		if (errorlevel = 1)
		{
			sleep 100
		}
		else if (errorlevel = 2)
		{
			msgbox, 이미지 파일을 찾을 수 없음: sms1.bmp
			break
		}
		else
		{
			break
		}
	}
	if (A_Index >= 100) {
		MsgBox, sms1.bmp 이미지를 찾을 수 없습니다 (타임아웃)
		return
	}
	MouseGetPos, RX, RY

MouseClick, l, %n42x%, %n42y%, 3, 0
MouseMove, %RX%, %RY%
Sleep, 1000
;~ ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {tab 2}, 휴대폰과 연결
Sleep, 1000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, %전화번호1%{Enter}, 휴대폰과 연결
;~ Sleep, 1000
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Tab 2}, 휴대폰과 연결
Sleep, 500
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Ctrl Down}v{Ctrl Up}, 휴대폰과 연결
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Tab 4}, 휴대폰과 연결
Sleep, 500
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Enter}, 휴대폰과 연결
Sleep, 500
ControlsetText, edit11, 	,  %WINTITLE%
GuiControl, disable, 문자발송1

SetKeyDelay, 1
}
return


완료조합1:
{
	SetKeyDelay, 0
ControlsetText, edit11, 	,  %WINTITLE%
ControlGetText, 거래처명1, 	Edit2,  %WINTITLE%
ControlGetText, 배송날짜1, 	Edit3,  %WINTITLE%
ControlGetText, 출발시각1, 	Edit4,  %WINTITLE%
ControlGetText, 배송지1, 	Edit5,  %WINTITLE%
ControlGetText, 기타메모1, 	Edit6,  %WINTITLE%
ControlGetText, 내용1, 	Edit7,  %WINTITLE%
ControlGetText, 전화번호1, Edit8, %WINTITLE%
gosub, 거래처명정리
Controlsend, Edit11, [신흥목재 알림]{Shift}{Enter}%거래처명1% 고객님 주문하신 제품을 출하 완료 했습니다, %WINTITLE%
GuiControl, enable, 완료발송1
GuiControl, disable, 문자발송1
GuiControl, disable, 문자발송2
GuiControl, disable, 완료발송2
SetKeyDelay, 1
}
return

완료조합2:
{
	SetKeyDelay, 0
ControlsetText, edit11, 	,  %WINTITLE%
ControlGetText, 거래처명1, 	Edit2,  %WINTITLE%
ControlGetText, 배송날짜1, 	Edit3,  %WINTITLE%
ControlGetText, 출발시각1, 	Edit4,  %WINTITLE%
ControlGetText, 배송지1, 	Edit5,  %WINTITLE%
ControlGetText, 기타메모1, 	Edit6,  %WINTITLE%
ControlGetText, 내용1, 	Edit7,  %WINTITLE%
ControlGetText, 전화번호1, Edit8, %WINTITLE%
gosub, 거래처명정리
Controlsend, Edit11, [신흥목재 알림]{Shift}{Enter}%거래처명1% 고객님 주문하신 제품배송을 완료했습니다, %WINTITLE%
GuiControl, enable, 완료발송2
GuiControl, disable, 문자발송1
GuiControl, disable, 문자발송2
GuiControl, disable, 완료발송1
SetKeyDelay, 1
}
return

거래처명정리:
{

ControlGetText, 거래처명1, 	Edit2,  %WINTITLE%


;~ 거래처명1 := StrReplace(거래처명1, "(" , " ")
;~ 거래처명1 := StrReplace(거래처명1, ")" , " ")
거래처명1 := StrReplace(거래처명1, "고객님손님/배송(1)" , "")
거래처명1 := StrReplace(거래처명1, "고객님손님/배송(2)" , "")
거래처명1 := StrReplace(거래처명1, "고객님손님/절단(1)" , "")
거래처명1 := StrReplace(거래처명1, "고객님손님/절단(2)" , "")
거래처명1 := StrReplace(거래처명1, "고객님손님/절단(3)" , "")
거래처명1 := StrReplace(거래처명1, "고객님손님/절단(4)" , "")
거래처명1 := StrReplace(거래처명1, "고객님(손님)/도어" , "")
거래처명1 := StrReplace(거래처명1, "고객님(손님)/견적" , "")
거래처명1 := StrReplace(거래처명1, "고객님(손님)" , "")
거래처명1 := StrReplace(거래처명1, "고객님-손님" , "")
거래처명1 := StrReplace(거래처명1, "사장님" , "")
거래처명1 := StrReplace(거래처명1, "지붕/" , "")
거래처명1 := StrReplace(거래처명1, "님" , "")

}
return


완료발송1:
{


if (A_UserName = "shwoodnew")
{
}

else
{

}

controlsend, Edit11, {Ctrl Down}ac{Ctrl Up}, %WINTITLE%
;~ 보내는사람 := "15882100"
WinWait, %WINTITLE%,
IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
WinWaitActive, %WINTITLE%,
Sleep, 300
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
Sleep, 100
	Loop, 100  ; 최대 100번 시도 (10초 타임아웃)
	{
		ImageSearch, n42x, n42y, %VirtualX%, %VirtualY%, %VirtualX2%, %VirtualY2%, *100 %A_ScriptDir%\IMAGESEARCH\sms1.bmp
		if (errorlevel = 1)
		{
			sleep 100
		}
		else if (errorlevel = 2)
		{
			msgbox, 이미지 파일을 찾을 수 없음: sms1.bmp
			break
		}
		else
		{
			break
		}
	}
	if (A_Index >= 100) {
		MsgBox, sms1.bmp 이미지를 찾을 수 없습니다 (타임아웃)
		return
	}
MouseGetPos, RX, RY

MouseClick, l, %n42x%, %n42y%, 3, 0
MouseMove, %RX%, %RY%
;~ Sleep, 10
;~ ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {tab 2}, 휴대폰과 연결
Sleep, 1000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, %전화번호1%, 휴대폰과 연결
Sleep, 1000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Enter}, 휴대폰과 연결
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Tab 2}, 휴대폰과 연결
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Ctrl Down}v{Ctrl Up}, 휴대폰과 연결
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Tab 4}, 휴대폰과 연결
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Enter}, 휴대폰과 연결
ControlsetText, edit11, 	,  %WINTITLE%

GuiControl, disable, 완료발송1

}
return



완료발송2:
{

if (A_UserName = "shwoodnew")
{
}

else
{

}


controlsend, Edit11, {Ctrl Down}ac{Ctrl Up}, %WINTITLE%
;~ 보내는사람 := "15882100"
WinWait, %WINTITLE%,
IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
WinWaitActive, %WINTITLE%,
Sleep, 300
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
Sleep, 100
	Loop, 100  ; 최대 100번 시도 (10초 타임아웃)
	{
		ImageSearch, n42x, n42y, %VirtualX%, %VirtualY%, %VirtualX2%, %VirtualY2%, *100 %A_ScriptDir%\IMAGESEARCH\sms1.bmp
		if (errorlevel = 1)
		{
			sleep 100
		}
		else if (errorlevel = 2)
		{
			msgbox, 이미지 파일을 찾을 수 없음: sms1.bmp
			break
		}
		else
		{
			break
		}
	}
	if (A_Index >= 100) {
		MsgBox, sms1.bmp 이미지를 찾을 수 없습니다 (타임아웃)
		return
	}
MouseGetPos, RX, RY

MouseClick, l, %n42x%, %n42y%, 3, 0
MouseMove, %RX%, %RY%
;~ Sleep, 10
;~ ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {tab 2}, 휴대폰과 연결
Sleep, 1000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, %전화번호1%, 휴대폰과 연결
Sleep, 1000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Enter}, 휴대폰과 연결
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Tab 2}, 휴대폰과 연결
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Ctrl Down}v{Ctrl Up}, 휴대폰과 연결
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Tab 4}, 휴대폰과 연결
Sleep, 2000
ControlSend, Microsoft.UI.Content.DesktopChildSiteBridge1, {Enter}, 휴대폰과 연결
ControlsetText, edit11, 	,  %WINTITLE%
GuiControl, disable, 완료발송2
}

return







도어회사선택:
{
	;~ Sleep, 1000
	Gui, 2:Destroy
	Gui, 2:Default
	Gui, 2:-SysMenu
	Gui, 2:+alwaysontop
	Gui, 2:Font, S14 CDefault W700, Malgun Gothic

	Gui, 2:Add, Picture, x7 y7 w181 h56 v1color1, %A_Desktop%\오토핫키2\blue.png         ;;;;;;;;;;;;;;;;;;;;;;;;; ini 끝
	Gui, 2:Add, Picture, x7 y67 w181 h56 v1color2, %A_Desktop%\오토핫키2\green.png
	Gui, 2:Add, Picture, x7 y127 w181 h56 v1color3, %A_Desktop%\오토핫키2\red.png
	Gui, 2:Add, Button, x10 y10 w175 h50 g재현, 재현하늘창
	Gui, 2:Add, Button, x10 y70 w175 h50 g우딘, 우딘숲도어
	Gui, 2:Add, Button, x10 y130 w175 h50 g크로스, 크로스몰딩
	Gui, 2:Add, Button, x10 y200 w175 h50 g취소, 해당  없음
	Gui, 2:Show, x%Gui2_x% y%Gui2_y% w193 , 도어회사선택 ;  w478 h584
	;~ Sleep, 1000
}
return

재현:
{
	control, choosestring, 재현, ComboBox1, %WINTITLE%
	WinKill, 도어회사선택
	gui, 2:hide
gui, 2:submit
		;~ Sleep, 1000
		gosub, 재단컷
	return
}
return
우딘:
{
		control, choosestring, 우딘, ComboBox1, %WINTITLE%
	WinKill, 도어회사선택
gui, 2:hide
gui, 2:submit
		;~ Sleep, 1000
		gosub, 재단컷
	return
}
return
크로스:
{
		control, choosestring, 크로스, ComboBox1, %WINTITLE%
	WinKill, 도어회사선택
gui, 2:hide
gui, 2:submit
		;~ Sleep, 1000
		gosub, 재단컷
	return
}
return
취소:
{
		;~ Sleep, 1000

	;~ WinWait, %WINTITLE%,
	;~ IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
	;~ WinWaitActive, %WINTITLE%,
	WinKill, 도어회사선택
gui, 2:hide
gui, 2:submit

			gosub, 재단컷

	return
}
return
;~///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
재단컷:
{

	WinKill, 도어회사선택
gui, 2:hide
gui, 2:submit
	MouseMove, %Mouse_door_x%, %Mouse_door_y%
Sleep, 200
	Gui, 3:Destroy
	Gui, 3:Default
	Gui, 3:-SysMenu
	Gui, 3:+alwaysontop
	Gui, 3:Font, S14 CDefault W700, Malgun Gothic

	Gui, 3:Add, Picture, x7 y7 w181 h56 v1color1, %A_Desktop%\오토핫키2\red.png
	Gui, 3:Add, Button, x10 y10 w175 h50 g재단있음, 재단 있음
	Gui, 3:Add, Button, x10 y80 w175 h50 g재단없음, 취`       소
	Gui, 3:Show, x%Gui3_x% y%Gui3_y% w193 , 재단유무 ;  w478 h584
	Sleep, 1
	;~ Sleep, 100
}
return

재단있음:
{
	control, choosestring, 컷, ComboBox2, %WINTITLE%
	;~ WinKill, 도어회사선택
	;~ WinKill, 재단유무
	MouseMove, %Mouse_cut_x%, %Mouse_cut_y%
		;~ Sleep, 1000
gui, 2:hide
gui, 2:submit
gui, 3:hide
gui, 3:submit
	;~ WinKill, 도어회사선택
	;~ WinKill, 재단유무
	return
}
return
재단없음:
{
	;~ WinKill, 도어회사선택
	;~ WinKill, 재단유무
	MouseMove, %Mouse_cut_x%, %Mouse_cut_y%


		;~ Sleep, 1000
	;~ WinWait, %WINTITLE%,
	;~ IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
	;~ WinWaitActive, %WINTITLE%,


gui, 2:hide
gui, 2:submit
gui, 3:hide
gui, 3:submit
	;~ WinKill, 도어회사선택
	;~ WinKill, 재단유무
	return
}
return

;~///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

!+1::
추출:
{

	Gui, submit, nohide
if( 상태 = "매출")
{


ControlClick, TDBGridEh1 , ahk_class TfmChitSale,,,,x150 y32
ControlSetText, edit9, , %WINTITLE%
ControlGetText, 거래처, TRzEdit8, ahk_class TfmChitSale
ControlSetText, Edit2, %거래처%, %WINTITLE%
Gosub, UpdateRecentShipments
ControlGetText, 배송날짜, TRzDBDateTimeEdit1, ahk_class TfmChitSale

NewStr := RegExReplace(배송날짜, "-" , Replacement := "")
Number := Abs(NewStr)
요일 := Get_Weekday(Number, 1)
if (요일 = "2"){
	요일 = 월
}
else if (요일 = "3"){
	요일 = 화
}
else if (요일 = "4"){
	요일 = 수
}
else if (요일 = "5"){
	요일 = 목
}
else if (요일 = "6"){
	요일 = 금
}
else if (요일 = "7"){
	요일 = 토
}
else if (요일 = "1"){
	요일 = 일
}
else
{
}
;~ Clipboard :=

ControlSetText, Edit3, %배송날짜%`n(%요일%), %WINTITLE%

ControlGetText, 출발시각, TRzDBEdit13, ahk_class TfmChitSale
ControlSetText, Edit4, %출발시각%, %WINTITLE%
ControlGetText, 배송지, TRzDBEdit14, ahk_class TfmChitSale
ControlSetText, Edit5, %배송지%, %WINTITLE%
ControlGetText, 기타메모, TRzDBEdit12, ahk_class TfmChitSale
ControlSetText, Edit6, %기타메모%, %WINTITLE%
ControlGetText, 내용, TDBGridInplaceEdit1, ahk_class TfmChitSale

	if( (내용 = "1") or (내용 = "2") or (내용 = "3") or (내용 = "4") or (내용 = "5") or (내용 = "6") or (내용 = "7") or (내용 = "8") or (내용 = "9") or (내용 = "10") )
	{
		gosub, 추출
	}
	else
	{

	}
	Sleep, 500



ControlSetText, Edit7, %내용%, %WINTITLE%
ControlGetText, 연락처, TRzDBEdit19, ahk_class TfmChitSale
ControlSetText, Edit8, %연락처%, %WINTITLE%
}
else
{
ControlGetText, 받는분, Edit1, %WINTITLE%
ControlGetText, 거래처, TRzEdit2, ahk_class TfmEstimate2
ControlSetText, Edit2, %거래처%, %WINTITLE%
Gosub, UpdateRecentShipments
ControlGetText, 배송날짜, TRzDBDateTimeEdit1, ahk_class TfmEstimate2


;~ Clipboard := 배송날짜
NewStr := RegExReplace(배송날짜, "-" , Replacement := "")
Number := Abs(NewStr)
요일 := Get_Weekday(Number, 1)

;~ MsgBox, % 요일

if (요일 = "2"){
	요일 = 월
}
else if (요일 = "3"){
	요일 = 화
}
else if (요일 = "4"){
	요일 = 수
}
else if (요일 = "5"){
	요일 = 목
}
else if (요일 = "6"){
	요일 = 금
}
else if (요일 = "7"){
	요일 = 토
}
else if (요일 = "1"){
	요일 = 일
}
else
{
}
;~ Clipboard :=

ControlSetText, Edit3, %배송날짜%`n(%요일%), %WINTITLE%

ControlGetText, 출발시각, TRzDBEdit4, ahk_class TfmEstimate2
ControlSetText, Edit4, %출발시각%, %WINTITLE%
ControlGetText, 배송지, TRzDBEdit9, ahk_class TfmEstimate2
ControlSetText, Edit5, %배송지%, %WINTITLE%
ControlGetText, 기타메모, TRzDBEdit2, ahk_class TfmEstimate2
ControlSetText, Edit6, %기타메모%, %WINTITLE%
ControlGetText, 내용, TDBGridInplaceEdit1, ahk_class TfmEstimate2
ControlSetText, Edit7, %내용%, %WINTITLE%
ControlGetText, 연락처, TRzDBEdit7, ahk_class TfmEstimate2
ControlSetText, Edit8, %연락처%, %WINTITLE%
}


;~///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;~ OnMessage(0x0053, "WM_HELP")

GuiControl, enable, 조합
GuiControl, enable, 캘린더
GuiControl, enable, 발송1
GuiControl, enable, 발송2
GuiControl, enable, 조합1
GuiControl, enable, 조합2
GuiControl, enable, 완료조합1
GuiControl, enable, 완료조합2


MouseMove, %Mouse_extract_x%, %Mouse_extract_y%

gosub, 도어회사선택
Sleep, 1000
;~ /////////////////////////////////////////////////////////////////////////////////////////////////
;~///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}return

!+2::
조합:
{

gui, 2:hide
gui, 2:submit
gui, 3:hide
gui, 3:submit
Gui, submit, nohide
SetKeyDelay, 0

IfWinExist, ahk_class TfmChitSale
{
상태 = 매출
}
else
{
상태 = 매입
}
ControlsetText, edit9, 	,  %WINTITLE%
ControlGetText, 거래처명1, 	Edit2,  %WINTITLE%
ControlGetText, 배송날짜1, 	Edit3,  %WINTITLE%
ControlGetText, 출발시각1, 	Edit4,  %WINTITLE%
ControlGetText, 배송지1, 	Edit5,  %WINTITLE%
ControlGetText, 기타메모1, 	Edit6,  %WINTITLE%
ControlGetText, 내용1, 	Edit7,  %WINTITLE%
ControlGetText, 전화번호, 	Edit8, %WINTITLE%


if( 상태 = "매출")
{
요약=
(
□□□[Ⅰ. 출고 리스트 업]
- 거래처명 : %거래처명1%
- 연 락  처 : %연락처%
- 내       용 : %내용1% 외 건
- 출고날짜 : %배송날짜1%
- 시       각 : %출발시각1%
- 출 고  지 : %배송지1%
- 기타메모 : %기타메모1%
)

Controlsend, Edit9, %요약%, %WINTITLE%
MsgBox, , 크로스체크 필요, 도어 / 컷팅 `n 확인해주세요, 1
}
else
{

요약=
(
□□□[Ⅰ. 입하 리스트 업]
- 매입처명 : %거래처명1%
- 연 락  처 : %연락처%
- 내       용 : %내용1% 외 건
- 입하날짜 : %배송날짜1%
- 시       각 : %출발시각1%
- 입 하  지 : %배송지1%
- 기타메모 : %기타메모1%
)

Controlsend, Edit9, %요약%, %WINTITLE%
}


SetKeyDelay, 1


Sleep, 1000

}
return

!+3::
발송1:
{

gui, 2:hide
gui, 2:submit
gui, 3:hide
gui, 3:submit
;~ FileDelete, %A_MyDocuments%\7_2번째 전표.xlsx
	Gui, submit, nohide
if( 상태 = "매출")
{


WinShow, 카카오톡
Sleep, 100
	;~ WinWait, 카카오톡,
	;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	;~ WinWaitActive, 카카오톡,




if WinExist(받는분)
{

}
else
{
Sleep,50
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	Sleep,100
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100
	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
ControlSend, Edit2, %받는분%, 카카오톡
Sleep, 100
	Sleep, 1000
controlsend, EVA_Window2, {Enter}, 카카오톡
	;~ ControlFocus, RICHEDIT50W1, %받는분%
	;~ Sleep, 100
	;~ ControlSend, RICHEDIT50W1, {Space}{Backspace}, %받는분%
	;~ Sleep, 100
	;~ ControlSetText, , %요약%, %받는분%
	;~ ControlSend, , {Enter}, %받는분%
	Sleep, 50
	ControlSend, Edit2, {del 10}{Backspace 10}, 카카오톡
	Sleep, 50

}





/*

if WinExist(받는분)
{
}


else
{


Sleep,200

ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	Sleep,100
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100

	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100

	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
;~ ControlSetText, Edit2, %받는분%, 카카오톡
ControlSend, Edit2, %받는분%, 카카오톡
Sleep, 100




Sleep, 300
controlsend, Edit2, {Enter}, 카카오톡
}
;;;;

*/



winmove, %받는분%, , %WinMove_recv1_x%, %WinMove_recv1_y%




	WinGetPos, X11, Y11, , , ahk_class TfmChitSale
WinMove, ahk_class TfmChitSale, , %WinMove_sales_x%, %WinMove_sales_y%
WinShow, 카카오톡
;~ gosub, 캘린더
		gosub, 캘린더
Sleep, 200

ControlGetText, 받는분, Edit1, %WINTITLE%
;~ sleep, 100

;~ Clipboard1 := Clipboard
;~ Clipboard =

;~ WinWait, %WINTITLE%,
;~ IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
;~ WinWaitActive, %WINTITLE%,

Loop,2
{
Sleep, 100
controlsend, Edit9, {Ctrl Down}a, %WINTITLE%
Sleep, 10
controlsend, Edit9, c{Ctrl Up}, %WINTITLE%
sleep, 100
}



	;~ WinWait, ahk_class TfmChitSale,
	;~ IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	;~ WinWaitActive, ahk_class TfmChitSale,

;~ controlclick, TRzBitBtn8, ahk_class TfmChitSale
;~ Sleep, 100

WinWait, 인쇄리스트,
IfWinNotActive, 인쇄리스트, , WinActivate, 인쇄리스트,
WinWaitActive, 인쇄리스트,
	sleep,500

;~ ControlSend, TRzListBox1, {home 5}{down 20}, 인쇄리스트
ControlSend, TRzListBox1, {down 2}, 인쇄리스트
	sleep,200
ControlClick, TRzBitBtn11, 인쇄리스트
Sleep,0
WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,

;~ ~~~
sleep, 100

Control, choose, 8 , TfrxComboBox1, Preview


;~ return
;~ Loop,3
;~ {
;~ ControlClick, TToolBar1, Preview,,,,x183 y17
;~ Sleep, 100
;~ }
ControlClick, TToolBar1, Preview,,,,x534 y15
Sleep, 100


ControlGetText, 페이지, TEdit1, Preview
ControlClick, TToolBar1, Preview,,,,x416 y15

페이지 := 페이지 / 2
Sleep, 100
WinWait, %받는분%,
IfWinNotActive, %받는분%, , WinActivate, %받는분%,
WinWaitActive, %받는분%,


Sleep, 100
ControlFocus, RICHEDIT50W1, %받는분%
Sleep, 100

	ControlSend, RICHEDIT50W1,{Space}, %받는분%
Sleep, 200
	ControlSend, RICHEDIT50W1,{Backspace}, %받는분%
Sleep, 100
	ControlSetText, , ☏☏☏ %거래처명1% 매장출고 ☏☏☏, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 100

	ControlSend, RICHEDIT50W1,{Space}, %받는분%
Sleep, 200
	ControlSend, RICHEDIT50W1,{Backspace}, %받는분%
Sleep, 100
	ControlSetText, , %요약%, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 50

Sleep, 100

	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,

Sleep, 100
Send, {Home 3}
Sleep, 100
	ControlClick, TToolBar1, Preview,,,,x509 y15
Sleep, 100
Loop, %페이지% ; 매장출고
{
;~ Send, {PgDn 2}
	Sleep, 110
;~ CaptureScreen("361, 82, 1046, 1346", False, 0)
CaptureScreen(Capture_store1_x1 ", " Capture_store1_y1 ", " Capture_store1_x2 ", " Capture_store1_y2, False, 0)
;~ 491, 69, 1564, 2027
		sleep, 100
	WinWait, %받는분%,
	IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	WinWaitActive, %받는분%,
	Sleep, 100


	ControlSend, RICHEDIT50W1,{Space}, %받는분%
Sleep, 100
	ControlSend, RICHEDIT50W1,{Backspace}, %받는분%
Sleep, 100
	send, {Ctrl Down}v{Ctrl Up}
	sleep, 200
	Send, {Enter 2}
	sleep, 100

		sleep, 100

	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,

	Sleep, 200
	ControlClick, TToolBar1, Preview,,,,x509 y15
	Sleep, 100
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,
Sleep, 100

;~ ~~~

ControlClick, TToolBar1, Preview, , , ,x616 y15
sleep, 100

	WinWait, 인쇄리스트,
	IfWinNotActive, 인쇄리스트, , WinActivate, 인쇄리스트,
	WinWaitActive, 인쇄리스트,
	Sleep, 100


;~ Send, {ctrl Down}{F11}{ctrl Up}


ControlClick, TRzBitBtn1, 인쇄리스트
Sleep,200

ControlClick, Edit2, 카카오톡
ControlSend, Edit2, {Del 30}{BackSpace 30}, ahk_class EVA_Window_Dblclk
Sleep, 100


controlsend, EVA_Window2, {Ctrl}F, ahk_class EVA_Window_Dblclk
controlsend, , {Enter}, ahk_exe KakaoTalk.exe

ControlClick, TRzDBEdit12, ahk_class TfmChitSale
ControlSend, TRzDBEdit12, {Home}☏{Space 2}{Right}{f5}, ahk_class TfmChitSale
;~ ControlClick, TAdvToolBar1, ahk_class TfmChitSale,,,,x275 y10


WinMove, ahk_class TfmChitSale, , %X11%, %Y11%


}

else ; 상태 = "매입"
{

	받는분=신흥목재매입 					;;교체해야하는것
	;~ 받는분=김태준 					;;교체해야하는것
WinShow, 카카오톡

if WinExist(받는분)
{
}


else
{


Sleep,200

ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	Sleep,100
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100

	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100

	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
;~ ControlSetText, Edit2, %받는분%, 카카오톡
ControlSend, Edit2, %받는분%, 카카오톡
Sleep, 100




Sleep, 300
controlsend, Edit2, {Enter}, 카카오톡
Sleep, 300
controlsend, Edit2, {Enter}, 카카오톡
}
;;;;


winmove, %받는분%, , %WinMove_recv1_x%, %WinMove_recv1_y%


winmove, %받는분%, , %WinMove_recv2_x%, %WinMove_recv2_y%



		gosub, 캘린더3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;; 나중에 수정 ;;;;;;;;;;;;;;
Sleep, 200

ControlGetText, 받는분, Edit1, %WINTITLE%
sleep, 100re
controlsend, Edit9, {Ctrl Down}a, %WINTITLE%
Sleep, 100
controlsend, Edit9, c{Ctrl Up}, %WINTITLE%
sleep, 300






	;~ WinWait, ahk_class TfmEstimate2,
	;~ IfWinNotActive, ahk_class TfmEstimate2, , WinActivate, ahk_class TfmEstimate2,
	;~ WinWaitActive, ahk_class TfmEstimate2,

;~ controlclick, TRzBitBtn1, ahk_class TfmEstimate2
;~ Sleep, 100

WinWait, 인쇄리스트,
IfWinNotActive, 인쇄리스트, , WinActivate, 인쇄리스트,
WinWaitActive, 인쇄리스트,
	sleep,500

;~ Control, choose, 6, TRzListBox1, 인쇄리스트
;~ ControlSend, TRzListBox1, {home 5}{down 6}, 인쇄리스트
ControlSend, TRzListBox1, {down}, 인쇄리스트
	sleep,500
ControlClick, TRzBitBtn11, 인쇄리스트
Sleep,0
WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,

sleep, 100
;~ Loop,2
;~ {
;~ ControlClick, TToolBar1, Preview,,,,x183 y17
;~ Sleep, 100
;~ }
ControlClick, TToolBar1, Preview,,,,x534 y15
Sleep, 100
ControlGetText, 페이지, TEdit1, Preview
ControlClick, TToolBar1, Preview,,,,x416 y15

Sleep, 200


WinWait, %받는분%,
IfWinNotActive, %받는분%, , WinActivate, %받는분%,
WinWaitActive, %받는분%,


Sleep, 100
ControlFocus, RICHEDIT50W1, %받는분%
Sleep, 100

	ControlSend, RICHEDIT50W1,{Space}, %받는분%
Sleep, 200
	ControlSend, RICHEDIT50W1,{Backspace}, %받는분%
Sleep, 100
	ControlSetText, , ☏☏☏ %거래처명1% 매장출고 ☏☏☏, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 100

	ControlSend, RICHEDIT50W1,{Space}, %받는분%
Sleep, 200
	ControlSend, RICHEDIT50W1,{Backspace}, %받는분%
Sleep, 100
	ControlSetText, , %요약%, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 50
Sleep, 100

	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,

Loop, %페이지%
{
;~ Send, {PGDN 10}
	Sleep, 110
CaptureScreen(Capture_store2_x1 ", " Capture_store2_y1 ", " Capture_store2_x2 ", " Capture_store2_y2, False, 0) ; 매장출고  주황색
		sleep, 100
	WinWait, %받는분%,
	IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	WinWaitActive, %받는분%,
	Sleep, 100



	ControlSend, RICHEDIT50W1,{Space}, %받는분%
Sleep, 100
	ControlSend, RICHEDIT50W1,{Backspace}, %받는분%
Sleep, 100
	send, {Ctrl Down}v{Ctrl Up}
	sleep, 200
	Send, {Enter 2}
	sleep, 100



	;~ ControlSend, RICHEDIT50W1, {Space}{Backspace}, %받는분%
	;~ Sleep, 100
	;~ send, {Ctrl Down}v{Ctrl Up}
	;~ sleep, 200
	;~ Send, {Enter 2}
	;~ sleep, 100


	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,

	Sleep, 200
	ControlClick, TToolBar1, Preview,,,,x509 y15
	Sleep, 100
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,
Sleep, 100



ControlClick, TToolBar1, Preview, , , ,x616 y15
sleep, 100

	WinWait, 인쇄리스트,
	IfWinNotActive, 인쇄리스트, , WinActivate, 인쇄리스트,
	WinWaitActive, 인쇄리스트,
	Sleep, 100


;~ Send, {ctrl Down}{F11}{ctrl Up}


ControlClick, TRzBitBtn1, 인쇄리스트
Sleep,200

ControlClick, Edit2, 카카오톡
ControlSend, Edit2, {Del 30}{BackSpace 30}, ahk_class EVA_Window_Dblclk
Sleep, 100


controlsend, EVA_Window2, {Ctrl}F, ahk_class EVA_Window_Dblclk
controlsend, , {Enter}, ahk_exe KakaoTalk.exe

ControlClick, TRzDBEdit1, ahk_class TfmEstimate2
ControlSend, TRzDBEdit1, {Home}☏{f5}, ahk_class TRzDBEdit2
ControlClick, TAdvToolBar1, ahk_class TfmEstimate2,,,,x342 y10


;~ WinMove, ahk_class TfmChitSale, , %X11%, %Y11%

}
;~ Send, {ctrl Down}{F11}{ctrl Up}

}

;~ Clipboard := Clipboard1

return


배송자확인:
{
	WinKill, 도어회사선택
gui, 3:hide
gui, 3:submit
gui, 2:hide
gui, 2:submit
	MouseMove, %Mouse_delivery_x%, %Mouse_delivery_y%
Sleep, 200
	Gui, 4:Destroy
	Gui, 4:Default
	Gui, 4:-SysMenu
	Gui, 4:+alwaysontop
	Gui, 4:Font, S14 CDefault W700, Malgun Gothic

	Gui, 4:Add, Picture, x7 y7 w181 h56 v4color1, %A_Desktop%\오토핫키2\red.png
	Gui, 4:Add, Picture, y77 w181 h56 v4color2, %A_Desktop%\오토핫키2\blue.png
	Gui, 4:Add, Button, x10 y10 w175 h50 g조배송, 조 배송
	Gui, 4:Add, Button, x10 y+20 w175 h50 g여배송, 여 배송
	Gui, 4:Add, Button, x10 y+20 w175 h50 g김배송, 김 배송
	Gui, 4:Add, Button, x10 y+20 w175 h50 g취소배송, 취`       소
	Gui, 4:Show, x%Gui4_x% y%Gui4_y% w193 , 배송자 선택 ;  w478 h584
	Sleep, 1
	;~ Sleep, 100
}
return


조배송:
{
	control, choose, 2, ComboBox3, %WINTITLE%
	gui, 4:hide
	gui, 4:submit
	gosub, 발송2
}
return



여배송:
{
	control, choose, 3, ComboBox3, %WINTITLE%
	gui, 4:hide
	gui, 4:submit
	gosub, 발송2
}
return



김배송:
{
	control, choose, 4 , ComboBox3, %WINTITLE%
	gui, 4:hide
	gui, 4:submit
	gosub, 발송2
}
return



취소배송:
{
	control, choose, 1 , ComboBox3, %WINTITLE%
	gui, 4:hide
	gui, 4:submit
	gosub, 발송2
}
return





!+4::
발송2:
{
gui, 2:hide
gui, 2:submit
gui, 3:hide
gui, 3:submit
;~ FileDelete, %A_MyDocuments%\7_2번째 전표.xlsx


run, https://map.kakao.com/, , max

winshow, 카카오톡
Sleep,200



if WinExist(받는분)
{

}
else
{
Sleep,50
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	Sleep,100
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100
	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
ControlSend, Edit2, %받는분%, 카카오톡
Sleep, 100
	Sleep, 1000
controlsend, EVA_Window2, {Enter}, 카카오톡
	;~ ControlFocus, RICHEDIT50W1, %받는분%
	;~ Sleep, 100


	;~ ControlSend, RICHEDIT50W1,{Space}, %받는분%
;~ Sleep, 100
	;~ ControlSend, RICHEDIT50W1,{Backspace}, %받는분%
;~ Sleep, 100
	;~ ControlSetText, , %요약%, %받는분%
	;~ ControlSend, , {Enter}, %받는분%
	Sleep, 50
	ControlSend, Edit2, {del 10}{Backspace 10}, 카카오톡
	Sleep, 50

}


/*

if WinExist(받는분)
{
}


else
{
	;~ WinWait, 카카오톡,
	;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	;~ WinWaitActive, 카카오톡,

Sleep,200

ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	Sleep,100
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100
	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100
	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
;~ ControlSetText, Edit2, %받는분%, 카카오톡
ControlSend, Edit2, %받는분%, 카카오톡
Sleep, 100
Sleep, 300
controlsend, Edit2, {Enter}, 카카오톡
Sleep, 100
controlsend, Edit2, {Enter}, 카카오톡
}
*/
	Gui, submit, nohide
WinKill, 카카오톡 공유 - Whale,
	ControlClick, TDBGridEh1 , ahk_class TfmChitSale,,,,x150 y32
WinGetPos, X11, Y11, , , ahk_class TfmChitSale
WinMove, ahk_class TfmChitSale, , %WinMove_sales_x%, %WinMove_sales_y%

		gosub, 캘린더2
Sleep, 200

ControlGetText, 받는분, Edit1, %WINTITLE%
sleep, 100

;~ Clipboard1 := Clipboard
;~ Clipboard =

;~ WinWait, %WINTITLE%,
;~ IfWinNotActive, %WINTITLE%, , WinActivate, %WINTITLE%,
;~ WinWaitActive, %WINTITLE%,

Loop,2
{
Sleep, 100
controlsend, Edit9, {Ctrl Down}a, %WINTITLE%
Sleep, 10
controlsend, Edit9, c{Ctrl Up}, %WINTITLE%
sleep, 100
}


;~ WinShow, 카카오톡





;;;;


winmove, ahk_exe whale.exe, , %WinMove_whale_x%, %WinMove_whale_y%,
WinMaximize, ahk_exe whale.exe
Sleep, 100
;~ WinWait, 카카오톡,
;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
;~ WinWaitActive, 카카오톡,
;~ Sleep, 100
	WinWait, 카카오맵 - Whale,
	IfWinNotActive, 카카오맵 - Whale, , WinActivate, 카카오맵 - Whale,
	WinWaitActive, 카카오맵 - Whale,
Sleep, 100

ControlGetText, 배송지1, Edit5,  %WINTITLE%

ControlClick, x174 y202, 카카오맵 - Whale
Sleep, 500
send, %배송지1%
Sleep, 200
send, {Enter}
Sleep, 1000
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

Loop, 100  ; 최대 100번 시도 (10초 타임아웃)
	{
		ImageSearch, nx, ny, %VirtualX%, %VirtualY%, %VirtualX2%, %VirtualY2%, *100 %A_ScriptDir%\IMAGESEARCH\16.png

		if (errorlevel = 1)
		{
			sleep 10
		}

		else if (errorlevel = 2)
		{
			msgbox, 이미지 파일을 찾을 수 없음: 16.png
			break
		}

		else if (errorlevel = 0)
		{
			break
		}

		sleep 10
	}
if (A_Index >= 100) {
	MsgBox, 16.png 이미지를 찾을 수 없습니다 (타임아웃)
	return
}



MouseClick, l, %nx%, %ny%, , 0
Sleep, 100





;~ send, {Tab 2}{Enter}
;~ Sleep, 1000

Loop, 100  ; 최대 100번 시도 (타임아웃)
	{
		ImageSearch, nx, ny, %VirtualX%, %VirtualY%, %VirtualX2%, %VirtualY2%, *100 %A_ScriptDir%\IMAGESEARCH\17.png

		if (errorlevel = 1)
		{
			sleep 10
		}

		else if (errorlevel = 2)
		{
			msgbox, 이미지 파일을 찾을 수 없음: 17.png
			break
		}

		else if (errorlevel = 0)
		{
			break
		}

		sleep 10
	}
if (A_Index >= 100) {
	MsgBox, 이미지를 찾을 수 없습니다 (타임아웃): 17.png
	return
}



MouseClick, l, %nx%, %ny%, , 0
Sleep, 100





Loop, 100  ; 최대 100번 시도 (타임아웃)
	{
		ImageSearch, nx, ny, %VirtualX%, %VirtualY%, %VirtualX2%, %VirtualY2%, *100 %A_ScriptDir%\IMAGESEARCH\18.png

		if (errorlevel = 1)
		{
			sleep 10
		}

		else if (errorlevel = 2)
		{
			msgbox, 이미지 파일을 찾을 수 없음: 18.png
			break
		}

		else if (errorlevel = 0)
		{
			break
		}

		sleep 10
	}
if (A_Index >= 100) {
	MsgBox, 이미지를 찾을 수 없습니다 (타임아웃): 18.png
	return
}



MouseClick, l, %nx%, %ny%, , 0
Sleep, 100





;~ send, {Tab 2}{Enter}
;~ Sleep, 1000
;~ send, {Tab 1}{Enter}





WinWait, 카카오톡 공유 - Whale,
IfWinNotActive, 카카오톡 공유 - Whale, , WinActivate, 카카오톡 공유 - Whale,
WinWaitActive, 카카오톡 공유 - Whale,
Sleep, 500
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
	Loop, 100  ; 최대 100번 시도 (타임아웃)
	{
		ImageSearch, n32x, n32y, %VirtualX%, %VirtualY%, %VirtualX2%, %VirtualY2%, *100 %A_ScriptDir%\IMAGESEARCH\32.png

		if (errorlevel = 1)
		{
			sleep 10
		}

		else if (errorlevel = 2)
		{
			msgbox, 이미지 파일을 찾을 수 없음: 32.png
			break
		}

		else
		{
			break
		}

		sleep 10
	}
	if (A_Index >= 100) {
		MsgBox, 이미지를 찾을 수 없습니다 (타임아웃): 32.png
		return
	}



MouseClick, l, %n32x%, %n32y%, , 0
Sleep, 1000
send, {Tab}
ControlGetText, 받는분, Edit1, %WINTITLE%
Sleep, 500
SendInput,{Raw}%받는분%
Sleep, 200





;~ CoordMode, Mouse, Screen
	;~ Loop
	;~ {
		;~ ImageSearch, n21x_1, n21y_1, 300, 300, 600, 600, *50 *TransWhite %A_ScriptDir%\IMAGESEARCH\21_1.png

		;~ if (errorlevel = 1)
		;~ {
			;~ sleep 100
		;~ }

		;~ else if (errorlevel = 2) ; this has no matching if
		;~ {
			;~ msgbox, cant search
		;~ }

		;~ else if (errorlevel = 0) ; this doesnt either
		;~ {
			;~ break
		;~ }

		;~ sleep 100

	;~ }
/*
Sleep, 200

	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,

controlclick, TRzBitBtn8, ahk_class TfmChitSale
*/

Sleep, 100

WinWait, 인쇄리스트,
IfWinNotActive, 인쇄리스트, , WinActivate, 인쇄리스트,
WinWaitActive, 인쇄리스트,
	sleep,500

;~ Control, choose, 20, TRzListBox1, 인쇄리스트
;~ ControlSend, TRzListBox1, {home 5}{down 20}, 인쇄리스트
ControlSend, TRzListBox1, {down 2}, 인쇄리스트
	sleep,200
ControlClick, TRzBitBtn11, 인쇄리스트
Sleep,1
WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,
sleep, 100

Control, choose, 8 , TfrxComboBox1, Preview


;~ return
;~ Loop,3
;~ {
;~ ControlClick, TToolBar1, Preview,,,,x183 y17
;~ Sleep, 100
;~ }
ControlClick, TToolBar1, Preview,,,,x534 y15
Sleep, 100


ControlGetText, 페이지, TEdit1, Preview
ControlClick, TToolBar1, Preview,,,,x416 y15

페이지 := 페이지 / 2


Sleep, 200

WinWait, %받는분%,
IfWinNotActive, %받는분%, , WinActivate, %받는분%,
WinWaitActive, %받는분%,



Sleep, 100
ControlFocus, RICHEDIT50W1, %받는분%
Sleep, 100

	ControlSend, RICHEDIT50W1,{Space}, %받는분%
Sleep, 200
	ControlSend, RICHEDIT50W1,{Backspace}, %받는분%
Sleep, 100
	ControlSetText, , ☎☎☎ %거래처명1% 현장배송 ☎☎☎, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 100

	ControlSend, RICHEDIT50W1,{Space}, %받는분%
Sleep, 200
	ControlSend, RICHEDIT50W1,{Backspace}, %받는분%
Sleep, 100
	ControlSetText, , %요약%, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 50

Sleep, 100

Sleep, 100

	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,

Sleep, 100
Send, {Home 3}
	ControlClick, TToolBar1, Preview,,,,x509 y15
Loop, %페이지% ; 매장출고
{
;~ Send, {PgDn 2}
	Sleep, 110
CaptureScreen(Capture_delivery_x1 ", " Capture_delivery_y1 ", " Capture_delivery_x2 ", " Capture_delivery_y2, False, 0)  ; 배송
;~ CaptureScreen("1294, 82, 1974, 1346", False, 0)
		sleep, 100
	WinWait, %받는분%,
	IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	WinWaitActive, %받는분%,
	Sleep, 100

	ControlSend, RICHEDIT50W1,{Space}, %받는분%
Sleep, 100
	ControlSend, RICHEDIT50W1,{Backspace}, %받는분%
Sleep, 100
	send, {Ctrl Down}v{Ctrl Up}
	sleep, 200
	Send, {Enter 2}
	sleep, 100



	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,

	Sleep, 200
	ControlClick, TToolBar1, Preview,,,,x509 y15
	Sleep, 100
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;~ WinWait, Preview,
;~ IfWinNotActive, Preview, , WinActivate, Preview,
;~ WinWaitActive, Preview,
;~ Sleep, 100
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;loop end

WinWait, 카카오톡 공유 - Whale,
IfWinNotActive, 카카오톡 공유 - Whale, , WinActivate, 카카오톡 공유 - Whale,
WinWaitActive, 카카오톡 공유 - Whale,
Sleep, 300
;~ MsgBox,  %n21x_1%, %n21y_1%
;~ MouseClick, , %n21x_1%, %n21y_1%, 2, 0
;~ Sleep, 200

controlsend, , {Tab}, 카카오톡 공유 - Whale
Sleep, 200
controlsend, , {Space}, 카카오톡 공유 - Whale
Sleep, 200
controlsend, , {Tab}, 카카오톡 공유 - Whale
Sleep, 200
controlsend, , {Space}, 카카오톡 공유 - Whale

;~ Send, {ctrl Down}{F11}{ctrl Up}

ControlClick, TToolBar1, Preview, , , ,x616 y15
sleep, 100

	WinWait, 인쇄리스트,
	IfWinNotActive, 인쇄리스트, , WinActivate, 인쇄리스트,
	WinWaitActive, 인쇄리스트,
	Sleep, 100

ControlClick, TRzBitBtn1, 인쇄리스트
Sleep,200

ControlClick, EVA_ChildWindow2, 카카오톡 , , , x45 y145,
controlsend, RICHEDIT50W1, {Esc}, ahk_exe KakaoTalk.exe

controlsend, EVA_Window2, {Ctrl}F, ahk_class EVA_Window_Dblclk
controlsend, , {Enter}, ahk_exe KakaoTalk.exe

WinClose, 카카오톡 공유 - Whale


ControlClick, TRzDBEdit12, ahk_class TfmChitSale
ControlSend, TRzDBEdit12, {Home}☎{Space 2}{Right}{f5}, ahk_class TfmChitSale
;~ ControlClick, TAdvToolBar1, ahk_class TfmChitSale,,,,x275 y10


;~ WinWait, %받는분%,
;~ IfWinNotActive, %받는분%, , WinActivate, %받는분%,
;~ WinWaitActive, %받는분%,

ControlFocus, Edit2, 카카오톡
ControlSend, Edit2, {Del 30}{BackSpace 30}, ahk_class EVA_Window_Dblclk
Sleep, 100

WinMove, ahk_class TfmChitSale, , %X11%, %Y11%
SoundBeep, 500
;~ Send, {ctrl Down}{F11}{ctrl Up}

;~ Clipboard := Clipboard1


}



return




!+5::
캘린더:
{
	Loop, 30  ; 최대 30번 시도 (3초 타임아웃)
	{
		Sleep, 100
		if FileExist(A_MyDocuments "\7_2번째 전표.xml"){
			FileDelete, %A_MyDocuments%\7_2번째 전표.xml
		}else{
			break
		}
	}


if WinExist("ahk_class TfmEstimate2")
{
	gosub, 캘린더3
	return
}
else

{


ControlGetText, 거래처명1, Edit2,  %WINTITLE%

ControlGetText, 출발시각1, Edit4,  %WINTITLE%
ControlGetText, 배송지1, Edit5,  %WINTITLE%
ControlGetText, 기타메모1, Edit6,  %WINTITLE%
ControlGetText, 내용1, Edit7,  %WINTITLE%
ControlGetText, 전화번호, Edit8, %WINTITLE%
ControlGetText, 재단여부, ComboBox2, %WINTITLE%
ControlGetText, 배송자, ComboBox3, %WINTITLE%


;~ winkill, ahk_exe hcell.exe

	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
	Sleep, 200


;~ Send, {F8}
ControlClick, TRzBitBtn8, ahk_class TfmChitSale

	WinWait, 인쇄리스트,
	IfWinNotActive, 인쇄리스트, , WinActivate, 인쇄리스트,
	WinWaitActive, 인쇄리스트,
	sleep,500

send, {home}{down 18}{tab 7}{enter}
Sleep, 200


Sleep, 200
winkill, ahk_exe hcell.exe
	WinWait, Export to Excel,
	IfWinNotActive, Export to Excel, , WinActivate, Export to Excel,
	WinWaitActive, Export to Excel,
	Sleep, 200

send, {ShiftDown}{Tab}{ShiftUp}{Space}{tab}
Sleep, 200
Send, {enter}
Sleep, 200
;~ ControlSetText, edit1, %A_MyDocuments%\7_2번째 전표.xls, 다른 이름으로 저장


	WinWait, 다른 이름으로 저장,
	IfWinNotActive, 다른 이름으로 저장, , WinActivate, 다른 이름으로 저장,
	WinWaitActive, 다른 이름으로 저장,

ControlSetText, edit1, %A_MyDocuments%\7_2번째 전표.xml, 다른 이름으로 저장
Sleep, 100

Send, {tab 2}{enter}


/*
Sleep, 100

xlCSV = 6
path := A_MyDocuments . "\7_2번째 전표.xls"


run, % path

WinWait, ahk_exe hcell.exe
	WinWait, 셀,
	IfWinNotActive, 셀, , WinActivate, 셀,
	WinWaitActive, 셀,

Send, {enter}
Sleep, 1000

Send, {AltDown}v{AltUp}
	WinWait, 다른 이름으로 저장하기,
	IfWinNotActive, 다른 이름으로 저장하기, , WinActivate, 다른 이름으로 저장하기,
	WinWaitActive, 다른 이름으로 저장하기,
Sleep, 100
Control, choosestring, 엑셀 통합 문서 (*.xlsx), ComboBox2, 다른 이름으로 저장하기
Sleep, 100
ControlSetText, ComboBox1, %A_MyDocuments%\7_2번째 전표.xlsx, 다른 이름으로 저장하기
Sleep, 500

ControlFocus, Button6, 다른 이름으로 저장하기
/*
;~ send, {tab 5}{enter}
ControlClick, Button6, 다른 이름으로 저장하기
Sleep, 100

	WinWait, 다른 이름으로 저장 확인,
	IfWinNotActive, 다른 이름으로 저장 확인, , WinActivate, 다른 이름으로 저장 확인,
	WinWaitActive, 다른 이름으로 저장 확인,
	Sleep, 100
Send, {Left}{enter}
*/

;~ Sleep, 1000
	;~ winkill, ahk_exe hcell.exe
	;~ Process, close, EXCEL.EXE
Sleep, 100
SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\기록중.mp3
;~ Sleep, 2000

;~ MsgBox, ?

/*
XL=

Global XL ; 중요함
*/



	Loop, 300  ; 최대 300번 시도 (30초 타임아웃)
	{
		Sleep, 100
		if FileExist(A_MyDocuments "\7_2번째 전표.xml"){
			break
		}else{
		}
	}
	if (A_Index >= 300) {
		MsgBox, 파일 생성 대기 타임아웃: 7_2번째 전표.xml
		return
	}

;~ /*

; ;;;;;;; 파이썬 FCM 실행
EnvSet, PATH, %A_EnvPath%;C:\Users\shwoodnew\AppData\Local\Programs\Python\Python313\;C:\Users\shwoodnew\AppData\Local\Programs\Python\Python313\Scripts\
Run, python "C:\Users\shwoodnew\tms_new\send_custom_fcm.py"
; ;;;;;;; 파이썬 FCM 실행


run, \\192.168.0.1\hdd1\일정표 최근\일정표220730\readerspeaker.ahk

;~ */

Sleep, 2000
;~ path := A_MyDocuments . "\7_2번째 전표.xlsx"
path := A_MyDocuments . "\7_2번째 전표.xml"
XL=
Global XL ; 중요함

XL := ComObjCreate("Excel.Application")
XL.Workbooks.Open(path, 3, 0)
XL.Visible := false

;~ SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\1.mp3
Sleep, 1000


XL.ActiveSheet.Range("1:500").select
XL.selection.Replace("0.00","")

전표번호 := XL.ActiveSheet.Range("B2").value
총금액 := XL.ActiveSheet.Range("Q4").value
업체코드 := XL.ActiveSheet.Range("Q6").value
입금액 := XL.ActiveSheet.Range("J7").value
;~ MsgBox, % 입금액

XL.ActiveSheet.Range("1:10").Delete
XL.ActiveSheet.Range("AH:AJ").Delete
XL.ActiveSheet.Range("AD:AF").Delete
XL.ActiveSheet.Range("X:AB").Delete
XL.ActiveSheet.Range("S:V").Delete
XL.ActiveSheet.Range("N:N").Delete
XL.ActiveSheet.Range("O:P").Delete
;~ XL.ActiveSheet.Range("N:N").Delete
XL.ActiveSheet.Range("L:M").Delete
XL.ActiveSheet.Range("D:J").Delete
;~ XL.ActiveSheet.Range("F:F").Delete
;~ XL.ActiveSheet.Range("A:A").Delete
;~ XL.ActiveSheet.Range("A:A").Delete

찾는문자 := "    *** 이 하 여 백 ***"
;~ 시트이름 := XL.Page 1
범위 := XL.workSheets("page 1").Range("1:500").Find(찾는문자)
행 := 범위.Row
;~ 행 := 행 + 1
XL.ActiveSheet.Range(행 ":500").Delete
;~ XL.ActiveSheet.Range(행 ":" 열).Value :=     *** 이 하 여 백 ***
XL.ActiveSheet.Range("D:G").NumberFormat := "@"
XL.ActiveSheet.Range("B:B").NumberFormat := "@"
Loop, % 행
{
	F값 := XL.ActiveSheet.Range("F" A_Index).value
	if(F값="2100000000"){
		XL.ActiveSheet.Range("F" A_Index).value := "0"
	}
	E값 := XL.ActiveSheet.Range("E" A_Index).value
	if(E값="0.000000"){
		XL.ActiveSheet.Range("E" A_Index).value := ""
	}
}
1출발시각 := RegExReplace(출발시각1, "[0-9]" , "")


if (1출발시각 = "::")
{
	RegExMatch(출발시각1, "(.*):(.*):(.*)", 1time)
	출발시각1 = % 1time1 "시" 1time2 "출"
}
else
{
}

gui, Submit, nohide

if (ddl = "예림"){
	도어회사 = 예
	}
else if (ddl = "우딘"){
	도어회사 = 우
	}
else if (ddl = "재현"){
	도어회사 = 재
	}
else if (ddl = "크로스"){
	도어회사 = 크
	}
else
{
	도어회사 =
}

gui, Submit, nohide

if (ddl2 = "컷"){
	재단여부 = 컷
	}
else
{
	재단여부 =
}

거래처명1 := StrReplace(거래처명1, "주식회사 " , "")
거래처명1 := StrReplace(거래처명1, "(주)" , "")
거래처명1 := StrReplace(거래처명1, " 주식회사" , "")
거래처명1 := StrReplace(거래처명1, "주식회사" , "")
거래처명1 := StrReplace(거래처명1, "지붕/" , "")
/*
파일이름1 := "A" 배송날짜 "_B" 출발시각1 "_C" 거래처명1 "_D" 배송지1 "_E" 기타메모1 "_V" 재단여부 "_G" 도어회사 "_T" 배송자 "_Y"

;~ StringReplace, 파일이름, %%파일이름%%, ,/'{}[]*&^$#@! , " ",
파일이름1 := StrReplace(파일이름1, "/" , ",")
파일이름1 := StrReplace(파일이름1, "\" , ",")
파일이름1 := StrReplace(파일이름1, ":" , ",")
파일이름1 := StrReplace(파일이름1, "*" , ",")
파일이름1 := StrReplace(파일이름1, "?" , ",")
파일이름1 := StrReplace(파일이름1, "<" , ",")
파일이름1 := StrReplace(파일이름1, ">" , ",")
파일이름1 := StrReplace(파일이름1, "|" , ",")
파일이름1 := StrReplace(파일이름1, "." , ",")
파일이름1 := StrReplace(파일이름1, "[" , ",")
파일이름1 := StrReplace(파일이름1, "]" , ",")
파일이름1 := StrReplace(파일이름1, " " , ",")

;~ MsgBox, % 파일이름1
;~ return
*/

;~ MsgBox, %배송날짜%', '%출발시각1%', '%거래처명1%', '매장출고', '%기타메모1%', '%재단여부%', '%도어회사%', '%배송자%', '%전표번호%', '%전화번호%', 'Y', %총금액%, %입금액%, %업체코드%



CONT1=
CONT=



; 1-1단계: 삭제 전에 값을 먼저 조회해서 변수에 저장
selectQuery =
(
SELECT image, order_image FROM tms WHERE ID = '%전표번호%';
)
selectResult := dbQuery(myDB, selectQuery)
if(errorCheck(selectResult)){
    MsgBox, % "조회 ErrorCode: " selectResult[2] ", Error : " selectResult[3]
    return
}

; 조회된 값을 변수에 저장 (dbQuery는 2차원 배열 반환: selectResult[행번호][컬럼번호])
if(selectResult != "" && selectResult.MaxIndex() >= 1){
    image := selectResult[1][1]           ; 첫번째 행, 첫번째 컬럼 (image)
    order_image := selectResult[1][2]     ; 첫번째 행, 두번째 컬럼 (order_image)

    ; ★ 수정: 명시적 문자열 연결 연산자 . 사용
    if (image != "" && image != "NULL") {
        imageValue := "'" . image . "'"
    } else {
        imageValue := "NULL"
    }

    if (order_image != "" && order_image != "NULL") {
        order_imageValue := "'" . order_image . "'"
    } else {
        order_imageValue := "NULL"
    }

    ; 디버깅용 - 실제 값 확인
    ;~ MsgBox, % "image 원본: [" . image . "]`norder_image 원본: [" . order_image . "]`n`nimageValue: " . imageValue . "`norder_imageValue: " . order_imageValue
} else {
    ; 조회 결과가 없으면 NULL로 설정
    imageValue := "NULL"
    order_imageValue := "NULL"
}

; 1-2단계: DELETE 실행
deleteQuery =
(
DELETE FROM tms WHERE ID = '%전표번호%';
)
result := dbQuery(myDB, deleteQuery)
if(errorCheck(result)){
    MsgBox, % "tms 삭제 ErrorCode: " result[2] ", Error : " result[3]
}

; 2단계: 새로운 데이터 삽입 (★ %imageValue%, %order_imageValue% 사용)
myQuery =
(
INSERT INTO tms (날짜, 시간, 업체, 출고지, 비고, 절단, 도어, 배송자, ID, 전화번호, 상태, 총금액, 입금액, 업체코드, image, order_image)
VALUES ('%배송날짜%', '%출발시각1%', '%거래처명1%', '%배송지1%', '%기타메모1%', '%재단여부%', '%도어회사%', '%배송자%', '%전표번호%', '%전화번호%', 'Y', %총금액%, %입금액%, %업체코드%, %imageValue%, %order_imageValue%);
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "2_2 ErrorCode: " result[2] ", Error : " result[3]
}

;~ MsgBox, 끝
CONT1=
CONT=


; 0단계: 기존 임시 테이블 삭제
myQuery =
(
DROP TEMPORARY TABLE IF EXISTS temp_new_data;
)
result := dbQuery(myDB, myQuery)

; 1단계: 원본 테이블 구조로 임시 테이블 생성
myQuery =
(
CREATE TEMPORARY TABLE temp_new_data LIKE tms_list;
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "임시 테이블 생성 ErrorCode: " result[2] ", Error : " result[3]
    return
}

; 2단계: 엑셀 데이터 읽기 및 임시 테이블에 삽입
행마1 := 행 - 1
행마2 := 행 - 2

if(행마2!=0){
    Loop, % 행마2
    {
        pk := XL.ActiveSheet.Range("B" A_index).value
        if(pk=""){
            pk := "NULL"
        }else{
            pk := "'" pk "'"
        }

        내용 := XL.ActiveSheet.Range("C" A_index).value
        if(내용=""){
            내용 := "NULL"
        }else{
            내용 := "'" StrReplace(내용, "'", "''") "'"
        }

        수량 := XL.ActiveSheet.Range("D" A_index).value
        수량 := RemoveDecimal(수량)
        if(수량=""){
            수량 := 0
        }

        단가 := XL.ActiveSheet.Range("E" A_index).value
        단가 := RemoveDecimal(단가)
        if(단가=""){
            단가 := "NULL"
        }

        공급대가 := XL.ActiveSheet.Range("I" A_index).value
        공급대가 := RemoveDecimal(공급대가)
        if(공급대가=""){
            공급대가 := "NULL"
        }

        pdtcode := XL.ActiveSheet.Range("G" A_index).value
        pdtcode := RemoveDecimal(pdtcode)
        if(pdtcode="2100000000"){
            pdtcode := 0
        }

        비고 := XL.ActiveSheet.Range("F" A_index).value
        if(비고=""){
            비고 := "NULL"
        }else{
            비고 := "'" StrReplace(비고, "'", "''") "'"
        }

        no := XL.ActiveSheet.Range("H" A_index).value

        CONT := "(" 전표번호 ", " pk ", NULL, " 내용 ", " 수량 ", " 단가 ", " 공급대가 ", " pdtcode ", " 비고 ", " no "),`n"
        CONT1 .= CONT

        if(행마2 = A_Index){
            break
        }
    }
}

; 마지막 행 추가
pk := XL.ActiveSheet.Range("B" 행마1).value
if(pk=""){
    pk := "NULL"
}else{
    pk := "'" pk "'"
}

내용 := XL.ActiveSheet.Range("C" 행마1).value
if(내용=""){
    내용 := "NULL"
}else{
    내용 := "'" StrReplace(내용, "'", "''") "'"
}

수량 := XL.ActiveSheet.Range("D" 행마1).value
수량 := RemoveDecimal(수량)
if(수량=""){
    수량 := 0
}

단가 := XL.ActiveSheet.Range("E" 행마1).value
단가 := RemoveDecimal(단가)
if(단가=""){
    단가 := "NULL"
}

공급대가 := XL.ActiveSheet.Range("I" 행마1).value
공급대가 := RemoveDecimal(공급대가)
if(공급대가=""){
    공급대가 := "NULL"
}

pdtcode := XL.ActiveSheet.Range("G" 행마1).value
pdtcode := RemoveDecimal(pdtcode)
if(pdtcode="2100000000"){
    pdtcode := 0
}

비고 := XL.ActiveSheet.Range("F" 행마1).value
if(비고=""){
    비고 := "NULL"
}else{
    비고 := "'" StrReplace(비고, "'", "''") "'"
}

no := XL.ActiveSheet.Range("H" 행마1).value

CONT := "(" 전표번호 ", " pk ", NULL, " 내용 ", " 수량 ", " 단가 ", " 공급대가 ", " pdtcode ", " 비고 ", " no ")"
CONT1 .= CONT

; 3단계: 임시 테이블에 새 데이터 삽입
myQuery =
(
INSERT INTO temp_new_data (ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no)
VALUES
%CONT1%
;
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "임시 테이블 삽입 ErrorCode: " result[2] ", Error : " result[3] "`n`n쿼리>`n" myQuery
    return
}

; 4단계: '출' 값 복사 - 수량도 동일해야 함!
myQuery =
(
UPDATE temp_new_data t
SET t.출 = (
    SELECT o.출
    FROM tms_list o
    WHERE o.ID = t.ID
        AND o.내용 = t.내용
        AND o.수량 = t.수량
        AND o.pdt_code = t.pdt_code
        AND COALESCE(o.비고, '') = COALESCE(t.비고, '')
        AND o.출 IS NOT NULL
    ORDER BY ABS(o.no - t.no), o.no
    LIMIT 1 );
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "'출' 값 복사 ErrorCode: " result[2] ", Error : " result[3]
    return
}

; 5단계: 해당 ID의 모든 기존 데이터 삭제
myQuery =
(
DELETE FROM tms_list WHERE ID = '%전표번호%';
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "기존 데이터 삭제 ErrorCode: " result[2] ", Error : " result[3]
    return
}

; 6단계: 임시 테이블의 모든 데이터를 원본 테이블에 삽입
myQuery =
(
INSERT INTO tms_list (ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no)
SELECT ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no
FROM temp_new_data;
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "데이터 삽입 ErrorCode: " result[2] ", Error : " result[3]
    return
}

; 7단계: 임시 테이블 삭제
myQuery =
(
DROP TEMPORARY TABLE IF EXISTS temp_new_data;
)
result := dbQuery(myDB, myQuery)

;~ MsgBox, % "데이터 처리 완료!"


;~ XL.ActiveWorkbook.Save()
wb := ""
ws := ""
XL.ActiveWorkbook.Close(0)
XL.Quit()
XL := ""
	/*
	ControlClick TRzListBox1, 인쇄리스트, , ,, x189 y281 ; 연습 4
ControlClick, TRzBitBtn1, 인쇄리스트
*/

Sleep, 100


;~ MsgBox, , ,적성완료, 0.8
;~ Sleep, 800

;~ Sleep, 1000
	;~ winkill, ahk_exe hcell.exe
	;~ Process, close, EXCEL.EXE
Sleep, 100



Sleep, 100



}
}
return


; 숫자를 정수로 변환하는 함수
RemoveDecimal(Number) {
    return Floor(Number)
}


Pause::
초기화:
GuiClose:
{
;~ Process, close, EXCEL.EXE
;~ MsgBox, 끝
; 리소스 정리는 OnExit의 CleanUpOnExit()에서 처리됨
ExitApp
return
}

; 매출전표(TfmChitSale)/견적서(TfmEstimate2) 창이 모두 사라지면
; Edit 및 DropDownList 컨트롤을 빈 값으로 초기화한다.
WatchSourceWindows:
{
	global WatchSourceWasPresent, 상태
	isPresent := ( WinExist("ahk_class TfmChitSale") or WinExist("ahk_class TfmEstimate2") )
	if ( WatchSourceWasPresent && !isPresent )
	{
		GuiControl, , 1,
		GuiControl, , 2,
		GuiControl, , 3,
		GuiControl, , 4,
		GuiControl, , 5,
		GuiControl, , 6,
		GuiControl, , 7,
		GuiControl, , 8,
		GuiControl, , 10,
		GuiControl, , 11,
		GuiControl, Choose, ddl, 0
		GuiControl, Choose, ddl2, 0
		GuiControl, Choose, trans, 0
		IfWinExist, 도어회사선택
			WinClose, 도어회사선택
		IfWinExist, 재단유무
			WinClose, 재단유무
		IfWinExist, 배송자 선택
			WinClose, 배송자 선택
		Gui, ListView, RecentShipmentsLV
		LV_Delete()
	}
	; 매입/매출 구분 표시 (v9) 를 항상 현재 창 상태에 동기화
	if ( WinExist("ahk_class TfmChitSale") )
	{
		상태 := "매출"
		GuiControl, , 9, 매출
	}
	else if ( WinExist("ahk_class TfmEstimate2") )
	{
		상태 := "매입"
		GuiControl, , 9, 매입
	}
	else
	{
		GuiControl, , 9,
	}
	WatchSourceWasPresent := isPresent
}
return

; fb_chittop 에서 현재 거래처(G_NAME)와 100% 일치하는 CT_DATE, CT_NO 목록 조회
UpdateRecentShipments:
{
	global myDB, 거래처
	Gui, ListView, RecentShipmentsLV
	LV_Delete()
	if ( 거래처 = "" )
	{
		LV_Add("", "(거래처 없음)", "")
		return
	}
	; SQL injection 방지: 작은따옴표 이스케이프
	safeName := StrReplace(거래처, "'", "''")
	myQuery := "SELECT CT_DATE, CT_NO FROM fb_chittop WHERE G_NAME = '" . safeName . "' ORDER BY CT_DATE DESC, CT_NO DESC LIMIT 20;"
	shipmentResult := dbQuery(myDB, myQuery)
	if ( errorCheck(shipmentResult) )
	{
		LV_Add("", "조회 오류", shipmentResult[3])
		return
	}
	rowCount := 0
	if ( IsObject(shipmentResult) )
		rowCount := shipmentResult.MaxIndex()
	if ( rowCount = "" || rowCount < 1 )
	{
		LV_Add("", "(결과 없음)", "거래처=" . 거래처)
		return
	}
	Loop, % rowCount
	{
		rawDate := shipmentResult[A_Index][1]
		; YYYY-MM-DD → MM-DD
		shortDate := ( StrLen(rawDate) >= 10 ) ? SubStr(rawDate, 6, 5) : rawDate
		LV_Add("", shortDate, shipmentResult[A_Index][2])
	}
	LV_ModifyCol(1, 50)
	LV_ModifyCol(2, 115)
}
return

; ListView 셀 더블클릭 시 해당 셀의 값을 클립보드에 복사
RecentShipmentsEvent:
{
	if ( A_GuiEvent != "DoubleClick" )
		return
	Gui, ListView, RecentShipmentsLV
	row := A_EventInfo
	if ( row < 1 )
		return
	; 마우스 위치에서 클릭한 열 판별
	MouseGetPos,,,, ctrl
	LV_GetText(col1, row, 1)
	LV_GetText(col2, row, 2)
	; 마우스 X 좌표로 열 판단
	CoordMode, Mouse, Client
	MouseGetPos, mx, my
	CoordMode, Mouse, Screen
	; 첫 번째 컬럼 너비 90 기준으로 분기
	GuiControlGet, lvPos, Pos, RecentShipmentsLV
	relX := mx - lvPosX
	if ( relX < 90 )
		Clipboard := col1
	else
		Clipboard := col2
	ToolTip, % "복사됨: " . Clipboard
	SetTimer, RemoveShipmentTooltip, -1200
}
return

RemoveShipmentTooltip:
ToolTip
return



!+6::
캘린더2:
{
		a=0
	Loop, 30  ; 최대 30번 시도 (3초 타임아웃)
	{
		a++
		Sleep, 100
		if FileExist(A_MyDocuments "\7_2번째 전표.xml"){
		FileDelete, %A_MyDocuments%\7_2번째 전표.xml
		}else{
			break
		}
		Sleep, 100

		if(a>=10)
		{
			Process, close, EXCEL.EXE
			winkill, ahk_class XLMAIN
			WinKill, ahk_exe EXCEL.EXE
		}



	}


ControlGetText, 거래처명1, Edit2,  %WINTITLE%
;~ ControlGetText, 배송날짜1, Edit3,  %WINTITLE%
ControlGetText, 출발시각1, Edit4,  %WINTITLE%
ControlGetText, 배송지1, Edit5,  %WINTITLE%
ControlGetText, 기타메모1, Edit6,  %WINTITLE%
ControlGetText, 내용1, Edit7,  %WINTITLE%
ControlGetText, 전화번호, Edit8, %WINTITLE%
ControlGetText, 재단여부, ComboBox2, %WINTITLE%

ControlGetText, 배송자, ComboBox3, %WINTITLE%

;~ winkill, ahk_exe hcell.exe


	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
	Sleep, 200


;~ Send, {F8}
ControlClick, TRzBitBtn8, ahk_class TfmChitSale

	WinWait, 인쇄리스트,
	IfWinNotActive, 인쇄리스트, , WinActivate, 인쇄리스트,
	WinWaitActive, 인쇄리스트,
	sleep,500

send, {home}{down 18}{tab 7}{enter}
Sleep, 200


Sleep, 200
winkill, ahk_exe hcell.exe
	WinWait, Export to Excel,
	IfWinNotActive, Export to Excel, , WinActivate, Export to Excel,
	WinWaitActive, Export to Excel,
	Sleep, 200

send, {ShiftDown}{Tab}{ShiftUp}{Space}{tab}
Sleep, 200
Send, {enter}
Sleep, 200
;~ ControlSetText, edit1, %A_MyDocuments%\7_2번째 전표.xls, 다른 이름으로 저장


	WinWait, 다른 이름으로 저장,
	IfWinNotActive, 다른 이름으로 저장, , WinActivate, 다른 이름으로 저장,
	WinWaitActive, 다른 이름으로 저장,

ControlSetText, edit1, %A_MyDocuments%\7_2번째 전표.xml, 다른 이름으로 저장
Sleep, 100

Send, {tab 2}{enter}


Sleep, 100
;~ SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\기록중.mp3



	Loop, 300  ; 최대 300번 시도 (30초 타임아웃)
	{
		Sleep, 100
		if FileExist(A_MyDocuments "\7_2번째 전표.xml"){
			break
		}else{
		}
	}
	if (A_Index >= 300) {
		MsgBox, 파일 생성 대기 타임아웃: 7_2번째 전표.xml
		return
	}



; ;;;;;;; 파이썬 FCM 실행
EnvSet, PATH, %A_EnvPath%;C:\Users\shwoodnew\AppData\Local\Programs\Python\Python313\;C:\Users\shwoodnew\AppData\Local\Programs\Python\Python313\Scripts\
Run, python "C:\Users\shwoodnew\tms_new\send_custom_fcm.py"
; ;;;;;;; 파이썬 FCM 실행


run, \\192.168.0.1\hdd1\일정표 최근\일정표220730\readerspeaker.ahk
Sleep, 2000
;~ path := A_MyDocuments . "\7_2번째 전표.xlsx"
path := A_MyDocuments . "\7_2번째 전표.xml"

Global XL ; 중요함

XL := ComObjCreate("Excel.Application")
XL.Workbooks.Open(path, 3, 0)
XL.Visible := false



;~ SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\1.mp3
Sleep, 1000

XL.ActiveSheet.Range("1:500").select
XL.selection.Replace("0.00","")

전표번호 := XL.ActiveSheet.Range("B2").value
총금액 := XL.ActiveSheet.Range("Q4").value
업체코드 := XL.ActiveSheet.Range("Q6").value
입금액 := XL.ActiveSheet.Range("J7").value
;~ MsgBox, % 입금액
XL.ActiveSheet.Range("1:10").Delete
XL.ActiveSheet.Range("AH:AJ").Delete
XL.ActiveSheet.Range("AD:AF").Delete
XL.ActiveSheet.Range("X:AB").Delete
XL.ActiveSheet.Range("S:V").Delete
XL.ActiveSheet.Range("N:N").Delete
XL.ActiveSheet.Range("O:P").Delete
;~ XL.ActiveSheet.Range("N:N").Delete
XL.ActiveSheet.Range("L:M").Delete
XL.ActiveSheet.Range("D:J").Delete
;~ XL.ActiveSheet.Range("F:F").Delete
;~ XL.ActiveSheet.Range("A:A").Delete

찾는문자 := "    *** 이 하 여 백 ***"
;~ 시트이름 := XL.Page 1
범위 := XL.workSheets("page 1").Range("1:500").Find(찾는문자)
행 := 범위.Row
;~ 행 := 행 + 1
XL.ActiveSheet.Range(행 ":500").Delete
;~ XL.ActiveSheet.Range(행 ":" 열).Value :=     *** 이 하 여 백 ***
XL.ActiveSheet.Range("D:G").NumberFormat := "@"
XL.ActiveSheet.Range("B:B").NumberFormat := "@"
Loop, % 행
{
	F값 := XL.ActiveSheet.Range("F" A_Index).value
	if(F값="2100000000"){
		XL.ActiveSheet.Range("F" A_Index).value := "0"
	}
	E값 := XL.ActiveSheet.Range("E" A_Index).value
	if(E값="0.000000"){
		XL.ActiveSheet.Range("E" A_Index).value := ""
	}
}
1출발시각 := RegExReplace(출발시각1, "[0-9]" , "")



if (1출발시각 = "::")
{
	RegExMatch(출발시각1, "(.*):(.*):(.*)", 1time)
	출발시각1 = % 1time1 "시" 1time2 "출"
}
else
{
}

gui, Submit, nohide

if (ddl = "예림"){
	도어회사 = 예
	}
else if (ddl = "우딘"){
	도어회사 = 우
	}
else if (ddl = "재현"){
	도어회사 = 재
	}
else if (ddl = "크로스"){
	도어회사 = 크
	}
else
{
	도어회사 =
}


gui, Submit, nohide

if (ddl2 = "컷"){
	재단여부 = 컷
	}
else
{
	재단여부 =
}

거래처명1 := StrReplace(거래처명1, "주식회사 " , "")
거래처명1 := StrReplace(거래처명1, "(주)" , "")
거래처명1 := StrReplace(거래처명1, " 주식회사" , "")
거래처명1 := StrReplace(거래처명1, "주식회사" , "")
거래처명1 := StrReplace(거래처명1, "지붕/" , "")

/*
파일이름1 := "A" 배송날짜 "_B" 출발시각1 "_C" 거래처명1 "_D" 배송지1 "_E" 기타메모1 "_V" 재단여부 "_G" 도어회사 "_T" 배송자 "_Y"

;~ StringReplace, 파일이름, %%파일이름%%, ,/'{}[]*&^$#@! , " ",

파일이름1 := StrReplace(파일이름1, "/" , ",")
파일이름1 := StrReplace(파일이름1, "\" , ",")
파일이름1 := StrReplace(파일이름1, ":" , ",")
파일이름1 := StrReplace(파일이름1, "*" , ",")
파일이름1 := StrReplace(파일이름1, "?" , ",")
파일이름1 := StrReplace(파일이름1, "<" , ",")
파일이름1 := StrReplace(파일이름1, ">" , ",")
파일이름1 := StrReplace(파일이름1, "[" , ",")
파일이름1 := StrReplace(파일이름1, "]" , ",")kk
파일이름1 := StrReplace(파일이름1, "|" , ",")
파일이름1 := StrReplace(파일이름1, "." , ",")
파일이름1 := StrReplace(파일이름1, " " , ",")
*/



;~ MsgBox, '%배송날짜%', '%출발시각1%', '%거래처명1%', '%배송지1%', '%기타메모1%', '%재단여부%', '%도어회사%', '%배송자%', '%전표번호%', '%전화번호%', 'Y', %총금액%, %입금액%, %업체코드%




CONT1=
CONT=

; DELETE 전에 기존 image, order_image 값 조회
saved_image_detail := ""
saved_order_image_detail := ""
myQuery_backup_detail =
(
SELECT image, order_image FROM tms WHERE ID = '%전표번호%';
)
result_backup_detail := dbQuery(myDB, myQuery_backup_detail)
if(!errorCheck(result_backup_detail)){
    if(result_backup_detail.MaxIndex() >= 1){
        saved_image_detail := result_backup_detail[1][1]
        saved_order_image_detail := result_backup_detail[1][2]
    }
}

myQuery =
(
DELETE FROM tms WHERE ID = '%전표번호%';
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "tms 삭제 ErrorCode: " result[2] ", Error : " result[3]
}

; image, order_image SQL 값 처리
if(saved_image_detail = ""){
    saved_image_detail_sql := "NULL"
}else{
    saved_image_detail_sql := "'" saved_image_detail "'"
}
if(saved_order_image_detail = ""){
    saved_order_image_detail_sql := "NULL"
}else{
    saved_order_image_detail_sql := "'" saved_order_image_detail "'"
}

; 새로운 데이터 삽입
myQuery =
(
INSERT INTO tms (날짜, 시간, 업체, 출고지, 비고, 절단, 도어, 배송자, ID, 전화번호, 상태, 총금액, 입금액, 업체코드, image, order_image)
VALUES ('%배송날짜%', '%출발시각1%', '%거래처명1%', '%배송지1%', '%기타메모1%', '%재단여부%', '%도어회사%', '%배송자%', '%전표번호%', '%전화번호%', 'Y', %총금액%, %입금액%, %업체코드%, %saved_image_detail_sql%, %saved_order_image_detail_sql%);
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "2_5 ErrorCode: " result[2] ", Error : " result[3]
}else{
}

CONT1=
CONT=


; 0단계: 기존 임시 테이블 삭제
myQuery =
(
DROP TEMPORARY TABLE IF EXISTS temp_new_data;
)
result := dbQuery(myDB, myQuery)

; 1단계: 원본 테이블 구조로 임시 테이블 생성
myQuery =
(
CREATE TEMPORARY TABLE temp_new_data LIKE tms_list;
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "임시 테이블 생성 ErrorCode: " result[2] ", Error : " result[3]
    return
}

; 2단계: 엑셀 데이터 읽기 및 임시 테이블에 삽입
행마1 := 행 - 1
행마2 := 행 - 2

if(행마2!=0){
    Loop, % 행마2
    {
        pk := XL.ActiveSheet.Range("B" A_index).value
        if(pk=""){
            pk := "NULL"
        }else{
            pk := "'" pk "'"
        }

        내용 := XL.ActiveSheet.Range("C" A_index).value
        if(내용=""){
            내용 := "NULL"
        }else{
            내용 := "'" StrReplace(내용, "'", "''") "'"
        }

        수량 := XL.ActiveSheet.Range("D" A_index).value
        수량 := RemoveDecimal(수량)
        if(수량=""){
            수량 := 0
        }

        단가 := XL.ActiveSheet.Range("E" A_index).value
        단가 := RemoveDecimal(단가)
        if(단가=""){
            단가 := "NULL"
        }

        공급대가 := XL.ActiveSheet.Range("I" A_index).value
        공급대가 := RemoveDecimal(공급대가)
        if(공급대가=""){
            공급대가 := "NULL"
        }

        pdtcode := XL.ActiveSheet.Range("G" A_index).value
        pdtcode := RemoveDecimal(pdtcode)
        if(pdtcode="2100000000"){
            pdtcode := 0
        }

        비고 := XL.ActiveSheet.Range("F" A_index).value
        if(비고=""){
            비고 := "NULL"
        }else{
            비고 := "'" StrReplace(비고, "'", "''") "'"
        }

        no := XL.ActiveSheet.Range("H" A_index).value

        CONT := "(" 전표번호 ", " pk ", NULL, " 내용 ", " 수량 ", " 단가 ", " 공급대가 ", " pdtcode ", " 비고 ", " no "),`n"
        CONT1 .= CONT

        if(행마2 = A_Index){
            break
        }
    }
}

; 마지막 행 추가
pk := XL.ActiveSheet.Range("B" 행마1).value
if(pk=""){
    pk := "NULL"
}else{
    pk := "'" pk "'"
}

내용 := XL.ActiveSheet.Range("C" 행마1).value
if(내용=""){
    내용 := "NULL"
}else{
    내용 := "'" StrReplace(내용, "'", "''") "'"
}

수량 := XL.ActiveSheet.Range("D" 행마1).value
수량 := RemoveDecimal(수량)
if(수량=""){
    수량 := 0
}

단가 := XL.ActiveSheet.Range("E" 행마1).value
단가 := RemoveDecimal(단가)
if(단가=""){
    단가 := "NULL"
}

공급대가 := XL.ActiveSheet.Range("I" 행마1).value
공급대가 := RemoveDecimal(공급대가)
if(공급대가=""){
    공급대가 := "NULL"
}

pdtcode := XL.ActiveSheet.Range("G" 행마1).value
pdtcode := RemoveDecimal(pdtcode)
if(pdtcode="2100000000"){
    pdtcode := 0
}

비고 := XL.ActiveSheet.Range("F" 행마1).value
if(비고=""){
    비고 := "NULL"
}else{
    비고 := "'" StrReplace(비고, "'", "''") "'"
}

no := XL.ActiveSheet.Range("H" 행마1).value

CONT := "(" 전표번호 ", " pk ", NULL, " 내용 ", " 수량 ", " 단가 ", " 공급대가 ", " pdtcode ", " 비고 ", " no ")"
CONT1 .= CONT

; 3단계: 임시 테이블에 새 데이터 삽입
myQuery =
(
INSERT INTO temp_new_data (ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no)
VALUES
%CONT1%
;
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "임시 테이블 삽입 ErrorCode: " result[2] ", Error : " result[3] "`n`n쿼리>`n" myQuery
    return
}

; 4단계: '출' 값 복사 - 수량도 동일해야 함!
myQuery =
(
UPDATE temp_new_data t
SET t.출 = (
    SELECT o.출
    FROM tms_list o
    WHERE o.ID = t.ID
        AND o.내용 = t.내용
        AND o.수량 = t.수량
        AND o.pdt_code = t.pdt_code
        AND COALESCE(o.비고, '') = COALESCE(t.비고, '')
        AND o.출 IS NOT NULL
    ORDER BY ABS(o.no - t.no), o.no
    LIMIT 1 );
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "'출' 값 복사 ErrorCode: " result[2] ", Error : " result[3]
    return
}

; 5단계: 해당 ID의 모든 기존 데이터 삭제
myQuery =
(
DELETE FROM tms_list WHERE ID = '%전표번호%';
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "기존 데이터 삭제 ErrorCode: " result[2] ", Error : " result[3]
    return
}

; 6단계: 임시 테이블의 모든 데이터를 원본 테이블에 삽입
myQuery =
(
INSERT INTO tms_list (ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no)
SELECT ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no
FROM temp_new_data;
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "데이터 삽입 ErrorCode: " result[2] ", Error : " result[3]
    return
}

; 7단계: 임시 테이블 삭제
myQuery =
(
DROP TEMPORARY TABLE IF EXISTS temp_new_data;
)
result := dbQuery(myDB, myQuery)

;~ MsgBox, % "데이터 처리 완료!"





;~ XL.ActiveWorkbook.Save()
wb := ""
ws := ""
XL.ActiveWorkbook.Close(0)
XL.Quit()
XL := ""


Sleep, 100


;~ MsgBox, , ,적성완료, 0.8
;~ Sleep, 800

;~ Sleep, 1000
	;~ winkill, ahk_exe hcell.exe
	;~ Process, close, EXCEL.EXE
Sleep, 100
MsgBox, , ,거래처원장 상세 완료, 0.8


return
}






















거래처원장_상세:
{


    Loop, 10
    {
    Process, close, EXCEL.EXE
    winkill, ahk_class XLMAIN
    WinKill, ahk_exe EXCEL.EXE
    }
    XL:=""

	ControlClick, TAdvOfficePager1, ahk_class TfmMain,,,,x154 y17
    Sleep, 500

	ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x195 y15
    Sleep, 3000



Loop, 60  ; 최대 60번 시도 (Excel 창 대기 타임아웃)
{

        if WinExist("통합 문서1 - Excel")
        {

            try { ; 이미 활성화된 Excel 인스턴스 가져오기
				Global XL
                XL := ComObjActive("Excel.Application")
                XL.Visible:=true


            } catch {
                ;~ MsgBox, Excel 인스턴스를 찾을 수 없습니다.
                ;~ ExitApp
            }
            wb := XL.ActiveWorkbook
            ws := XL.ActiveSheet

            Loop, 300  ; 최대 300번 시도 (Append 작업 타임아웃 - 약 10분)
            {
                initialRowCount := currentRowCount
                Sleep, 2000
                currentRowCount := ws.UsedRange.Rows.Count
                if(currentRowCount = "0")
                {
                        ToolTip, Append 작업중. 현재 행 갯수0: %currentRowCount%
                }
                else
                {
                    if (currentRowCount = initialRowCount) {
                        ToolTip, Append 작업이 완료되었습니다. 현재 행 갯수1: %currentRowCount%
                        break
                    }
                    else
                    {
                        ToolTip, Append 작업중. 현재 행 갯수2: %currentRowCount%
                    }
                }
            }
            Sleep, 500
			/*
            XL.ActiveWorkbook.Saveas(A_MyDocuments . "\거래처원장_tms_list.xlsx")
            XL.ActiveWorkbook.Close(1)
            XL.Quit
			XL:=""
			*/
            Sleep, 500
            initialRowCount=
            currentRowCount=
			break
        }
        else
        {
			Sleep, 1000  ; Excel 창 대기
        }



}



Sleep, 500


/*
    path2 := A_MyDocuments . "\거래처원장_tms_list.xlsx"

    Global XL
    XL := ComObjCreate("Excel.Application")
    XL.Workbooks.Open(path2, 3, 0)
    XL.Visible := true
	*/

    Sleep, 500
    XL.ActiveSheet.Range("1:1").Delete
    XL.ActiveSheet.Range("1:2000").select
    XL.selection.Replace("0.00","")

    행1 := XL.ActiveSheet.UsedRange.Rows.Count

    ; A열에 품명+규격 결합
    Loop, % 행1
    {
        품명 := XL.ActiveSheet.Range("C" A_Index).value
        규격 := XL.ActiveSheet.Range("D" A_Index).value
        내용 := 품명 . "  " . 규격
        XL.ActiveSheet.Range("A" A_Index).value := 내용
    }

    ; 행 삭제 (역순으로!)
    행1 := XL.ActiveSheet.UsedRange.Rows.Count
    Loop, % 행1
    {
        currentRow := 행1 - A_Index + 1
        no := XL.ActiveSheet.Range("U" currentRow).value
        수금col := XL.ActiveSheet.Range("B" currentRow).value

        if(no="" || 수금col="수금"){
            XL.ActiveSheet.Range(currentRow ":" currentRow).Delete
        }
    }

    ; 중복 제거하여 고유 전표번호 배열 생성
    uniqueArr := []
    lastRow := XL.ActiveSheet.Range("Q" XL.ActiveSheet.Rows.Count).End(-4162).Row

    sourceRange := "Q1:Q" lastRow
    XL.ActiveSheet.Range(sourceRange).Copy()
    XL.ActiveSheet.Range("Z1").PasteSpecial()

    tempRange := "Z1:Z" lastRow
    XL.ActiveSheet.Range(tempRange).RemoveDuplicates(1, 0)

    Loop, % lastRow
    {
        value := XL.ActiveSheet.Range("Z" A_Index).value
        if(value != "" && value != 0){
            uniqueArr.Push(Floor(value))
        }
    }

    XL.ActiveSheet.Range("Z1:Z" lastRow).ClearContents()

    행2 := XL.ActiveSheet.UsedRange.Rows.Count

    ; 디버그 로그 파일 초기화
    FileDelete, debug_log.txt

    ; 각 전표번호별 처리
    Loop, % uniqueArr.Length()
    {
        전표번호 := uniqueArr[A_Index]

        debugLog := "`n========== 전표번호: " 전표번호 " ==========`n"

        ; DB에 해당 전표번호가 있는지 확인
        myQuery := "select * FROM tms_list WHERE ID = '" 전표번호 "';"
        result := dbQuery(myDB, myQuery)

        if(errorCheck(result)){
            debugLog .= "DB 조회 실패: " result[2] " - " result[3] "`n"
            FileAppend, %debugLog%, debug_log.txt
            continue
        }

        ; DB에 있든 없든 계속 진행
        isNewRecord := (result[1] = "")
        if(isNewRecord){
            debugLog .= "DB에 없음 - 신규 추가 모드`n"
        }else{
            debugLog .= "DB에 존재 - 업데이트 모드`n"
        }

        ; 임시 테이블 초기화
        CONT1 := ""

        myQuery := "DROP TEMPORARY TABLE IF EXISTS temp_new_data;"
        result := dbQuery(myDB, myQuery)

        myQuery := "CREATE TEMPORARY TABLE temp_new_data LIKE tms_list;"
        result := dbQuery(myDB, myQuery)
        if(errorCheck(result)){
            debugLog .= "임시 테이블 생성 실패: " result[2] " - " result[3] "`n"
            FileAppend, %debugLog%, debug_log.txt
            continue
        }

        ; 엑셀에서 해당 전표번호 행 찾기
        searchValue := Floor(전표번호)
        foundCells := []

        Loop, % 행2
        {
            qValue := Floor(XL.ActiveSheet.Range("Q" A_Index).value)
            noValue := XL.ActiveSheet.Range("U" A_Index).value

            if(qValue = searchValue && noValue != ""){
                foundCells.Push(A_Index)
            }
        }

        debugLog .= "엑셀에서 발견된 행: " foundCells.Length() "개`n"

        if(foundCells.Length() = 0){
            debugLog .= "엑셀에 데이터 없음 - 스킵`n"
            FileAppend, %debugLog%, debug_log.txt
            continue
        }

        ; 각 행의 데이터 출력 (디버깅)
        for index, row in foundCells {
            debugLog .= "  행 " row ": "
            debugLog .= "내용=" XL.ActiveSheet.Range("A" row).value
            debugLog .= ", 수량=" XL.ActiveSheet.Range("F" row).value
            debugLog .= ", 비고(K열)=" XL.ActiveSheet.Range("K" row).value
            debugLog .= ", no=" XL.ActiveSheet.Range("U" row).value "`n"
        }

        ; 데이터 수집
        Loop, % foundCells.Length()
        {
            rowNum := foundCells[A_Index]

            pk := XL.ActiveSheet.Range("R" rowNum).value
            pk := (pk="") ? "NULL" : "'" Floor(pk) "'"

            내용 := XL.ActiveSheet.Range("A" rowNum).value
            if(내용=""){
                내용 := "NULL"
            }else{
                내용 := StrReplace(내용, "'", "''")
                내용 := "'" 내용 "'"
            }

            수량 := XL.ActiveSheet.Range("F" rowNum).value
            수량 := RemoveDecimal(수량)
            수량 := (수량="" || 수량=0) ? 0 : Floor(수량)

            단가 := XL.ActiveSheet.Range("G" rowNum).value
            단가 := RemoveDecimal(단가)
            단가 := (단가="" || 단가=0) ? "NULL" : Floor(단가)

            공급대가 := XL.ActiveSheet.Range("J" rowNum).value
            공급대가 := RemoveDecimal(공급대가)
            공급대가 := (공급대가="" || 공급대가=0) ? "NULL" : Floor(공급대가)

            ; K열로 수정!
            비고 := XL.ActiveSheet.Range("K" rowNum).value
            if(비고=""){
                비고 := "NULL"
            }else{
                비고 := StrReplace(비고, "'", "''")
                비고 := "'" 비고 "'"
            }

            no := XL.ActiveSheet.Range("U" rowNum).value
            no := Floor(no)

            CONT := "(" 전표번호 ", " pk ", NULL, " 내용 ", " 수량 ", " 단가 ", " 공급대가 ", 0, " 비고 ", " no ")"
            CONT1 .= (A_Index < foundCells.Length()) ? CONT ",`n" : CONT
        }

        debugLog .= "생성된 VALUES 문:`n" CONT1 "`n"

        ; INSERT 쿼리 실행
        myQuery := "INSERT INTO temp_new_data (ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no) VALUES " CONT1 ";"

        debugLog .= "실행할 쿼리:`n" myQuery "`n"

        result := dbQuery(myDB, myQuery)
        if(errorCheck(result)){
            debugLog .= "INSERT 실패! ErrorCode: " result[2] ", Error: " result[3] "`n"
            FileAppend, %debugLog%, debug_log.txt
            continue
        }

        debugLog .= "INSERT 성공`n"

        ; '출' 값 복사 (기존 데이터가 있을 때만)
        if(!isNewRecord){
            myQuery := "UPDATE temp_new_data t SET t.출 = (SELECT o.출 FROM tms_list o WHERE o.ID = t.ID AND o.내용 = t.내용 AND o.수량 = t.수량 AND COALESCE(o.비고, '') = COALESCE(t.비고, '') AND o.출 IS NOT NULL ORDER BY ABS(o.no - t.no), o.no LIMIT 1);"
            result := dbQuery(myDB, myQuery)
            if(errorCheck(result)){
                debugLog .= "UPDATE 출 실패: " result[2] " - " result[3] "`n"
            }else{
                debugLog .= "UPDATE 출 성공`n"
            }

            ; 기존 데이터 삭제
            myQuery := "DELETE FROM tms_list WHERE ID = '" 전표번호 "';"
            result := dbQuery(myDB, myQuery)
            if(errorCheck(result)){
                debugLog .= "DELETE 실패: " result[2] " - " result[3] "`n"
            }else{
                debugLog .= "DELETE 성공`n"
            }
        }else{
            debugLog .= "신규 데이터이므로 '출' 값 복사 및 DELETE 스킵`n"
        }

        ; 새 데이터 삽입
        myQuery := "INSERT INTO tms_list (ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no) SELECT ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no FROM temp_new_data;"
        result := dbQuery(myDB, myQuery)
        if(errorCheck(result)){
            debugLog .= "최종 INSERT 실패: " result[2] " - " result[3] "`n"
        }else{
            debugLog .= "최종 INSERT 성공`n"
        }

        ; 임시 테이블 삭제
        myQuery := "DROP TEMPORARY TABLE IF EXISTS temp_new_data;"
        result := dbQuery(myDB, myQuery)

        debugLog .= "처리 완료`n"
        FileAppend, %debugLog%, debug_log.txt
    }

    MsgBox, % "처리 완료!`n`n로그 파일: debug_log.txt 확인"

    wb := ""
    ws := ""
    XL.ActiveWorkbook.Close(0)
    XL.Quit()
    XL := ""
	ToolTip,

    return
}
; msgbox, % myQuery






















거래처원장:
{


    Loop, 10
    {
    Process, close, EXCEL.EXE
    winkill, ahk_class XLMAIN
    WinKill, ahk_exe EXCEL.EXE
    }
	XL:=""


	ControlClick, TAdvOfficePager1, ahk_class TfmMain,,,,x54 y17
    Sleep, 500

	ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x195 y15
    Sleep, 3000



Loop, 60  ; 최대 60번 시도 (Excel 창 대기 타임아웃)
{

        if WinExist("통합 문서1 - Excel")
        {

            try { ; 이미 활성화된 Excel 인스턴스 가져오기

				Global XL
                XL := ComObjActive("Excel.Application")
                XL.Visible:=true


            } catch {
                ;~ MsgBox, Excel 인스턴스를 찾을 수 없습니다.
                ;~ ExitApp
            }
            wb := XL.ActiveWorkbook
            ws := XL.ActiveSheet

            Loop, 300  ; 최대 300번 시도 (Append 작업 타임아웃 - 약 10분)
            {
                initialRowCount := currentRowCount
                Sleep, 2000
                currentRowCount := ws.UsedRange.Rows.Count
                if(currentRowCount = "0")
                {
                        ToolTip, Append 작업중. 현재 행 갯수0: %currentRowCount%
                }
                else
                {
                    if (currentRowCount = initialRowCount) {
                        ToolTip, Append 작업이 완료되었습니다. 현재 행 갯수1: %currentRowCount%
                        break
                    }
                    else
                    {
                        ToolTip, Append 작업중. 현재 행 갯수2: %currentRowCount%
                    }
                }
            }
            Sleep, 500
            Sleep, 500
            initialRowCount=
            currentRowCount=
			break
        }
        else
        {
			Sleep, 1000  ; Excel 창 대기
        }



}


Sleep, 500







	Sleep, 500
	XL.ActiveSheet.Range("1:1").Delete
	XL.ActiveSheet.Range("1:500").select
	XL.selection.Replace("0.00","")



	행=
	행1 := XL.ActiveSheet.UsedRange.Rows.Count


	시작날짜 := XL.ActiveSheet.Range("A" 1).value
	종료날짜 := XL.ActiveSheet.Range("A" 행1).value

	업체코드 := XL.ActiveSheet.Range("AW1").value
	업체코드 := Floor(업체코드)


	; DELETE 전에 기존 image, order_image, 상태 값을 미리 저장
	image_backup := {}
	myQuery_backup =
	(
	SELECT ID, image, order_image, 상태 FROM tms
	WHERE 업체코드 = %업체코드%
	  AND 날짜 BETWEEN '%시작날짜%' AND '%종료날짜%';
	)
	result_backup := dbQuery(myDB, myQuery_backup)
	; MsgBox, % "result_backup 결과: " result_backup.MaxIndex() " 건"
	if(!errorCheck(result_backup)){
		Loop, % result_backup.MaxIndex()
		{
			; SELECT ID, image, order_image, 상태 순서대로 [1], [2], [3], [4]
			backup_id := result_backup[A_Index][1]
			backup_id := Floor(backup_id)  ; 숫자로 변환 (ID와 타입 일치)
			backup_image := result_backup[A_Index][2]
			backup_order_image := result_backup[A_Index][3]
			backup_상태 := result_backup[A_Index][4]
			image_backup[backup_id] := {}
			image_backup[backup_id].image := backup_image
			image_backup[backup_id].order_image := backup_order_image
			image_backup[backup_id].상태 := backup_상태
			; MsgBox, % "저장: ID=" backup_id " image=" backup_image " 상태=" backup_상태
		}
	}


	myQuery =
	(
-- 날짜 형식을 DATE로 변환해서 비교
DELETE FROM tms
WHERE 업체코드 = %업체코드%
  AND 날짜 BETWEEN '%시작날짜%' AND '%종료날짜%';
	)

; msgbox, % myQuery

	result := dbQuery(myDB, myQuery)
	if(errorCheck(result)){
		MsgBox, % "tms 삭제 ErrorCode: " result[2] ", Error : " result[3]
	}







Loop, % 행1
{

	행++


	XL.ActiveSheet.Range("AW:AW").NumberFormat := "@"
	XL.ActiveSheet.Range("D:E").NumberFormat := "@"
	날짜 := XL.ActiveSheet.Range("A" 행).value
	시간 := XL.ActiveSheet.Range("AK" 행).value
	출고지 := XL.ActiveSheet.Range("AJ" 행).value
	업체 := XL.ActiveSheet.Range("AT" 행).value
	비고 := XL.ActiveSheet.Range("AI" 행).value
	ID := XL.ActiveSheet.Range("AX" 행).value
	업체코드 := XL.ActiveSheet.Range("AW" 행).value
	총금액 := XL.ActiveSheet.Range("D" 행).value
	입금액 := XL.ActiveSheet.Range("E" 행).value


	ID := Floor(ID)
	총금액 := Floor(총금액)
	입금액 := Floor(입금액)
	업체코드 := Floor(업체코드)



	; msgbox, 1 행1: %행1% `n`n 시작날짜: %시작날짜% `n 종료날짜: %종료날짜% `n 날짜: %날짜% `n 시간: %시간% `n 업체: %업체% `n 출고지: %출고지% `n 비고: %비고% `n ID: %ID% `n W `n 총금액: %총금액% `n 입금액: %입금액% `n 업체코드: %업체코드%
	;~ XL.ActiveSheet.Range(행 ":" 열).Value :=     *** 이 하 여 백 ***

	IF((총금액="") && (입금액="")){

	}else{


	시간1 := RegExReplace(시간, "[0-9]" , "")

		if (시간1 = "::")
		{
			RegExMatch(시간, "(.*):(.*):(.*)", 1time)
			시간 = % 1time1 "시" 1time2 "출"
		}
		else
		{
		}


	CONT1=
	CONT=

	; msgbox, 2 행: %행% `n 행1: %행1% `n 시작날짜: %시작날짜% `n 종료날짜: %종료날짜% `n 날짜: %날짜% `n 시간: %시간% `n 업체: %업체% `n 출고지: %출고지% `n 비고: %비고% `n ID: %ID% `n W `n 총금액: %총금액% `n 입금액: %입금액% `n 업체코드: %업체코드%

	; 저장해둔 image, order_image, 상태 값 가져오기
	saved_image := ""
	saved_order_image := ""
	saved_상태 := ""
	if(image_backup.HasKey(ID)){
		saved_image := image_backup[ID].image
		saved_order_image := image_backup[ID].order_image
		saved_상태 := image_backup[ID].상태
	}

	; image, order_image SQL 값 처리
	if(saved_image = ""){
		saved_image_sql := "NULL"
	}else{
		saved_image_sql := "'" saved_image "'"
	}
	if(saved_order_image = ""){
		saved_order_image_sql := "NULL"
	}else{
		saved_order_image_sql := "'" saved_order_image "'"
	}
	; 상태 SQL 값 처리 (기존 값이 있으면 유지, 없으면 'W')
	if(saved_상태 = ""){
		saved_상태_sql := "'W'"
	}else{
		saved_상태_sql := "'" saved_상태 "'"
	}

	; 새로운 데이터 삽입
	myQuery =
	(
	INSERT INTO tms (날짜, 시간, 업체, 출고지, 비고, 절단, 도어, 배송자, ID, 전화번호, 상태, 총금액, 입금액, 업체코드, image, order_image)
	VALUES ('%날짜%', '%시간%', '%업체%', '%출고지%', '%비고%', NULL, NULL, NULL, '%ID%', NULL, %saved_상태_sql%, %총금액%, %입금액%, %업체코드%, %saved_image_sql%, %saved_order_image_sql%);
	)
	result := dbQuery(myDB, myQuery)
	if(errorCheck(result)){
		MsgBox, , ,% "2_4 ErrorCode: " result[2] ", Error : " result[3] "`n ID: " ID, 0.8

		myQuery1 =
		(
		DELETE FROM tms
		WHERE ID = '%ID%';
		)
		result1 := dbQuery(myDB, myQuery1)
		if(errorCheck(result1)){
			MsgBox, , ,% "2_6 ErrorCode: " result1[2] ", Error : " result1[3] "`n ID: " ID, 2.8
		}
		Sleep, 100

		myQuery2 =
		(
		INSERT INTO tms (날짜, 시간, 업체, 출고지, 비고, 절단, 도어, 배송자, ID, 전화번호, 상태, 총금액, 입금액, 업체코드, image, order_image)
		VALUES ('%날짜%', '%시간%', '%업체%', '%출고지%', '%비고%', NULL, NULL, NULL, '%ID%', NULL, %saved_상태_sql%, %총금액%, %입금액%, %업체코드%, %saved_image_sql%, %saved_order_image_sql%);
		)

		result2 := dbQuery(myDB, myQuery2)
		if(errorCheck(result2)){
			MsgBox, , ,% "2_3 ErrorCode: " result2[2] ", Error : " result2[3] "`n ID: " ID, 2.8
		}





	}else{
	}

	}
}

; 메모리 해제
image_backup := ""

/*
	CONT1=
	CONT=





	; 0단계: 기존 임시 테이블 삭제
	myQuery =
	(
	DROP TEMPORARY TABLE IF EXISTS temp_new_data;
	)
	result := dbQuery(myDB, myQuery)

	; 1단계: 원본 테이블 구조로 임시 테이블 생성
	myQuery =
	(
	CREATE TEMPORARY TABLE temp_new_data LIKE tms_list;
	)
	result := dbQuery(myDB, myQuery)
	if(errorCheck(result)){
		MsgBox, % "임시 테이블 생성 ErrorCode: " result[2] ", Error : " result[3]
		return
	}

	; 2단계: 엑셀 데이터 읽기 및 임시 테이블에 삽입
	행마1 := 행 - 1
	행마2 := 행 - 2

	if(행마2!=0){
		Loop, % 행마2
		{
			pk := XL.ActiveSheet.Range("B" A_index).value
			if(pk=""){
				pk := "NULL"
			}else{
				pk := "'" pk "'"
			}

			내용 := XL.ActiveSheet.Range("C" A_index).value
			if(내용=""){
				내용 := "NULL"
			}else{
				내용 := "'" StrReplace(내용, "'", "''") "'"
			}

			수량 := XL.ActiveSheet.Range("D" A_index).value
			수량 := RemoveDecimal(수량)
			if(수량=""){
				수량 := 0
			}

			단가 := XL.ActiveSheet.Range("E" A_index).value
			단가 := RemoveDecimal(단가)
			if(단가=""){
				단가 := "NULL"
			}

			공급대가 := XL.ActiveSheet.Range("I" A_index).value
			공급대가 := RemoveDecimal(공급대가)
			if(공급대가=""){
				공급대가 := "NULL"
			}

			pdtcode := XL.ActiveSheet.Range("G" A_index).value
			pdtcode := RemoveDecimal(pdtcode)
			if(pdtcode="2100000000"){
				pdtcode := 0
			}

			비고 := XL.ActiveSheet.Range("F" A_index).value
			if(비고=""){
				비고 := "NULL"
			}else{
				비고 := "'" StrReplace(비고, "'", "''") "'"
			}

			no := XL.ActiveSheet.Range("H" A_index).value

			CONT := "(" 전표번호 ", " pk ", NULL, " 내용 ", " 수량 ", " 단가 ", " 공급대가 ", " pdtcode ", " 비고 ", " no "),`n"
			CONT1 .= CONT

			if(행마2 = A_Index){
				break
			}
		}
	}

	; 마지막 행 추가
	pk := XL.ActiveSheet.Range("B" 행마1).value
	if(pk=""){
		pk := "NULL"
	}else{
		pk := "'" pk "'"
	}

	내용 := XL.ActiveSheet.Range("C" 행마1).value
	if(내용=""){
		내용 := "NULL"
	}else{
		내용 := "'" StrReplace(내용, "'", "''") "'"
	}

	수량 := XL.ActiveSheet.Range("D" 행마1).value
	수량 := RemoveDecimal(수량)
	if(수량=""){
		수량 := 0
	}

	단가 := XL.ActiveSheet.Range("E" 행마1).value
	단가 := RemoveDecimal(단가)
	if(단가=""){
		단가 := "NULL"
	}

	공급대가 := XL.ActiveSheet.Range("I" 행마1).value
	공급대가 := RemoveDecimal(공급대가)
	if(공급대가=""){
		공급대가 := "NULL"
	}

	pdtcode := XL.ActiveSheet.Range("G" 행마1).value
	pdtcode := RemoveDecimal(pdtcode)
	if(pdtcode="2100000000"){
		pdtcode := 0
	}

	비고 := XL.ActiveSheet.Range("F" 행마1).value
	if(비고=""){
		비고 := "NULL"
	}else{
		비고 := "'" StrReplace(비고, "'", "''") "'"
	}

	no := XL.ActiveSheet.Range("H" 행마1).value

	CONT := "(" 전표번호 ", " pk ", NULL, " 내용 ", " 수량 ", " 단가 ", " 공급대가 ", " pdtcode ", " 비고 ", " no ")"
	CONT1 .= CONT

	; 3단계: 임시 테이블에 새 데이터 삽입
	myQuery =
	(
	INSERT INTO temp_new_data (ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no)
	VALUES
	%CONT1%
	;
	)
	result := dbQuery(myDB, myQuery)
	if(errorCheck(result)){
		MsgBox, % "임시 테이블 삽입 ErrorCode: " result[2] ", Error : " result[3] "`n`n쿼리>`n" myQuery
		return
	}

	; 4단계: '출' 값 복사 - 수량도 동일해야 함!
	myQuery =
	(
	UPDATE temp_new_data t
	SET t.출 = (
		SELECT o.출
		FROM tms_list o
		WHERE o.ID = t.ID
			AND o.내용 = t.내용
			AND o.수량 = t.수량
			AND o.pdt_code = t.pdt_code
			AND COALESCE(o.비고, '') = COALESCE(t.비고, '')
			AND o.출 IS NOT NULL
		ORDER BY ABS(o.no - t.no), o.no
		LIMIT 1 );
	)
	result := dbQuery(myDB, myQuery)
	if(errorCheck(result)){
		MsgBox, % "'출' 값 복사 ErrorCode: " result[2] ", Error : " result[3]
		return
	}

	; 5단계: 해당 ID의 모든 기존 데이터 삭제
	myQuery =
	(
	DELETE FROM tms_list WHERE ID = '%전표번호%';
	)
	result := dbQuery(myDB, myQuery)
	if(errorCheck(result)){
		MsgBox, % "기존 데이터 삭제 ErrorCode: " result[2] ", Error : " result[3]
		return
	}

	; 6단계: 임시 테이블의 모든 데이터를 원본 테이블에 삽입
	myQuery =
	(
	INSERT INTO tms_list (ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no)
	SELECT ID, pk, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no
	FROM temp_new_data;
	)
	result := dbQuery(myDB, myQuery)
	if(errorCheck(result)){
		MsgBox, % "데이터 삽입 ErrorCode: " result[2] ", Error : " result[3]
		return
	}

	; 7단계: 임시 테이블 삭제
	myQuery =
	(
	DROP TEMPORARY TABLE IF EXISTS temp_new_data;
	)
	result := dbQuery(myDB, myQuery)

	;~ MsgBox, % "데이터 처리 완료!"


*/

/*
	XL.ActiveWorkbook.Save()
	*/
	wb := ""
	ws := ""
	XL.ActiveWorkbook.Close(0)
	XL.Quit()
	XL := ""


	Sleep, 100


	;~ MsgBox, , ,적성완료, 0.8
	;~ Sleep, 800

	;~ Sleep, 1000
		;~ winkill, ahk_exe hcell.exe
		;~ Process, close, EXCEL.EXE
	Sleep, 100

	MsgBox, , ,거래처원장, 0.8
	ToolTip,


	Gosub, 거래처원장_상세

	return

}







!+7::
캘린더3:
{
	Loop, 30  ; 최대 30번 시도 (3초 타임아웃)
	{
		Sleep, 100
		if FileExist(A_MyDocuments "\5.입하지시서.xml"){
			FileDelete, %A_MyDocuments%\5.입하지시서.xml
		}else{
			break
		}
	}

ControlGetText, 납기날짜1, TRzDBDateTimeEdit3, ahk_class TfmEstimate2
ControlGetText, 거래처명1, Edit2,  %WINTITLE%
;~ ControlGetText04, 배송날짜, Edit3,  %WINTITLE%
ControlGetText, 출발시각1, Edit4,  %WINTITLE%
ControlGetText, 배송지1, Edit5,  %WINTITLE%
ControlGetText, 기타메모1, Edit6,  %WINTITLE%
ControlGetText, 내용1, Edit7,  %WINTITLE%
ControlGetText, 전화번호, Edit8, %WINTITLE%
ControlGetText, 재단여부, Edit11, %WINTITLE%


	WinWait, ahk_class TfmEstimate2,
	IfWinNotActive, ahk_class TfmEstimate2, , WinActivate, ahk_class TfmEstimate2,
	WinWaitActive, ahk_class TfmEstimate2,
	Sleep, 200

Send, {F8}

ControlClick, TRzBitBtn8, ahk_class TfmChitSale
	WinWait, 인쇄리스트,
	IfWinNotActive, 인쇄리스트, , WinActivate, 인쇄리스트,
	WinWaitActive, 인쇄리스트,
	sleep,500

send, {home}{down 5}{tab 7}{enter}
Sleep, 200


Sleep, 200
;~ winkill, ahk_exe hcell.exe
	WinWait, Export to Excel,
	IfWinNotActive, Export to Excel, , WinActivate, Export to Excel,
	WinWaitActive, Export to Excel,
	Sleep, 200

send, {ShiftDown}{Tab}{ShiftUp}{Space}{tab}
Sleep, 200
Send, {enter}
Sleep, 500
ControlSetText, edit1, %A_MyDocuments%\5.입하지시서.xml, 다른 이름으로 저장
Sleep, 100

Send, {tab 2}{enter}




Sleep, 100

SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\기록중.mp3

	Loop, 300  ; 최대 300번 시도 (30초 타임아웃)
	{
		Sleep, 100
		if FileExist(A_MyDocuments "\5.입하지시서.xml"){
			Sleep, 1000
			break
		}else{
		}
	}
	if (A_Index >= 300) {
		MsgBox, 파일 생성 대기 타임아웃: 5.입하지시서.xml
		return
	}



; ;;;;;;; 파이썬 FCM 실행
EnvSet, PATH, %A_EnvPath%;C:\Users\shwoodnew\AppData\Local\Programs\Python\Python313\;C:\Users\shwoodnew\AppData\Local\Programs\Python\Python313\Scripts\
Run, python "C:\Users\shwoodnew\tms_new\send_purchase_fcm.py"
; ;;;;;;; 파이썬 FCM 실행


run, \\192.168.0.1\hdd1\일정표 최근\일정표220730\readerspeaker.ahk

;~ path := A_MyDocuments . "\7_2번째 전표.xlsx"
path2 := A_MyDocuments . "\5.입하지시서.xml"
xl=
Sleep, 100
Global XL ; 중요함

XL := ComObjCreate("Excel.Application")
XL.Workbooks.Open(path2, 3, 0)

XL.Visible := false


XL.ActiveSheet.Range("1:500").select
XL.selection.Replace("0.00","")


XL.ActiveSheet.Range("1:1").Delete
XL.ActiveSheet.Range("G:G").Delete
XL.ActiveSheet.Range("H:AB").Delete
찾는문자 := "이하여백"
범위 := XL.ActiveSheet.Range("B:B").Find(찾는문자)
행 := 범위.Row
;~ 행 := 행 + 1
;~ MsgBox, % 행 찾는문자
XL.ActiveSheet.Range(행 ":500").Delete
XL.ActiveSheet.Range("A:G").NumberFormat := "@"
XL.ActiveSheet.Range("A:A").NumberFormat := "@"

			전표번호 := XL.ActiveSheet.Range("A1").value

			전표번호 := StrReplace(전표번호, "," , "")


1출발시각 := RegExReplace(출발시각1, "[0-9]" , "")


if (1출발시각 = "::")
{
	RegExMatch(출발시각1, "(.*):(.*):(.*)", 1time)
	출발시각1 = % 1time1 "시" 1time2 "출"
}
else
{
}



if (ddl = "예림"){
	도어회사 = 예
	}
else if (ddl = "우딘"){
	도어회사 = 우
	}
else if (ddl = "재현"){
	도어회사 = 재
	}
else if (ddl = "크로스"){
	도어회사 = 크
	}
else
{
	도어회사 =
}


픽업=NULL
배송자=NULL
진행=주문

파일이름1 := "A" 배송날짜 "_B" 출발시각1 "_C" 거래처명1 "_D" 배송지1 "_E" 기타메모1 "_V" 재단여부 "_G주문_C"

파일이름1 := StrReplace(파일이름1, "/" , ",")
파일이름1 := StrReplace(파일이름1, "\" , ",")
파일이름1 := StrReplace(파일이름1, ":" , ",")
파일이름1 := StrReplace(파일이름1, "*" , ",")
파일이름1 := StrReplace(파일이름1, "?" , ",")
파일이름1 := StrReplace(파일이름1, "<" , ",")
파일이름1 := StrReplace(파일이름1, ">" , ",")
파일이름1 := StrReplace(파일이름1, "|" , ",")
파일이름1 := StrReplace(파일이름1, "." , ",")
파일이름1 := StrReplace(파일이름1, "[" , ",")
파일이름1 := StrReplace(파일이름1, "]" , ",")
파일이름1 := StrReplace(파일이름1, " " , ",")




CONT1=
CONT=




myQuery =
(
DELETE FROM tms_2 WHERE ID = '%전표번호%';
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "tms 삭제 ErrorCode: " result[2] ", Error : " result[3]
}



;                                                                     픽업 진행 배송자 null 값이 있어서 '' 를 사용한다
          myQuery =
          myQuery =
            (
			INSERT INTO tms_2 (날짜, 시간, 업체, 입고지, 비고, 픽업, 진행, 배송자, ID, 전화번호, 상태)
			VALUES ('%배송날짜%', '%출발시각1%', '%거래처명1%', '%배송지1%', '%기타메모1%', %픽업%, '%진행%', %배송자%, %전표번호%, '%전화번호%', 'A');
			)
			;~ MsgBox, % myQuery

            result := dbQuery(myDB, myQuery)
			if(errorCheck(result)){
				MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
			}else{
			}


			행마1 := 행 - 1
			행마2 := 행 - 2
			if(행마2!=0){
				Loop, % 행마2 ; csv 파일 값 입력 하기
				{



					pk := XL.ActiveSheet.Range("B" A_index).value
					if(pk=""){
						pk := "NULL"
					}else{
						pk := "'" pk "'"
					}
pk := StrReplace(pk, "," , "")



					내용 := XL.ActiveSheet.Range("C" A_index).value
					if(내용=""){
						내용=NULL
					}else{
						내용 := "'" 내용
						내용 := 내용 "'"
					}
					수량 := XL.ActiveSheet.Range("D" A_index).value
					수량 := RemoveDecimal(수량) ; 정수로 바꾸기

					if(수량=""){
						수량=0
					}else{
					}

					pdtcode := XL.ActiveSheet.Range("E" A_index).value
					pdtcode := RemoveDecimal(pdtcode) ; 정수로 바꾸기




					if(pdtcode="2100000000"){
						pdtcode=0
					}else{
					}
					비고 := XL.ActiveSheet.Range("F" A_index).value

					if(비고=""){
						비고=NULL
					}else{
						비고 := 비고 "'"
						비고 := "'" 비고
					}


비고 := StrReplace(비고, "(" , " ")
비고 := StrReplace(비고, ")" , " ")


					no := XL.ActiveSheet.Range("G" A_index).value ; 전표숫자

					CONT := "(" 전표번호 ", " pk ", NULL, " 내용 ", " 수량 ", " pdtcode ", " 비고 ", " no "),`n"
					CONT1 .= CONT
					if( 행마2 = A_Index){
						break
					}else{
					}
					;~ MsgBox, % CONT1 "`n" A_Index "`n" 행 "`n" 전표번호 "`n" 내용 "`n" 수량 "`n" pdtcode "`n" 비고
				}
			}else{
			}


				pk := XL.ActiveSheet.Range("B" 행마1).value
				if(pk=""){
					pk := "NULL"
				}else{
					pk := "'" pk "'"
				}
pk := StrReplace(pk, "," , "")

				; 마지막 행 추가
				내용 := XL.ActiveSheet.Range("C" 행마1).value
				if(내용=""){
					내용=NULL
				}else{
					내용 := "'" 내용
					내용 := 내용 "'"
				}
				수량 := XL.ActiveSheet.Range("D" 행마1).value
				수량 := RemoveDecimal(수량) ; 정수로 바꾸기

				if(수량=""){
					수량=0
				}else{
				}

				pdtcode := XL.ActiveSheet.Range("E" 행마1).value
				pdtcode := RemoveDecimal(pdtcode) ; 정수로 바꾸기


				if(pdtcode="2100000000"){
					pdtcode=0
				}else{
				}
				비고 := XL.ActiveSheet.Range("F" 행마1).value

				if(비고=""){
					비고=NULL
				}else{
					비고 := 비고 "'"
					비고 := "'" 비고
				}

비고 := StrReplace(비고, "(" , " ")
비고 := StrReplace(비고, ")" , " ")

				no := XL.ActiveSheet.Range("G" 행마1).value ; 전표숫자

				CONT := "(" 전표번호 ", " pk ", NULL, " 내용 ", " 수량 ", " pdtcode ", " 비고 ", " no ")"
				CONT1 .= CONT

				;~ CONT1 .= "`n;"


			;~ MsgBox, % CONT1


			myQuery =
			myQuery =
            (
			INSERT INTO tms_list (ID, pk, 출, 내용, 수량, pdt_code, 비고, no)
			VALUES
			%CONT1%
			;
			)
			;~ MsgBox, % "myQuery`n" myQuery
            result := dbQuery(myDB, myQuery)
			if(errorCheck(result)){
				MsgBox, % "ErrorCode: " result[2] ", Error : " result[3] "`n`n쿼리>`n" myQuery
			}else{
			}





;~ XL.ActiveWorkbook.Save()
wb := ""
ws := ""
XL.ActiveWorkbook.Close(0)
XL.Quit()
XL := ""
Sleep, 100
SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\F1.mp3

;~ MsgBox, , ,적성완료, 0.8
;~ Sleep, 800

run, \\192.168.0.1\hdd1\일정표 최근\일정표220730\readerspeaker.ahk

Sleep, 100


return
}









; 요일 구하기 함수
Get_Weekday(parmDate, parmMode)
{
	global

if StrLen(parmDate) <> 8
return,""
if parmDate is not Integer
return,""
if parmMode not in 0,1
return,""
FormatTime,WeekDay,%parmDate%, ddd
if parmMode = 1
{
objWeekDay := {"일":1, "월":2, "화":3, "수":4, "목":5, "금":6, "토":7}
ReturnString := objWeekDay [WeekDay]
}
else
ReturnString := WeekDay
return,ReturnString
}


;vWDayStart: day defined as first day of week (Sun:1, Sat:7)
DateGetWeekStart(vDate, vWDayStart:=2, vFormat:="yyyyMMddHHmmss")
{
	if (vDate = "")
		vDate := A_Now
	FormatTime, vWDay, % vDate, WDay
	vNum := Mod(vWDayStart+7-vWDay, 7)
	if vNum
		EnvAdd, vDate, % vNum-7, Days
	vDate := SubStr(vDate, 1, 8) "000000"
	if !(vFormat == "yyyyMMddHHmmss")
	{
		FormatTime, vDate, % vDate, % vFormat
		return vDate
	}
	return vDate
}

;vWDayEnd: day defined as last day of week (Sun:1, Sat:7)
DateGetWeekEnd(vDate, vWDayEnd:=1, vFormat:="yyyyMMddHHmmss")
{
	if (vDate = "")
		vDate := A_Now
	FormatTime, vWDay, % vDate, WDay
	vNum := Mod(vWDayEnd+7-vWDay, 7)
	if vNum
		EnvAdd, vDate, % vNum, Days
	vDate := SubStr(vDate, 1, 8) "235959"
	if !(vFormat == "yyyyMMddHHmmss")
	{
		FormatTime, vDate, % vDate, % vFormat
		return vDate
	}
	return vDate
}


;~ MsgBox, % vMonthStart "`r`n" vDate "`r`n" vMonthEnd

DateAdd(DateTime, Time, TimeUnits)
{
	EnvAdd, DateTime, % Time, % TimeUnits
	return DateTime
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


~RButton::
{
	CoordMode, mouse, screen
	If( WinExist("ahk_class TfmChitSale") or WinExist("ahk_class TfmEstimate2") )
	{
		WinActivate, %WINTITLE%
		Mousemove, -172, 673
	}
	else
	{

	}
}
return

; 엑셀 인스턴스를 확인하는 함수
GetExcelInstance() {
    Loop {
        ; 이미 실행 중인 Excel 인스턴스 가져오기



		XL.Quit()

        XL := ""

		Global XL ; 중요함
        try {
            XL := ComObjActive("Excel.Application")
        } catch {
            ; 예외 처리 (Excel 인스턴스를 찾지 못한 경우)
        }

        ; 엑셀이 제대로 활성화되었는지 확인
        if IsObject(XL) {
            return XL
        }

        ; 1초 대기 후 다시 시도
        Sleep, 1000
    }
}


/*
XL=

Global XL ; 중요함

GetExcelInstance() {
    Loop {
		;~ XL := ComObjCreate("Excel.Application")
		;~ if IsObject(XL) {
			;~ MsgBox, Excel 객체 생성 성공!
		;~ } else {
			;~ MsgBox, Excel 객체 생성 실패...
		;~ }

        ;~ ; 이미 실행 중인 Excel 인스턴스 가져오기
        XL := ComObjActive("Excel.Application")
        ;~ ; 엑셀이 제대로 활성화되었는지 확인
        if IsObject(XL) {
            return XL
        }

        ; 1초 대기 후 다시 시도
        Sleep, 1000
    }
}
