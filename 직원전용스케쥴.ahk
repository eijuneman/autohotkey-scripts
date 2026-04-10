Gui, +AlwaysOnTop
Gui, Font, S20 CDefault, Verdana
Gui, Add, Text, x16 y13 w120 h30 , 오늘 해야할 일
Gui, Font, S13 CDefault, Verdana
Gui, Add, Edit, x14 y53 w860 h430 , 일정 없음  ; 1
Gui, Font, S20 CDefault, Verdana
Gui, Add, Text, x16 y503 w300 h30 , 내일 아침 배송
Gui, Font, S13 CDefault, Verdana
Gui, Add, Edit, x14 y543 w860 h330 , 일정 없음  ; 2
Gui, Font, S20 CDefault, Verdana
Gui, Add, Text, x16 y903 w210 h30 , 내일 할 일
Gui, Font, S13 CDefault, Verdana
Gui, Add, Edit, x14 y943 w860 h280 , 일정 없음  ; 3
Gui, Font, S20 CDefault, Verdana
Gui, Add, Text, x16 y1240 w300 h30 , 자재 주문 or 재고 부족분
Gui, Font, S13 CDefault, Verdana
Gui, Add, Edit, x14 y1283 w860 h260 , 준비사항 없음  ; 4
Gui, Font, S20 CDefault, Verdana
Gui, Font, S20 CDefault, Verdana
Gui, Add, Button, x666 y13 w100 h30 gB1, 복사하기
Gui, Add, Button, x776 y13 w100 h30 gB2, 붙여널기
Gui, Add, Button, x666 y503 w100 h30 gB3, 복사하기
Gui, Add, Button, x776 y503 w100 h30 gB4, 붙여널기
Gui, Add, Button, x666 y903 w100 h30 gB5, 복사하기
Gui, Add, Button, x776 y903 w100 h30 gB6, 붙여널기
Gui, Add, Button, x666 y1240 w100 h30 gB7, 복사하기
Gui, Add, Button, x776 y1240 w100 h30 gB8, 붙여널기
; Generated using SmartGUI Creator for SciTE
Gui, Show, x-1802 y-538 w900 h1600, 직원전용스케쥴
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
	controlsend, Edit1, %배송날짜% | %거래처% / %출발시각% / %배송지% / %기타메모%`n                     - %내용% 외 건`n, 직원전용스케쥴
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

	controlsend, Edit2, %배송날짜% | %거래처% / %출발시각% / %배송지% / %기타메모%`n                     - %내용% 외 건`n, 직원전용스케쥴
	
	

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
	controlsend, Edit3, %배송날짜% | %거래처% / %출발시각% / %배송지% / %기타메모%`n                     - %내용% 외 건`n, 직원전용스케쥴


return




B7:
	ControlGetText, 거래처, TRzEdit8, ahk_exe JedaeroM.exe
	ControlGetText, 배송날짜, TRzDBDateTimeEdit1, ahk_exe JedaeroM.exe
	ControlGetText, 출발시각, TRzDBEdit12, ahk_exe JedaeroM.exe
	ControlGetText, 배송지, TRzDBEdit13, ahk_exe JedaeroM.exe
	ControlGetText, 기타메모, TRzDBEdit11, ahk_exe JedaeroM.exe
	ControlGetText, 내용, TDBGridInplaceEdit1, ahk_exe JedaeroM.exe
	

return


B8:
	controlsend, Edit4, %배송날짜% | %거래처% / %출발시각% / %배송지% / %기타메모%`n                     - %내용% 외 건`n, 직원전용스케쥴

return







GuiClose:
ExitApp