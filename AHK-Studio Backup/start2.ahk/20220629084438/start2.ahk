;~무한반복이
#NoEnv
#SingleInstance, force
#WinActivateForce
#Persistent
;~ DetectHiddenText,on
;~ DetectHiddenWindows, on

SetTimer, timer0, 200
;~ SetTimer, timer1, -1
;~ SetTimer, timer2, -1
;~ SetTimer, timer3, -1
;~ SetTimer, timer4, -1

SetKeyDelay, -1

; 제대로판매 마우스왼쪽 옆 버튼 활용 도우미


; 전표
Menu, MyMenu, Add, 열기 모니터 전표, open
Menu, MyMenu, Add, 열기 모니터 전표NS, open2
Menu, MyMenu, Add, 닫기 모니터 전표, close
Menu, MyMenu, Add  ; 라인선
; 인쇄 하위
Menu, Submenu1, Add, [O O] 2장인쇄, gprint
Menu, Submenu1, Add, [O X] 단가 O 전표인쇄, oprint
Menu, Submenu1, Add, [X O] 단가 X 전표인쇄, fprint
; 인쇄 상위
Menu, MyMenu, Add, 전표인쇄, :Submenu1
Menu, MyMenu, Add, 일 정 표, timetable
Menu, MyMenu, Add, 도어발주서, doororder
Menu, MyMenu, Add, 손님 화면 ON, monitorshow1
Menu, MyMenu, Add, 손님 화면 OFF, monitorshow2
Menu, MyMenu, Add, 견적서작성, compare
Menu, MyMenu, Add  ; 라인선
; 배송문자 시스템
Menu, MyMenu, Add, 배송문자 시스템, sch  ; 그 부메뉴 아래에 또다른 메뉴 항목을 추가합니다.
Menu, MyMenu, Add  ; 라인선
; 인쇄 하위
Menu, Submenu2, Add, 재현매입 신흥카톡으로, jaehyunintex

Menu, Submenu2, Add, 다른이름저장 창제거, killsave
Menu, Submenu2, Add, 돋보기 테스크바 제거, taskdel
Menu, Submenu2, Add, 은행로그인, taskdel
Menu, Submenu2, Add, 소리내어읽기, read  ; 그 부메뉴 아래에 또다른 메뉴 항목을 추가합니다.
Menu, Submenu2, Add, 홈페이지단가 올리기, upload  ; 그 부메뉴 아래에 또다른 메뉴 항목을 추가합니다.
Menu, Submenu2, Add, 단가변환프로그램, exchange  ; 그 부메뉴 아래에 또다른 메뉴 항목을 추가합니다.
; 인쇄 상위
Menu, MyMenu, Add, 기타, :Submenu2



XButton1::
IfWinNotExist, ahk_class TfmChitSale
{
	Menu, MyMenu, Disable, 닫기 모니터 전표
	; 인쇄 하위
	Menu, Submenu1, Disable, [O O] 2장인쇄
	Menu, Submenu1, Disable, [O X] 단가 O 전표인쇄
	Menu, Submenu1, Disable, [X O] 단가 X 전표인쇄
	; 인쇄 상위
	Menu, MyMenu, Disable, 전표인쇄
	Menu, MyMenu, Disable, 배송문자 시스템
	Menu, Submenu2, Disable, 소리내어읽기
}
else
{
	Menu, MyMenu, Enable, 닫기 모니터 전표
	; 인쇄 하위
	Menu, Submenu1, Enable, [O O] 2장인쇄
	Menu, Submenu1, Enable, [O X] 단가 O 전표인쇄
	Menu, Submenu1, Enable, [X O] 단가 X 전표인쇄
	; 인쇄 상위
	Menu, MyMenu, Enable, 전표인쇄
	Menu, MyMenu, Enable, 배송문자 시스템
	Menu, Submenu2, Enable, 소리내어읽기
}
Menu, MyMenu, Show  ; 즉, Win-Z 핫키를 누르면 메뉴가 나타납니다.
return




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
		SoundPlay, C:\Users\userpc\Documents\listadd.mp3
	}
	else
	{
		Send, {F5}
	}
	

}
return



F11::
{

	IfWinActive, ahk_class TfmChitSale
	{
		ControlGetText, abc, TRzEdit8, ahk_class TfmChitSale
				Sleep, 200
		ControlClick, TAdvToolBar1, ahk_class TfmChitSale,,,,x344 y16
		Sleep, 1000
		Send, {alt}{enter}{right 4}{down}{enter}
		Sleep, 1000
		ControlSetText, TRzEdit1, %abc%, ahk_class TfmMain
		ControlSend, TRzEdit1, {Enter}, ahk_class TfmMain	
	}		
	else
	{
	}
	

}
return





F13::
#z::
open:

SoundPlay, C:\Users\userpc\Documents\녹음.mp3
CoordMode, MOUSE, SCREEN ; 전표켜기

	WinWait, ahk_exe JedaeroM.exe,
	IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	WinWaitActive, ahk_exe JedaeroM.exe,

ControlClick, TAdvToolBar1, ahk_exe JedaeroM.exe,,,, NA x400 y20

	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
WinMove, ahk_class TfmChitSale, , -2, 0
WinSet, Alwaysontop, off, POS 세로3.mp4 - 팟플레이어
WinShow, 확대화면2
WinShow, 확대화면3
WinShow, 확대화면4
WinShow, 확대화면5
;~ WinHide, 확대화면7
;~ WinHide, 확대화면8
;~ WinHide, 확대화면9
				;~ IfWinNotExist, 배송문자 시스템  -by shwood-
					;~ run, s누르기.ahk, C:\Users\userpc\Desktop
				;~ IfWinExist, 배송문자 시스템  -by shwood-
				;~ {
					;~ WinActivate, 배송문자 시스템  -by shwood-
				;~ }

WinActivate, ahk_class TfmChitSale


return





open2:

CoordMode, MOUSE, SCREEN ; 전표켜기

	;~ WinWait, ahk_exe JedaeroM.exe,
	;~ IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
	;~ WinWaitActive, ahk_exe JedaeroM.exe,

ControlClick, TAdvToolBar1, ahk_exe JedaeroM.exe,,,, NA x400 y20

	WinWait, ahk_class TfmChitSale,
	IfWinNotActive, ahk_class TfmChitSale, , WinActivate, ahk_class TfmChitSale,
	WinWaitActive, ahk_class TfmChitSale,
WinMove, ahk_class TfmChitSale, , -2, 0
WinSet, Alwaysontop, off, POS 세로3.mp4 - 팟플레이어
WinShow, 확대화면2
WinShow, 확대화면3
WinShow, 확대화면4
WinShow, 확대화면5
;~ WinHide, 확대화면7
;~ WinHide, 확대화면8
;~ WinHide, 확대화면9
				;~ IfWinNotExist, 배송문자 시스템  -by shwood-
					;~ run, s누르기.ahk, C:\Users\userpc\Desktop
				;~ IfWinExist, 배송문자 시스템  -by shwood-
				;~ {
					;~ WinActivate, 배송문자 시스템  -by shwood-
				;~ }

WinActivate, ahk_class TfmChitSale


return






F12::
close:
{
	IfWinExist, ahk_class TfmChitSale
	{
		WinActivate, ahk_class TfmChitSale
		WinSet, Top, , POS 세로3.mp4 - 팟플레이어
		WinActivate, POS 세로3.mp4 - 팟플레이어

		WinActivate, ahk_class TfmChitSale
		WinHide, 확대화면5
		WinHide, 확대화면4
		WinHide, 확대화면3
		WinHide, 확대화면2
		ControlClick,  TAdvToolBar1, ahk_class TfmChitSale, , , , x343 y14
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
return



gprint: ;매장+사무실 전표 인쇄 (2장인쇄)
{
SoundPlay, C:\Users\userpc\Documents\녹음2.mp3

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
SoundPlay, C:\Users\userpc\Documents\녹음2.mp3

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
SoundPlay, C:\Users\userpc\Documents\녹음2.mp3

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
{

	IfWinNotExist, 배송문자 시스템  -by shwood-
	{
		run, s누르기.ahk, C:\Users\userpc\Desktop
		;~ Sleep, 1000
	}
	IfWinExist, 배송문자 시스템  -by shwood-
	{
		;~ Sleep, 1000
	}
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




~RButton::
{
	CoordMode, mouse, screen
	IfWinExist, ahk_class TfmChitSale
	{
		WinActivate, 배송문자 시스템  -by shwood-
		Mousemove, -426, 559
	}
	else
	{

	}
}
return




~LButton::
{

	SetWinDelay, 0
CoordMode, Mouse, Relative
MouseGetPos, ax, ay
wingetpos, wx, wy, , , ahk_class TfmChitSale




MouseGetPos, UnderX, UnderY, WinUnderHwnd, ControlUnder

while GetKeyState("LButton")

	if ( instr(ControlUnder, "TButton2") || instr(ControlUnder, "TButton3") )
	{
		Sleep, 300
		ControlGettext, WhichButton, %ControlUnder%, Ahk_id %WinUnderHwnd%
		
			WinWait, 인쇄하기,
			IfWinNotActive, 인쇄하기, , WinActivate, 인쇄하기,
			WinWaitActive, 인쇄하기,
	
		ControlClick, TRzBitBtn1, 인쇄하기
		CoordMode, mouse, Screen
		Mousemove, -426, 559
		SoundBeep, 1000
	}

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

				WinShow, POS 세로3.mp4 - 팟플레이어
				WinSet, Top, , POS 세로3.mp4 - 팟플레이어



				WinHide, 확대화면4
				WinHide, 확대화면3
				WinHide, 확대화면2
				WinHide, 확대화면5
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


		return
	}

	if (ax > 355 && ax < 435 && ay > 54 && ay < 89)
	{
		IfWinActive, ahk_class TfmMain
		{

			SoundPlay, C:\Users\userpc\Documents\녹음.mp3
			CoordMode, MOUSE, SCREEN ; 전표켜기
			WinActivate, ahk_exe JedaeroM.exe
			WinWait, ahk_class TfmChitSale
			WinMove,  ahk_class TfmChitSale, , -2, 0
			WinShow, 확대화면2
			WinShow, 확대화면3
			WinShow, 확대화면4
			WinShow, 확대화면5
				IfWinNotExist, 배송문자 시스템  -by shwood-
				run, s누르기.ahk, C:\Users\userpc\Desktop
				IfWinExist, 배송문자 시스템  -by shwood-
				{
					WinActivate, 배송문자 시스템  -by shwood-
				}

			WinActivate, ahk_class TfmChitSale

		}
		return
	}



	if (ax > 955 && ax < 1066 && ay > 600 && ay < 626)
	{
		IfWinActive, 닫기 취소확인
		{
						winshow, POS 세로3.mp4 - 팟플레이어
			WinHide, 확대화면4
			WinHide, 확대화면3
			WinHide, 확대화면2
			WinHide, 확대화면5


		}
		return
	}



}
return



taskdel: ; 테스크바에 돋보기 제거하기
{
winset, Exstyle, ^0x80, 돋보기1
winset, Exstyle, ^0x80, 돋보기2
winset, Exstyle, ^0x80, 돋보기3
winset, Exstyle, ^0x80, 돋보기4
winset, Exstyle, ^0x80, 돋보기5
winset, Exstyle, ^0x80, 돋보기6
winset, Exstyle, ^0x80, 확대화면1
winset, Exstyle, ^0x80, 확대화면2
winset, Exstyle, ^0x80, 확대화면3
winset, Exstyle, ^0x80, 확대화면4
winset, Exstyle, ^0x80, 확대화면5
winset, Exstyle, ^0x80, 확대화면6
winset, Exstyle, ^0x80, FIFA ONLINE 4
}
return

monitorshow1: ; 스케치업 보여주기
{
;~ WinShow, 돋보기7
;~ WinShow, 확대화면7
}
return

monitorshow2: ; 스케치업 보여주기
{
;~ Winhide, 돋보기7
;~ Winhide, 확대화면7
}
return


jaehyunintex:
{
send, {alt}
Sleep, 2000
send, f
Sleep, 2000
send, p
Sleep, 10000
send, o
Sleep, 2000
send, {down}{Enter}
Sleep, 1000
; 카톡으로 전환
WinShow, 카카오톡

	WinWait, 카카오톡,
	IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	WinWaitActive, 카카오톡,

Sleep,200
ControlClick, x29 y118, 카카오톡
Sleep,300
ControlSend, EVA_VH_ListControl_Dblclk3, {CtrlDown}F{CtrlUp}, 카카오톡
Sleep,300
ControlSetText, Edit2, 신흥목재카톡방, 카카오톡
Sleep, 300
controlsend, Edit2, {Enter}, 카카오톡

	WinWait, 신흥목재카톡방,
	IfWinNotActive, 신흥목재카톡방, , WinActivate, 신흥목재카톡방,
	WinWaitActive, 신흥목재카톡방,

Sleep, 300
Send, ♤♤♤ 내일 재현 입고 ♤♤♤{Enter},
Sleep, 300
ControlSend, Edit2, {Del 30}{BackSpace 30}, 카카오톡
Sleep, 100

	WinWait, %재현엑셀%,
	IfWinNotActive, %재현엑셀%, , WinActivate, %재현엑셀%,
	WinWaitActive, %재현엑셀%,

send, {PrintScreen 2}
	{
	CoordMode, Mouse, Screen
	sleep, 2000
	MouseClick, left, 629, 162, , , d
	sleep, 1000
	MouseClick, left, 1740, 947, , , u
	sleep, 100
	}

	WinWait, 다른 이름으로 저장,
	IfWinNotActive, 다른 이름으로 저장, , WinActivate, 다른 이름으로 저장,
	WinWaitActive, 다른 이름으로 저장,

Sleep, 200
ControlSetText, Edit2, C:\Users\userpc\Desktop\전표자동저장{Enter}, 다른 이름으로 저장
Sleep, 300
ControlSetText, Edit1, 1.png, 다른 이름으로 저장
sleep, 200
ControlClick, Button2, 다른 이름으로 저장
sleep, 200

	WinWait, 다른 이름으로 저장 확인,
	IfWinNotActive, 다른 이름으로 저장 확인, , WinActivate, 다른 이름으로 저장 확인,
	WinWaitActive, 다른 이름으로 저장 확인,
	Sleep, 200

ControlClick, Button1, 다른 이름으로 저장 확인
Sleep, 500

	WinWait, 신흥목재카톡방,
	IfWinNotActive, 신흥목재카톡방, , WinActivate, 신흥목재카톡방,
	WinWaitActive, 신흥목재카톡방,
	Sleep, 200

send, {Ctrl Down}
sleep, 100
send, v
sleep, 100
send, {Ctrl Up}
sleep, 300
Send, {Enter}
sleep, 300
Send, {Esc}
sleep, 500
controlsend, RICHEDIT50W1, {Enter}, ahk_exe KakaoTalk.exe
sleep, 100
controlsend, RICHEDIT50W1, {Enter}, ahk_exe KakaoTalk.exe
ControlClick, EVA_ChildWindow2, 카카오톡 , , , x45 y145,
controlsend, RICHEDIT50W1, {Esc}, ahk_exe KakaoTalk.exe
controlsend, EVA_Window2, {Ctrl}F, ahk_class EVA_Window_Dblclk
controlsend, , {Enter}, ahk_exe KakaoTalk.exe
Sleep, 300
ControlSend, Edit2, {Del 30}{BackSpace 30}, 카카오톡
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

winkill, 7.2번째 전표333.xls - Excel
ComObjCreate("SAPI.SpVoice").Speak(거래처) ; announce text
Sleep, 100
ComObjCreate("SAPI.SpVoice").Speak(날짜) ; announce text
Sleep, 100
ComObjCreate("SAPI.SpVoice").Speak(시간) ; announce text
Sleep, 100
ComObjCreate("SAPI.SpVoice").Speak(장소) ; announce text
Sleep, 100
ControlClick, TRzBitBtn1, 인쇄하기
ComObjCreate("SAPI.SpVoice").Speak(say) ; announce text
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
run, 홈페이지단가변환.ahk, C:\Users\userpc\Desktop\오토핫키2
	return
}




exchange:
{
run, 단가변환프로그램.ahk, Z:\HDD1\단가변환프로그램
}
return


doororder:
{
	run, 도어발주.ahk, Z:\HDD1\DoorOrder
	;~ Sleep,100
	;~ winshow, 확대화면7
	;~ Sleep,100


}
return


timetable:
{
	run, 일정표.ahk, Z:\HDD1\일정표

}
return




killsave:
{
	winkill, 다른 이름으로 저장
}
return




timer0:
{
	;~ SetWinDelay, 100
	;~ SetKeyDelay, 0
	;~ Sleep, 800
	IfWinExist, ahk_class TfmChitSale
	{
		Sleep, 500
		IfWinNotExist, 배송문자 시스템  -by shwood-
		{
			run, s누르기.ahk, C:\Users\userpc\Desktop
			;~ Sleep, 1000
		}
		IfWinExist, 배송문자 시스템  -by shwood-
		{
			;~ Sleep, 1000
		}
	}
	else
	{
		WinKill, 배송문자 시스템  -by shwood-
		Sleep, 200
		;~ WinKill, 배송문자 시스템  -by shwood-
	}
	;~ Sleep, 1000
}
return









;~ timer2:

;~ {
		;~ SetKeyDelay, 0
	;~ SetControlDelay, 0
	   ;~ wingetpos, 22x, 22y, , , 일정표

		;~ {	IfWinExist, 일정표
			;~ {
					;~ if (22x = 1920 && 22y = 0)
						;~ {
							;~ {
								;~ IfWinNotActive, 일정표
								;~ {

									;~ WinSet, Alwaysontop, off, 확대화면7

								;~ }
								;~ else
								;~ {

									;~ WinSet, Alwaysontop, on, 확대화면7
								;~ }
							;~ }
						;~ }
					;~ else
						;~ {
							;~ WinSet, Alwaysontop, off, 확대화면7
						;~ }


			;~ }

			;~ else
			;~ {
				;~ WinSet, Alwaysontop, off, 확대화면7
			;~ }

		;~ }







;~ }


;~ return








;~ timer3:
;~ {
		;~ SetKeyDelay, -1
	;~ SetControlDelay, -1
;~ IfWinActive, ahk_class TfmChitSale
;~ {
;~ WinMove,
;~ }




;~ return

























;~ timer4:


;~ {
	   ;~ wingetpos, 44x, 44y, , , 도어발주헬퍼

		;~ {	IfWinExist, 도어발주헬퍼
			;~ {
					;~ if (wx = 1920 && wy = 0)
						;~ {
							;~ {
								;~ IfWinNotActive, 도어발주헬퍼
								;~ {
									;~ WinHide, 확대화면8

								;~ }
								;~ else
								;~ {
									;~ WinShow, 확대화면8
								;~ }
							;~ }
						;~ }
					;~ else
						;~ {
							;~ WinHide, 확대화면8
						;~ }


			;~ }

			;~ else
			;~ {
				;~ WinHide, 확대화면8
			;~ }

		;~ }






;~ }


return

