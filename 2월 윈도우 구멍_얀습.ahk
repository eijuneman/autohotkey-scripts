#NoEnv

				WinWait, ahk_exe JedaeroM.exe
				IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe, 
				WinWaitActive, ahk_exe JedaeroM.exe, 
					
send, {LAlt}{Enter}{Right 6}{down}{Enter}
						
			Sleep, 1500
			ControlClick, TRzButton4, ahk_exe JedaeroM.exe
			ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe,,,,x50 y29
				Sleep, 1500		
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
						
			
CONTROL, CHOOSE, 8, TfrxComboBox1, Preview
			Sleep, 1000
			ControlClick, TToolBar1, Preview,,,,x534 y15
			ControlGetText, 페이지, TEdit1, Preview
			ControlClick, TToolBar1, Preview,,,,x416 y15
			
			Loop, %페이지%
			{

Sleep, 1000			
					send, {PrintScreen 2}
					
					{
					CoordMode, Mouse, Screen
					sleep, 1500
					MouseClick, left, 317, 80, , , d
					sleep, 1000
					MouseClick, left, 1565, 949, , , u
					sleep, 100
					}	
			
				WinWait, 다른 이름으로 저장, 
				IfWinNotActive, 다른 이름으로 저장, , WinActivate, 다른 이름으로 저장, 
				WinWaitActive, 다른 이름으로 저장, 
				
				send, {esc 2}
					

				WinWait, Preview, 
				IfWinNotActive, Preview, , WinActivate, Preview, 
				WinWaitActive, Preview, 
				Sleep, 200				
				
				
				
				
				
				
				
				숫자 ++
			ControlClick, TToolBar1, Preview,,,,x509 y15		
}		
			