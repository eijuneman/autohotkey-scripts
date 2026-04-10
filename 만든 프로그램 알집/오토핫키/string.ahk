#NoEnv
#SingleInstance, Force
#WinActivateForce
#Persistent
#Include, csv.ahk
SetTimer, timer, 1000

e9 = 김태준

timer:
{
Gui, submit, nohide
FormatTime, TimeString,, HHmm






;;;;;;;;;;;;;;;;;;;


if(TimeString = 2108) ; 회장님들께 일계표 보내기
{
;~ MsgBox, %e9%



run, C:\Program Files (x86)\Kakao\KakaoTalk\KakaoTalk.exe

Sleep, 1000
WinWait, 카카오톡,
IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
WinWaitActive, 카카오톡,
Sleep, 3000

Send, {enter}
Sleep, 3000
Send, walther1ls{shift Down}1{Shift up}
Sleep, 100
Send, {enter}

Sleep, 3000



WinKill, 다른 이름으로 저장
WinKill, 다른 이름으로 저장
WinKill, 다른 이름으로 저장
WinShow, 카카오톡
WinWait, 카카오톡,
IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
WinWaitActive, 카카오톡,
Sleep,100
ControlClick, x29 y118, 카카오톡
Sleep,300
ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
Sleep,300
ControlSetText, Edit2, %e9%, ahk_class EVA_Window_Dblclk
Sleep, 300
controlsend, Edit2, {Enter}, ahk_class EVA_Window_Dblclk

WinWait, %e9%,
IfWinNotActive, %e9%, , WinActivate, %e9%,
WinWaitActive, %e9%,

WinMove, %e9%, -360, 40
FormatTime, date1 , YYYYMMDD, yyyy-MM-dd

ControlSend, Edit2, {Del 10}{BackSpace 10}, 카카오톡
run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M, Max

WinWait, ahk_class TfmLogin,
IfWinNotActive, ahk_class TfmLogin, , WinActivate, ahk_class TfmLogin,
WinWaitActive, ahk_class TfmLogin,
Sleep, 100

Send, kk0404
Sleep, 100
send, {Enter}
Sleep, 2000
;~ WinActivate, ahk_exe JedaeroM.exe

WinWait, ahk_exe JedaeroM.exe,
IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
WinWaitActive, ahk_exe JedaeroM.exe,
Sleep, 1000

send, {LAlt}{Enter}{Right 6}{Up 2}{Enter}
Sleep, 1000
ControlClick, TRzButton4, ahk_class TfmMain
ControlClick, TAdvToolBar2, ahk_class TfmMain
Sleep, 1000
ControlClick, TAdvToolBar3, ahk_class TfmMain,,,, x59 y12
Sleep, 500

WinWait, ahk_class TfmFr4Report,
IfWinNotActive, ahk_class TfmFr4Report, , WinActivate, ahk_class TfmFr4Report,
WinWaitActive, ahk_class TfmFr4Report,
Sleep, 200

ControlClick, TRzBitBtn10, ahk_class TfmFr4Report

WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,
Sleep, 1000

ControlClick, TToolBar1, Preview, , , ,x179 y15
sleep, 100
send, {PrintScreen }
{
	CoordMode, Mouse, Screen
	sleep, 2500
	MouseClick, left, 457, 90, , , d
	sleep, 100
	MouseClick, left, 1431, 968, , , u
	sleep, 100
}

winkill, 다른 이름으로 저장
winkill, 다른 이름으로 저장

WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,
Sleep, 1000

ControlClick, TToolBar1, Preview, , , ,x616 y15
sleep, 100

WinWait, ahk_class TfmFr4Report,
IfWinNotActive, ahk_class TfmFr4Report, , WinActivate, ahk_class TfmFr4Report,
WinWaitActive, ahk_class TfmFr4Report,
Sleep, 100

ControlClick, TRzBitBtn1, ahk_class TfmFr4Report
Sleep,200

controlgettext, 매출액, TRzEdit25, ahk_exe JedaeroM.exe
controlgettext, 기간내미수금, TRzEdit16, ahk_exe JedaeroM.exe
controlgettext, 현금입금, TRzEdit13, ahk_exe JedaeroM.exe
controlgettext, 카드입금, TRzEdit9, ahk_exe JedaeroM.exe
controlgettext, 은행입금, TRzEdit25, ahk_exe JedaeroM.exe
controlgettext, 매입액, 	TRzEdit23, ahk_exe JedaeroM.exe
controlgettext, 매출이익, TRzEdit14, ahk_exe JedaeroM.exe

winshow, %e9%

WinWait, %e9%,
IfWinNotActive, %e9%, , WinActivate, %e9%,
WinWaitActive, %e9%,
Sleep, 1000

은행입금 -= 2

send, ★★★ %date1% 일계표 ★★★{ShiftDown}{Enter}{ShiftUp}{ShiftDown}{Enter}{ShiftUp}총매출액 : %매출액%원{ShiftDown}{Enter}{ShiftUp}외상금액 : %기간내미수금%원{ShiftDown}{Enter}{ShiftUp}현금입금 : %현금입금%원{ShiftDown}{Enter}{ShiftUp}카드입금 : %카드입금%원{ShiftDown}{Enter}{ShiftUp}은행입금 : 확인중{ShiftDown}{Enter}{ShiftUp}매입액 : %매입액%원{ShiftDown}{Enter}{ShiftUp}순이익 : %매출이익%원{enter}

send, {Ctrl Down}
sleep, 100
send, v
sleep, 100
send, {Ctrl Up}
sleep, 300
Send, {Enter}
sleep, 300

ControlClick, TAdvToolBar3, ahk_class TfmMain, ,,, X149 Y14
Sleep, 1000
WinWait, ahk_exe JedaeroM.exe
IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
WinWaitActive, ahk_exe JedaeroM.exe,
Sleep, 1000
send, {LAlt}{Enter}{Right 6}{down}{Enter}

Sleep, 1000
ControlClick, TRzButton4, ahk_class TfmMain
Sleep, 500
ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x50 y29
Sleep, 1500
ControlClick, TAdvToolBar3, ahk_class TfmMain,,,,x53 y13
Sleep, 1500
WinWait, ahk_class TfmFr4Report,
IfWinNotActive, ahk_class TfmFr4Report, , WinActivate, ahk_class TfmFr4Report,
WinWaitActive, ahk_class TfmFr4Report,

ControlClick, TRzListBox1, ahk_class TfmFr4Report,,,,x122 y40
Send, {Home}{Down 2}
Sleep, 200
ControlClick, TRzBitBtn10, ahk_class TfmFr4Report
Sleep, 200

WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,

CONTROL, CHOOSE, 8, TfrxComboBox1, Preview
Sleep, 1000
ControlClick, TToolBar1, Preview,,,,x534 y15
Sleep, 200
ControlGetText, 페이지, TEdit1, Preview
ControlClick, TToolBar1, Preview,,,,x416 y15
	WinKill,  다른 이름으로 저장
	WinKill,  다른 이름으로 저장
Loop, %페이지%
{
	Sleep, 1000
	CoordMode, Mouse, Screen
	send, {PrintScreen }


	sleep, 2500
	MouseClick, left, 317, 80, , , d
	sleep, 100
	MouseClick, left, 1565, 949, , , u
	sleep, 100

	;WinWait, 다른 이름으로 저장,
	;IfWinNotActive, 다른 이름으로 저장, , WinActivate, 다른 이름으로 저장,
	;WinWaitActive, 다른 이름으로 저장,
	WinKill,  다른 이름으로 저장
	WinKill,  다른 이름으로 저장
	Sleep, 500

	WinWait, %e9%,
	IfWinNotActive, %e9%, , WinActivate, %e9%,
	WinWaitActive, %e9%,
	Sleep, 500

	send, {Ctrl Down}
	sleep, 100
	send, v
	sleep, 100
	send, {Ctrl Up}
	sleep, 500
	Send, {Enter 2}
	sleep, 300

WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,

	ControlClick, TToolBar1, Preview,,,,x509 y15
	Sleep, 1000
		WinKill,  다른 이름으로 저장
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WinWait, Preview,
IfWinNotActive, Preview, , WinActivate, Preview,
WinWaitActive, Preview,
Sleep, 1000

ControlClick, TToolBar1, Preview, , , ,x616 y15
sleep, 100

WinWait, ahk_class TfmFr4Report,
IfWinNotActive, ahk_class TfmFr4Report, , WinActivate, ahk_class TfmFr4Report,
WinWaitActive, ahk_class TfmFr4Report,
Sleep, 100

ControlClick, TRzBitBtn1, ahk_class TfmFr4Report
Sleep,200
controlclick, TAdvToolBar3, ahk_exe JedaeroM.exe,,,, x280 y15
Sleep, 200
;~ ;;--------------------------------------------------------------------------
WinWait, ahk_exe JedaeroM.exe,
IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
WinWaitActive, ahk_exe JedaeroM.exe,
Sleep, 100

send, {LAlt}{Enter}{Right 4}{Down 3}{Enter}
Sleep, 1000
ControlClick, TRzButton4, ahk_class TfmMain
ControlClick, TAdvToolBar4, ahk_class TfmMain,,,,x36 y30
Sleep, 1000
ControlClick, TAdvToolBar2, ahk_class TfmMain,,,, x59 y12
Sleep,2000

IfWinNotExist, .ahk_class TfmFr4Report
{
	ControlClick, TAdvToolBar2, ahk_class TfmMain,,,, x263 y12
	send, {LAlt}{Enter}{Up}{Enter}
	Sleep,200

	WinWait, 백업저장 확인
	IfWinNotActive, 백업저장 확인, , WinActivate, 백업저장 확인,
	WinWaitActive, 백업저장 확인,
	Sleep, 200

	ControlClick, Button2, 백업저장 확인
	Sleep, 500
}
else
{
	ControlClick,TRzListBox1, ahk_class TfmFr4Report,,,,x138 y8
	Sleep, 100
	ControlClick,TRzBitBtn10, ahk_class TfmFr4Report

	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,
	WinKill,  다른 이름으로 저장
	Sleep, 100
	CONTROL, CHOOSE, 8, TfrxComboBox1, Preview
	Sleep, 1000
	CoordMode, Mouse, Screen
	send, {PrintScreen }


	sleep, 2500
	MouseClick, left, 317, 80, , , d
	sleep, 100
	MouseClick, left, 1565, 949, , , u
	sleep, 100


	WinWait, 다른 이름으로 저장,
	IfWinNotActive, 다른 이름으로 저장, , WinActivate, 다른 이름으로 저장,
	WinWaitActive, 다른 이름으로 저장,

	WinKill,  다른 이름으로 저장

	WinWait, Preview,
	IfWinNotActive, Preview, , WinActivate, Preview,
	WinWaitActive, Preview,
	Sleep, 200

	WinWait, %e9%,
	IfWinNotActive, %e9%, , WinActivate, %e9%,
	WinWaitActive, %e9%,
	Sleep, 500

	send, {Ctrl Down}v{Ctrl Up}
	Sleep, 500
	Send, {Enter 2}
	sleep, 300
	Send, {Esc}
	Sleep, 100
	ControlClick, TToolBar1, Preview,,,,x509 y15

		WinClose, Preview
	Sleep, 1000


	ControlClick, TRzBitBtn1, ahk_class TfmFr4Report
	Sleep, 200
	ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe,,,,x268 y12
	Sleep, 200
	;;;=================================
	send, {LAlt}{Enter}{Up}{Enter}
	Sleep,200




	WinWait, 백업저장 확인
	IfWinNotActive, 백업저장 확인, , WinActivate, 백업저장 확인,
	WinWaitActive, 백업저장 확인,
	Sleep, 1000

	ControlClick, Button2, 백업저장 확인
	Sleep, 200




}
;~ FormatTime, TimeString,, HHmm
Process, close, KakaoTalk.exe
sleep, 60000
}
}