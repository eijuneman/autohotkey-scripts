; 스크립트 시작 부분에 추가
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")

;~ ListLines, Off
;~ Process, Priority, , High
Menu, TRAY, Icon, C:\Users\shwoodnew\Desktop\오토핫키2\Mushroom - Boo.ico
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


;~ host := "127.0.0.1"
host := "59.27.187.25"
user := "root"
pw := "tlsgmdahrwo12#"
;~ database := "mydatabase.businesses"
database := "mydatabase"

sql_start()
global myDB := dbConnect(host, user, pw, database)
if(myDB = "error"){
	MsgBox, % myDB
}
dbQuery(myDB, "set character set euckr")


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

Gui, Add, Button, x10 y+15 w90 h40 g조합1 v조합1 , (매장손님)`n조합
Gui, Font, CDefault W700, Malgun Gothic
Gui, Add, Button, x+9 w90 h40 g조합2 v조합2, (배송손님)`n조합
Gui, Font, CDefault W400, Malgun Gothic

Gui, Add, Button, x10 y+5 w90 h60  g문자발송1 v문자발송1, (매장손님)`n문자발송
Gui, Font, CDefault W700, Malgun Gothic
Gui, Add, Button, x+9 w90 h60 g문자발송2 v문자발송2, (배송손님)`n문자발송
Gui, Font, CDefault W400, Malgun Gothic


Gui, Add, Button, x10 y+15 w90 h40 g완료조합1 v완료조합1, (매장완료)`n조합
Gui, Font, CDefault W700, Malgun Gothic
Gui, Add, Button, x+9 w90 h40 g완료조합2 v완료조합2, (배송완료)`n조합
Gui, Font, CDefault W400, Malgun Gothic


Gui, Add, Button, x10 y+5 w90 h60  g완료발송1 v완료발송1, (매장손님)`n출고완료`n문자발송
Gui, Font, CDefault W700, Malgun Gothic
Gui, Add, Button, x+9 w90 h60 g완료발송2 v완료발송2, (배송손님)`n배송완료`n문자발송



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
		Gui, Show, x-215 y-83 w210 h1560, %WINTITLE% ;  w478 h584
		Sleep, 1
	}
	IfWinExist, %WINTITLE%
	{
		Sleep, 1
	}
		Sleep, 500
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
CoordMode, pixel, Screen
Sleep, 100
	Loop
	{
		ImageSearch, n42x, n42y,  -1199, 35, -1000, 175, *50 *TransWhite C:\Users\shwoodnew\Documents\IMAGESEARCH\sms1.bmp
		if (errorlevel = 1)
		{
			sleep 100
		}
		else if (errorlevel = 2) ; this has no matching if
		{
			msgbox, cant search
		}
		else
		{
			break
		}
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
CoordMode, mouse, Screen
Sleep, 100
	Loop
	{
		ImageSearch, n42x, n42y, -1200, -238, -500, 600, *50 *TransWhite C:\Users\shwoodnew\Documents\IMAGESEARCH\sms1.bmp
		if (errorlevel = 1)
		{
			sleep 100
		}
		else if (errorlevel = 2) ; this has no matching if
		{
			msgbox, cant search
		}
		else
		{
			break
		}
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
CoordMode, mouse, Screen
Sleep, 100
	Loop
	{
		ImageSearch, n42x, n42y,  -1200, -238, -500, 600, *50 *TransWhite C:\Users\shwoodnew\Documents\IMAGESEARCH\sms1.bmp
		if (errorlevel = 1)
		{
			sleep 100
		}
		else if (errorlevel = 2) ; this has no matching if
		{
			msgbox, cant search
		}
		else
		{
			break
		}
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
CoordMode, mouse, Screen
Sleep, 100
	Loop
	{
		ImageSearch, n42x, n42y,  -1200, -238, -500, 600, *50 *TransWhite C:\Users\shwoodnew\Documents\IMAGESEARCH\sms1.bmp
		if (errorlevel = 1)
		{
			sleep 100
		}
		else if (errorlevel = 2) ; this has no matching if
		{
			msgbox, cant search
		}
		else
		{
			break
		}
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
	Gui, 2:Show, x-415 y456 w193 , 도어회사선택 ;  w478 h584
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
	MouseMove, -306, 673
Sleep, 200
	Gui, 3:Destroy
	Gui, 3:Default
	Gui, 3:-SysMenu
	Gui, 3:+alwaysontop
	Gui, 3:Font, S14 CDefault W700, Malgun Gothic

	Gui, 3:Add, Picture, x7 y7 w181 h56 v1color1, %A_Desktop%\오토핫키2\red.png
	Gui, 3:Add, Button, x10 y10 w175 h50 g재단있음, 재단 있음
	Gui, 3:Add, Button, x10 y80 w175 h50 g재단없음, 취`       소
	Gui, 3:Show, x-415 y576 w193 , 재단유무 ;  w478 h584
	Sleep, 1
	;~ Sleep, 100
}
return

재단있음:
{
	control, choosestring, 컷, ComboBox2, %WINTITLE%
	;~ WinKill, 도어회사선택
	;~ WinKill, 재단유무
	MouseMove, 	-106, 673
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
	MouseMove, 	-106, 673


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


MouseMove, -314, 673

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



winmove, %받는분%, , -468, 784




	WinGetPos, X11, Y11, , , ahk_class TfmChitSale
WinMove, ahk_class TfmChitSale, , 0, 1
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
ControlClick, TRzBitBtn10, 인쇄리스트
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
CaptureScreen("1939, 82, 3006, 2028", False, 0)
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


winmove, %받는분%, , -468, 784


winmove, %받는분%, , -868, 784



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
ControlClick, TRzBitBtn10, 인쇄리스트
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
CaptureScreen("1524, 85, 2280, 1152", False, 0) ; 매장출고  주황색
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
	MouseMove, -306, 517
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
	Gui, 4:Show, x-415 y420 w193 , 배송자 선택 ;  w478 h584
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
WinMove, ahk_class TfmChitSale, , 0, 1

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


winmove, ahk_exe whale.exe, , 0, 0,
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
CoordMode, Screen



Loop
	{
		ImageSearch, nx, ny, 0, 160, 3838, 2158, *70 %A_MyDocuments%\IMAGESEARCH\16.png

		if (errorlevel = 1)
		{
			sleep 10
		}

		else if (errorlevel = 2) ; this has no matching if
		{
			msgbox, cant search
		}

		else if (errorlevel = 0) ; this doesnt either
		{
			break
		}

		sleep 10
	}



MouseClick, l, %nx%, %ny%, , 0
Sleep, 100





;~ send, {Tab 2}{Enter}
;~ Sleep, 1000

Loop
	{
		ImageSearch, nx, ny, 0, 160, 3838, 2158, *50 *TransWhite %A_MyDocuments%\IMAGESEARCH\17.png

		if (errorlevel = 1)
		{
			sleep 10
		}

		else if (errorlevel = 2) ; this has no matching if
		{
			msgbox, cant search
		}

		else if (errorlevel = 0) ; this doesnt either
		{
			break
		}

		sleep 10
	}



MouseClick, l, %nx%, %ny%, , 0
Sleep, 100





Loop
	{
		ImageSearch, nx, ny, 0, 160, 3838, 2158, *50 *TransWhite %A_MyDocuments%\IMAGESEARCH\18.png

		if (errorlevel = 1)
		{
			sleep 10
		}

		else if (errorlevel = 2) ; this has no matching if
		{
			msgbox, cant search
		}

		else if (errorlevel = 0) ; this doesnt either
		{
			break
		}

		sleep 10
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
CoordMode, Mouse, Screen
	Loop
	{
		ImageSearch, n32x, n32y, 0, 160, 1000,1000, *50 *TransWhite %A_MyDocuments%\IMAGESEARCH\32.png

		if (errorlevel = 1)
		{
			sleep 10
		}

		else if (errorlevel = 2) ; this has no matching if
		{
			msgbox, cant search
		}

		else
		{
			break
		}

		sleep 10
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
		;~ ImageSearch, n21x_1, n21y_1, 300, 300, 600, 600, *50 *TransWhite C:\Users\shwoodnew\Documents\IMAGESEARCH\21_1.png

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
ControlClick, TRzBitBtn10, 인쇄리스트
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
CaptureScreen("491, 82, 1564, 2027", False, 0)  ; 배송
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
	Loop
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



	Loop
	{
		Sleep, 100
		if FileExist(A_MyDocuments "\7_2번째 전표.xml"){
			break
		}else{
		}
	}



; ;;;;;;; 파이썬 FCM 실행
EnvSet, PATH, %A_EnvPath%;C:\Users\shwoodnew\AppData\Local\Programs\Python\Python313\;C:\Users\shwoodnew\AppData\Local\Programs\Python\Python313\Scripts\
Run, python "C:\Users\shwoodnew\tms_new\send_custom_fcm.py"
; ;;;;;;; 파이썬 FCM 실행


run, \\192.168.0.1\hdd1\일정표 최근\일정표220730\readerspeaker.ahk

Sleep, 2000
;~ path := A_MyDocuments . "\7_2번째 전표.xlsx"
path := A_MyDocuments . "\7_2번째 전표.xml"
XL=
Global XL ; 중요함

XL := ComObjCreate("Excel.Application")
XL.Workbooks.Open(path, 3, 0)
XL.Visible := false

Sleep, 1000


XL.ActiveSheet.Range("1:500").select
XL.selection.Replace("0.00","")

전표번호 := XL.ActiveSheet.Range("B2").value
총금액 := XL.ActiveSheet.Range("Q4").value
업체코드 := XL.ActiveSheet.Range("Q6").value

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
파일이름1 := StrReplace(파일이름1, "|" , ",")
파일이름1 := StrReplace(파일이름1, "." , ",")
파일이름1 := StrReplace(파일이름1, "[" , ",")
파일이름1 := StrReplace(파일이름1, "]" , ",")
파일이름1 := StrReplace(파일이름1, " " , ",")

;~ MsgBox, % 파일이름1
;~ return
*/

CONT1=
CONT=

; 중복 ID 확인 및 삭제
myQuery =
(
DELETE FROM tms_list WHERE ID = '%전표번호%';
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "tms_list 삭제 ErrorCode: " result[2] ", Error : " result[3]
}

myQuery =
(
DELETE FROM tms WHERE ID = '%전표번호%';
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "tms 삭제 ErrorCode: " result[2] ", Error : " result[3]
}

; 새로운 데이터 삽입
myQuery =
(
INSERT INTO tms (날짜, 시간, 업체, 출고지, 비고, 절단, 도어, 배송자, ID, 전화번호, 상태, 총금액, 업체코드)
VALUES ('%배송날짜%', '%출발시각1%', '%거래처명1%', '매장출고', '%기타메모1%', '%재단여부%', '%도어회사%', '%배송자%', '%전표번호%', '%전화번호%', 'Y', %총금액%, %업체코드%);
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "2_1 ErrorCode: " result[2] ", Error : " result[3]
}else{
}

;~ MsgBox, % myQuery

			행마1 := 행 - 1
			행마2 := 행 - 2
			if(행마2!=0){
				Loop, % 행마2 ; csv 파일 값 입력 하기
				{



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

					pdtcode := XL.ActiveSheet.Range("G" A_index).value
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

					단가 := XL.ActiveSheet.Range("E" A_index).value
					단가 := RemoveDecimal(단가)

					if(단가=""){
						단가=0
					}else{
					}



					공급대가 := XL.ActiveSheet.Range("I" A_index).value
					공급대가 := RemoveDecimal(공급대가)

					if(공급대가=""){
						공급대가=0
					}else{
					}

					no := XL.ActiveSheet.Range("H" A_index).value ; 전표숫자

					;~ CONT := (%전표번호%, NULL, %내용%, %수량%, %pdtcode%, %비고%, %no%)
					CONT := "(" 전표번호 ", NULL, " 내용 ", " 수량 ", " 단가 ", " 공급대가 ", " pdtcode ", " 비고 ", " no "),`n"
					CONT1 .= CONT
					if( 행마2 = A_Index){
						break
					}else{
					}
					;~ MsgBox, % CONT1 "`n" A_Index "`n" 행 "`n" 전표번호 "`n" 내용 "`n" 수량 "`n" pdtcode "`n" 비고
				}
			}else{
			}
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


				단가 := XL.ActiveSheet.Range("E" 행마1).value
				단가 := RemoveDecimal(단가)

				if(단가=""){
					단가=0
				}else{
				}



				공급대가 := XL.ActiveSheet.Range("I" 행마1).value
				공급대가 := RemoveDecimal(공급대가)

				if(공급대가=""){
					공급대가=0
				}else{
				}


				pdtcode := XL.ActiveSheet.Range("G" 행마1).value
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

				no := XL.ActiveSheet.Range("H" 행마1).value ; 전표숫자

				CONT := "(" 전표번호 ", NULL, " 내용 ", " 수량 ", " 단가 ", " 공급대가 ", " pdtcode ", " 비고 ", " no ")"
				;~ CONT = (%전표번호%, NULL, %내용%, %수량%, %pdtcode%, %비고%, %no%)`n
				CONT1 .= CONT

				;~ CONT1 .= "`n;"


			;~ MsgBox, % CONT1


			myQuery =
			myQuery =
            (
			INSERT INTO tms_list (ID, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no)
			VALUES
			%CONT1%
			;
			)
			;~ MsgBox, % "myQuery`n" myQuery
            result := dbQuery(myDB, myQuery)
			if(errorCheck(result)){
				MsgBox, % "2_2 ErrorCode: " result[2] ", Error : " result[3] "`n`n쿼리>`n" myQuery
			}else{
			}





XL.ActiveWorkbook.Save()
XL.ActiveWorkbook.Close(1)
XL.Quit()
XL=
	/*
	ControlClick TRzListBox1, 인쇄리스트, , ,, x189 y281 ; 연습 4
ControlClick, TRzBitBtn1, 인쇄리스트
*/

Sleep, 100

SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\1.mp3

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
XL.Quit()
XL=
ExitApp
return
}




!+6::
캘린더2:
{
	Loop
	{
		Sleep, 100
		if FileExist(A_MyDocuments "\7_2번째 전표.xml"){
			FileDelete, %A_MyDocuments%\7_2번째 전표.xml
		}else{
			break
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
SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\기록중.mp3



	Loop
	{
		Sleep, 100
		if FileExist(A_MyDocuments "\7_2번째 전표.xml"){
			break
		}else{
		}
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




XL.ActiveSheet.Range("1:500").select
XL.selection.Replace("0.00","")

전표번호 := XL.ActiveSheet.Range("B2").value
총금액 := XL.ActiveSheet.Range("Q4").value
업체코드 := XL.ActiveSheet.Range("Q6").value

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
파일이름1 := StrReplace(파일이름1, "]" , ",")
파일이름1 := StrReplace(파일이름1, "|" , ",")
파일이름1 := StrReplace(파일이름1, "." , ",")
파일이름1 := StrReplace(파일이름1, " " , ",")
*/

; 중복 ID 확인 및 삭제
myQuery =
(
DELETE FROM tms_list WHERE ID = '%전표번호%';
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "tms_list 삭제 ErrorCode: " result[2] ", Error : " result[3]
}

myQuery =
(
DELETE FROM tms WHERE ID = '%전표번호%';
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "tms 삭제 ErrorCode: " result[2] ", Error : " result[3]
}

; 새로운 데이터 삽입
myQuery =
(
INSERT INTO tms (날짜, 시간, 업체, 출고지, 비고, 절단, 도어, 배송자, ID, 전화번호, 상태, 총금액, 업체코드)
VALUES ('%배송날짜%', '%출발시각1%', '%거래처명1%', '%배송지1%', '%기타메모1%', '%재단여부%', '%도어회사%', '%배송자%', '%전표번호%', '%전화번호%', 'Y', %총금액%, %업체코드%);
)
result := dbQuery(myDB, myQuery)
if(errorCheck(result)){
    MsgBox, % "2_1 ErrorCode: " result[2] ", Error : " result[3]
}else{
}




;~ MsgBox, % myQuery

			행마1 := 행 - 1
			행마2 := 행 - 2
			if(행마2!=0){
				Loop, % 행마2 ; csv 파일 값 입력 하기
				{



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

					pdtcode := XL.ActiveSheet.Range("G" A_index).value
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

					단가 := XL.ActiveSheet.Range("E" A_index).value
					단가 := RemoveDecimal(단가)

					if(단가=""){
						단가=NULL
					}else{
						단가 := 단가 "'"
						단가 := "'" 단가
					}


					공급대가 := XL.ActiveSheet.Range("I" A_index).value
					공급대가 := RemoveDecimal(공급대가)

					if(공급대가=""){
						공급대가=NULL
					}else{
						공급대가 := 공급대가 "'"
						공급대가 := "'" 공급대가
					}

					no := XL.ActiveSheet.Range("H" A_index).value ; 전표숫자

					;~ CONT := (%전표번호%, NULL, %내용%, %수량%, %pdtcode%, %비고%, %no%)
					CONT := "(" 전표번호 ", NULL, " 내용 ", " 수량 ", " 단가 ", " 공급대가 ", " pdtcode ", " 비고 ", " no "),`n"
					CONT1 .= CONT
					if( 행마2 = A_Index){
						break
					}else{
					}
					;~ MsgBox, % CONT1 "`n" A_Index "`n" 행 "`n" 전표번호 "`n" 내용 "`n" 수량 "`n" pdtcode "`n" 비고
				}
			}else{
			}
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


				단가 := XL.ActiveSheet.Range("E" 행마1).value
				단가 := RemoveDecimal(단가)

				if(단가=""){
					단가=NULL
				}else{
					단가 := 단가 "'"
					단가 := "'" 단가
				}



				공급대가 := XL.ActiveSheet.Range("I" 행마1).value
				공급대가 := RemoveDecimal(공급대가)

				if(공급대가=""){
					공급대가=NULL
				}else{
					공급대가 := 공급대가 "'"
					공급대가 := "'" 공급대가
				}


				pdtcode := XL.ActiveSheet.Range("G" 행마1).value
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

				no := XL.ActiveSheet.Range("H" 행마1).value ; 전표숫자

				CONT := "(" 전표번호 ", NULL, " 내용 ", " 수량 ", " 단가 ", " 공급대가 ", " pdtcode ", " 비고 ", " no ")"
				;~ CONT = (%전표번호%, NULL, %내용%, %수량%, %pdtcode%, %비고%, %no%)`n
				CONT1 .= CONT

				;~ CONT1 .= "`n;"


			;~ MsgBox, % CONT1


			myQuery =
			myQuery =
            (
			INSERT INTO tms_list (ID, 출, 내용, 수량, 단가, 공급대가, pdt_code, 비고, no)
			VALUES
			%CONT1%
			;
			)
			;~ MsgBox, % "myQuery`n" myQuery
            result := dbQuery(myDB, myQuery)
			if(errorCheck(result)){
				MsgBox, % "2_2 ErrorCode: " result[2] ", Error : " result[3] "`n`n쿼리>`n" myQuery
			}else{
			}





XL.ActiveWorkbook.Save()
XL.ActiveWorkbook.Close(1)
XL.Quit()
XL=


Sleep, 100

SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\1.mp3

;~ MsgBox, , ,적성완료, 0.8
;~ Sleep, 800

;~ Sleep, 1000
	;~ winkill, ahk_exe hcell.exe
	;~ Process, close, EXCEL.EXE
Sleep, 100



return
}




!+7::
캘린더3:
{
	Loop
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
;~ ControlGetText, 배송날짜, Edit3,  %WINTITLE%
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

	Loop
	{
		Sleep, 100
		if FileExist(A_MyDocuments "\5.입하지시서.xml"){
			Sleep, 1000
			break
		}else{
		}
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

					no := XL.ActiveSheet.Range("G" A_index).value ; 전표숫자

					CONT := "(" 전표번호 ", NULL, " 내용 ", " 수량 ", " pdtcode ", " 비고 ", " no "),`n"
					CONT1 .= CONT
					if( 행마2 = A_Index){
						break
					}else{
					}
					;~ MsgBox, % CONT1 "`n" A_Index "`n" 행 "`n" 전표번호 "`n" 내용 "`n" 수량 "`n" pdtcode "`n" 비고
				}
			}else{
			}
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

				no := XL.ActiveSheet.Range("G" 행마1).value ; 전표숫자

				CONT := "(" 전표번호 ", NULL, " 내용 ", " 수량 ", " pdtcode ", " 비고 ", " no ")"
				CONT1 .= CONT

				;~ CONT1 .= "`n;"


			;~ MsgBox, % CONT1


			myQuery =
			myQuery =
            (
			INSERT INTO tms_list (ID, 출, 내용, 수량, pdt_code, 비고, no)
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





XL.ActiveWorkbook.Save()
XL.ActiveWorkbook.Close(1)
XL.Quit()
XL=
Sleep, 100
SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\F1.mp3

;~ MsgBox, , ,적성완료, 0.8
;~ Sleep, 800

;~ run, \\192.168.0.1\hdd1\일정표 최근\일정표220730\readerspeaker.ahk

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
