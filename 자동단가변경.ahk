		WinWait, ahk_exe JedaeroM.exe, 
		IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe, 
		WinWaitActive, ahk_exe JedaeroM.exe, 
		Sleep,1000

Control, Choose, 2, TRzComboBox9, ahk_exe JedaeroM.exe
ControlClick, TRzGroupButton2, ahk_exe JedaeroM.exe
Control, Choose, 6,   TRzComboBox2, ahk_exe JedaeroM.exe
ControlSetText, TRzEdit1, 130, ahk_exe JedaeroM.exe
Control, Choose, 4,   TRzComboBox7, ahk_exe JedaeroM.exe
Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe

Return


