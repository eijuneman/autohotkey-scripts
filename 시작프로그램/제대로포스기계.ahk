#z::
	CoordMode, MOUSE, SCREEN
	MouseClick,L,403,64
	MouseClickDrag,L,538,149,112,0
	sleep,900
	
    WinActivate PowerPoint 슬라이드 쇼  -  POS 세로2
	Send, {Shift Down}{F3 3}{Shift Up}
	WinActivate 매출전표
	MouseClick,L,168,73	
return


F12::
	CoordMode, MOUSE, SCREEN

    WinActivate PowerPoint 슬라이드 쇼  -  POS 세로2
    Send, {Shift Down}
    Send, {F2 3}
    Send, {Shift Up}
	Click
	Send, {F12}

return


+z::
	CoordMode, MOUSE, SCREEN
	WinActivate PowerPoint 슬라이드 쇼  -  POS 세로2.pptx
	
    Send, {Shift Down}
    Send, {F2 3}
    Send, {Shift Up}
	MouseClick,L,972,630	
return



