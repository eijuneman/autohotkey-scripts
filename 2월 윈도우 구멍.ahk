#NoEnv

				WinWait, ahk_exe JedaeroM.exe
				IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe, 
				WinWaitActive, ahk_exe JedaeroM.exe, 
					
send, {LAlt}{Enter}{Right 6}{down}{Enter}
						
			Sleep, 3000
			ControlClick, TRzButton4, ahk_exe JedaeroM.exe
			ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe,,,,x50 y29
				Sleep, 3000		
			ControlClick, TAdvToolBar3, ahk_exe JedaeroM.exe,,,,x53 y13			
			
				WinWait, ahk_class TfmFr4Report, 
				IfWinNotActive, ahk_class TfmFr4Report, , WinActivate, ahk_class TfmFr4Report, 
				WinWaitActive, ahk_class TfmFr4Report, 
				
			ControlClick, TRzListBox1, ahk_class TfmFr4Report,,,,x122 y40
			Sleep, 100
			ControlClick, TRzBitBtn9, ahk_class TfmFr4Report
						Sleep, 100
						
						
				WinWait, Preview, 
				IfWinNotActive, Preview, , WinActivate, Preview, 
				WinWaitActive, Preview, 						
						Sleep, 1000
						
						
			ControlSetText, edit1, 115, Preview
			Sleep, 200
			ControlSend, edit1, {enter}, Preview
			ControlClick, TToolBar1, Preview,,,,x534 y15
			ControlGetText, ÍA·¡»¡, TEdit1, Preview
			ControlClick, TToolBar1, Preview,,,,x416 y15
			
			Loop, %ÍA·¡»¡%
			{
				
			ControlSetText,  TEdit1, ÍA·¡»¡, Preview				
					send, {PrintScreen 2}
					
					{
					CoordMode, Mouse, Screen
					sleep, 3000
					MouseClick, left, 317, 80, , , d
					sleep, 1000
					MouseClick, left, 1565, 949, , , u
					sleep, 100
					}	
			
				WinWait, ”aŸe ·¡Ÿq·a¡ ¸á¸w, 
				IfWinNotActive, ”aŸe ·¡Ÿq·a¡ ¸á¸w, , WinActivate, ”aŸe ·¡Ÿq·a¡ ¸á¸w, 
				WinWaitActive, ”aŸe ·¡Ÿq·a¡ ¸á¸w, 
				
				send, {esc 2}
					

				WinWait, Preview, 
				IfWinNotActive, Preview, , WinActivate, Preview, 
				WinWaitActive, Preview, 
				Sleep, 200				
				
				ÍA·¡»¡ ++
}		
			