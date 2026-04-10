Loop
{


	#IfWinNotExist, ahk_class TfmChitSale
	{
		wingetpos, wx, wy, , , ahk_class TfmChitSale
		IfWinActive, ahk_class TfmChitSale
		{
			if (wx = -2 && wy = 0)
			{
				WinShow, 확대화면5
				WinShow, 확대화면4
				WinShow, 확대화면3
				WinShow, 확대화면2
			}
			else
			{
				WinHide, 확대화면2
				WinHide, 확대화면3
				WinHide, 확대화면4
				WinHide, 확대화면5	
			}
		}
		else
		{
		WinHide, 확대화면5
		WinHide, 확대화면4
		WinHide, 확대화면3
		WinHide, 확대화면2
		}
	}
	
	
	;~ #IfWinExist, 도어발주헬퍼
	;~ {		
		;~ IfWinActive, 도어발주헬퍼
		;~ {
			;~ Sleep, 500
		;~ Winhide, 슬라이드쇼
		;~ WinShow, 확대화면7	
		;~ }
		;~ else
		;~ {
		;~ winhide, 확대화면7
		;~ WinShow, 슬라이드쇼
		;~ }	
	;~ }
}
