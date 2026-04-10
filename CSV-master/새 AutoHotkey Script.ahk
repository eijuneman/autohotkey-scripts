#NoEnv
#SingleInstance, force
#IfWinActive, ahk_exe JedaeroM.exe
SetKeyDelay, -1

space1:
{
	WinWait, 제대로판매재고M 프로 ver7.61a - [상품관리],
	IfWinNotActive, 제대로판매재고M 프로 ver7.61a - [상품관리], , WinActivate, 제대로판매재고M 프로 ver7.61a - [상품관리],
	WinWaitActive, 제대로판매재고M 프로 ver7.61a - [상품관리],
	Sleep, 10
	ControlSend , TAdvToolBar3, {F3}, 제대로판매재고M 프로 ver7.61a - [상품관리]
	Sleep, 100
	Send, {tab 10}
	ControlGetText, code, TRzDBEdit16, 제대로판매재고M 프로 ver7.61a - [상품관리]
}
return


Enter::
{
	;~ Sleep, 100


	ControlGetText, code, TRzDBEdit16, 제대로판매재고M 프로 ver7.61a - [상품관리]
	ControlSend , TAdvToolBar3, {F5}, 제대로판매재고M 프로 ver7.61a - [상품관리]
	Sleep, 10
	ControlFocus, TDBGridEh1, 제대로판매재고M 프로 ver7.61a - [상품관리]
	Sleep, 10
	Send, {down 1}
		gosub, space1
			Sleep, 10
		gosub, F2
		Sleep, 10
		gosub, space1

			WinActivate, 상품명 규격 변경
}
return


~LButton Up::
	Keywait, LButton, D T0.25
	if(ErrorLevel=1)
		Return

	While GetKeystate("LButton","P")

		gosub, space1
			Sleep, 10
		gosub, F2
		Sleep, 10
		gosub, space1
Return

F2::
{
	WinWait, 제대로판매재고M 프로 ver7.61a - [상품별 거래조회],
	IfWinNotActive, 제대로판매재고M 프로 ver7.61a - [상품별 거래조회], , WinActivate, 제대로판매재고M 프로 ver7.61a - [상품별 거래조회],
	WinWaitActive, 제대로판매재고M 프로 ver7.61a - [상품별 거래조회],

	Sleep, 10
	ControlClick, TAdvDockPanel1, 제대로판매재고M 프로 ver7.61a - [상품별 거래조회] ,,,,x246 y38
	Sleep, 100
	ControlSetText, TRzEdit2, %code%, 제대로판매재고M 프로 ver7.61a - [상품별 거래조회]
	if ErrorLevel = 0
	{
		ControlClick, TAdvToolBar2, 제대로판매재고M 프로 ver7.61a - [상품별 거래조회] ,,,,x35 y18
	}
	else
	{
		gosub, F2
	}
}
return

F1::
{
	Send, {Esc 10}{LAlt}{Enter}
	Sleep, 100
	Send, {Right 3}{Enter}
	ControlFocus, TRzDBEdit10, ahk_class TfmMain
}
return

<+<^v::
{
	ControlSend , TAdvToolBar3, {F3}, 제대로판매재고M 프로 ver7.61a - [상품관리]
Sleep, 10
	Send, {Home}★품절★
}
return
