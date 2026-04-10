
; 2번파일 업로드
Send, {ENTER}
CoordMode, MOUSE, SCREEN
ImageSearch, bX, bY, 0,0, 500,500, C:\Users\taeju\Documents\IMAGESEARCH\1.png
MouseClick, L , %bX% , %bY%,,0
Sleep, 1000

CoordMode, MOUSE, SCREEN
ImageSearch, bX, bY, 600,0, 800,200, C:\Users\taeju\Documents\IMAGESEARCH\2.png
MouseClick, L , %bX% , %bY% , 2,0
Sleep,2000
SendInput, C:\Users\taeju\Desktop\cost\1
Send, {ENTER}
Sleep,1000
Send, {Alt Down}
Send, N
Send, {Alt Up}



Sleep,2000
SendInput, 2.xlsx   ; 2번파일 업로드
Sleep,2000
MouseClick, L , 804,512,,0