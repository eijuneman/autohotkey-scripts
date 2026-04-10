
		WinWait, ahk_exe JedaeroM.exe, 
		IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe, 
		WinWaitActive, ahk_exe JedaeroM.exe, 
		Sleep,1000
	{ ; 합판1-1
	Control, Choose, 2, TRzComboBox9, ahk_exe JedaeroM.exe
	ControlClick, TDBGridEh2, ahk_exe JedaeroM.exe, , , , x53 y58

	ControlClick, TRzGroupButton2, ahk_exe JedaeroM.exe
	Control, Choose, 6,   TRzComboBox2, ahk_exe JedaeroM.exe
	ControlSetText, TRzEdit1, 150, ahk_exe JedaeroM.exe
	Control, Choose, 4,   TRzComboBox7, ahk_exe JedaeroM.exe
	Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
	Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe
	ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
	Sleep, 500

	}
Return


