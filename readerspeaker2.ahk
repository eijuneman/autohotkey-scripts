#Persistent  ; 스크립트를 계속 실행합니다.
#SingleInstance force

SetTitleMatchMode, 1  ; 창 제목을 부분적으로 일치시킵니다.
SetTitleMatchMode, slow
SetBatchLines, -1
SetKeyDelay, 2

Loop, 3
{
winkill, ahk_exe chrome.exe
}
Sleep, 100
    Run, chrome.exe "https://papago.naver.com/"

Loop, 3
{
	if WinExist("카카오톡 공유 - Whale")
	{
		WinKill, 카카오톡 공유 - Whale
	}
	else
	{
		break
	}
}





ControlGetText, broadcast, Edit12, 배송문자 시스템  -by shwood-
Clipboard:=broadcast
ClipWait, 2




Sleep, 100
	SoundPlay, \\192.168.0.1\hdd2\일정표 최근\일정표220730\sound\MP_Clinking Teaspoon.mp3

		WinWait, Papago - Chrome,
		IfWinNotActive, Papago - Chrome, , WinActivate, Papago - Chrome,
		WinWaitActive, Papago - Chrome,
Sleep, 1000

	ControlSend, , {Ctrl Down}v{Ctrl Up} , Papago - Chrome

		Sleep, 1000
		ControlSend, , {tab 2}, Papago - Chrome
		Sleep, 1000
		ControlSend, , {Enter}, Papago - Chrome
		Sleep, 1000
	;~ ControlSend, , {Ctrl up} , Papago - Chrome



		;~ WinWait, Papago - Chrome,
		;~ IfWinNotActive, Papago - Chrome, , WinActivate, Papago - Chrome,
		;~ WinWaitActive, Papago - Chrome,



	;~ Sleep,100
	;~ ControlSend, , {Enter}, Papago - Chrome
	;~ Sleep,1000
		Clipboard =
Clipboard := Clipboard1
WinMinimize, Papago - Chrome
Sleep, 22000
winkill, ahk_exe chrome.exe
ExitApp
return






; 요일 구하기 함수
Get_Weekday(parmDate, parmMode)
{
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


/*
FormatTime, A_tmrw, YYYYMMDD,dd
;~ MsgBox, % A_tmrw

;~ return

ControlGetText, 거래처명1, Edit2,  배송문자 시스템  -by shwood-
ControlGetText, 날짜1, Edit3,  배송문자 시스템  -by shwood-
ControlGetText, 시간1, Edit4,  배송문자 시스템  -by shwood-
Send, {ctrl Down}{F10}{ctrl Up}
날짜1 := StrReplace(날짜1, "(" , "-")
;~ MsgBox,  %날짜1%
날짜1 := StrReplace(날짜1, ")" , "")
;~ MsgBox,  %날짜1%

RegExMatch(날짜1, "(.*)-(.*)-(.*)((.*))", 일자)

;~ MsgBox,  % 일자1
;~ 일자합 := 일자2 일자3

RegExMatch(일자1, "(.*)-(.*)", n일자)


;~ MsgBox, %n일자1%
;~ MsgBox, %n일자2%
;~ MsgBox, %일자2%
;~ MsgBox, %일자3%


;~ RegExMatch(시간1, "(.*):(.*):(.*)", n시간1)

;~ MsgBox, % n시간11 ":" n시간12

;~ return


n일자2 := RegExReplace(n일자2, "01" , Replacement := "1")
n일자2 := RegExReplace(n일자2, "02" , Replacement := "2")
n일자2 := RegExReplace(n일자2, "03" , Replacement := "3")
n일자2 := RegExReplace(n일자2, "04" , Replacement := "4")
n일자2 := RegExReplace(n일자2, "05" , Replacement := "5")
n일자2 := RegExReplace(n일자2, "06" , Replacement := "6")
n일자2 := RegExReplace(n일자2, "07" , Replacement := "7")
n일자2 := RegExReplace(n일자2, "08" , Replacement := "8")
n일자2 := RegExReplace(n일자2, "09" , Replacement := "9")





일자2 := RegExReplace(일자2, "01" , Replacement := "1")
일자2 := RegExReplace(일자2, "02" , Replacement := "2")
일자2 := RegExReplace(일자2, "03" , Replacement := "3")
일자2 := RegExReplace(일자2, "04" , Replacement := "4")
일자2 := RegExReplace(일자2, "05" , Replacement := "5")
일자2 := RegExReplace(일자2, "06" , Replacement := "6")
일자2 := RegExReplace(일자2, "07" , Replacement := "7")
일자2 := RegExReplace(일자2, "08" , Replacement := "8")
일자2 := RegExReplace(일자2, "09" , Replacement := "9")
일자2 := RegExReplace(일자2, "`n" , Replacement := "")


;~ MsgBox, %n일자2%
;~ MsgBox, %일자2%


;~ MsgBox, % "출고날짜는" 일자2 "월" 일자3 "일" 일자4 "요일"

;~ return
/*

날짜1 := StrReplace(일자합, "(" , "-")
날짜1 := StrReplace(일자합, "" , "-")

MsgBox, %일자합%
MsgBox, %A_tmrw%
MsgBox, %A_tmrw%%일자합%
MsgBox, %일자합%%A_tmrw%
if (A_tmrw = 일자합)
{
	현재 = 오늘
	MsgBox, %현재%
}

else

{
	현재 = 미래
	MsgBox, %현재%
}






return




MsgBox,  %일자1%
MsgBox,  %일자2%
MsgBox,  %일자3%
MsgBox,  %일자4%


Sleep, 100

SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\신규리스트.mp3
ComObjCreate("SAPI.SpVoice").Speak("알림!알림!알림!" 거래처명1 "현장 의 신규출고리스트가 추가됐습니다" )
Sleep, 100


ComObjCreate("SAPI.SpVoice").Speak("출고날짜는" )






num1 := Round(A_tmrw)
일자2 := Round(일자2)


오늘1 := 일자2 - num1
;~ MsgBox, %A_tmrw%`n%일자2%`n%오늘1%`n%A_tmrw%`n%일자2%`n%오늘1%
;~ MsgBox, %오늘1%
if(오늘1 = 0)
{
	ComObjCreate("SAPI.SpVoice").Speak("오늘 입니다")
}
else if(오늘1 = 1)
{
	ComObjCreate("SAPI.SpVoice").Speak("내일 입니다")
}

else
{

}
;~ return








ComObjCreate("SAPI.SpVoice").Speak(n일자2 "월" 일자2 "일")
Sleep, 100
ComObjCreate("SAPI.SpVoice").Speak(일자3 "요일" )
Sleep, 100

ComObjCreate("SAPI.SpVoice").Speak(시간1 "입니다")
Sleep, 100
ComObjCreate("SAPI.SpVoice").Speak("출고리스트 확인해주세요")

ExitApp







