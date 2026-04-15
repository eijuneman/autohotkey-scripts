;~무한반복이
#NoEnv
Process, Priority, , High
Menu, TRAY, Icon, Mushroom - Bee.ico
#SingleInstance, force
#WinActivateForce
#Persistent
SetWorkingDir %A_ScriptDir%
DetectHiddenText,on
DetectHiddenWindows, on
;~ SetTimer, timer1, 100
SetTimer, timer0, 500
#Include, screencapture.ahk
;~ SetBatchLines, -1


SetKeyDelay, 1



; 제대로판매 마우스왼쪽 옆 버튼 활용 도우미

; 전표
Menu, MyMenu, Add, 열기 모니터 전표(&1) , open
Menu, MyMenu, Add, 열기 모니터 전표 Mute(&2) , open2
Menu, MyMenu, Add, 열기 모니터 전표 Just(&3) , open3
Menu, MyMenu, Add, 닫기 모니터 전표(&4) , close
Menu, MyMenu, Add, ◘금액전표스샷(&5) , screenshot
Menu, MyMenu, Add  ; 라인선
; 인쇄 하위
;~ Menu, Submenu1, Add, [O O] 2장인쇄, gprint
;~ Menu, Submenu1, Add, [O X] 단가 O 전표인쇄, oprint
;~ Menu, Submenu1, Add, [X O] 단가 X 전표인쇄, fprint
; 인쇄 상위
Menu, MyMenu, Add, Transport Mangement System , timetable
Menu, MyMenu, Add, Warehouse Management System(&0) , timetable2
;~ Menu, MyMenu, Add, 전표인쇄, :Submenu1
; Door Order 하위 메뉴
Menu, DoorOrderMenu, Add, 합판다 웹발주(&1), doororder_web
Menu, DoorOrderMenu, Add, 합판다 카카오톡센더(&2), doororder_kakao
Menu, DoorOrderMenu, Add, 기존 버전 도어발주(&3), doororder
Menu, MyMenu, Add, Door Order(&-), :DoorOrderMenu


Menu, MyMenu, Add  ; 라인선
;--------------------------------------------------------------------------------------------------------
Menu, 기업은행, Add, 기업은행.xlsx 열람(&1), banklist
Menu, 기업은행, Add, 기업은행 로그인(&2), banklogin
Menu, 기업은행, Add, 기업은행 기록 만들기(&3), bankmake
Menu, MyMenu, Add, 기업은행(&6) , :기업은행
;--------------------------------------------------------------------------------------------------------
Menu, MyMenu, Add  ; 라인선
;--------------------------------------------------------------------------------------------------------
Menu, 홈텍스, Add, 홈텍스 열람(&1), hometaxlist
Menu, 홈텍스, Add, 홈텍스 로그인(&2), hometaxlogin
Menu, 홈텍스, Add, 홈텍스 기록 만들기(&3), hometaxmake
Menu, MyMenu, Add, 홈텍스(&7) , :홈텍스
;--------------------------------------------------------------------------------------------------------
Menu, MyMenu, Add  ; 라인선
;--------------------------------------------------------------------------------------------------------
Menu, MyMenu, Add, 손익계산서 제작(&8), 손익계산서
;--------------------------------------------------------------------------------------------------------
Menu, MyMenu, Add  ; 라인선
Menu, 외상장부, Add, 외상장부 열람(&1), creditlist
Menu, 외상장부, Add, 외상장부 기록 만들기(&2), creditmake
Menu, MyMenu, Add, 외상장부 작성(&9), :외상장부
;--------------------------------------------------------------------------------------------------------
Menu, MyMenu, Add  ; 라인선
;--------------------------------------------------------------------------------------------------------
;~ Menu, MyMenu, Add, ▤ 메모장열기, monitorshow1
;~ Menu, MyMenu, Add, ▥ 계산기열기, monitorshow2
;~ Menu, MyMenu, Add, ▥ 계산기열기, monitorshow2
Menu, MyMenu, Add, 견적서작성, compare
Menu, MyMenu, Add, 단위면적 자재산출, howmany
Menu, MyMenu, Add  ; 라인선
; 배송문자 시스템
Menu, MyMenu, Add, 재현카달록스캔, sch  ; 그 부메뉴 아래에 또다른 메뉴 항목을 추가합니다.
Menu, MyMenu, Add  ; 라인선
; 인쇄 하위
Menu, Submenu2, Add, 재현매입 신흥카톡으로, jaehyunintex

Menu, Submenu2, Add, 다른이름저장 창제거, killsave
Menu, Submenu2, Add, 돋보기 테스크바 제거, taskdel
Menu, Submenu2, Add, 은행로그인, taskdel
Menu, Submenu2, Add, 소리내어읽기, read  ; 그 부메뉴 아래에 또다른 메뉴 항목을 추가합니다.
Menu, Submenu2, Add, 홈페이지단가 올리기, upload  ; 그 부메뉴 아래에 또다른 메뉴 항목을 추가합니다.
Menu, Submenu2, Add, 단가변환프로그램, exchange  ; 그 부메뉴 아래에 또다른 메뉴 항목을 추가합니다.
Menu, Submenu2, Add, CS관리, CS  ; 그 부메뉴 아래에 또다른 메뉴 항목을 추가합니다.
Menu, Submenu2, Add, 우딘자동입력, 우딘자동입력  ; 그 부메뉴 아래에 또다른 메뉴 항목을 추가합니다.
; 인쇄 상위
Menu, MyMenu, Add, 기타(&E) , :Submenu2
;~ run, %A_ScriptDir%\2.ahk
run, %A_ScriptDir%\스니핑툴.ahk
;~ run, %A_ScriptDir%\마우스그리기.ahk
return

#z::
XButton1::
/*
IfWinNotExist, ahk_class TfmChitSale
{
	Menu, MyMenu, Disable, 닫기 모니터 전표(&C)
	; 인쇄 하위
	;~ Menu, Submenu1, Disable, [O O] 2장인쇄
	;~ Menu, Submenu1, Disable, [O X] 단가 O 전표인쇄
	;~ Menu, Submenu1, Disable, [X O] 단가 X 전표인쇄
	; 인쇄 상위
	;~ Menu, MyMenu, Disable, 전표인쇄
	;~ Menu, Submenu2, Disable, 소리내어읽기
}
else
{
	Menu, MyMenu, Enable, 닫기 모니터 전표(&C)
	; 인쇄 하위
	;~ Menu, Submenu1, Enable, [O O] 2장인쇄
	;~ Menu, Submenu1, Enable, [O X] 단가 O 전표인쇄
	;~ Menu, Submenu1, Enable, [X O] 단가 X 전표인쇄
	; 인쇄 상위
	;~ Menu, MyMenu, Enable, 전표인쇄
	;~ Menu, Submenu2, Enable, 소리내어읽기
}
*/
Menu, MyMenu, Show  ; 즉, Win-Z 핫키를 누르면 메뉴가 나타납니다.
;~ gosub, monitorshow2
return



bankmake:
{

	run, %A_ScriptDir%\excel com\기업은행.ahk

run, C:\Users\shwoodnew\Desktop\오토핫키2\excel com\비용처리 컨트롤러.ahk
return
}



banklogin:
{

	run, %A_ScriptDir%\excel com\기업은행로그인.ahk

return
}



hometaxlogin:
{

	run, %A_ScriptDir%\홈텍스 com\홈텍스로그인.ahk

return
}



banklist:
{

	run, %A_ScriptDir%\excel com\기업은행.xlsx

run, C:\Users\shwoodnew\Desktop\오토핫키2\excel com\비용처리 컨트롤러.ahk
return
}




hometaxmake:
{

	run, %A_ScriptDir%\홈텍스 com\홈텍스.ahk

return
}




hometaxlist:
{

	run, %A_ScriptDir%\홈텍스 com\홈텍스.ahk

return
}



손익계산서:
{

	run, %A_ScriptDir%\excel com\손익계산서2.ahk

return
}



Menu, 홈텍스, Add, 외상장부 열람(&1), creditlist
Menu, 홈텍스, Add, 홈텍스 기록 만들기(&2), creditmake





creditlist:
{
	run, %A_ScriptDir%\excel com\외상장부.xlsx
	return
}


creditmake:
{
	run, %A_ScriptDir%\excel com\외상장부.ahk
	return
}





/*
F5::
{

	IfWinActive, ahk_class TfmChitSale
	{

		ControlGetText, 출고지, TRzDBEdit13, ahk_class TfmChitSale

		if (출고지 = "")
		{
			;~ Clipboard := 매장출고
			;~ ControlSetText, TRzDBEdit13, shwood, ahk_class TfmChitSale
			ControlFocus, TRzDBEdit13, ahk_class TfmChitSale
			send, 매장출고{Space}{BackSpace}
			Sleep, 1000

			;~ Send, {enter}
		}
		else
		{
		}
		ControlClick, TAdvToolBar1, ahk_class TfmChitSale,,,, x273 y13
		ControlClick, button3, 일정표
		SoundPlay, C:\Users\shwoodnew\Documents\listadd.mp3
	}
	else
	{
		Send, {F5}
	}


}
return

*/







howmany:
{
	run, \\192.168.0.1\hdd1\일정표 최근\일정표220730\적산\자재산출.ahk
}
return







F13::
open:
;~ gosub, monitorshow2

	run, C:\Users\shwoodnew\Desktop\포멧 이전 자료\오토핫키2\시작프로그램\Simple_Zoom.exe
	 WinMaximize, ahk_class TfmMain
SoundPlay, %A_ScriptDir%\MP_맑은벨.mp3
Sleep, 600

SoundPlay, C:\Users\shwoodnew\Documents\녹음.mp3
CoordMode, MOUSE, SCREEN ; 전표켜기

	;~ WinWait, ahk_exe JedaeroM.exe,
	;~ IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	;~ WinWaitActive, ahk_exe JedaeroM.exe,
Sleep, 100

If WinExist("매출전표 (수정전표)") or WinExist("매출전표")
{
	;~ MsgBox 있음
}
else
{
	ControlClick, TAdvToolBar1, ahk_class TfmMain,,,, NA x400 y20
	;~ MsgBox 없음
}
	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
	Sleep, 1


WinMove, ahk_class TfmChitSale, , -2, 0
				WinSet, Alwaysontop, off, 시퀀스 01.mp4 - 팟플레이어
WinShow, 확대화면2
WinShow, 확대화면3
WinShow, 확대화면4
WinShow, 확대화면5
;~ WinHide, 확대화면7
;~ WinHide, 확대화면8
;~ WinHide, 확대화면9

				;~ IfWinNotExist, 배송문자 시스템  -by shwood-
					;~ run, s누르기2.ahk, C:\Users\shwoodnew\Desktop
				;~ else
				;~ {
				;~ }
				;~ IfWinExist, 배송문자 시스템  -by shwood-
				;~ {
					;~ WinActivate, 배송문자 시스템  -by shwood-
				;~ }

WinActivate, ahk_class TfmChitSale


return





open2:
;~ gosub, monitorshow2
	run, C:\Users\shwoodnew\Desktop\포멧 이전 자료\오토핫키2\시작프로그램\Simple_Zoom.exe
CoordMode, MOUSE, SCREEN ; 전표켜기
	 WinMaximize, ahk_class TfmMain

	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
Sleep, 100

If WinExist("매출전표 (수정전표)") or WinExist("매출전표")
{
	;~ MsgBox 있음
}
else
{
	ControlClick, TAdvToolBar1, ahk_class TfmMain,,,, NA x400 y20
	;~ MsgBox 없음
}
	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
	Sleep, 1



WinMove, ahk_class TfmChitSale, , -2, 0
				WinSet, Alwaysontop, off, 시퀀스 01.mp4 - 팟플레이어
WinShow, 확대화면2
WinShow, 확대화면3
WinShow, 확대화면4
WinShow, 확대화면5
;~ WinHide, 확대화면7
;~ WinHide, 확대화면8
;~ WinHide, 확대화면9
				;~ IfWinNotExist, 배송문자 시스템  -by shwood-
					;~ run, s누르기2.ahk, C:\Users\shwoodnew\Desktop
				;~ else
				;~ {
				;~ }

WinActivate, ahk_class TfmChitSale


return




open3:
Sleep, 100

If WinExist("매출전표 (수정전표)") or WinExist("매출전표")
{
	;~ MsgBox 있음
}
else
{
	ControlClick, TAdvToolBar1, ahk_class TfmMain,,,, NA x400 y20
	;~ MsgBox 없음
}
	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
	Sleep, 1



return





close:

F12::

{
	IfWinExist, ahk_class TfmChitSale
	{
		WinActivate, ahk_class TfmChitSale
		WinSet, Top, , POS 세로13.mp4 - 팟플레이어
		WinActivate, POS 세로13.mp4 - 팟플레이어

		WinActivate, ahk_class TfmChitSale
		WinHide, 확대화면5
		WinHide, 확대화면4
		WinHide, 확대화면3
		WinHide, 확대화면2
		;~ ControlClick,  TAdvToolBar1, ahk_class TfmChitSale, , , , x343 y14
		winkill, ahk_class TfmChitSale
	}
	else
	{
		Send, {f12}
	}

	IfWinExist, 닫기 취소확인
	{
		WinSet, Top, , ahk_class CHslShowAtlView
		WinActivate, ahk_class CHslShowAtlView
		Sleep,100
		WinActivate, 닫기 취소확인
	}
	else
	{
	}
}

killsave:
{
	winkill, 다른 이름으로 저장
	Process, close, Simple_Zoom.exe
}
return



gprint: ;매장+사무실 전표 인쇄 (2장인쇄)
{
SoundPlay, C:\Users\shwoodnew\Documents\녹음2.mp3

WinWait, ahk_class TfmChitSale,
IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
WinWaitActive, ahk_class TfmChitSale,
Sleep, 200
send, {f8}

	WinWait, ahk_class TfmFr4Report,
	IfWinNotActive, ahk_class TfmFr4Report, , WinActivate, ahk_class TfmFr4Report,
	WinWaitActive, ahk_class TfmFr4Report,

sleep,500
ControlClick TRzListBox1, 인쇄하기, , ,, x189 y281 ; 연습 4
Sleep, 500
Send, {f9}
sleep,800
Send, {enter}
Sleep, 200


	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
	Sleep, 200

send, {f8}

	WinWait, ahk_class TfmFr4Report,
	IfWinNotActive, ahk_class TfmFr4Report, , WinActivate, ahk_class TfmFr4Report,
	WinWaitActive, ahk_class TfmFr4Report,
	sleep,500

ControlClick TRzListBox1, 인쇄하기, , ,, x189 y312  ; 2번쨰 11
Sleep, 200
Send, {F9}
sleep,800
Send, {Enter}
sleep,1000

	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
	Sleep, 200

send, {f8}
	WinWait, ahk_class TfmFr4Report,
	IfWinNotActive, ahk_class TfmFr4Report, , WinActivate, ahk_class TfmFr4Report,
	WinWaitActive, ahk_class TfmFr4Report,
	sleep,500

ControlClick TRzListBox1, 인쇄하기, , ,, x189 y281 ; 연습 4
Send, {F12}
}
return



oprint: ;사무실 전표 인쇄 (단가0)
{
SoundPlay, C:\Users\shwoodnew\Documents\녹음2.mp3

WinWait, ahk_class TfmChitSale,
IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
WinWaitActive, ahk_class TfmChitSale,
Sleep, 200
Send, {F8}
sleep,600
ControlClick TRzListBox1, 인쇄하기, , ,, x189 y281 ; 연습 4
Sleep, 200
Send, {F9}
sleep,800
Send, {Enter}
sleep,1000
Send, {F12}
}
return



fprint: ;매장 전표 인쇄 (단가X)
{
SoundPlay, C:\Users\shwoodnew\Documents\녹음2.mp3

	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
	Sleep, 200

Send, {F8}

	WinWait, ahk_class TfmFr4Report,
	IfWinNotActive, ahk_class TfmFr4Report, , WinActivate, ahk_class TfmFr4Report,
	WinWaitActive, ahk_class TfmFr4Report,
	sleep,500

ControlClick TRzListBox1, 인쇄하기, , ,, x189 y312  ; 2번쨰 11
Sleep, 200
Send, {F9}
sleep,800
Send, {Enter}
sleep,1000

	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
	Sleep, 200


Send, {F8}
	WinWait, ahk_class TfmFr4Report,
	IfWinNotActive, ahk_class TfmFr4Report, , WinActivate, ahk_class TfmFr4Report,
	WinWaitActive, ahk_class TfmFr4Report,
	sleep,500

ControlClick TRzListBox1, 인쇄하기, , ,, x189 y281 ; 연습 4
Send, {F12}
}
return




XButton2::
sch:
timetable:
{
	;~ MsgBox, ㅇㅇ
	;~ run, %A_Desktop%\일정표20.exe
	;~ run, \\192.168.0.1\hdd1\일정표 최근\일정표220730\일정표21.ahk
	;~ run, %A_Desktop%\일정표2025\일정표21.exe

	run, "C:\Program Files\Naver\Naver Whale\Application\whale.exe" "https://shwood.co.kr/sales/sales_listup"

}
return



timetable2:
{

	run, %A_Desktop%\WMS\WMS_VER2.ahk


}
return

!J::
{
	IfWinExist, ahk_class TfmChitSale
	{
			ControlFocus, 	TRzDBEdit13, ahk_class TfmChitSale
	}
	else
	{
		send, !J
	}
}
return




<^<+XButton2::
{
Run explore \\192.168.0.1\hdd1\일정표 최근\일정표220730\매출
}
return





/*

~LButton::
{

	SetWinDelay, 0
CoordMode, Mouse, Relative
MouseGetPos, ax, ay
wingetpos, wx, wy, , , ahk_class TfmChitSale




MouseGetPos, UnderX, UnderY, WinUnderHwnd, ControlUnder

while GetKeyState("LButton")

	;~ if ( instr(ControlUnder, "TButton2") || instr(ControlUnder, "TButton3") )
	;~ {
		;~ Sleep, 300
		;~ ControlGettext, WhichButton, %ControlUnder%, Ahk_id %WinUnderHwnd%

			;~ WinWait, 인쇄하기,
			;~ IfWinNotActive, 인쇄하기, , WinActivate, 인쇄하기,
			;~ WinWaitActive, 인쇄하기,

		;~ ControlClick, TRzBitBtn1, 인쇄하기
		;~ CoordMode, mouse, Screen
		;~ Mousemove, -426, 559
		;~ SoundBeep, 1000
	;~ }

	;~ if instr(ControlUnder, "TButton3")
	;~ {
		;~ Sleep, 300
		;~ ControlGettext, WhichButton, %ControlUnder%, Ahk_id %WinUnderHwnd%
		;~ winwait, 인쇄하기
		;~ ControlClick, TRzBitBtn1, 인쇄하기
		;~ CoordMode, mouse, Screen
		;~ Mousemove, 1700, 100
	;~ }



	if (ax > 986 && ax < 1044 && ay < 55)
	{

			IfWinActive, ahk_class TfmChitSale
			{
				;~ WinSet, Alwaysontop, on, 시퀀스 01.mp4 - 팟플레이어
				;~ WinShow, POS 세로13.mp4 - 팟플레이어
				;~ WinSet, Top, , POS 세로13.mp4 - 팟플레이어



				;~ WinHide, 확대화면4
				;~ WinHide, 확대화면3
				;~ WinHide, 확대화면2
				;~ WinHide, 확대화면5
				ControlClick,  TAdvToolBar1, ahk_class TfmChitSale, , , , x343 y14
							IfWinExist, 닫기 취소확인
							{
								WinSet, Top, , ahk_class CHslShowAtlView
								WinActivate, ahk_class CHslShowAtlView
								Sleep,100
								WinActivate, 닫기 취소확인
							}
							else
							{
							}
			}
			else
			{
			}

			Process, close, Simple_Zoom.exe

		return
	}

	if (ax > 355 && ax < 435 && ay > 54 && ay < 89)
	{
					IfWinActive,  ahk_class TfmMain
			run, C:\Users\shwoodnew\Desktop\포멧 이전 자료\오토핫키2\시작프로그램\Simple_Zoom.exe
	 WinMaximize, ahk_class TfmMain
		Sleep, 1

		IfWinActive, ahk_class TfmMain
		{
			SoundPlay, %A_ScriptDir%\MP_맑은벨.mp3
			Sleep, 600
			SoundPlay, C:\Users\shwoodnew\Documents\녹음.mp3
			CoordMode, MOUSE, SCREEN ; 전표켜기
			WinActivate, ahk_exe JedaeroM.exe
	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
		Sleep, 1






			WinMove,  ahk_class TfmChitSale, , -2, 0
				WinSet, Alwaysontop, off, 시퀀스 01.mp4 - 팟플레이어
			WinShow, 확대화면2
			WinShow, 확대화면3
			WinShow, 확대화면4
			WinShow, 확대화면5

			WinActivate, ahk_class TfmChitSale



	;~ WinWait, ahk_class TfmChitSale,
	;~ IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	;~ WinWaitActive, ahk_class TfmChitSale,
	Sleep, 1
;~ WinMove, ahk_class TfmChitSale, , -2, 0
;~ WinSet, Alwaysontop, off, POS 세로13.mp4 - 팟플레이어
;~ WinShow, 확대화면2
;~ WinShow, 확대화면3
;~ WinShow, 확대화면4
;~ WinShow, 확대화면5
;~ WinHide, 확대화면7
;~ WinHide, 확대화면8
;~ WinHide, 확대화면9

				;~ IfWinNotExist, 배송문자 시스템  -by shwood-
					;~ run, s누르기2.ahk, C:\Users\shwoodnew\Desktop
				;~ else
				;~ {
				;~ }
				;~ IfWinExist, 배송문자 시스템  -by shwood-
				;~ {
					;~ WinActivate, 배송문자 시스템  -by shwood-
				;~ }


WinActivate, ahk_class TfmChitSale












		}
		return
	}



	if (ax > 955 && ax < 1066 && ay > 600 && ay < 626)
	{
		IfWinActive, 닫기 취소확인
		{
						;~ winshow, POS 세로13.mp4 - 팟플레이어
			;~ WinHide, 확대화면4
			;~ WinHide, 확대화면3
			;~ WinHide, 확대화면2
			;~ WinHide, 확대화면5


		}
		return
	}



}



return
*/

우딘자동입력:
{

run, %A_ScriptDir%\우딘자동입력.ahk
}
return




taskdel: ; 테스크바에 돋보기 제거하기
{
winset, Exstyle, -0x80, 돋보기1
winset, Exstyle, -0x80, 돋보기2
winset, Exstyle, -0x80, 돋보기3
winset, Exstyle, -0x80, 돋보기4
winset, Exstyle, -0x80, 돋보기5
winset, Exstyle, -0x80, 돋보기6
winset, Exstyle, -0x80, 확대화면1
winset, Exstyle, -0x80, 확대화면2
winset, Exstyle, -0x80, 확대화면3
winset, Exstyle, -0x80, 확대화면4
winset, Exstyle, -0x80, 확대화면5
winset, Exstyle, -0x80, 확대화면6
}
return

<^<+<!NumpadEnter::
{
	CoordMode, mouse, screen
	Send, {Ctrl}
	MouseMove, 1256, 726, 7
	Sleep, 100
	Send, {Ctrl}

}
return



<^<+<!m::
monitorshow1: ; 메모장

{
   if winexist("ahk_class Notepad")
   {
      winactivate, ahk_class Notepad
   }
   else
   {
      run, notepad.exe
   }
}
return



<^<+<!c::
monitorshow2: ; 계산기
{
   if winexist("계산기")
   {
      winactivate, 계산기
   }
   else
   {
      run, calc.exe
   }
}
return



<^<+<!p::
monitorshow3: ; 그림판
{
   if winexist("ahk_exe mspaint.exe")
   {
      winactivate, ahk_exe mspaint.exe
   }
   else
   {
      run, mspaint.exe
   }
}
return

<^<+<!k::
{
   if winexist("카카오톡")
   {
      winactivate, 카카오톡
   }
   else
   {
      run, C:\Program Files (x86)\Kakao\KakaoTalk\KakaoTalk.exe
   }
}
return


<^<+<!j::
{
   if winexist("ahk_exe jedaerom.exe")
   {
      winactivate, ahk_exe jedaerom.exe
   }
   else
   {
      run, C:\참좋은소프트\제대로판매재고M\JedaeroM.exe
   }
}
return


<^<+<!e::
{
   if winexist("ahk_exe msedge.exe")
   {
      winactivate, ahk_exe msedge.exe
   }
   else
   {
      run, C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe
   }
}
return


<^<+<!q::
{
   if winexist("ahk_exe chrome.exe")
   {
      winactivate, ahk_exe chrome.exe
   }
   else
   {
      run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
   }
}
return


<^<+<!w::
{
   if winexist("ahk_exe whale.exe")
   {
      winactivate, ahk_exe whale.exe
   }
   else
   {
      run, C:\Program Files\Naver\Naver Whale\Application\whale.exe
   }
}
return






















jaehyunintex:
{
}
return


^1::
read:
{
ControlGetText, 거래처, TRzEdit8, ahk_class TfmChitSale
ControlGetText, 날짜, TRzDBDateTimeEdit1, ahk_class TfmChitSale
ControlGetText, 시간,  TRzDBEdit12, ahk_class TfmChitSale
ControlGetText, 장소, TRzDBEdit13, ahk_class TfmChitSale
ControlClick, TRzBitBtn8, ahk_class TfmChitSale

	WinWait,  인쇄하기,
	IfWinNotActive,  인쇄하기, , WinActivate,  인쇄하기,
	WinWaitActive,  인쇄하기,
	Sleep, 100

ControlClick, TRzListBox1, 인쇄하기 , , , ,x223 y344
ControlClick, TRzBitBtn6, 인쇄하기
Sleep, 100

	WinWait,  Export to Excel,
	IfWinNotActive,  Export to Excel, , WinActivate,  Export to Excel,
	WinWaitActive,  Export to Excel,
	Sleep, 100

ControlClick, TButton2, Export to Excel

	WinWait,  다른 이름으로 저장,
	IfWinNotActive,  다른 이름으로 저장, , WinActivate,  다른 이름으로 저장,
	WinWaitActive,  다른 이름으로 저장,

ControlClick, 	Button2, 다른 이름으로 저장

	WinWait,  7.2번째 전표333.xls - Excel,
	IfWinNotActive,  7.2번째 전표333.xls - Excel, , WinActivate,  7.2번째 전표333.xls - Excel,
	WinWaitActive,  7.2번째 전표333.xls - Excel,


Xl := ComObjActive("Excel.Application")

winmove, ahk_class XLMAIN, , 5, 5
WinMaximize, ahk_class XLMAIN

xl.Cells.Replace(What:="ea", Replacement:="개")
xl.Cells.Replace(What:="~*", Replacement:="에 ")

Xl.range("a1:ae60").Select ;
Xl.Selection.unMerge

xl.range("q:q").select
xl.selection.copy
xl.range("r:r").pastespecial

xl.range("o:o").select
xl.selection.copy
xl.range("q:q").pastespecial

xl.range("r:r").select
xl.selection.copy
xl.range("n:n").pastespecial

xl.range("c:c").select
xl.selection.copy
xl.range("d:d").pastespecial

XL.Range("c11").value := "번째 출고 품목? "
SourceRange := XL.Range("C11")
SourceRange.AutoFill(XL.Range("c11:c46"))


XL.Range("o11").value := "출고수량은?"
SourceRange := XL.Range("o11")
SourceRange.AutoFill(XL.Range("o11:o46"))

xl.Range("P11:P46").Select
xl.Selection.NumberFormat := "#,##0"

셀 := 11
Loop
{
	복사 = B%셀%
	var := xl.Range(복사).value
	if(var = "")
	break
	else
	셀 ++
}

셀 --
복사 = B11:Q%셀%

XL.range(복사).select
xl.selection.copy

ClipWait, 0.5
say := clipboard

Xl := ""  ; Excel COM 객체 해제
winkill, 7.2번째 전표333.xls - Excel
voice := ComObjCreate("SAPI.SpVoice")
voice.Speak(거래처)
Sleep, 100
voice.Speak(날짜)
Sleep, 100
voice.Speak(시간)
Sleep, 100
voice.Speak(장소)
Sleep, 100
ControlClick, TRzBitBtn1, 인쇄하기
voice.Speak(say)
voice := ""  ; SAPI COM 객체 해제
}
return



compare:
{
WinWait, ahk_exe JedaeroM.exe,
IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
WinWaitActive, ahk_exe JedaeroM.exe,
Sleep, 100
send, {Esc 10}{LAlt}{Enter}{Right 4}{Down 6}{Enter}
Sleep, 1000
ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe,,,,x62 y14
}
return


upload:
{
run, 홈페이지단가변환.ahk, C:\Users\shwoodnew\Desktop\오토핫키2
	return
}


CS:
{
run, CS관리.ahk, \\192.168.0.1\hdd1\오토핫키2
	return
}




exchange:
{
run, 단가변환프로그램24년.ahk, \\192.168.0.1\hdd1\단가변환프로그램
}
return


doororder_web:
{
	run, "C:\Program Files\Naver\Naver Whale\Application\whale.exe" "https://shwood.co.kr/product/product_cart"
}
return

doororder_kakao:
{
	run, cmd /k "pushd \\192.168.0.1\hdd1\DoorOrder\KakaoSender && python main.py && popd"
}
return

doororder:
{
	run, 도어발주_에이스크립트.ahk, C:\Users\shwoodnew\Desktop\doororder
	;~ Sleep,100
	;~ winshow, 확대화면7
	;~ Sleep,100
}
return




screenshot:
{


	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,

controlclick, TRzBitBtn8, ahk_class TfmChitSale
Sleep, 100

WinWait, 인쇄리스트,
IfWinNotActive, 인쇄리스트, , WinActivate, 인쇄리스트,
WinWaitActive, 인쇄리스트,
	sleep,500

;~ Control, choose, 20, TRzListBox1, 인쇄리스트
ControlSend, TRzListBox1, {home 5}{down 17}, 인쇄리스트
	sleep,200
;~ ControlClick, TRzBitBtn10, 인쇄리스트

Send, {tab 4}{Enter}

Sleep,0
WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,

;~ ~~~
sleep, 100

Control, choose, 6 , TfrxComboBox1, Preview




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

;~ 페이지 := 페이지 / 2
;~ WinWait, %받는분%,
;~ IfWinNotActive, %받는분%, , WinActivate, %받는분%,
;~ WinWaitActive, %받는분%,


;~ Sleep, 100
;~ ControlFocus, RICHEDIT50W1, %받는분%
;~ Sleep, 100
	;~ ControlSetText, , ☏☏☏ %거래처명1% 매장출고 ☏☏☏, %받는분%
	;~ ControlSend, , {Enter}, %받는분%
	;~ Sleep, 60
	;~ ControlSetText, , %요약%, %받는분%
	;~ ControlSend, , {Enter}, %받는분%
	;~ Sleep, 50

Sleep, 100

	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,

Sleep, 100
Send, {Home 3}
	;~ ControlClick, TToolBar1, Preview,,,,x509 y15
	Num=1


Loop, %페이지% ; 매장출고
{

	DIR1 := A_Desktop "\자동전표저장\전표 " Num ".png"
	Sleep, 110
CaptureScreen("1147, 93, 2666, 1190", False, DIR1)

	sleep, 100

	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,

	Sleep, 200
	ControlClick, TToolBar1, Preview,,,,x509 y15
	Sleep, 100

	Num++

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

ControlClick, TRzBitBtn1, 인쇄리스트
Sleep,200

	if WinExist("자동전표저장"){
		WinActivate, %A_Desktop%\자동전표저장
	}
	else
	{
		Run explore %A_Desktop%\자동전표저장
	}

}
return



<^<+<!Home::
resetposition:
CoordMode, Pixel, screen
winshow, 휴대폰과 연결
winshow, 카카오톡
WinActivate, 휴대폰과 연결
WinActivate, 카카오톡
Sleep, 200
;~ WinMove, 휴대폰과 연결, , -1207, -238, 610, 967
;~ WinMove, 카카오톡, , -606, -238, 392, 960
WinMove, 휴대폰과 연결, , -1447, 0, 840, 957
WinMove, 카카오톡, , -613, 0, 400, 950
;~ WinMove, 확대화면6, , -243, 1571



return



timer0:
{




	If( WinExist("ahk_class TfmChitSale") or WinExist("ahk_class TfmEstimate2") )
	{




		IfWinExist, 배송문자 시스템  -by shwood-
		{
		}
		else
		{
			control, disable, , TRzBitBtn8, ahk_class TfmChitSale
			Sleep, 10
			;~ run, %A_Desktop%\오토핫키2\s누르기2.ahk,, Hide
			RunHidden("C:\Users\shwoodnew\Desktop\오토핫키2\s누르기2.ahk")
			;~ WinWait, s누르기2
			;~ WinActivate, ahk_class TfmChitSale
			;~ Sleep, 1500

			Sleep, 50
		}
	}
	else
	{
		;~ WinKill, 배송문자 시스템  -by shwood-
		;~ Sleep, 2000
	}


Sleep, 1500
}

control, enable, , TRzBitBtn8, ahk_class TfmChitSale
return




+Pause::
초기화:
{
Reload
}
return

RunHidden(command) {
	global
    Run,%command%,, Hide-
    ;~ Run, %comspec% /c %command%,, Hide-
	return
}


timer1:
{
Gui, submit, nohide
FormatTime, TimeString,, HHmm

;    1. 점검 시간 , 모든 프로그램의 가동률을 확인해 주세요
	if(TimeString = 0705) or (TimeString = 1305) or (TimeString = 1630)
	{
		SoundPlay, %A_ScriptDir%\MP_Tiny Button Push.mp3
		Sleep, 2000
		SoundPlay, %A_ScriptDir%\어드바이져흥\어드바이져흥_1ERP WMS TMS.mp3
		Sleep, 60000
		return
	}

;    2. 제대로 판매재고 기록 누락 된것 있으면 기록, 출고장소, 카드현금은행 입출금,
	else if(TimeString = 0901) or (TimeString = 1001) or (TimeString = 1101) or (TimeString = 1201) or (TimeString = 1301) or (TimeString = 1401) or (TimeString = 1501) or (TimeString = 1601)
	{
		SoundPlay, %A_ScriptDir%\MP_Tiny Button Push.mp3
		Sleep, 2000
		SoundPlay, %A_ScriptDir%\어드바이져흥\어드바이져흥_2정리안된 ERP.mp3
		Sleep, 60000
		return

	}

;    3. 세금계산서 발행하기
	else if(TimeString = 1030) or (TimeString = 1130) or (TimeString = 1230) or (TimeString = 1330) or (TimeString = 1430) or (TimeString = 1530) or (TimeString = 1630)
	{
		SoundPlay, %A_ScriptDir%\MP_Tiny Button Push.mp3
		Sleep, 2000
		SoundPlay, %A_ScriptDir%\어드바이져흥\어드바이져흥_3세금계산서 발행.mp3
		Sleep, 60000
		return
	}

;    4. 도어 발주 대조 확인
	else if(TimeString = 1520)
	{
		SoundPlay, %A_ScriptDir%\MP_Tiny Button Push.mp3
		Sleep, 2000
		SoundPlay, %A_ScriptDir%\어드바이져흥\어드바이져흥_4도어발주내용확인.mp3
		Sleep, 60000
		return
	}

;    5. 내일 출고 리스트 누락분 있는지 확인하기
	else if(TimeString = 1520)
	{
		SoundPlay, %A_ScriptDir%\MP_Tiny Button Push.mp3
		Sleep, 2000
		SoundPlay, %A_ScriptDir%\어드바이져흥\어드바이져흥_5내일 매입매출발송.mp3
		Sleep, 60000
		return
	}


;    6. 홈페이지 단가 최신화
	else if(TimeString = 1520)
	{
		SoundPlay, %A_ScriptDir%\MP_Tiny Button Push.mp3
		Sleep, 2000
		SoundPlay, %A_ScriptDir%\어드바이져흥\어드바이져흥_6홈페이지단가.mp3
		Sleep, 60000
		return
	}

;   7. 주문받은 내용중 누락분 있는지 카톡 문자 전화통화내용 확인 해주세요
	else if(TimeString = 1520)
	{
		SoundPlay, %A_ScriptDir%\MP_Tiny Button Push.mp3
		Sleep, 2000
		SoundPlay, %A_ScriptDir%\어드바이져흥\어드바이져흥_7누락 일반 발주분확인 .mp3
		Sleep, 60000
		return
	}

;   8. 폐점맨트
	else if(TimeString = 1645)
	{
		Run, %A_ScriptDir%\폐점알림.ahk
		Sleep, 60000
		return
	}

;   9. 우딘날리기_1
	else if(TimeString = 1602)
	;~ else if(TimeString = 0735)
	{
		MsgBox, 262160, 알림, ◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆`n◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆`n◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆`n`n`n`n`n2분 후에 우딘 / 재현 작동합니다`n`n`n`n`n◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆`n◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆`n◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆, 30
		Sleep, 58000
		WinKill, 알림
		return
	}

;   9. 우딘날리기_2
	else if(TimeString = 1604)
	;~ else if(TimeString = 0738)
	{
		Run, %A_ScriptDir%\우딘자동입력.ahk
		Sleep, 60000
		return
	}

;   10. 기업은행_2
	else if(TimeString = 0005)
	;~ else if(TimeString = 0741)
	{
		Run, %A_ScriptDir%\excel com\기업은행.ahk
		Sleep, 60000
		return
	}

}
return


NumLock::
Send, {PrintScreen}
return
!NumLock::
Send, {NumLock}
return



;~ SetDefaultEndpoint(DeviceID)
;~ {
    ;~ IPolicyConfig := ComObjCreate("{870af99c-171d-4f9e-af0d-e63df40c2bc9}", "{F8679F50-850A-41CF-9C72-430F290290C8}")
    ;~ DllCall(NumGet(NumGet(IPolicyConfig+0)+13*A_PtrSize), "UPtr", IPolicyConfig, "UPtr", &DeviceID, "UInt", 0, "UInt")
    ;~ ObjRelease(IPolicyConfig)
;~ }

;~ GetDeviceID(Devices, Name)
;~ {
    ;~ For DeviceName, DeviceID in Devices
        ;~ If (InStr(DeviceName, Name))
            ;~ Return DeviceID
;~ }

;~ #IfWinActive 제대로판매재고M 프로 ver7.66 - [거래처 전표관리]
;~ <^RButton::
;~ ControlGetText, 전배송지, TDBGridEh1, 제대로판매재고M 프로 ver7.66 - [거래처 전표관리]

;~ MsgBox, %전배송지%
;~ return


<!<^<+1::
;~ Numpad1::
문구 =
(
기업 이부근(신흥목재) 489-059250-01-011
)
Send, %문구%
return


+NumpadMult::
Send,{Pause}
return



#IfWinActive ahk_class TfmChitSale



F11::
{


		ControlGetText, abc, TRzEdit8, ahk_class TfmChitSale
				Sleep, 200
		WinKill, ahk_class TfmChitSale
	Sleep, 2000
    ControlClick, x5 y5, ahk_exe JedaeroM.exe
	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 10

	send, {LAlt}{Enter}{Right 4}{Down}{Enter}
	Sleep, 1000
		ControlSetText, TRzEdit1, %abc%, ahk_class TfmMain
		Sleep, 100
		ControlSend, TRzEdit1, {Enter}, ahk_class TfmMain

return

}




<^Numpad0::
{
	SetKeyDelay,-1
	;~ Sleep, 100
	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,

ControlGetText, 메모, TRzDBEdit12, ahk_class TfmChitSale
메모1:=메모

ControlGetText, 출고방법1, TRzDBEdit14, ahk_class TfmChitSale
if(InStr(출고방법1, "매장")){
	출고방법=상차
	출고이모지=☏
	메모 := StrReplace(메모, "상차", 출고방법)
	메모 := StrReplace(메모, "배송", 출고방법)
}else{
	출고방법=배송
	출고이모지=☎
	메모 := StrReplace(메모, "상차", 출고방법)
	메모 := StrReplace(메모, "하차", 출고방법)
}
;~ MsgBox, % 메모 "`n" 출고방법1 "`n" 출고방법 "`n"

if(InStr(메모, "☏") or InStr(메모, "☎")){
}else{
	출고이모지=
}

ControlGetText, 현금, TRzDBEdit4, ahk_class TfmChitSale
ControlGetText, 은행, TRzDBEdit3, ahk_class TfmChitSale
ControlGetText, 카드, TRzDBEdit2, ahk_class TfmChitSale

1arr:=[현금, 은행, 카드]
Loop, % 1arr.length() {
   if(1arr[A_Index]!="0"){
      if(A_Index="1"){
         결제방법=현금
      }else if(A_Index="2"){
         결제방법=은행
      }else if(A_Index="3"){
         결제방법=카드
      }else{
         결제방법=외상
      }
      break
   }
   else{
      결제방법=외상
   }
}

2arr:=["현금", "은행", "카드", "외상"]
Loop, % 2arr.length() {
   if(InStr(메모, 2arr[A_Index])){
      if(A_Index="1"){
         메모 := StrReplace(메모, 2arr[A_Index], 결제방법)
      }else if(A_Index="2"){
         메모 := StrReplace(메모, 2arr[A_Index], 결제방법)
      }else if(A_Index="3"){
         메모 := StrReplace(메모, 2arr[A_Index], 결제방법)
      }else{
         메모 := StrReplace(메모, 2arr[A_Index], 결제방법)
      }

		신규=
		break
   }
	else{
	신규=1
   }
}

	메모 := StrReplace(메모, 출고이모지, "")
	메모1 := StrReplace(메모1, 출고이모지, "")

if((메모="") && (신규="1")){
	메모 = % 출고이모지 . "끝." . 출고방법 . "." . 결제방법
}else if((메모!="") && (신규="1")){
	메모 = % 출고이모지 . "끝." . 출고방법 . "." . 결제방법 . "." 메모1
}else if((메모="") && (신규="")){
	메모 = % 출고이모지 . "끝." . 출고방법 . "." . 결제방법 . "." 메모1
}else{
	메모 = % 출고이모지 . 메모
}

Sleep, 10
ControlFocus, TRzDBEdit12, ahk_class TfmChitSale
Send, {del 50}{Backspace 50}%메모%
Sleep, 100
Send, {End}{Space}
Sleep, 100
Send, {Backspace}{F5}
	SetKeyDelay,0
return
}


<^Numpad7:: ; 세금계산서 발행해야 함
{
	SetKeyDelay,-1
	Sleep, 100
	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,

ControlGetText, 메모, TRzDBEdit12, ahk_class TfmChitSale
메모1:=메모

;~ ControlGetText, 출고방법1, TRzDBEdit14, ahk_class TfmChitSale
if(InStr(메모, "◇")) {
	메모 := StrReplace(메모, "◇", "◇")
}else if(InStr(메모, "◆")) {
	메모 := StrReplace(메모, "◆", "◇")
}else{
	메모 = % 메모 . " ◇"
}

Sleep, 100
ControlFocus, TRzDBEdit12, ahk_class TfmChitSale
Send, {del 50}{Backspace 50}%메모%
Sleep, 100
Send, {End}{Space}
Sleep, 100
Send, {Backspace}{F5}

	SetKeyDelay,1
return
}


<^Numpad8:: ; 세금계산서 발행함
{
	SetKeyDelay,-1
	Sleep, 100
	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,

ControlGetText, 메모, TRzDBEdit12, ahk_class TfmChitSale
메모1:=메모

;~ ControlGetText, 출고방법1, TRzDBEdit14, ahk_class TfmChitSale
if(InStr(메모, "◇")) {
	메모 := StrReplace(메모, "◇", "◆")
}else if(InStr(메모, "◆")) {
	메모 := StrReplace(메모, "◆", "◆")
}else{
	메모 = % 메모 . " ◆"
}

Sleep, 100
ControlFocus, TRzDBEdit12, ahk_class TfmChitSale
Send, {del 50}{Backspace 50}%메모%
Sleep, 100
Send, {End}{Space}
Sleep, 100
Send, {Backspace}{F5}
	SetKeyDelay,1
return
}


<^1:: ; ctrl
{
ControlClick, TRzBitBtn10, ahk_class TfmChitSale
}


return

<^2:: ; ctrl
{
ControlClick, TRzBitBtn15, ahk_class TfmChitSale
}


return

<^3::
{
ControlClick, TRzBitBtn14, ahk_class TfmChitSale
}
return


<^4::
{
ControlClick, TRzBitBtn17, ahk_class TfmChitSale
}
return



<!1:: ; alt
{
ControlFocus, TDBGridEh1, ahk_class TfmChitSale
ControlFocus, TRzDBDateTimeEdit1, ahk_class TfmChitSale
}
return

<!2::
{
ControlFocus, TDBGridEh1, ahk_class TfmChitSale
ControlFocus, TRzDBEdit13, ahk_class TfmChitSale
}
return

<!3::
{
ControlFocus, TDBGridEh1, ahk_class TfmChitSale
ControlFocus, TRzDBEdit14, ahk_class TfmChitSale
}
return

<!4::
{
ControlFocus, TDBGridEh1, ahk_class TfmChitSale
ControlFocus, TRzDBEdit12, ahk_class TfmChitSale
}
return


<^Numpad1::
{
ControlClick, TRzButton4, ahk_class TfmChitSale
}
return


<^Numpad2::
{
ControlClick, TRzButton3, ahk_class TfmChitSale
}
return


<^Numpad3::
{
ControlClick, TRzButton2, ahk_class TfmChitSale
}
return





#IfWinActive 수금전표
<!1::
ControlFocus, TRzDBDateTimeEdit1, 수금전표
return


<!2::
ControlFocus, TRzDBEdit9, 수금전표
return


<!3::
ControlFocus, TRzDBEdit8, 수금전표
return


<!4::
ControlFocus, TRzDBEdit7, 수금전표
return



<!5::
ControlFocus, TRzDBEdit3, 수금전표
return



<!6::
ControlFocus, TRzDBEdit1, 수금전표
return





<^Numpad7:: ; 세금계산서 발행해야 함
{
	SetKeyDelay,-1
	Sleep, 100
	WinWait, ahk_class TfmChitInPay,
	IfWinNotActive, ahk_class TfmChitInPay, , WinActivate, ahk_class TfmChitInPay,
	WinWaitActive, ahk_class TfmChitInPay,

ControlGetText, 메모, TRzDBEdit1, ahk_class TfmChitInPay
메모1:=메모

;~ ControlGetText, 출고방법1, TRzDBEdit14, ahk_class TfmChitSale
if(InStr(메모, "◇")) {
	메모 := StrReplace(메모, "◇", "◇")
}else if(InStr(메모, "◆")) {
	메모 := StrReplace(메모, "◆", "◇")
}else{
	메모 = % 메모 . " ◇"
}

Sleep, 100
ControlFocus, TRzDBEdit1, ahk_class TfmChitInPay
Send, {del 50}{Backspace 50}%메모%
Sleep, 100
Send, {End}{Space}
Sleep, 100
Send, {Backspace}{F5}

	SetKeyDelay,1
return
}


<^Numpad8:: ; 세금계산서 발행함
{
	SetKeyDelay,-1
	Sleep, 100
	WinWait, ahk_class TfmChitInPay,
	IfWinNotActive, ahk_class TfmChitInPay, , WinActivate, ahk_class TfmChitInPay,
	WinWaitActive, ahk_class TfmChitInPay,

ControlGetText, 메모, TRzDBEdit1, ahk_class TfmChitInPay
메모1:=메모

;~ ControlGetText, 출고방법1, TRzDBEdit14, ahk_class TfmChitSale
if(InStr(메모, "◇")) {
	메모 := StrReplace(메모, "◇", "◆")
}else if(InStr(메모, "◆")) {
	메모 := StrReplace(메모, "◆", "◆")
}else{
	메모 = % 메모 . " ◆"
}

Sleep, 100
ControlFocus, TRzDBEdit1, ahk_class TfmChitInPay
Send, {del 50}{Backspace 50}%메모%
Sleep, 100
Send, {End}{Space}
Sleep, 100
Send, {Backspace}{F5}
	SetKeyDelay,1
return
}



#IfWinActive ahk_class PotPlayer64
esc::
return
Space::
return
Enter::
return
NumpadEnter::
return





#IfWinActive ahk_exe JedaeroM.exe
<^F1::
{
	Sleep, 1000
   Winwait, ahk_exe JedaeroM.exe
    IfWinNotActive, ahk_exe JedaeroM.exe,     WinActivate, ahk_exe JedaeroM.exe
    WinActivate, ahk_exe JedaeroM.exe


    Sleep, 200
    ControlClick, x21 y39, ahk_exe JedaeroM.exe




    send, {esc 10}{alt}{enter}
    send, {right 4}{down}{enter}
		Sleep, 300
		ControlFocus, TRzEdit1, ahk_exe JedaeroM.exe



return
}


#IfWinActive ahk_exe JedaeroM.exe
<!<+1::
{
    ControlClick, x5 y5, ahk_exe JedaeroM.exe
	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 10

	send, {LAlt}{Enter}{Right 2}{Enter}
	Sleep, 1000
return
}


<!<+2::
{
    ControlClick, x5 y5, ahk_exe JedaeroM.exe
	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 10

	send, {LAlt}{Enter}{Right 3}{Enter}
	Sleep, 1000
return
}

<!<+3::
{
    ControlClick, x5 y5, ahk_exe JedaeroM.exe
	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 10

	send, {LAlt}{Enter}{Right 4}{Enter}
	Sleep, 1000
return
}

<!<+4::
{
    ControlClick, x5 y5, ahk_exe JedaeroM.exe
	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 10

	send, {LAlt}{Enter}{Right 4}{Down}{Enter}
	Sleep, 1000
return
}




<!<+5::
{
    ControlClick, x5 y5, ahk_exe JedaeroM.exe
	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 10

	send, {LAlt}{Enter}{Right 4}{up 3}{Enter}
	Sleep, 1000
return
}







<^<+1::
{
    ControlClick, x5 y5, ahk_exe JedaeroM.exe
	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 10

	send, {LAlt}{Enter}{Right 5}{Down}{Enter}
	Sleep, 1000
return
}


<^<+2::
{
    ControlClick, x5 y5, ahk_exe JedaeroM.exe
	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 10

	send, {LAlt}{Enter}{Right 5}{Down 2}{Enter}
	Sleep, 1000
return
}

<^<+3::
{
    ControlClick, x5 y5, ahk_exe JedaeroM.exe
	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,
	Sleep, 10

	send, {LAlt}{Enter}{Right 5}{Down 3}{Enter}
	Sleep, 1000
return
}




#IfWinActive ahk_exe ONENOTE.EXE
RShift::
{
	Send, {Alt Down}d{ALT Up}y

return
}



;;;;;;;;;;   스 피 커 바 꾸 기 ;;;;;;;;;;;;;;;;
Devices := {}
IMMDeviceEnumerator := ComObjCreate("{BCDE0395-E52F-467C-8E3D-C4579291692E}", "{A95664D2-9614-4F35-A746-DE8DB63617E6}")

; IMMDeviceEnumerator::EnumAudioEndpoints
; eRender = 0, eCapture, eAll
; 0x1 = DEVICE_STATE_ACTIVE
DllCall(NumGet(NumGet(IMMDeviceEnumerator+0)+3*A_PtrSize), "UPtr", IMMDeviceEnumerator, "UInt", 0, "UInt", 0x1, "UPtrP", IMMDeviceCollection, "UInt")
ObjRelease(IMMDeviceEnumerator)

; IMMDeviceCollection::GetCount
DllCall(NumGet(NumGet(IMMDeviceCollection+0)+3*A_PtrSize), "UPtr", IMMDeviceCollection, "UIntP", Count, "UInt")
Loop % (Count)
{
    ; IMMDeviceCollection::Item
    DllCall(NumGet(NumGet(IMMDeviceCollection+0)+4*A_PtrSize), "UPtr", IMMDeviceCollection, "UInt", A_Index-1, "UPtrP", IMMDevice, "UInt")

    ; IMMDevice::GetId
    DllCall(NumGet(NumGet(IMMDevice+0)+5*A_PtrSize), "UPtr", IMMDevice, "UPtrP", pBuffer, "UInt")
    DeviceID := StrGet(pBuffer, "UTF-16"), DllCall("Ole32.dll\CoTaskMemFree", "UPtr", pBuffer)

    ; IMMDevice::OpenPropertyStore
    ; 0x0 = STGM_READ
    DllCall(NumGet(NumGet(IMMDevice+0)+4*A_PtrSize), "UPtr", IMMDevice, "UInt", 0x0, "UPtrP", IPropertyStore, "UInt")
    ObjRelease(IMMDevice)

    ; IPropertyStore::GetValue
    VarSetCapacity(PROPVARIANT, A_PtrSize == 4 ? 16 : 24)
    VarSetCapacity(PROPERTYKEY, 20)
    DllCall("Ole32.dll\CLSIDFromString", "Str", "{A45C254E-DF1C-4EFD-8020-67D146A850E0}", "UPtr", &PROPERTYKEY)
    NumPut(14, &PROPERTYKEY + 16, "UInt")
    DllCall(NumGet(NumGet(IPropertyStore+0)+5*A_PtrSize), "UPtr", IPropertyStore, "UPtr", &PROPERTYKEY, "UPtr", &PROPVARIANT, "UInt")
    DeviceName := StrGet(NumGet(&PROPVARIANT + 8), "UTF-16")    ; LPWSTR PROPVARIANT.pwszVal
    DllCall("Ole32.dll\CoTaskMemFree", "UPtr", NumGet(&PROPVARIANT + 8))    ; LPWSTR PROPVARIANT.pwszVal
    ObjRelease(IPropertyStore)

    ObjRawSet(Devices, DeviceName, DeviceID)
}
ObjRelease(IMMDeviceCollection)

