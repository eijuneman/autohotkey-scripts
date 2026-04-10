; 제대로 시작
Run, jaedero.lnk, C:\Users
Sleep,1000
sendraw, kk0404
send, {enter}
Sleep,1000


MouseClick,R,15,15,2,0
Sleep, 500
Send, {up 2}
send, {enter}

CoordMode, Mouse, Relative
ImageSearch, aX, aY, 0,0, 1400,700, C:\Users\taeju\Documents\IMAGESEARCH\7.PNG
MouseClick, L , %aX% , %aY%,,0
Sleep, 1000

CoordMode, Mouse, Relative
ImageSearch, aX, aY, 0,0, 1400,700, C:\Users\taeju\Documents\IMAGESEARCH\8.PNG
MouseClick, L , %aX% , %aY%,,0
Sleep, 40000
; 제대로 끝 

; 엑셀시작
WinActivate, _mother sheet2.xlsm - Excel
Sleep, 3000

Send, {CTRL Up}
Send, Q
Send, {CTRL Down}

Sleep, 15000

Loop, 3
{
CoordMode, Mouse, Relative
ImageSearch, aX, aY, 0,0, 1400,700, C:\Users\taeju\Documents\IMAGESEARCH\9.PNG
MouseClick, L , %aX% , %aY%,,0
Sleep, 4000
}
