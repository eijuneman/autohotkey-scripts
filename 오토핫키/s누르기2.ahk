Gui, +AlwaysOnTop
Gui, Add, Text, x22 y19 w80 h20 , 문자 받는 분
Gui, Add, Edit, x22 y99 w220 h390 , 대기 중
Gui, Add, Edit, x172 y39 w0 h10 , 대기 중
Gui, Add, Edit, x262 y39 w190 h30 , 대기 중
Gui, Add, Text, x262 y79 w110 h20 , 배송날짜
Gui, Add, Edit, x262 y99 w0 h0 , 대기 중
Gui, Add, Text, x262 y19 w110 h20 , 거래처명
Gui, Add, Edit, x262 y99 w190 h30 , 대기 중
Gui, Add, Text, x262 y139 w110 h20 , 출발/도착 시각
Gui, Add, Edit, x262 y159 w190 h30 , 대기 중
Gui, Add, Text, x262 y199 w110 h20 , 배송지
Gui, Add, Edit, x262 y219 w190 h30 , 대기 중
Gui, Add, Edit, x262 y279 w190 h40 , 대기 중
Gui, Add, Edit, x262 y350 w190 h40 , 품목 내용
Gui, Add, Text, x262 y349 w910 h-530 , 인트로 문구
Gui, Add, Edit, x262 y419 w190 h70 , [신흥목재 상품 출고 안내]`n기쁨을 전하는 신흥목재입니다.고객님의 소중한 상품을 출고합니다.`n
Gui, Add, Edit, x22 y39 w220 h30 , 김태준
Gui, Add, Text, x22 y79 w80 h20 , 조합 내용
Gui, Add, Button, x22 y509 w70 h50 g스케쥴복사, 스케쥴복사
Gui, Add, Button, x382 y509 w70 h50 g초기화, 초기화
Gui, Add, Button, x112 y509 w70 h50 g조합, 조합
Gui, Add, Button, x202 y509 w70 h50 g발송1, 발송`n`n(매장)
Gui, Add, Button, x292 y509 w70 h50 g발송2, 발송`n`n(배 송)
Gui, Add, Text, x262 y259 w110 h20 , 기타메모
Gui, Add, Text, x262 y330 w110 h20 , 품목 내용
Gui, Add, Text, x262 y399 w110 h20 , 첫문구
; Generated using SmartGUI Creator for SciTE
Gui, Show, x-485 y986 w478 h584, 배송문자 시스템  -by shwood-
return



SetControlDelay, 20

스케쥴복사:
{
Sleep,300
	ControlGetText, var1 , TRzEdit8, ahk_exe JedaeroM.exe ; 거래처명
	ControlGetText, var4 , 	TRzDBEdit12, ahk_exe JedaeroM.exe ; 시각

ControlGetText, var5 , 		TRzDBEdit11, ahk_exe JedaeroM.exe ;비고



ControlGetText, var8 , 	TRzDBDateTimeEdit1, ahk_exe JedaeroM.exe ; 날짜

ControlGetText, var9, TRzDBEdit13, ahk_exe JedaeroM.exe ; 장소

Sleep,1000


WinActivate,	ahk_exe JedaeroM.exe
Send,{F12}
Sleep,1000
ImageSearch, aX,aY, 0,0,1000,400, C:\Users\taeju\Documents\IMAGESEARCH\15.png
MouseClick, l,%aX%,%aY%,,0
WinWait, 매출전표
WinActivate, 매출전표
SetControlDelay, 1



ControlSetText,TRzEdit8, %var1%, ahk_exe JedaeroM.exe  ; 거래처명 
Sleep, 500
controlsend,TRzEdit8, {Enter}, ahk_exe JedaeroM.exe
Sleep, 500

ControlSetText,TRzDBEdit12 ,%var4%, ahk_exe JedaeroM.exe ; 시각

ControlFocus, TRzDBEdit11,ahk_exe JedaeroM.exe
ControlSetText,TRzDBEdit11,%var5%, ahk_exe JedaeroM.exe    ;비고

ControlSetText,TRzDBDateTimeEdit1, %var8%, ahk_exe JedaeroM.exe  ; 날짜

ControlFocus, TRzDBEdit13,ahk_exe JedaeroM.exe
ControlSetText, TRzDBEdit13, %var9% ,  ahk_exe JedaeroM.exe ; 장소


ControlClick, TRzBitBtn17, ahk_exe JedaeroM.exe
send,{Right}{F12}
sleep,1000
	
	

	ControlClick, x32 y188, ahk_class TfmChitSale
	sleep, 1000
		controlsend,TDBGridInplaceEdit1, {Right}, ahk_exe JedaeroM.exe
		Sleep, 500
		controlsend,TDBGridInplaceEdit1, {Ctrl Down}{Down}{Ctrl Up}, ahk_exe JedaeroM.exe	
		
	Loop 20
	{
		sleep, 200
		controlsend,TDBGridInplaceEdit1, {PgDn 1}, ahk_exe JedaeroM.exe
		Sleep, 100
		controlsend,TDBGridInplaceEdit1, {Up}, ahk_exe JedaeroM.exe	
		Sleep, 100
		controlsend,TDBGridInplaceEdit1, {Ctrl Down}{Left}{Ctrl Up}, ahk_exe JedaeroM.exe	
		Sleep, 100
		controlsend,TDBGridInplaceEdit1, {Right}, ahk_exe JedaeroM.exe	


		
	}
	
	Sleep, 500
	
	ControlClick, x447 y184, ahk_class TfmChitSale
	sleep, 50
	ControlClick, TDBGridInplaceEdit1, ahk_class TfmChitSale, , WheelDown, 30
	Loop 20
	{
		controlsend,TDBGridInplaceEdit1, {Del}, ahk_exe JedaeroM.exe
		ControlClick, TDBGridInplaceEdit1, ahk_class TfmChitSale, , WheelUp, 1
		
	}
	sleep, 500
	ControlClick, x813 y184, ahk_class TfmChitSale
	sleep, 50
	ControlClick, TDBGridInplaceEdit1, ahk_class TfmChitSale, , WheelDown, 30
	Loop 2
	{
		controlsend,TDBGridInplaceEdit1, {Del}, ahk_exe JedaeroM.exe
		ControlClick, TDBGridInplaceEdit1, ahk_class TfmChitSale, , WheelUp, 1
		
	}
	ControlClick, TRzDBDateTimeEdit1, ahk_class TfmChitSale
		
	ControlClick, x210 y183, ahk_class TfmChitSale

}
return


조합:
{
	ControlGetText, 거래처, TRzEdit8, ahk_exe JedaeroM.exe
	ControlSetText, Edit3, %거래처%, 배송문자 시스템  -by shwood-
	ControlGetText, 배송날짜, TRzDBDateTimeEdit1, ahk_exe JedaeroM.exe
	ControlSetText, Edit5, %배송날짜%, 배송문자 시스템  -by shwood-
	ControlGetText, 출발시각, TRzDBEdit12, ahk_exe JedaeroM.exe
	ControlSetText, Edit6, %출발시각%, 배송문자 시스템  -by shwood-	
	ControlGetText, 배송지, TRzDBEdit13, ahk_exe JedaeroM.exe
	ControlSetText, Edit7, %배송지%, 배송문자 시스템  -by shwood-
	ControlGetText, 기타메모, TRzDBEdit11, ahk_exe JedaeroM.exe
	ControlSetText, Edit8, %기타메모%, 배송문자 시스템  -by shwood-		
	ControlGetText, 내용, TDBGridInplaceEdit1, ahk_exe JedaeroM.exe
	ControlSetText, Edit9, %내용%, 배송문자 시스템  -by shwood-	


	ControlGetText, 거래처명1, 	Edit3,  배송문자 시스템  -by shwood-
	ControlGetText, 배송날짜1, 	Edit5,  배송문자 시스템  -by shwood-
	ControlGetText, 출발시각1, 	Edit6,  배송문자 시스템  -by shwood-
	ControlGetText, 배송지1, 	Edit7,  배송문자 시스템  -by shwood-
	ControlGetText, 기타메모1, 	Edit8,  배송문자 시스템  -by shwood-
	ControlGetText, 내용1, 	Edit9,  배송문자 시스템  -by shwood-
	ControlGetText, 인트로멘트1, 	Edit10, 배송문자 시스템  -by shwood-
	Controlsend, Edit1, %인트로멘트1%{Shift}{Enter}◆거래처명 : %거래처명1%{Shift}{Enter}◆내      용 : %내용1% 외 건{Shift}{Enter}◆배송날짜 : %배송날짜1%{Shift}{Enter}◆시      간 : %출발시각1%{Shift}{Enter}◆배 송  지 : %배송지1%{Shift}{Enter}◆기타메모 : %기타메모1%{Shift}{Enter}, 배송문자 시스템  -by shwood-		

	MsgBox, 4096, ★주의!!★발송전 체크사항!!, 문자 받는분`n배송닐짜`n출발/도착 시각`n`n확인해야함
}
return


발송1:
{
	ControlGetText, 받는분, Edit11, 배송문자 시스템  -by shwood-
	sleep, 100
	controlsend, Edit1, {Ctrl Down}a, 배송문자 시스템  -by shwood-
	Sleep, 300
	controlsend, Edit1, c{Ctrl Up}, 배송문자 시스템  -by shwood-
	sleep, 300 
	WinActivate, 카카오톡
	Sleep,300
	ControlClick, x29 y118, 카카오톡
	Sleep,300
	ControlSend, EVA_VH_ListControl_Dblclk3, {Ctrl}F, ahk_class EVA_Window_Dblclk
	Sleep,300
	ControlSetText, Edit2, %받는분%, ahk_class EVA_Window_Dblclk
	Sleep, 300
	controlsend, Edit2, {Enter}, 카카오톡	
	Sleep, 300
	Send, {Ctrl Down}
	sleep, 100
	send, v
	sleep, 100
	send, {Ctrl Up}{Enter}

	Sleep, 300
	ControlSend, Edit2, {Del 30}, ahk_class EVA_Window_Dblclk
	Sleep, 300
	controlclick, TRzBitBtn8, ahk_class TfmChitSale
	Sleep, 300
	controlclick, x226 y369, 인쇄하기,,,, NA x149 y313
	Sleep, 300
	controlclick, TRzBitBtn9, 인쇄하기
	Sleep, 300
	WinActivate, ahk_exe JedaeroM.exe
	MouseClick, l, 195, 42, 2
	sleep, 100
	WinActivate, ahk_exe JedaeroM.exe
	Sleep, 1000
	send, {PrintScreen}
	sleep, 100
	MouseClick, left, 400, 89
	sleep,1000
	MouseGetpos, ax, ay
	MouseClick, left, %ax%, %ay%, , , d
	kx := ax+1100
	ky := ay+800
	Sleep, 500
	MouseClick, left, %kx%, %ky%, , , u
	sleep, 1000
	Send,{Esc 2}
	sleep, 1000
	
	ControlClick, TRzBitBtn1, ahk_exe JedaeroM.exe	
	Sleep,1000
	WinActivate, ahk_class #32770
	sleep, 1000
	send, {Ctrl Down}
	sleep, 100
	send, v
	sleep, 100
	send, {Ctrl Up}
	sleep, 300
	Send, {Enter}
	sleep, 1000
	Send, {Esc}
sleep, 500
	controlsend, RICHEDIT50W1, {Enter}, ahk_exe KakaoTalk.exe
		sleep, 100
	controlsend, RICHEDIT50W1, {Enter}, ahk_exe KakaoTalk.exe
	ControlClick, EVA_ChildWindow2, 카카오톡 , , , x45 y145,
	controlsend, RICHEDIT50W1, {Esc}, ahk_exe KakaoTalk.exe		
	

	controlsend, EVA_Window2, {Ctrl}F, ahk_class EVA_Window_Dblclk	
	controlsend, , {Enter}, ahk_exe KakaoTalk.exe
	
	
	
	
}
return

발송2:
{
	ControlGetText, 받는분, Edit11, 배송문자 시스템  -by shwood-
	sleep, 100
	controlsend, Edit1, {Ctrl Down}a, 배송문자 시스템  -by shwood-
	Sleep, 300
	controlsend, Edit1, c{Ctrl Up}, 배송문자 시스템  -by shwood-
	sleep, 300 
	WinActivate, 카카오톡
	Sleep,300
	ControlClick, x29 y118, 카카오톡
	Sleep,300
	ControlSend, EVA_VH_ListControl_Dblclk3, {Ctrl}F, ahk_class EVA_Window_Dblclk
	Sleep,300
	ControlSetText, Edit2, %받는분%, ahk_class EVA_Window_Dblclk
	Sleep, 300
	controlsend, Edit2, {Enter}, 카카오톡	
	Sleep, 300
	Send, {Ctrl Down}
	sleep, 100
	send, v
	sleep, 100
	send, {Ctrl Up}{Enter}

	Sleep, 300
	ControlSend, Edit2, {Del 30}, ahk_class EVA_Window_Dblclk
	Sleep, 300
	controlclick, TRzBitBtn8, ahk_class TfmChitSale
	Sleep, 300
	controlclick, x226 y369, 인쇄하기,,,, NA x149 y313
	Sleep, 300
	controlclick, TRzBitBtn9, 인쇄하기
	Sleep, 300
	WinActivate, ahk_exe JedaeroM.exe
	MouseClick, l, 195, 42, 2
	sleep, 100
	WinActivate, ahk_exe JedaeroM.exe
	Sleep, 1000
	send, {PrintScreen}
	sleep, 100
	MouseClick, left, 400, 89
	sleep,1000
	MouseGetpos, ax, ay
	MouseClick, left, %ax%, %ay%, , , d
	kx := ax+1100
	ky := ay+800
	Sleep, 500
	MouseClick, left, %kx%, %ky%, , , u
	sleep, 1000
	Send,{Esc 2}
	sleep, 1000
	
	ControlClick, TRzBitBtn1, ahk_exe JedaeroM.exe	
	Sleep,1000
	WinActivate, ahk_class #32770
	sleep, 1000
	send, {Ctrl Down}
	sleep, 100
	send, v
	sleep, 100
	send, {Ctrl Up}
	sleep, 300
	Send, {Enter}
	sleep, 1000
	Send, {Esc}
sleep, 500
	controlsend, RICHEDIT50W1, {Enter}, ahk_exe KakaoTalk.exe
		sleep, 100
	controlsend, RICHEDIT50W1, {Enter}, ahk_exe KakaoTalk.exe
	ControlClick, EVA_ChildWindow2, 카카오톡 , , , x45 y145,
	controlsend, RICHEDIT50W1, {Esc}, ahk_exe KakaoTalk.exe		
	

	controlsend, EVA_Window2, {Ctrl}F, ahk_class EVA_Window_Dblclk	
	controlsend, , {Enter}, ahk_exe KakaoTalk.exe
	
	
	
	run, https://map.kakao.com/
Sleep, 1000
ControlGetText, 배송지1, 	Edit7,  배송문자 시스템  -by shwood-
Sleep, 2000
send, %배송지1%
Sleep, 500
send, {Enter}
Sleep, 1000
ImageSearch, nx, ny, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\taeju\Documents\IMAGESEARCH\16.png
MouseClick, l, %nx%, %ny%
Sleep, 1000
ImageSearch, n1x, n1y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\taeju\Documents\IMAGESEARCH\17.png
MouseClick, l, %n1x%, %n1y%
Sleep, 1000
ImageSearch, n2x, n2y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\taeju\Documents\IMAGESEARCH\18.png
MouseClick, l, %n2x%, %n2y%
Sleep, 2000
ImageSearch, n3x, n3y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\taeju\Documents\IMAGESEARCH\19.png
MouseClick, l, %n3x%, %n3y%
Sleep, 1000
send, {Tab}
ControlGetText, 받는분, Edit11, 배송문자 시스템  -by shwood-
Sleep, 1000
send, %받는분%

ImageSearch, n4x, n4y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\taeju\Documents\IMAGESEARCH\21.png
MouseClick, l, %n4x%, %n4y%
Sleep, 1000

ImageSearch, n5x, n5y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\taeju\Documents\IMAGESEARCH\22.png
MouseClick, l, %n5x%, %n5y%
Sleep, 1000




}
return


초기화:
{
	WinGetPos, ax, ay, , , 배송문자 시스템  -by shwood-
	Reload
	Sleep, 2000
	WinActivate, 배송문자 시스템  -by shwood-
	MsgBox,  %ax%, %ay%
}
return


GuiClose:
ExitApp


