#SingleInstance, Force
WinKill, ahk_exe ttermpro.exe
WinKill, auto


    WinKill, ahk_exe ttermpro.exe
    Sleep,100
winkill, ahk_exe JedaeroM.exe

          SoundPlay, %A_MyDocuments%\sound\sound33.wav


Sleep, 540
    WinKill, ahk_exe ttermpro.exe
    winkill, ahk_exe JedaeroM.exe

        Sleep, 1500
    winkill, ahk_exe JedaeroM.exe
/*
run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M
    WinKill, ahk_exe ttermpro.exe

Sleep, 2000

		WinWait, ahk_exe JedaeroM.exe,
		IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
		WinWaitActive, ahk_exe JedaeroM.exe,
Sleep, 500

ControlSetText, TRzEdit2, 0415660571, ahk_exe JedaeroM.exe
ControlSetText, TRzEdit1, 0415660571, ahk_exe JedaeroM.exe
ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
*/

run, ttermpro.exe, C:\Program Files (x86)\teraterm

		WinWait, Tera Term: 새 연결,
		IfWinNotActive, Tera Term: 새 연결, , WinActivate, Tera Term: 새 연결,
		WinWaitActive, Tera Term: 새 연결,

Sleep, 100
;~ send, {Down}
;~ Sleep, 500
control, Check, , Button11, Tera Term: 새 연결

Sleep,200,

control, choosestring, 1, ComboBox4, Tera Term: 새 연결
Sleep, 100,

ControlSend, Button5, {enter}, Tera Term: 새 연결
;~ Sleep, 1000
run, %A_Desktop%\WMS\WMS_VER2.ahk



