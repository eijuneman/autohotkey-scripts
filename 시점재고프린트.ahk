SoundBeep, 500


run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M

        WinWait, 로그인, 
        IfWinNotActive, 로그인, , WinActivate, 로그인, 
        WinWaitActive, 로그인, 
        Sleep, 200
        
ControlSend, TRzEdit1, 1111, ahk_exe JedaeroM.exe
ControlClick, TRzBitBtn3, 로그인


        WinWait, ahk_exe JedaeroM.exe, 
        IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe, 
        WinWaitActive, ahk_exe JedaeroM.exe, 
        Sleep, 200
        
WinMaximize, ahk_exe JedaeroM.exe
        
Sleep, 1000


send, {alt}{enter}{left 3}{Down 5}{enter}
Sleep, 1000

ControlClick, TRzButton4, ahk_exe JedaeroM.exe
Sleep, 200
Control, choose, 7, TRzComboBox3, ahk_exe JedaeroM.exe
Sleep, 200
ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe, , , , x36 y23
Sleep, 20000
ControlClick, TAdvToolBar3, ahk_exe JedaeroM.exe, , , , x173 y10
Sleep, 10000

SoundBeep, 500

Xl := ComObjActive("Excel.Application") 
Xl.columns("M").delete
SoundBeep, 500
return