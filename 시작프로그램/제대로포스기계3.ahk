#z::
	CoordMode, MOUSE, SCREEN ; 전표켜기
	MouseClick,L,2314,-464
	MouseClickDrag,L,2378,11,2112,-526
	sleep,600
	
    WinActivate PowerPoint 슬라이드 쇼  -  POS 세로2
	Send, {Shift Down}{F3 3}{Shift Up}
	WinActivate 매출전표
	MouseClick,L,2142,-450	
return


F12::
	CoordMode, MOUSE, SCREEN ; 전표끄기

    WinActivate PowerPoint 슬라이드 쇼  -  POS 세로2
    Send, {Shift Down}
    Send, {F2 3}
    Send, {Shift Up}
	Click
	Send, {F12}

return





#f1::
    CoordMode, MOUSE, SCREEN ; 현금
	MouseClick,L,2638,204
	
return





#'::
    CoordMode, MOUSE, SCREEN ; 은행결제
    MouseClick,L,2638,222
	MouseClick,L,2789,222
	MouseClick,L,2789,250
	

return




#/::
	CoordMode, MOUSE, SCREEN ; 카드결제
	MouseClick,L,2638,241
	MouseClick,L,2789,241
	MouseClick,L,2789,268
	

return





#[::
	CoordMode, MOUSE, SCREEN ; 인쇄하기
    Send, {F8}
	MouseClick,L,2689,353
    Send, {F9}	
	sleep,800
	MouseClick,L,2865,86

return


#]::
	CoordMode, MOUSE, SCREEN ; 미리보기(인쇄전)
	WinActivate PowerPoint 슬라이드 쇼  -  POS 세로2
    Send, {Shift Down}
    Send, {F2 3}
    Send, {Shift Up}
	Click
    Send, {F8}
    Send, {F8}
	WinActivate Preview
	MouseClick,L,2108,-487
	sleep,2000
	MouseMove, 2248,-460
	Send, {PrintScreen 4}
	sleep,2000
	Send, {PrintScreen 4}	
	MouseClickDrag,L,2248,-460, 3178,233,100
	Click
	
return