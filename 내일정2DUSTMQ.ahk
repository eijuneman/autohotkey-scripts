
	WinShow, 카카오톡

		WinWait, 카카오톡, 
		IfWinNotActive, 카카오톡, , WinActivate, 카카오톡, 
		WinWaitActive, 카카오톡, 


	Sleep,200
	ControlClick, x29 y118, 카카오톡
	Sleep,300
	

	ControlSend, EVA_VH_ListControl_Dblclk3, {Ctrl}F, ahk_class EVA_Window_Dblclk
	Sleep,300
	ControlSetText, Edit2, 회장님들, ahk_class EVA_Window_Dblclk
	Sleep, 300
	controlsend, Edit2, {Enter}, 카카오톡	
	
		WinWait, 회장님들, 
		IfWinNotActive, 회장님들, , WinActivate, 회장님들, 
		WinWaitActive, 회장님들, 
		
	FormatTime, date1 , YYYYMMDD, yyyy-MM-dd
	
	Sleep, 300











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
	
	send, {LAlt}{Enter}{Right 6}{Up 2}{Enter}
	Sleep, 1000
	ControlClick, TRzButton4, ahk_class TfmMain
	ControlClick, TAdvToolBar2, ahk_class TfmMain
	Sleep, 1000
	ControlClick, TAdvToolBar3, ahk_class TfmMain,,,, x59 y12
	Sleep, 500	
	
			WinWait, 인쇄하기, 
			IfWinNotActive, 인쇄하기, , WinActivate, 인쇄하기, 
			WinWaitActive, 인쇄하기, 
			Sleep, 100	
	
	ControlClick, TRzBitBtn9, 인쇄하기	
	
	



	
		WinWait, Preview, 
		IfWinNotActive, Preview, , WinActivate, Preview, 
		WinWaitActive, Preview, 
	
	sleep, 200	
	ControlClick, x185 y43, Preview
	sleep, 100
	send, {PrintScreen 2}
			
			{
			CoordMode, Mouse, Screen
			sleep, 2000
			MouseClick, left, 457, 71, , , d
			sleep, 1000
			MouseClick, left, 1431, 968, , , u
			sleep, 100
			}	
	
		WinWait, 다른 이름으로 저장, 
		IfWinNotActive, 다른 이름으로 저장, , WinActivate, 다른 이름으로 저장, 
		WinWaitActive, 다른 이름으로 저장, 
		
	
			
		Sleep, 200			
	ControlSetText, Edit2, C:\Users\taeju\Desktop\전표자동저장{Enter}, 다른 이름으로 저장
		Sleep, 300


		
	ControlSetText, Edit1, 1.png, 다른 이름으로 저장	
		sleep, 200
		ControlClick, Button2, 다른 이름으로 저장	
		sleep, 200
		
		WinWait, 다른 이름으로 저장 확인, 
		IfWinNotActive, 다른 이름으로 저장 확인, , WinActivate, 다른 이름으로 저장 확인, 
		WinWaitActive, 다른 이름으로 저장 확인, 
		Sleep, 200				
			
		
		
		ControlClick, Button1, 다른 이름으로 저장 확인
		Sleep, 500
		
	
		WinWait, Preview, 
		IfWinNotActive, Preview, , WinActivate, Preview, 
		WinWaitActive, Preview, 
		Sleep, 200				
		
		
		
	Send,{Esc 2}
	sleep, 100


	
		WinWait, 인쇄하기, 
		IfWinNotActive, 인쇄하기, , WinActivate, 인쇄하기, 
		WinWaitActive, 인쇄하기, 
		Sleep, 100		
	

	
	
	ControlClick, TRzBitBtn1, 인쇄하기
	Sleep,200

winkill, 제대로판매재고M ver7.56 - [일계표 / 월계표]




		WinWait, 회장님들, 
		IfWinNotActive, 회장님들, , WinActivate, 회장님들, 
		WinWaitActive, 회장님들, 
		Sleep, 200		
	
	
	
	Send, ★★★ %date1% 일계표 ★★★{Enter}
	Send, {Ctrl Down}
	sleep, 100
	send, v
	sleep, 100
	send, {Ctrl Up}{Enter}
	Sleep, 300
	ControlSend, Edit2, {Del 30}, ahk_class EVA_Window_Dblclk
	Sleep, 100



	sleep, 60000







