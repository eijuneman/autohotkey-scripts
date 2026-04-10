;~무한반복이
#NoEnv
#WinActivateForce
#Persistent
winset, alwaysontop, on,확대화면6

Process, Priority, , High
SetKeyDelay, -1

; 제대로판매 마우스왼쪽 옆 버튼 활용 도우미
; 전표
Menu, MyMenu, Add, 계산기, open
Menu, MyMenu, Add, 카카오톡, close
Menu, MyMenu, Add  ; 라인선
; 인쇄 하위
Menu, MyMenu, Add, 제대로장부, gprint
Menu, MyMenu, Add, 인터넷, oprint
Menu, MyMenu, Add, 스케치업, fprint
Menu, MyMenu, Add  ; 라인선



XButton2::

Menu, MyMenu, Show  ; 즉, Win-Z 핫키를 누르면 메뉴가 나타납니다.
return











#z::
open:
{
SoundPlay, C:\Users\taeju\Documents\녹음.mp3
CoordMode, MOUSE, SCREEN ; 전표켜기
WinActivate, ahk_exe JedaeroM.exe
ControlClick, TAdvToolBar1, ahk_exe JedaeroM.exe,,,, NA x400 y20
WinWait, ahk_class TfmChitSale
WinMove,  ahk_class TfmChitSale, , -2, 0
WinShow, 확대화면2
WinShow, 확대화면3
WinShow, 확대화면4
WinShow, 확대화면5
WinActivate, ahk_class TfmChitSale
}
return






F12::
close:
{
	IfWinActive, ahk_class TfmChitSale
	{
		WinActivate, ahk_class TfmChitSale
		WinSet, Top, , 슬라이드 쇼
		WinActivate, 슬라이드 쇼
		WinActivate, ahk_class TfmChitSale
		WinHide, 확대화면5
		WinHide, 확대화면4
		WinHide, 확대화면3
		WinHide, 확대화면2
		ControlClick,  TAdvToolBar1, ahk_class TfmChitSale, , , , x343 y14
	}
	IfWinExist, 닫기 취소확인
	{
		WinSet, Top, , ahk_class CHslShowAtlView
		WinActivate, ahk_class CHslShowAtlView
		Sleep,100
		WinActivate, 닫기 취소확인
		return
	}

	IfNotExist, 닫기 취소확인
	{
	}
}
return



gprint: ;매장+사무실 전표 인쇄 (2장인쇄)
{
SoundPlay, C:\Users\taeju\Documents\녹음2.mp3

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
SoundPlay, C:\Users\taeju\Documents\녹음2.mp3

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
SoundPlay, C:\Users\taeju\Documents\녹음2.mp3

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


sch:
{
run, s누르기.ahk, C:\Users\taeju\Desktop
}
return




~LButton::
{
CoordMode, Mouse, Relative
MouseGetPos, ax, ay
wingetpos, wx, wy, , , ahk_class TfmChitSale
while GetKeyState("LButton")

	if (ax > 986 && ax < 1041 && ay < 55)
	{

		IfWinActive, ahk_class TfmChitSale
		{
			WinActivate, ahk_class TfmChitSale
			WinSet, Top, , 슬라이드 쇼
			WinActivate, 슬라이드 쇼
			WinHide, 확대화면5
			WinHide, 확대화면4
			WinHide, 확대화면3
			WinHide, 확대화면2
			ControlClick,  TAdvToolBar1, ahk_class TfmChitSale, , , , x343 y14
		}
		else
		{

		}

		IfWinExist, 닫기 취소확인
		{
			WinSet, Top, , ahk_class CHslShowAtlView
			WinActivate, ahk_class CHslShowAtlView
			Sleep,100
			WinActivate, 닫기 취소확인
			return
		}
		else
		{

		}
		return
	}

	if (ax > 355 && ax < 432 && ay > 50 && ay < 86)
	{
		IfWinActive, ahk_class TfmMain
		{
			SoundPlay, C:\Users\taeju\Documents\녹음.mp3
			CoordMode, MOUSE, SCREEN ; 전표켜기
			WinActivate, ahk_exe JedaeroM.exe
			WinWait, ahk_class TfmChitSale
			WinMove,  ahk_class TfmChitSale, , -2, 0
			WinShow, 확대화면2
			WinShow, 확대화면3
			WinShow, 확대화면4
			WinShow, 확대화면5
			WinActivate, ahk_class TfmChitSale

		}
		return
	}



	if (ax > 955 && ax < 1066 && ay > 600 && ay < 626)
	{
		IfWinActive, 닫기 취소확인
		{
			WinHide, 확대화면5
			WinHide, 확대화면4
			WinHide, 확대화면3
			WinHide, 확대화면2
			Sleep, 1000
			winshow, 슬라이드 쇼
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
WinHide, 확대화면5
WinHide, 확대화면4
WinHide, 확대화면3
WinHide, 확대화면2
Sleep, 200
WinActivate, ahk_exe SketchUp.exe
WinShow, 확대화면7
}
return



monitorshow2: ; 스케치업 화면 닫기sdf
{
WinHide, 확대화면7
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
ControlSetText, Edit2, C:\Users\taeju\Desktop\전표자동저장{Enter}, 다른 이름으로 저장
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


exchange:
{
run, 단가변환프로그램.ahk, C:\Users\taeju\Desktop\단가변환프로그램
}
return