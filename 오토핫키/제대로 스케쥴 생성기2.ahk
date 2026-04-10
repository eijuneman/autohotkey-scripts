Gui, +AlwaysOnTop
Gui, Add, Text, x52 y19 w190 h20 , 거래처명
Gui, Add, Edit, x52 y39 w190 h50 GNAME , Edit
Gui, Add, Text, x52 y109 w190 h20 , 전표일자
Gui, Add, Edit, x52 y129 w190 h50 GTIME, Edit
Gui, Add, Text, x342 y19 w190 h20 , 장소
Gui, Add, Edit, x342 y39 w190 h50 GADD, Edit
Gui, Add, Text, x342 y109 w190 h20 , 결제방법
Gui, Add, Edit, x342 y129 w190 h50 GPAY, Edit
Gui, Add, Text, x52 y199 w190 h20 , 전표메모
Gui, Add, Edit, x52 y219 w480 h50 GMEMO, Edit
Gui, Add, Button, x182 y309 w100 h30 GRESET, Button
Gui, Add, Button, x312 y309 w100 h30 GSTART, Button
; Generated using SmartGUI Creator for SciTE
Gui, Show, w658 h532, 제대로 작업 스케줄 추가 프로그램
return








GuiClose:
ExitApp