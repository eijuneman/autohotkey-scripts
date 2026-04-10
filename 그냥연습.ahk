#NoENV
#SingleInstance, Force
#InstallMouseHook

#Include, %A_ScriptDir%\csv.ahk
연다 = 0

어제날짜=%A_Now%
EnvAdd,어제날짜,-1,days
FormatTime,어제날짜,%어제날짜%,yyyy-MM-dd
csvfile1 = %A_ScriptDir%\상품정보\상품정보.CSV
        csv_Load(csvfile1,"data1")

locachange:

gui, l:destroy
gui, l:Default
gui, l:-sysmenu
gui, l:+alwaysontop
Gui, Font, S13 CDefault w700, Malgun Gothic

Gui, l:Add, Button, x45 y20  w100 h40 gll1, 변환후 저장
Gui, l:Add, Button, x+10 w100 h40 gll2, 닫기



Gui, l:Add, Text, x20 y+5 w20 h40 vl#1 Backgroundtrans, #1
Gui, l:Add, Edit, x+5 w170 h40 cE7141B vn1LOCA1 gll4
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 1
Gui, l:Add, Text,x20 y+5 w20 h40 vl#2 backgroundtrans, #2
Gui, l:Add, Edit,  x+5  w170 h40 cE7141B vn2LOCA1
Gui, l:Add, Button, x+0   w40 h40 gldelloca, 2
Gui, l:Add, Text,x20 y+5 w20 h40 vl#3 backgroundtrans, #3
Gui, l:Add, Edit,x+5  w170 h40 cE7141B vn3LOCA1
Gui, l:Add, Button, x+0   w40 h40 gldelloca
Gui, l:Add, Text,x20 y+5 w20 h40 vl#4 backgroundtrans, #4
Gui, l:Add, Edit, x+5  w170 h40 cE7141B vn4LOCA1
Gui, l:Add, Button, x+0   w40 h40 gldelloca
Gui, l:Add, Text,x20 y+5 w20 h40 vl#5 backgroundtrans, #5
Gui, l:Add, Edit,x+5  w170 h40 cE7141B vn5LOCA1
Gui, l:Add, Button, x+0   w40 h40 gldelloca
Gui, l:Add, Text, x20y+5 w20 h40 vl#6 backgroundtrans, #6
Gui, l:Add, Edit, x+5   w170 h40 cE7141B vn6LOCA1
Gui, l:Add, Button, x+0   w40 h40 gldelloca
Gui, l:Add, Text,x20 y+5 w20 h40 vl#7 backgroundtrans, #7
Gui, l:Add, Edit,x+5   w170 h40 cE7141B vn7LOCA1
Gui, l:Add, Button, x+0   w40 h40 gldelloca
Gui, l:Add, Text,x20 y+5 w20 h40 vl#8 backgroundtrans, #8
Gui, l:Add, Edit, x+5  w170 h40 cE7141B vn8LOCA1
Gui, l:Add, Button, x+0   w40 h40 gldelloca
Gui, l:Add, Text,x20 y+5 w20 h40 vl#9 backgroundtrans, #9
Gui, l:Add, Edit,x+5   w170 h40 cE7141B vn9LOCA1
Gui, l:Add, Button, x+0   w40 h40 gldelloca
Gui, l:Add, Text,x20 y+5 w20 h40 vl#10 backgroundtrans, #10
Gui, l:Add, Edit,x+5   w170 h40 cE7141B vn10LOCA1
Gui, l:Add, Button, x+0   w40 h40 gldelloca


2번열=300


Gui, Font, S20 CDefault w700, Malgun Gothic
Gui, l:Add, Edit, readonly x335 y20 w90 h40 vRL1 Cred +Right, %newlocation1%
Gui, l:Add, text, x+0 y20 w15 h40 Cred +center, -
Gui, l:Add, Edit, readonly x+10 y20 w90 h40 vRL2 Cred +Left, %newlocation2%


Gui, Font, S13 CDefault w700, Malgun Gothic
Gui, l:Add, Text, x%2번열% y65 w35 h40 vl#11 Backgroundtrans, #11
Gui, l:Add, Edit, x+0 w170 h40 cE7141B vn11LOCA1
Gui, l:Add, Button, x+0   w35 h40 gldelloca
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#12 backgroundtrans, #12
Gui, l:Add, Edit,  x+0  w170 h40 cE7141B vn12LOCA1
Gui, l:Add, Button, x+0   w35 h40 gldelloca
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#13 backgroundtrans, #13
Gui, l:Add, Edit,x+0  w170 h40 cE7141B vn13LOCA1
Gui, l:Add, Button, x+0   w35 h40 gldelloca
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#14 backgroundtrans, #14
Gui, l:Add, Edit, x+0  w170 h40 cE7141B vn14LOCA1
Gui, l:Add, Button, x+0   w35 h40 gldelloca
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#15 backgroundtrans, #15
Gui, l:Add, Edit,x+0  w170 h40 cE7141B vn15LOCA1
Gui, l:Add, Button, x+0   w35 h40 gldelloca
Gui, l:Add, Text, x%2번열% y+5 w35 h40 vl#16 backgroundtrans, #16
Gui, l:Add, Edit, x+0   w170 h40 cE7141B vn16LOCA1
Gui, l:Add, Button, x+0   w35 h40 gldelloca
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#17 backgroundtrans, #17
Gui, l:Add, Edit,x+0   w170 h40 cE7141B vn17LOCA1
Gui, l:Add, Button, x+0   w35 h40 gldelloca
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#18 backgroundtrans, #18
Gui, l:Add, Edit, x+0  w170 h40 cE7141B vn18LOCA1
Gui, l:Add, Button, x+0   w35 h40 gldelloca
Gui, l:Add, Text,x%2번열% y+5 w35 h40 vl#19 backgroundtrans, #19
Gui, l:Add, Edit,x+0   w170 h40 cE7141B vn19LOCA1
Gui, l:Add, Button, x+0   w35 h40 gldelloca

Gui, Font, S12 w700 cred, Malgun Gothic
Gui, l:Add, Text,x%2번열% y+5 w200 h100 backgroundtrans, ※ 주의사항`n- 카드번호만 변경합니다. 로케이션 및 다른 정보 저장시 항시 저장을 누르세요!!!

Gui, Font, S13 CDefault w400, Malgun Gothic

Gui,l:show, x978 y51 , 변환 하기
return

ldelloca:   ; 에디트 값 지우기
GuiControlGet, loorder, FocusV
GuiControl, , n%loorder%LOCA1,
;~ MsgBox % OutputVar
return





ll1:
Gui, l:submit, nohide


Loop, % Rows
	{
	 founds:=CSV_Search("data1",n1LOCA1,A_Index)
	 if founds=0
		break
	 founds:=StrSplit(founds,",")
        r2:=CSV_ReadCell("data1",founds[1],2) ; s3
        r0:=CSV_ReadCell("data1",founds[1],1) ; original  rfid
        r29:=CSV_ReadCell("data1",founds[1],29) ; 상품명
        r30:=CSV_ReadCell("data1",founds[1],30) ; 규격
        r31:=CSV_ReadCell("data1",founds[1],31) ; pdt code
        MsgBox, % r31 "," r29 "," r30 "," r2 "," r31 "," r0
    }

return

ll2:
WinKill, 변환 하기
gui, l:hide
gui, l:submit
return

ll4:
Gui, l:submit, nohide
GuiControlGet, lolength, FocusV
RegExMatch(lolength, "n(.*)LOCA1", lolength)
로카값1 := n%lolength1%LOCA1
    Sleep, 200
    코드길이l := StrLen(로카값1)
        ;~ MsgBox, % "코드길이l:" 코드길이l "`nlolength1:" lolength1 "`nlolength:" lolength "`nn%lolength1%LOCA1:" n%lolength1%LOCA1 "`n로카값:" 로카값 "`n로카값1:" 로카값1
    if ( 코드길이l = 10 )
    {
    }
    else
    {
        GuiControl, , n%lolength1%LOCA1,
    }




return
