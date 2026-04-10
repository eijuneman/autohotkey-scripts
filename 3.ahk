#NoEnv
#Persistent
#WinActivateForce
#SingleInstance, force
SetBatchLines -1
;~ SetWinDelay, -1
;~ SetKeyDelay, -1

Loop
{
	wingetpos, wx, wy, , , ahk_class TfmChitSale
	If WinExist("ahk_class TfmChitSale")
	{
		if (wx = -2 && wy = 0)
		{
			If ( WinActive("ahk_exe JedaeroM.exe") or WinActive("배송문자 시스템  -by shwood-") or WinActive("닫기 취소확인") or WinActive("ahk_class TfmFindJepum"))
			{
				WinSet, Alwaysontop, off, POS 세로3.mp4 - 팟플레이어
				WinShow, 확대화면3
				WinShow, 확대화면4
				WinShow, 확대화면2
				WinShow, 확대화면5

			}
			else
			{
				WinSet, Alwaysontop, on, POS 세로3.mp4 - 팟플레이어
				WinHide, 확대화면5
				WinHide, 확대화면2
				WinHide, 확대화면4
				WinHide, 확대화면3
			}
		}
		else
		{
			WinSet, Alwaysontop, on, POS 세로3.mp4 - 팟플레이어
			WinHide, 확대화면5
			WinHide, 확대화면2
			WinHide, 확대화면4
			WinHide, 확대화면3
		}
	}
	else
	{
		WinSet, Alwaysontop, on, POS 세로3.mp4 - 팟플레이어
		WinHide, 확대화면5
		WinHide, 확대화면2
		WinHide, 확대화면4
		WinHide, 확대화면3
	}
	    ;~ If WinExist("닫기 취소확인")
		;~ {
			;~ WinSet, alwaysontop, on, 닫기 취소확인
		;~ }
		;~ else
		;~ {
		;~ }
}