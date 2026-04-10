Gui, +AlwaysOnTop -SysMenu
Gui, Add, Button, x12 y9 w100 h30 gopen,손님전표 열기
Gui, Add, Button, x12 y49 w100 h30 gclose, 손님전표 닫기
Gui, Add, Button, x12 y89 w100 h30 ggprint, 2장 전표인쇄
Gui, Add, Button, x12 y129 w100 h30 goprint, 단가 O 전표인쇄
Gui, Add, Button, x12 y169 w100 h30 gfprint, 단가 X 전표인쇄
Gui, Add, Button, x12 y209 w100 h30 gsch, 스케줄생성기


Gui, Show, w126 h251, 제대로 컨트롤러 v1.0
return




#z::
open:
{
	WinMinimize, 제대로 컨트롤러 v1.0
	Sleep,300
	CoordMode, MOUSE, SCREEN ; 전표켜기
	WinActivate, ahk_exe JedaeroM.exe
	Sleep,500
	WinWait, ahk_exe JedaeroM.exe

	ControlClick, TAdvToolBar1, ahk_exe JedaeroM.exe,,,, NA x400 y20
	WinWait, ahk_class TfmChitSale
	WinActivate, ahk_class TfmChitSale
	Sleep,100
	WinMove, -2, 0
	WinActivate 슬라이드 쇼
	SendInput, {Shift Down}{F3 3}{Shift Up}
	WinActivate, ahk_class TfmChitSale
	ControlSend, , {Shift Down}, 제대로판매재고M ver7.56 - [일자 전표관리]
	ControlSend, , {F3}, 제대로판매재고M ver7.56 - [일자 전표관리]
	ControlSend, , {Shift Down}, 제대로판매재고M ver7.56 - [일자 전표관리]
	
}
return






F12::
close:
{
	IfWinExist, ahk_class TfmChitSale
	{
	WinSet, Bottom, , 슬라이드 쇼	
	WinActivate, ahk_class TfmChitSale
	Sleep,100
	Send, {F12}
		
	
	IfWinExist, 닫기 취소확인
		WinActivate, 닫기 취소확인
	IfNotExist, 닫기 취소확인
		MouseClick,L,220,73,0
	}
	
	else
	{
			Send, {F12}
	Sleep,100
	}


}
return



gprint: ;매장+사무실 전표 인쇄 (2장인쇄)
{
	WinMinimize, 제대로 컨트롤러 v1.0
	Sleep,300
	WinActivate, ahk_class TfmChitSale
	sleep,1000
    Send, {F8}
	sleep,600
	MouseClick,L,379,339,,0
    Send, {F9}	
	sleep,800
	MouseClick,L,435,342,,0
	sleep,2000
    Send, {F8}
	sleep,2000
    MouseClick,L,379,366,,0
    Send, {F9}	
	sleep,800
	MouseClick,L,435,342,,0
	sleep,2000	
	Send, {F8}
	sleep,800
	MouseClick,L,379,339,,0
	Send, {F12}

}
return




oprint: ;사무실 전표 인쇄 (단가0)
{
	WinMinimize, 제대로 컨트롤러 v1.0
	Sleep,300
	WinActivate, ahk_class TfmChitSale
	Send, {F8}
	sleep,600
	MouseClick,L,379,339,,0
    Send, {F9}	
	sleep,800
	MouseClick,L,435,342,,0
	sleep,2000
}
return




fprint: ;매장 전표 인쇄 (단가X)
{
	WinMinimize, 제대로 컨트롤러 v1.0
	Sleep,300
	WinActivate, ahk_class TfrxPrintDialog
	Send, {F8}

	sleep,800
    MouseClick,L,379,366,,0
    Send, {F9}	
	sleep,800
	MouseClick,L,435,342,,0
	sleep,2000	
	Send, {F8}
	sleep,2000
	MouseClick,L,379,339,,0
	Send, {F12}
}
return


sch:
{
	WinMinimize, 제대로 컨트롤러 v1.0
	run, s누르기.ahk, C:\Users\taeju\Desktop




}
return




~LButton::
{
CoordMode, Mouse, Relative
	MouseGetPos, ax, ay
    while GetKeyState("LButton")
    
        if (ax > 986 && ax < 1041 && ay < 55)
		{
		    WinActivate, 슬라이드 쇼
		WinWait, 슬라이드 쇼
		Sleep, 200
		Send, {Shift Down}
		Send, {F2 3}
		Send, {Shift Up}
		WinActivate, ahk_class TfmChitSale
		Sleep,100
		Send, {F12}
		ControlSend, , {Shift Down}, 제대로판매재고M ver7.56 - [일자 전표관리]
		ControlSend, , {F3}, 제대로판매재고M ver7.56 - [일자 전표관리]
		ControlSend, , {Shift Down}, 제대로판매재고M ver7.56 - [일자 전표관리]
		
		
		IfWinExist, 닫기 취소확인
		WinActivate, 닫기 취소확인
		IfNotExist,  닫기 취소확인
		MouseClick,L,220,73,0 
		ControlSend, , {Shift Down}, 제대로판매재고M ver7.56 - [일자 전표관리]
		ControlSend, , {F3}, 제대로판매재고M ver7.56 - [일자 전표관리]
		ControlSend, , {Shift Down}, 제대로판매재고M ver7.56 - [일자 전표관리]
		}
}
return


XButton1::
   CoordMode, MOUSE, SCREEN ; 전표켜기
    WinActivate, 제대로 컨트롤러 v1.0
   MouseGetPos, ax, ay 
   WinWait, 제대로 컨트롤러 v1.0
   WinMove, %ax%, %ay%
return

XButton2::
   WinMinimize, 제대로 컨트롤러 v1.0
return   


GuiClose:
ExitApp