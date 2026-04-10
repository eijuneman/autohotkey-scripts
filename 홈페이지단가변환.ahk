#SingleInstance, Force
SetKeyDelay, 0
SetWinDelay, 0

; 웹하드에 상품정보가 수정됐다는 것을 전재로 하는 상황
/*


run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M, Max

WinWait, ahk_class TfmLogin,
IfWinNotActive, ahk_class TfmLogin, , WinActivate, ahk_class TfmLogin,
WinWaitActive, ahk_class TfmLogin,
Sleep, 100

Send, kk0404
Sleep, 100
send, {Enter}
Sleep, 1000
WinActivate, ahk_exe JedaeroM.exe

WinWait, ahk_exe JedaeroM.exe,
IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
WinWaitActive, ahk_exe JedaeroM.exe,
Sleep, 100

WinGet, pid, PID , ahk_exe JedaeroM.exe


send, {LAlt}{Enter}{Right 2}{Enter}
Sleep, 1000
ControlSend, TRzEdit1, {ENTER}, ahk_exe JedaeroM.exe
Sleep, 2000
ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe, , , , X175 Y22

WinWait, ahk_class TMessageForm,
IfWinNotActive, ahk_class TMessageForm, , WinActivate, ahk_class TMessageForm,
WinWaitActive, ahk_class TMessageForm,
Sleep, 1000

ControlClick, TButton1, ahk_class TMessageForm
Sleep, 1000

WinWait, 통합 문서1 - Excel,
IfWinNotActive, 통합 문서1 - Excel, , WinActivate, 통합 문서1 - Excel,
WinWaitActive, 통합 문서1 - Excel,
Sleep, 1000

Send, {AltDown}{F4}{AltUp}
Sleep, 1000

WinWait, ahk_class NUIDialog,
IfWinNotActive, ahk_class NUIDialog, , WinActivate, ahk_class NUIDialog,
WinWaitActive, ahk_class NUIDialog,
Sleep, 1000
Send, {ENTER}

WinWait, 다른 이름으로 저장,
IfWinNotActive, 다른 이름으로 저장, , WinActivate, 다른 이름으로 저장,
WinWaitActive, 다른 이름으로 저장,
Sleep, 1000

Send, \\192.168.0.1\hdd2\일정표 최근\상품관리.xlsx{ENTER}
Sleep, 1000
WinWait, 다른 이름으로 저장,
IfWinNotActive, 다른 이름으로 저장, , WinActivate, 다른 이름으로 저장,
WinWaitActive, 다른 이름으로 저장,

ControlClick, Button1, 다른 이름으로 저장

*/


run, mother_sheets.xlsm, C:\Users\%A_UserName%\Desktop\cost\0_22년단가변환
Sleep, 5000




WinWait, mother_sheets.xlsm - Excel
IfWinNotActive, mother_sheets.xlsm - Excel, , WinActivate, mother_sheets.xlsm - Excel,
WinWaitActive, mother_sheets.xlsm - Excel,
Sleep, 5000
Send, {CtrlDown}q{CtrlUp}




Sleep, 10000



Loop, 5
{
winkill, ahk_exe msedge.exe
}

Run, msedge.exe "https://shwood.co.kr/admin/goods/excel_upload" " --new-window"
Sleep, 1000


WinWait, ahk_exe msedge.exe,
IfWinNotActive, ahk_exe msedge.exe, , WinActivate, ahk_exe msedge.exe,
WinWaitActive, ahk_exe msedge.exe,

WinMove, ahk_exe msedge.exe, ,1, 1
WinMaximize, ahk_exe msedge.exe
Sleep, 3000
;~ send, {enter}






	Sleep, 1000
		Loop
		{
			ImageSearch, x0, y0, 200, 200, 1900, 700, *50 C:\Users\%A_UserName%\Documents\IMAGESEARCH\01.png

			if (errorlevel = 1)
			{
				sleep 100
			}

			else if (errorlevel = 2) ; this has no matching if
			{
				msgbox, cant search
			}

			else if (errorlevel = 0) ; this doesnt either
			{
				break
			}

			sleep 100
		}
	MouseClick, , %x0%, %y0%




WinWait, ahk_exe msedge.exe,
IfWinNotActive, ahk_exe msedge.exe, , WinActivate, ahk_exe msedge.exe,
WinWaitActive, ahk_exe msedge.exe,
Sleep, 1000
CoordMode, mouse, Screen


VAR = 0





Loop, 2
{
VAR ++
		Loop
		{
			ImageSearch, x1, y1, 200, 200, 1700, 700, *50 C:\Users\%A_UserName%\Documents\IMAGESEARCH\1.png

			if (errorlevel = 1)
			{
				sleep 100
			}

			else if (errorlevel = 2) ; this has no matching if
			{
				msgbox, cant search
			}

			else if (errorlevel = 0) ; this doesnt either
			{
				break
			}

			sleep 100
		}
	MouseClick, , %x1%, %y1%

	WinWait, 열기,
	IfWinNotActive, 열기, , WinActivate, 열기,
	WinWaitActive, 열기,
	Sleep, 1000
	Send, C:\Users\%A_UserName%\Desktop\cost\0_22년단가변환\%VAR%.xlsx{enter}



	Sleep, 1000
		Loop
		{
			ImageSearch, x2, y2, 200, 200, 1900, 700, *50 C:\Users\%A_UserName%\Documents\IMAGESEARCH\2.png

			if (errorlevel = 1)
			{
				sleep 100
			}

			else if (errorlevel = 2) ; this has no matching if
			{
				msgbox, cant search
			}

			else if (errorlevel = 0) ; this doesnt either
			{
				break
			}

			sleep 100
		}
	MouseClick, , %x2%, %y2%


	Sleep, 5000

		Loop
		{
			ImageSearch, x3, y3, 200, 200, 1900, 700, *50 C:\Users\%A_UserName%\Documents\IMAGESEARCH\3.png

			if (errorlevel = 1)
			{
				sleep 100
			}

			else if (errorlevel = 2) ; this has no matching if
			{
				msgbox, cant search
			}

			else if (errorlevel = 0) ; this doesnt either
			{
				break
			}

			sleep 100
		}
	MouseClick, , %x3%, %y3%


	Sleep, 1000

}

winkill, ahk_exe msedge.exe

winkill, mother_sheets.xlsm - Excel

WinKill, ahk_pid %pid%


return


;~ ImageSearch, x1, y1, 1600, 100, 1900, 280, C:\Users\%A_UserName%\Documents\IMAGESEARCH\2.png
;~ ControlClick, x%x1% y%y1%, ahk_exe msedge.exe





;~ Loop
;~ {
	;~ ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, 1080, ...ScreenShots\incluir2.png    ; <<< Are you sure the path is correct ? I personally never used three dots in a path.
	;~ if ErrorLevel = 0
	;~ {
		;~ MsgBox,4,, % "Yes I found the image !", 1 ; <<< show this message when the image has been found, and close after one second
		;~ break ; <<< break the loop
	;~ }

	;~ else
	;~ {
		;~ MsgBox,,, % "Didn't find it ! Do you want to keep searching ?"
		;~ IfMsgBox, Yes
			;~ continue
		;~ else
			;~ break
	;~ }
;~ }



;~ WinWait, ahk_exe msedge.exe,
;~ IfWinNotActive, ahk_exe msedge.exe, , WinActivate, ahk_exe msedge.exe,
;~ WinWaitActive, ahk_exe msedge.exe,

;~ Sleep, 2000

;~ MouseClick, , 1812, 210, , 0

;~ Sleep, 1000

;~ WinWait, ahk_exe msedge.exe,
;~ IfWinNotActive, ahk_exe msedge.exe, , WinActivate, ahk_exe msedge.exe,
;~ WinWaitActive, ahk_exe msedge.exe,

;~ Sleep, 1000
;~ send, {enter}
;~ Sleep, 3000
;~ MouseClick, , 559, 323, , 0

;~ WinWait, 열기,
;~ IfWinNotActive, 열기, , WinActivate, 열기,
;~ WinWaitActive, 열기,

;~ Sleep, 1000
;~ Send, C:\Users\%A_UserName%\Desktop\cost\0_22년단가변환\2.xlsx{enter}

;~ WinWait, ahk_exe msedge.exe,
;~ IfWinNotActive, ahk_exe msedge.exe, , WinActivate, ahk_exe msedge.exe,
;~ WinWaitActive, ahk_exe msedge.exe,

;~ Sleep, 2000

;~ MouseClick, , 1812, 210, , 0




