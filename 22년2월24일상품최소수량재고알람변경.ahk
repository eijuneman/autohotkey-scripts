			
				WinWait, ahk_exe JedaeroM.exe
				IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe, 
				WinWaitActive, ahk_exe JedaeroM.exe, 
					
			
						send, {LAlt}{Enter}{Right 6}{down}{Enter}
						
			Sleep, 1000
			ControlClick, TRzButton4, ¹A”¡Ìe ¸‰¡M ver7.57
			ControlClick, TAdvToolBar2, ¹A”¡Ìe ¸‰¡M ver7.57,,,,x50 y29
				Sleep, 3000		
			ControlClick, TAdvToolBar3, ¹A”¡Ìe ¸‰¡M ver7.57,,,,x53 y13			
			
				WinWait, ·¥­áÐa‹¡ 
				IfWinNotActive, ·¥­áÐa‹¡, , WinActivate, ·¥­áÐa‹¡, 
				WinWaitActive, ·¥­áÐa‹¡, 
				
			
			
			control, choose, 3, TRzListBox1, ·¥­áÐa‹¡
			ControlSetText, edit1, 115{enter}, Preview
			Sleep, 200
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
			
			