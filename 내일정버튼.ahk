Loop
{

	IfWinActive, ahk_class TfmChitSale
	{

	WinGetPos, ax, ay, , , ahk_class TfmChitSale
	winmove, 계산기, , %ax%+500, %ay%+25
	WinSet, alwaysontop, , 계산기
	}

}
return