#NoEnv
#SingleInstance, force
SetTimer, cal , 200
/*

TRzPanel8 ; 판넬
TRzDBComboBox5 ; 분류
TRzDBComboBox3 ; 단가
ahk_class TfmMain ; 윈도우타이틀
*/
GUi, destroy
gui, default
Gui, +alwaysontop


Gui, Font, S14 CRED, Verdana

Gui, Add, GroupBox, x22 y19 w130 h200 , 분류
Gui, Font, S13 CDefault, Verdana
Gui, Add, Radio, x32 y50 w110 h40 v철물 gcal, 철물/목재(4)
;~ Gui, Add, Text, x70 y+0 w60 h25 , ↑↓
Gui, Add, Radio, x32 y+0 w110 h40 v건축 gcal, 건축/목공(1)
Gui, Add, Radio, x32 y+0 w110 h40 v개인 gcal, 개인(0)
Gui, Add, Radio, x32 y+0 w110 h40 v기타 gcal, 기타(7)

Gui, Font, S14 CBLUE, Verdana
Gui, Add, GroupBox, x172 y19 w130 h200 , 결제
Gui, Font, S13 CDefault, Verdana
Gui, Add, Radio, x182 y50 w110 h40 v선불 gcal, 선불(5)
;~ Gui, Add, Text, x220 y+0 w60 h25 , ↑↓
Gui, Add, Radio, x182 y+0 w110 h40 v외상 gcal, 외상(2)

Gui, Font, S14 CGREEN, Verdana
Gui, Add, GroupBox, x322 y19 w130 h200 , 출고
Gui, Font, S13 CDefault, Verdana
Gui, Add, Radio, x332 y50 w110 h40 v상차 gcal, 상차(6)
;~ Gui, Add, Text, x370 y+0 w60 h25 , ↑↓
Gui, Add, Radio, x332 y+0 w110 h40 v배송 gcal, 배송(3)

Gui, Font, S14 C666600, Verdana
Gui, Add, GroupBox, x472 y19 w130 h200 , 판매량
Gui, Font, S13 CDefault, Verdana
Gui, Add, Radio, x482 y50 w110 h40 v많다 gcal, 많다(+)
;~ Gui, Add, Text, x370 y+0 w60 h25 , ↑↓
Gui, Add, Radio, x482 y+0 w110 h40 v적다 gcal, 적다`n(NumEnt)

Gui, Add, Button, x32 y+110 w110 h70 gup, ▲이전거래처(up)
Gui, Add, Button, x+40 w110 h70 gdown, ▼다음거래처(down)
Gui, Add, text, x+40 w110 h20 v단가, 단가

Gui, Font, S15 Cred W700, Verdana
Gui, Add, text, y+10 w110 h40 v단가분류, 단가분류


Gui, Font, S13 W400 CDefault, Verdana
Gui, Add, Button, x+40 y240 w110 h70 gEnter, 변환`n(Enter)

; Generated using SmartGUI Creator for SciTE



Gui, Show, , CS관리
return

Numpad4::
GuiControl, , 철물, 1
return

Numpad1::
GuiControl, , 건축, 1
return

Numpad7::
GuiControl, , 기타, 1
return

Numpad0::
GuiControl, , 개인, 1
return

Numpad5::
GuiControl, , 선불, 1
return

Numpad2::
GuiControl, , 외상, 1
return

Numpad6::
GuiControl, , 상차, 1
return

Numpad3::
GuiControl, , 배송, 1
return

NumpadAdd::
GuiControl, , 많다, 1
return

NumpadEnter::
GuiControl, , 적다, 1
return

cal:
Gui, submit, nohide

if (철물 = 1)
	점수1 := 1
else if (건축 = 1)
	점수1 := 2
else if (개인 = 1)
	점수1 := 3
else
{
	점수1 := 3
}

if (선불 = 1)
	점수2 := 0
else if (결제 = 1)
	점수2 := 1
else
{
	점수2 := 1
}

if (상차 = 1)
	점수3 := 0
else if (배송 = 1)
	점수3 := 1
else
{
	점수3 := 1
}

if (많다 = 1)
	점수4 := 0
else if (적다 = 1)
	점수4 := 1
else
{
	점수4 := 1
}


점수 := 점수1 + 점수2 + 점수3 + 점수4


if (점수 = 1)
	GuiControl, , 단가분류, A단가
else if (점수 = 2)
	GuiControl, , 단가분류, 매출단가
else if (점수 = 3)
	GuiControl, , 단가분류, B단가
else if (점수 = 4)
	GuiControl, , 단가분류, 소매단가
else if (점수 >= 5)
	GuiControl, , 단가분류, C단가
else
{
}
	GuiControl, , 단가, %점수%

return





up:
up::

	WinWait,  ahk_class TfmMain,
	IfWinNotActive,  ahk_class TfmMain, , WinActivate,  ahk_class TfmMain,
	WinWaitActive,  ahk_class TfmMain,

ControlSend, TDBGridEh1, {up},  ahk_class TfmMain


return

down:
Down::
	WinWait,  ahk_class TfmMain,
	IfWinNotActive,  ahk_class TfmMain, , WinActivate,  ahk_class TfmMain,
	WinWaitActive,  ahk_class TfmMain,

ControlSend, TDBGridEh1, {down},  ahk_class TfmMain


return

Enter:
Enter::
gui, submit, nohide
	WinWait,  ahk_class TfmMain,
	IfWinNotActive,  ahk_class TfmMain, , WinActivate,  ahk_class TfmMain,
	WinWaitActive,  ahk_class TfmMain,
	;~ Sleep, 500
ControlSend, TRzPanel8, {f3 2}, ahk_class TfmMain
Sleep, 200
ControlGetText, 단가분류1, Static2, CS관리
if (단가분류1 = "A단가")
	control, choose, 2, TRzDBComboBox3, ahk_class TfmMain
else if (단가분류1 = "매출단가")
	control, choose, 1, TRzDBComboBox3, ahk_class TfmMain
else if (단가분류1 = "B단가")
	control, choose, 3, TRzDBComboBox3, ahk_class TfmMain
else if (단가분류1 = "소매단가")
	control, choose, 5, TRzDBComboBox3, ahk_class TfmMain
else if (단가분류1 = "C단가")
	control, choose, 4, TRzDBComboBox3, ahk_class TfmMain
else
{
}


if ( 철물 = 1 )
control, choose, 5, TRzDBComboBox5, ahk_class TfmMain

else if ( 건축 = 1 )
control, choose, 3, TRzDBComboBox5, ahk_class TfmMain

else if ( 개인 = 1 )
control, choose, 2, TRzDBComboBox5, ahk_class TfmMain
else
{
	control, choose, 4, TRzDBComboBox5, ahk_class TfmMain
	control, choose, 4, TRzDBComboBox3, ahk_class TfmMain

}


ControlGetText, 단가분류1, Static2, CS관리
ControlSend, TRzPanel8, {f5}, ahk_class TfmMain
Sleep, 500
ControlSend, TDBGridEh1, {down},  ahk_class TfmMain
Sleep, 500
ControlGetText, 업체명, TRzDBEdit25, ahk_class TfmMain
ComObjCreate("SAPI.SpVoice").Speak("다음거래처는!7" 업체명)

return






GuiClose:
ExitApp