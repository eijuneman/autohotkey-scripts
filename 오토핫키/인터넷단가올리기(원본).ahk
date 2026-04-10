; ?쒕?濡??쒖옉

Run, jaedero.lnk, C:\Users
Sleep,1000
sendraw, kk0404
send, {enter}
Sleep,1000


MouseClick,R,15,15,2,0
Sleep, 500
Send, {up 2}
send, {enter}
Sleep, 1000
CoordMode, Mouse, Relative
ImageSearch, aX, aY, 0,0, 1400,700, C:\Users\taeju\Documents\IMAGESEARCH\7.PNG
MouseClick, L , %aX% , %aY%,,0
Sleep, 1000

CoordMode, Mouse, Relative
ImageSearch, aX, aY, 0,0, 1400,700, C:\Users\taeju\Documents\IMAGESEARCH\8.PNG
MouseClick, L , %aX% , %aY%,,0
Sleep, 60000
; ?쒕?濡???



; ?쒕?濡?rare ?묒??쒖옉
WinActivate, 통합 문서1 - Excel
CoordMode, mouse , Window
ImageSearch, kX, kY, 0,0, 1400,700, C:\Users\taeju\Documents\IMAGESEARCH\12.PNG
MouseClick, L , %kX% , %kY%,,0
Sleep, 2000


MouseClick, L , 216,209,,0
Sleep,1000
MouseClick, L , 262, 34,,0
Sleep, 1000

CoordMode, mouse , Window
ImageSearch, jX, jY, 0,0, 1400,700, C:\Users\taeju\Documents\IMAGESEARCH\13.PNG
MouseClick, L , %jX% , %jY%,,0
Sleep, 3000


send, {Left}
Sleep, 1000

send,{enter}
Sleep, 1000



; 留덈뜑 ?묒??쒖옉
Run, _mother sheet.xlsm, C:\Users\taeju\Desktop\cost


Sleep, 23000
; 硫뷀겕濡??쒖옉


MouseClick, L , 438,60,,0
sleep,1000
MouseClick, L , 365,97,,0
sleep,10000


MouseClick, L , 610,57,,0
sleep,1000
MouseClick, L , 83,111,1,0
sleep,1000
MouseClick, L , 308,292,,0
sleep,1000
MouseClick, L , 255,354,,0
sleep,1000
MouseClick, L , 201,90,,0
sleep,1000
send,{enter}


Sleep, 10000

send, {Left}
sleep,500
send,{enter}
sleep,500

send, {Left}
sleep,500
send,{enter}
sleep,500

send, {Left}
sleep,500
send,{enter}
sleep,20000

; 硫뷀겕濡? / ?묒? ??






Run, msedge.exe, C:\Program Files (x86)\Microsoft\Edge\Application, max
Sleep, 1000
SendInput, https://shwood.co.kr/admin/goods/excel_upload
Sleep, 1000
Send, {ENTER}
Sleep, 2000

CoordMode, MOUSE, SCREEN
ImageSearch, aX, aY, 600,400, 1400,700, C:\Users\taeju\Documents\IMAGESEARCH\LOGINBOTTON.PNG
MouseClick, L , %aX% , %aY%,,0
Sleep, 3000

; 1踰덊뙆???낅줈??

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
SendInput, 1.xlsx   ; 1踰덊뙆???낅줈??
Sleep,2000
Send, {ENTER}

CoordMode, MOUSE, SCREEN
ImageSearch, cX, cY, 1700, 100,1920,300, C:\Users\taeju\Documents\IMAGESEARCH\3.png
MouseClick, L , %cX% , %cY% , 2
Sleep,40000





Send, {ENTER}
Sleep,1000
Send, {F5}
Sleep,1000


; 2踰덊뙆???낅줈??2踰덉㎏ ?쒕룄
Send, {ENTER}
Sleep, 1000
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
SendInput, 2.xlsx   ; 2踰덊뙆???낅줈??2踰덉㎏ ?쒕룄
Sleep,2000
MouseClick, L , 804,512,,0
Sleep,2000

CoordMode, MOUSE, SCREEN
ImageSearch, cX, cY, 1700, 100,1920,300, C:\Users\taeju\Documents\IMAGESEARCH\3.png
MouseClick, L , %cX% , %cY% , 2

Sleep,30000








Send, {ENTER}
Sleep,1000
Send, {F5}
Sleep,1000

; 3踰덊뙆???낅줈??2踰덉㎏ ?쒕룄
Send, {ENTER}
CoordMode, MOUSE, SCREEN
ImageSearch, bX, bY, 0,0, 500,500, C:\Users\taeju\Documents\IMAGESEARCH\1.png
MouseClick, L , %bX% , %bY%,,0
Sleep, 1000

CoordMode, MOUSE, SCREEN
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
SendInput, 3.xlsx     ; 3踰덊뙆???낅줈??2踰덉㎏ ?쒕룄
Sleep,2000
Send, {ENTER}


CoordMode, MOUSE, SCREEN
ImageSearch, cX, cY, 1700, 100,1920,300, C:\Users\taeju\Documents\IMAGESEARCH\3.png
MouseClick, L , %cX% , %cY% , 
Sleep,20000
 
Send,{Enter}
Sleep,2000
 ; 濡쒓렇?꾩썐
CoordMode, MOUSE, SCREEN
ImageSearch, loutX, loutY, 1600, 0,1920,500, C:\Users\taeju\Documents\IMAGESEARCH\4.png
MouseClick, L , %loutX% , %loutY% 
Sleep,1000

CoordMode, MOUSE, SCREEN
ImageSearch, lout2X, lout2Y, 1600, 0,1920,500, C:\Users\taeju\Documents\IMAGESEARCH\5.png
MouseClick, L , %lout2X% , %lout2Y% 
Sleep,1000




; Killing time
IfWinExist, ahk_class Chrome_WidgetWin_1
 WinKill ; ?ｌ? ?ㅼ슫
Sleep,1000

IfWinExist, ahk_class XLMAIN
 WinKill ; ?꾩뿉??諛쒓껄??李쎌쓣 ?ъ슜?⑸땲??
Sleep,1000








ExitApp