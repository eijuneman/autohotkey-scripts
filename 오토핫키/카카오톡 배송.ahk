Gui, Add, Edit, x31 y55 w134 h38 , 
Gui, Add, Edit, x175 y55 w124 h38 , Edit1
Gui, Add, Edit, x309 y55 w134 h38 , Edit2
Gui, Add, Edit, x175 y115 w124 h38 , Edit3
Gui, Add, Edit, x309 y115 w134 h38 , Edit4
Gui, Add, Text, x31 y36 w134 h19 , 거레처명
Gui, Add, Text, x175 y36 w115 h19 , 배송날짜
Gui, Add, Text, x309 y36 w134 h19 , 출발시각
Gui, Add, Text, x175 y98 w115 h15 , 배송지
Gui, Add, Text, x309 y98 w134 h15 , 기타메모
Gui, Add, Edit, x31 y160 w412 h67 , [신흥목재 상품 배송 안내]`n기쁨을 전하는 신흥목재입니다.고객님의 소중한 상품을 가지고 출발합니다.`n
Gui, Add, Edit, x31 y240 w432 h76 , 
Gui, Add, Text, x31 y142 w83 h16 , 내용
Gui, Add, Button, x50 y335 w76 h38 g추출, 추출
Gui, Add, Button, x150 y335 w76 h38 g조합, 조합
Gui, Add, Button, x250 y335 w76 h38 g시작, 시작
Gui, Add, Button, x350 y335 w76 h38 g초기화, 초기화
; Generated using SmartGUI Creator for SciTE
Gui, Show, w479 h400, 배송문자 시스템  -by shwood-
return



SetControlDelay, 20


추출:
{
	ControlGetText, 거래처, TRzEdit8, ahk_exe JedaeroM.exe
	ControlSetText, Edit1, %거래처%, 배송문자 시스템  -by shwood-
	ControlGetText, 배송날짜, TRzDBDateTimeEdit1, ahk_exe JedaeroM.exe
	ControlSetText, Edit2, %배송날짜%, 배송문자 시스템  -by shwood-
	ControlGetText, 출발시각, TRzDBEdit12, ahk_exe JedaeroM.exe
	ControlSetText, Edit3, %출발시각%, 배송문자 시스템  -by shwood-	
	ControlGetText, 배송지, TRzDBEdit13, ahk_exe JedaeroM.exe
	ControlSetText, Edit4, %배송지%, 배송문자 시스템  -by shwood-
	ControlGetText, 기타메모, TRzDBEdit11, ahk_exe JedaeroM.exe
	ControlSetText, Edit5, %기타메모%, 배송문자 시스템  -by shwood-		
	
}
return


조합:
{
	ControlGetText, 배송날짜1, 	Edit2,  배송문자 시스템  -by shwood-
	ControlGetText, 출발시각1, 	Edit3,  배송문자 시스템  -by shwood-
	ControlGetText, 배송지1, 	Edit4,  배송문자 시스템  -by shwood-
	ControlGetText, 기타메모1, 	Edit5,  배송문자 시스템  -by shwood-
	ControlGetText, 인트로멘트, 	Edit6, 배송문자 시스템  -by shwood-
	Controlsend, Edit7, %인트로멘트%{Shift}{Enter}◆배송날짜 : %배송날짜1%{Shift}{Enter}◆출발시각 : %출발시각1%{Shift}{Enter}◆배 송  지 : %배송지1%{Shift}{Enter}◆기타메모 : %기타메모1%{Shift}{Enter}, 배송문자 시스템  -by shwood-		

	controlsend, RICHEDIT50W1, Enter, ahk_exe KakaoTalk.exe
	controlsend, RICHEDIT50W1, Esc, ahk_exe KakaoTalk.exe
	
}
return

시작:
{
	ControlClick, EVA_ChildWindow1, 카카오톡 , , , x45 y145,
	controlsend, EVA_Window2, {Ctrl}F, ahk_class EVA_Window_Dblclk
	ControlGetText, 거래처명, Edit1, 배송문자 시스템  -by shwood-
	sleep, 300
	ControlSetText, Edit2, %거래처명%, ahk_class EVA_Window_Dblclk
	Sleep, 500
	controlsend, Edit2, {Enter}, 카카오톡	
	Sleep, 300
	controlsend, Edit7, {Ctrl Down}a, 배송문자 시스템  -by shwood-
	Sleep, 100
	controlsend, Edit7, c{Ctrl Up}, 배송문자 시스템  -by shwood-
	sleep, 300 
	controlsend, RICHEDIT50W1, {Ctrl Down}v{Ctrl Up}, ahk_exe KakaoTalk.exe
	sleep, 300
	controlsend, RICHEDIT50W1, {Enter}, ahk_exe KakaoTalk.exe
	sleep, 300
	controlsend, RICHEDIT50W1, {Esc}, ahk_exe KakaoTalk.exe	
	sleep, 100
	ControlClick, EVA_ChildWindow1, 카카오톡 , , , x45 y145,
	controlsend, EVA_Window2, {Ctrl}F, ahk_class EVA_Window_Dblclk
	Sleep, 100
	ControlSend, Edit2, {Del 30}, ahk_class EVA_Window_Dblclk
}
return


초기화:
{
	WinGetPos, ax, ay, , , 배송문자 시스템  -by shwood-
	Reload
	winmove, 배송문자 시스템  -by shwood-, , %ax%, %ay%
}

GuiClose:
ExitApp
