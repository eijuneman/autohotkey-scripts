Gui, +AlwaysOnTop
Gui, Font, S20 CDefault, Verdana
Gui, Add, Text, x16 y13 w120 h30 , 오늘 해야할 일
Gui, Font, S15 CDefault, Verdana
Gui, Add, Edit, x16 y53 w860 h630 , 일정 없음
Gui, Font, S20 CDefault, Verdana
Gui, Add, Text, x16 y703 w120 h30 , 내일 할 일
Gui, Font, S15 CDefault, Verdana
Gui, Add, Edit, x16 y743 w860 h480 , 일정 없음
Gui, Font, S20 CDefault, Verdana
Gui, Add, Text, x16 y1240 w120 h30 , 자재 주문 or 재고 부족분
Gui, Font, S15 CDefault, Verdana
Gui, Add, Edit, x16 y1283 w860 h260 , 준비사항 없음
Gui, Font, S20 CDefault, Verdana
Gui, Font, S20 CDefault, Verdana
Gui, Add, Button, x666 y13 w100 h30 gB1, 복사하기
Gui, Add, Button, x776 y13 w100 h30 gB2, 붙여널기
Gui, Add, Button, x666 y703 w100 h30 gB3, 복사하기
Gui, Add, Button, x776 y703 w100 h30 gB4, 붙여널기
Gui, Add, Button, x666 y1240 w100 h30 gB5, 복사하기
Gui, Add, Button, x776 y1240 w100 h30 gB6, 붙여널기
; Generated using SmartGUI Creator for SciTE
Gui, Show, x-1802 y-538 w900 h1600, 신흥목재스케쥴
return






B1:
	ControlGetText, 거래처, TRzEdit8, ahk_exe JedaeroM.exe
	ControlGetText, 배송날짜, TRzDBDateTimeEdit1, ahk_exe JedaeroM.exe
	ControlGetText, 출발시각, TRzDBEdit12, ahk_exe JedaeroM.exe
	ControlGetText, 배송지, TRzDBEdit13, ahk_exe JedaeroM.exe
	ControlGetText, 기타메모, TRzDBEdit11, ahk_exe JedaeroM.exe
	ControlGetText, 내용, TDBGridInplaceEdit1, ahk_exe JedaeroM.exe
	

return


B2:
	controlsend, Edit1, %배송날짜%|%거래처%|%출발시각%|%배송지%|%기타메모%`n          - %내용%`n, 신흥목재스케쥴

return


B3:
	ControlGetText, 거래처, TRzEdit8, ahk_exe JedaeroM.exe
	ControlGetText, 배송날짜, TRzDBDateTimeEdit1, ahk_exe JedaeroM.exe
	ControlGetText, 출발시각, TRzDBEdit12, ahk_exe JedaeroM.exe
	ControlGetText, 배송지, TRzDBEdit13, ahk_exe JedaeroM.exe
	ControlGetText, 기타메모, TRzDBEdit11, ahk_exe JedaeroM.exe
	ControlGetText, 내용, TDBGridInplaceEdit1, ahk_exe JedaeroM.exe
	

return


B4:
	controlsend, Edit2, %배송날짜%|%거래처%|%출발시각%|%배송지%|%기타메모%{Enter}, 신흥목재스케쥴


return


B5:
	ControlGetText, 거래처, TRzEdit8, ahk_exe JedaeroM.exe
	ControlGetText, 배송날짜, TRzDBDateTimeEdit1, ahk_exe JedaeroM.exe
	ControlGetText, 출발시각, TRzDBEdit12, ahk_exe JedaeroM.exe
	ControlGetText, 배송지, TRzDBEdit13, ahk_exe JedaeroM.exe
	ControlGetText, 기타메모, TRzDBEdit11, ahk_exe JedaeroM.exe
	ControlGetText, 내용, TDBGridInplaceEdit1, ahk_exe JedaeroM.exe
	

return


B6:
	controlsend, Edit3, %배송날짜%|%거래처%|%출발시각%|%배송지%|%기타메모%{Enter}, 신흥목재스케쥴


return








GuiClose:
ExitApp






Pause::
Reload




GuiClose:
ExitApp
