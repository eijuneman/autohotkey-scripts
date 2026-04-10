
#Include, screencapture.ahk
e9 = 신흥목재 A.I. 홍이
;~ e9 = 김태준


;~ MsgBox, %e9%
	winkill, ahk_exe JedaeroM.exe

	run, C:\Program Files (x86)\Kakao\KakaoTalk\KakaoTalk.exe

	Sleep, 1000
	WinWait, ahk_exe KakaoTalk.exe,
	IfWinNotActive, ahk_exe KakaoTalk.exe, , WinActivate, ahk_exe KakaoTalk.exe,
	WinWaitActive, ahk_exe KakaoTalk.exe,
	Sleep, 3000


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

	WinMove, %e9%, 100, 40
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


	CaptureScreen("457, 90, 1431, 968", False, 0)
		  sleep, 100
	   WinWait, %e9%,
	   IfWinNotActive, %e9%, , WinActivate, %e9%,
	   WinWaitActive, %e9%,
	   Sleep, 100
	   send, {Ctrl Down}v{Ctrl Up}
	   sleep, 200
	   Send, {Enter 2}
	   sleep, 100

		  sleep, 100


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
   controlgettext, 수금액, TRzEdit24, ahk_exe JedaeroM.exe
   controlgettext, 기간내미수금, TRzEdit16, ahk_exe JedaeroM.exe
   controlgettext, 현금입금, TRzEdit13, ahk_exe JedaeroM.exe
   controlgettext, 카드입금, TRzEdit9, ahk_exe JedaeroM.exe
   ;~ controlgettext, 은행입금, TRzEdit25, ahk_exe JedaeroM.exe
   controlgettext, 매입액,    TRzEdit23, ahk_exe JedaeroM.exe
   controlgettext, 매출이익, TRzEdit14, ahk_exe JedaeroM.exe






매출액1 := StrReplace(매출액, "," , "")
수금액1 := StrReplace(수금액, "," , "")
기간내미수금1 := StrReplace(기간내미수금, "," , "")
현금입금1 := StrReplace(현금입금, "," , "")
카드입금1 := StrReplace(카드입금, "," , "")
;~ 은행입금1 := StrReplace(은행입금, "," , "")
매입액1 := StrReplace(매입액, "," , "")
매출이익1 := StrReplace(매출이익, "," , "")

은행입금 := 수금액1 - 카드입금1 - 현금입금1


ConvertedNumber := AddCommas(은행입금)



	winshow, %e9%

	WinWait, %e9%,
	IfWinNotActive, %e9%, , WinActivate, %e9%,
	WinWaitActive, %e9%,
	Sleep, 1000

	은행입금 -= 2

	send, ★★★ %date1% 일계표 ★★★{ShiftDown}{Enter}{ShiftUp}{ShiftDown}{Enter}{ShiftUp}총매출액 : %매출액%원{ShiftDown}{Enter}{ShiftUp}외상금액 : %기간내미수금%원{ShiftDown}{Enter}{ShiftUp}현금입금 : %현금입금%원{ShiftDown}{Enter}{ShiftUp}카드입금 : %카드입금%원{ShiftDown}{Enter}{ShiftUp}은행입금 : %ConvertedNumber%원{ShiftDown}{Enter}{ShiftUp}매입액 : %매입액%원{ShiftDown}{Enter}{ShiftUp}순이익 : %매출이익%원{enter}

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

	;~ ControlClick, TRzListBox1, ahk_class TfmFr4Report,,,,x122 y40
	;~ Send, {Home}{Down 2}
	;~ Sleep, 200
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
	Sleep, 1000

	Loop, %페이지%
	{

	   Sleep, 110
	CaptureScreen("300, 74, 1593, 976", False, 0)
		  sleep, 100
	   WinWait, %e9%,
	   IfWinNotActive, %e9%, , WinActivate, %e9%,
	   WinWaitActive, %e9%,
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

	}
	else
	{
		;~ ControlClick,TRzListBox1, ahk_class TfmFr4Report,,,,x138 y8
		send, {home}
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


		CaptureScreen("317, 80, 1565, 949", False, 0)
			sleep, 100
			WinWait, %e9%,
			IfWinNotActive, %e9%, , WinActivate, %e9%,
			WinWaitActive, %e9%,
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

			WinKill, Preview
		Sleep, 1000


		ControlClick, TRzBitBtn1, ahk_class TfmFr4Report
		Sleep, 200
		ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe,,,,x268 y12
		Sleep, 200
		;;;====v============================
		send, {LAlt}{Enter}{Up}{Enter}
		Sleep,200






	}


	WinKill, ahk_exe JedaeroM.exe
	;~ FormatTime, TimeString,, HHmm
	;~ Process, close, KakaoTalk.exe
	Sleep,3000





SetKeyDelay, 1

	run, 일정표15.ahk, \\192.168.0.1\hdd2\일정표 최근\일정표220730
	Sleep, 100
	WinWait, 신흥목재 전산프로그램,
	IfWinNotActive, 신흥목재 전산프로그램, , WinActivate, 신흥목재 전산프로그램,
	WinWaitActive, 신흥목재 전산프로그램,
	Sleep, 3000

	ControlSend, ,{Shift down}{Tab}{Shift Up}{Right 3}, 신흥목재 전산프로그램

	Sleep, 10000
	CaptureScreen("12, 67, 1271, 743", False, 0)
	sleep, 100
	WinWait, %e9%,
	IfWinNotActive, %e9%, , WinActivate, %e9%,
	WinWaitActive, %e9%,
	Sleep, 100
	send, ◁◁◁ %date1% 김태예 과장 ▷▷▷{Shift down}{Enter}{shift up}◁◁◁ 일일 업무 진행  사항 보고 ▷▷▷{enter}

	Sleep, 100
	send, {Ctrl Down}v{Ctrl Up}
	sleep, 100
	Send, {Enter 2}
	sleep, 100



	ControlSend, ,{Shift down}{Tab}{Shift Up}{Right 1}, 신흥목재 전산프로그램

	Sleep, 5000
	CaptureScreen("12, 67, 1271, 743", False, 0)
	sleep, 100
	WinWait, %e9%,
	IfWinNotActive, %e9%, , WinActivate, %e9%,
	WinWaitActive, %e9%,
	Sleep, 100
	send, ◁◁◁ %date1% 여성구 기사 ▷▷▷{Shift down}{Enter}{shift up}◁◁◁ 일일 업무 진행  사항 보고 ▷▷▷{enter}

	Sleep, 100
	send, {Ctrl Down}v{Ctrl Up}
	sleep, 100
	Send, {Enter 2}
	sleep, 2000

	winkill, 신흥목재 전산프로그램
	WinKill, %e9%
	;~ Sleep.1000



return


; 백의 자리마다 콤마를 추가하는 함수
AddCommas(Number) {
	global
    if Number < 0
        return

    ; 숫자를 문자열로 변환
    StrNumber := Number

    ; 소수점 체크
    Decimal := ""
    Pos := InStr(StrNumber, ".")
    if (Pos > 0) {
        Decimal := SubStr(StrNumber, Pos)
        StrNumber := SubStr(StrNumber, 1, Pos - 1)
    }

    ; 백의 자리마다 콤마 추가
    Result := ""
    Len := StrLen(StrNumber)
    Loop % Len {
        Result .= SubStr(StrNumber, A_Index, 1)
        if (Mod(Len - A_Index, 3) = 0 && A_Index < Len)
            Result .= ","
    }

    return Result . Decimal
}