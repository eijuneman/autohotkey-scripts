#Persistent

SetTimer,Timer,200                                                        ;timer: 의 구문을 200ms(0.2초) 마다 실행하라는 뜻입니다.

Gui, Add, Edit, x66 y12 w70 h20 vsend1, 상대좌표            ; v를 붙여 각각의 이름을 정합니다.
Gui, Add, Edit, x206 y12 w70 h20 vsend2, 절대좌표            ; vsend1~6
Gui, Add, Edit, x66 y32 w70 h20 vsend3, Title                    ;guicontrol 과 함께 보시면 됩니다.
Gui, Add, Edit, x206 y32 w70 h20 vsend4, ClassNN
Gui, Add, Edit, x66 y52 w70 h20 vsend5, 화면비율
Gui, Add, Edit, x206 y52 w70 h20 vsend6, 좌표색값
Gui, Add, Button, x6 y12 w60 h20 , 상대좌표
Gui, Add, Button, x146 y12 w60 h20 , 절대좌표
Gui, Add, Button, x6 y32 w60 h20 , Title
Gui, Add, Button, x146 y32 w60 h20 , ClassNN
Gui, Add, Button, x6 y52 w60 h20 , 화면비율
Gui, Add, Button, x146 y52 w60 h20 , 좌표색값
Gui, +Alwaysontop
Gui, Show, x981 y862 h88 w286, 화면정보
Return

button상대좌표:                                              ; 버튼을 누르면 1이라는 변수에는 상대좌표값이 들어있는데
clipboard = %1%                                              ; 그것을 클립보드에 복사하라는 뜻입니다.
return

button절대좌표:
clipboard = %2%
return

buttonTitle:
clipboard = %3%
return

buttonClassNN:
clipboard = %4%
return

button화면비율:
clipboard = %5%
return

button좌표색값:
clipboard = %6%
return

GuiClose:                                                          ; X를 누르면 종료하라는 뜻입니다.
ExitApp                                                            ; 이 구문이 없으면 창만 닫기고 프로그램은 종료되지 않지요.

 

 

 


Timer:                                                                      ;settimer, 의 명령에 따라 실행됩니다.

Coordmode,mouse,relative                                        ;창을 기준으로 마우스의 좌표값을 재라는 의미입니다.
mousegetpos,x,y                                                      ;마우스 좌표값을 얻어옵니다.
ControlGetText, Color,TRzDBEdit13, ahk_class TfmChitSale                                 ;상대좌표 x,y

coordmode,mouse,screen                                                ;Screen 화면을 기준으로 좌표값을 재라는 의미입니다.
mousegetpos,xx,yy,MouseWindowUID, MouseControlID      ;절대좌표 xx,yy, ID, ClassNN
xratio:=round(xx/A_ScreenWidth*100)
yratio:=round(yy/A_Screenheight*100)                                ;화면비율 xratio,yratio 
                                                                                    ;비율로 쓰면 해상도가 달라도 적용할 수 있는 장점이..

WinGetTitle, Title, ahk_id %MouseWindowUID%                  ;Title얻기
WinGetClass, Class, ahk_id %MouseWindowUID%              ;Class얻기.  따로 넣지는 않습니다. 참고용

guicontrol, ,send1, %x% %y%                                      ;얻은 정보를 표시하도록 Gui로 보냅니다.
guicontrol, ,send2, %xx% %yy%                                  ;Gui 구현 창에 vsend1~6으로 이름을 정해놓았습니다.
guicontrol, ,send3, %title%
guicontrol, ,send4, %MouseControlID%
guicontrol, ,send5, %xratio% %yratio%
guicontrol, ,send6, %color%

return                                                                        ;timer구문 끝

 

 

 

Rbutton::                                ;오른쪽 버튼을 누르면 정보를 1,2,3,4,5,6 변수에 각각 저장
1=%x% %y%
2=%xx% %yy%                      ;Gui의 어떤 버튼을 누르는지에 따라 하나의 값이 저장되도록 함 (처음부분)
3=%title%
4=%MouseControlID%
5=%xratio% %yratio%
6=%color%
coordmode,mouse,screen
mousemove,1023,910
soundbeep,1500,80                  ;기본내장 소리, 주파수, 시간
return

^x::exitapp                            ;Ctrl + x 는 종료