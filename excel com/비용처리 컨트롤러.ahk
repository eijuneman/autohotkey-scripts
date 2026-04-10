#NoEnv
#SingleInstance, force
SetTimer, 포브스, 3000
단축키=
(
F1 : 날자검색
F2 : 기록하기(검색된 날짜 기준)
LShift : 엑셀 빨간색 만들기


38	건물관리비
40	광고선전비
22	급여
36	매장운영비용
32	보험료
34	세금과공과
35	세무비용
51	소모품비
37	수선비
33	식대
 5	여비교통비
44	운반비
31	유류비
30	적금
29	전력비
39	접대비
45	차량 유지비
28	통신비

 4	복리후생비
90	재고자산, 감모손실
91	재해손실
47	지급수수료
46	카드사용료
 3	퇴직급여
48	판매수수료


90 재고자산,감모손실
91 재해손실
)





/*
1  급여 임금 제수당
3  퇴직급여
4  복리후생비
5  여비교통비
6  임차료
7  통신비
8  전력비
9  적금
10 유류비
11 보험료
12 식대
13 세금과공과
14 세무비용(이용선비용)
15 매장운영비용
16 수선비
17 건물관리비
18 접대기
19 광고선전비
21 운반비
22 차량장비 유지비
23 카드사용료
24 지급수수료
25 판매수수료
28 소모품비
*/

Gui, +AlwaysOnTop
Gui, Font, CDefault W400, Malgun Gothic
Gui, Add, GroupBox, x10 y10 w200 h580 , 단축키
Gui, Add, text, x20 y40 w200 , %단축키%

Gui, Show, x-600 y1000 , 비용처리 컨트롤러  -by shwood- ;  w478 h584



F1::
{
	ControlFocus, TRzDateTimeEdit2, ahk_class TfmMain ; 관리 검색 날짜
}
return


F2::
{
	;~ ControlClick, TRzDBDateTimeEdit1, ahk_class TfmMain ; 기록 날짜
	ControlGetText, var, TRzDateTimeEdit2, ahk_class TfmMain
	ControlClick, TAdvToolBar3, ahk_class TfmMain,,,, x38 y15
	ControlSetText, TRzDBDateTimeEdit1, , ahk_class TfmMain
	ControlSend, TRzDBDateTimeEdit1, %var%, ahk_class TfmMain
	ControlFocus, TRzComboBox2, ahk_class TfmMain
}
return


F6::
{
	;~ ControlGetText, var, TRzDateTimeEdit2, ahk_class TfmMain
	ControlClick, TAdvToolBar4, ahk_class TfmMain,,,, x38 y15
	;~ ControlSetText, TRzDBDateTimeEdit1, , ahk_class TfmMain
	;~ ControlSend, TRzDBDateTimeEdit1, %var%, ahk_class TfmMain
	;~ ControlFocus, TRzComboBox2, ahk_class TfmMain
}
return



<+Space::
{
	;~ WinWait, 기업은행.xlsx - Excel,
	;~ IfWinNotActive, 기업은행.xlsx - Excel, , WinActivate, 기업은행.xlsx - Excel,
	;~ WinWaitActive, 기업은행.xlsx - Excel,
	;~ Sleep, 500

	;~ CoordMode, Mouse, Screen
	;~ Send, {Shift Down}{Space}{Shift Up}
	;~ MouseGetPos, aX, aY
	;~ MouseClick, , 4074, 686 , ,0
	;~ MouseMove, %aX%, %aY%, 0
	;~ Send, {Down}



	CoordMode, Mouse, Screen
	Send, {Shift Down}{Space}{Shift Up}
	MouseGetPos, aX, aY
	;~ MouseClick, , 4074, 686 , ,0

	CoordMode, Mouse, Screen
	Loop
	{
		ImageSearch, n32x, n32y, -1200, -75, -638, 200, *50 %A_ScriptDir%\red.bmp

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
		sleep 100
	}
	MouseClick, l, %n32x%, %n32y%, , 0
	MouseClick, l, %n32x%, %n32y%, , 0



}


	MouseMove, %aX%, %aY%, 0
	Send, {Down}


return


;~ Esc::
Guiclose:
ExitApp

포브스:

IfWinNotExist, 기업은행.xlsx - Excel
{
	ExitApp
}

return
