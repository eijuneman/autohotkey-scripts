#NoEnv
Run, C:\참좋은소프트\제대로판매재고M\JedaeroM.exe

Sleep, 100
		WinWait, 로그인,
		IfWinNotActive, 로그인, , WinActivate, 로그인,
		WinWaitActive, 로그인,


Sleep, 100
	ControlSend, TRzEdit1, kk0404, ahk_exe JedaeroM.exe
	Sleep, 500
	ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
	SoundBeep, 1000
Run, C:\Program Files (x86)\Kakao\KakaoTalk\KakaoTalk.exe

Run, C:\Program Files (x86)\PicPick\picpick.exe
;~ Run, C:\Program Files\DAUM\PotPlayer\PotPlayerMini64.exe
;~ Run, C:\Program Files\DAUM\PotPlayer\PotPlayer64.exe
Run, C:\Program Files\AutoHotkey\SciTE\SciTE.exe
Run, C:\Users\shwoodnew\Desktop\오토핫키2\start2.ahk



return