#NoEnv

Menu, TRAY, Icon, Mushroom - 1UP.ico
;~ #Persistent
#WinActivateForce
#SingleInstance, force

SetTitleMatchMode, 3
SetTitleMatchMode, slow

SetBatchLines, -1
;~ SetWinDelay, -1
;~ SetKeyDelay, -1

				;~ WinSet, Alwaysontop, off, 시퀀스 01.mp4 - 팟플레이어
				;~ WinSet, Alwaysontop, off, POS 세로2024.mp4 - 팟플레이어

				;~ WinSet, Alwaysontop, off, 시퀀스 01.mp4 - 팟플레이어


Loop
{






	wingetpos, wx, wy, , , ahk_class TfmChitSale
	If WinExist("ahk_class TfmChitSale") or WinExist("ahk_class TfmEstimate2")
	{

		if (wx = -2 && wy = 0)
		{
			If (WinActive("배송문자 시스템  -by shwood-") or WinActive("닫기 취소확인") or WinActive("ahk_class TfmFindJepum")  or WinActive("재단유무") or WinActive("인쇄리스트") or WinActive("도어회사선택") or WinActive("ahk_class TfmChitSale") or WinActive("ahk_class TfmEstimate2")) ; ( WinActive("ahk_exe JedaeroM.exe") or
			{
				WinSet, Alwaysontop, off, 시퀀스 01.mp4 - 팟플레이어
				;~ WinSet, Alwaysontop, on, POS 세로2024.mp4 - 팟플레이어


				WinShow, 확대화면3
				WinShow, 확대화면4
				WinShow, 확대화면2
				WinShow, 확대화면5

			}
			else
			{
				;~ WinSet, Alwaysontop, on, 시퀀스 01.mp4 - 팟플레이어
				WinSet, Alwaysontop, on, POS 세로2024.mp4 - 팟플레이어
				WinHide, 확대화면5
				WinHide, 확대화면2
				WinHide, 확대화면4
				WinHide, 확대화면3
			}
		}
		else
		{
							;~ WinSet, Alwaysontop, on, 시퀀스 01.mp4 - 팟플레이어
			WinSet, Alwaysontop, on, POS 세로2024.mp4 - 팟플레이어
			WinHide, 확대화면5
			WinHide, 확대화면2
			WinHide, 확대화면4
			WinHide, 확대화면3
		}
	}
	else
	{
		WinSet, Alwaysontop, on, 시퀀스 01.mp4 - 팟플레이어
		;~ WinSet, Alwaysontop, on, POS 세로2024.mp4 - 팟플레이어
		WinHide, 확대화면5
		WinHide, 확대화면2
		WinHide, 확대화면4
		WinHide, 확대화면3
		WinKill, 배송문자 시스템  -by shwood-
		;~ WinKill, ahk_exe Simple_Zoom.exe
		;~ WinKill, ahk_class kwonjo obyeun
		;~ WinKill, 돋보기1
		;~ Process, close, Simple_Zoom.exe
	}


	If WinExist("닫기 취소확인")
	{
		WinSet, alwaysontop, on, 닫기 취소확인
	}
	else
	{
	}
	Sleep, 500
}