CoordMode, MOUSE, SCREEN
ImageSearch, aX, aY, 600,400, 1400,700, C:\Users\taeju\Documents\IMAGESEARCH\LOGINBOTTON.PNG
MouseClick, L , %aX% , %aY%,,0
Sleep, 3000


; 2번파일 업로드
Send, {ENTER}
ImageSearch, bX, bY, 0,0, 500,500, C:\Users\taeju\Documents\IMAGESEARCH\1.png
MouseClick, L , %bX% , %bY%,,0
Sleep, 1000

ImageSearch, bX, bY, 600,0, 800,200, C:\Users\taeju\Documents\IMAGESEARCH\2.png
MouseClick, L , %bX% , %bY% , 2
Sleep,2000
SendInput, C:\Users\taeju\Desktop\cost\1
Send, {ENTER}
Sleep,1000
Send, {Alt Down}
Send, N
Send, {Alt Up}
Sleep,1000
SendInput, 2.xlsx    ; 2번파일 업로드
Sleep,1000
Send, {ENTER}

ImageSearch, cX, cY, 1700, 100,1920,300, C:\Users\taeju\Documents\IMAGESEARCH\3.png
MouseClick, L , %cX% , %cY% , 2
Sleep,40000




; 3번파일 업로드
Send, {ENTER}
ImageSearch, bX, bY, 0,0, 500,500, C:\Users\taeju\Documents\IMAGESEARCH\1.png
MouseClick, L , %bX% , %bY%,,0
Sleep, 1000

ImageSearch, bX, bY, 600,0, 800,200, C:\Users\taeju\Documents\IMAGESEARCH\2.png
MouseClick, L , %bX% , %bY% , 2
Sleep,2000
SendInput, C:\Users\taeju\Desktop\cost\1
Send, {ENTER}
Sleep,1000
Send, {Alt Down}
Send, N
Send, {Alt Up}
Sleep,2000
SendInput, 3.xlsx     ; 3번파일 업로드
Sleep,2000
Send, {ENTER}


CoordMode, MOUSE, SCREEN
ImageSearch, cX, cY, 1700, 100,1920,300, C:\Users\taeju\Documents\IMAGESEARCH\3.png
MouseClick, L , %cX% , %cY% , 
Sleep,40000
