CoordMode, Mouse, Relative

~LButton::
{

	MouseGetPos, ax, ay
    while GetKeyState("LButton")
    
        if (ax > 986 && ax < 1041 && ay < 55)
		{
		    WinActivate, ½½¶óÀÌµå ¼î
		WinWait, ½½¶óÀÌµå ¼î
		Send, {Shift Down}
		Send, {F2 3}
		Send, {Shift Up}
		WinActivate, ahk_class TfmChitSale
		Sleep,100
		Send, {F12}
		}
	
}