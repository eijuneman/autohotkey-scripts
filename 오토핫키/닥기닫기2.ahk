LButton::
MouseGetPos, ax, ay, 

if (ax>986 and ax<1043 and ay>30 and ay<49)
	{
	Click
	WinActivate, 슬라이드 쇼
	WinWait, 슬라이드 쇼
    Send, {Shift Down}
    Send, {F2 3}
    Send, {Shift Up}
	WinActivate, ahk_class TfmChitSale
	Sleep,100
	Send, {F12}
	
}
else
	{
	Click
	}
return
