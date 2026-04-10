#NoEnv
Process, Priority, , High
;~ SetWorkingDir, \\192.168.0.1\hdd1\일정표 최근\일정표220730 ; Ensures a consistent starting directory.
SetWorkingDir, %A_ScriptDir% ; Ensures a consistent starting directory.
winkill, 화상 키보드
Menu, TRAY, Icon, %A_ScriptDir%\Mushroom - Super.ico
#SingleInstance, Force
;~ Process, Priority,, High
;~ #MaxMem 512  ; that's a large chunk of memory for a script
;~ ListLines Off  ; helps with speed
#MaxHotkeysPerInterval, 10000
;~ DetectHiddenText, On
;~ DetectHiddenWindows, On
SetTitleMatchMode, 1
SetTitleMatchMode, slow

;~ SetBatchLines, -1  ; affects CPU utilization... script will run at max speed
SetControlDelay, 1
SetWinDelay, 1
SetKeyDelay, 2
SetMouseDelay, 1


    ;~ SetTimer ,CheckInactive, 5000



#Include, %A_ScriptDir%\MySQL.ahk

;~ host := "127.0.0.1"
host := "59.27.187.25"
;~ host := "192.168.0.23"
user := "root"
pw := "tlsgmdahrwo12#"
database := "mydatabase"

sql_start()

global myDB := dbConnect(host, user, pw, database)
if(myDB = "error"){
	MsgBox, % myDB
}
dbQuery(myDB, "set character set euckr")




/*
broadcast=\\192.168.0.1\hdd1\일정표 최근\일정표220730\breadcast
Voice := ComObjCreate("SAPI.SpVoice")
if (A_UserName = "지게차용")
{
    ;~ SetTimer , timer, 5000
}
else
{
}
*/


;~ run, explorer \\192.168.0.1\hdd1\일정표 최근\일정표220730\매입, , hide, PID
;~ run, explorer \\192.168.0.1\hdd1\일정표 최근\일정표220730\매출, , hide, PID

#Include, %A_MyDocuments%\Class_LV_InCellEdit.ahk
#Include, %A_MyDocuments%\Class_LV_Colors.ahk
#Include, %A_MyDocuments%\csv.ahk
#Include, %A_MyDocuments%\screencapture.ahk
;~ SetTimer, timer, 1000

루틴목록30 = |보험 확인|
루틴목록7 = |주간결산|부족재고 분 확인|
루틴목록1 = |세금계산서 발행|내일 배송건 확인|오늘 발주품목 납기확인|커피머신 청소|사무실 청소|보험 확인|카톡전화문자 받은 발주 확인|발주서 출고서와 대조|화장실 청소|외상장부정리|송금|비용처리

FormatTime, todaynowmonth, YYYYMMDD,yyyyMMdd
vDate := todaynowmonth
vMonthStart := SubStr(vDate, 1, 6) "01"
vDay := SubStr(vDate, 7, 2)
vMonthEnd := DateAdd(vDate, -vDay+32, "Days")
vMonthEnd := SubStr(vMonthEnd, 1, 6)
vMonthEnd := DateAdd(vMonthEnd, -1, "Days")
vMonthEnd := SubStr(vMonthEnd, 1, 8)


FormatTime, todaynow1, YYYYMMDDdddd,MM월 dd일 dddd
FormatTime, todaynow, YYYYMMDD,yyyyMMdd
FormatTime, addtime1, YYYYMMDD,yyyy-MM-dd
FormatTime, A_tmrw, YYYYMMDD,yyyyMMdd
A_tmrw += 1, days
FormatTime, A_tmrw1, YYYYMMDD,yyyyMMdd
A_tmrw1 += 2, days
FormatTime, A_tmrw2, YYYYMMDD,yyyyMMdd
A_tmrw2 += 3, days
FormatTime, A_week, YYYYMMDD,yyyyMMdd
A_Week += 7, days
FormatTime, A_month1, YYYYMMDD,yyyyMMdd
A_month1 += 31, days
FormatTime, A_time, YYYYMMDDHHmm,HHmm

vDate := A_Now
vDate1 := DateGetWeekStart(vDate,, "yyyyMMdd")
vDate2 := DateGetWeekEnd(vDate,, "yyyyMMdd")
FormatTime, vDate, % vDate, yyyyMMdd

winshow, 카카오톡

라벨 := "M"
;~ 받는분 := "김태준"
받는분 := "지게차피씨"
;~ 받는분 := "신흥목재업무로그"
상태 := "A"
parmMode = 0
Gui, 1:Destroy
Gui, 1:Default
Gui, 1:+SysMenu
WinSet, Style, +0x20000000,
;~ Gui, 1:+alwaysontop

Gui, 1:Add, Progress, x10 y30 w1260 h5 vPG1,0
Gui, 1:Font, S13 CDefault W700, Malgun Gothic
;~ Gui, Color, FcFcFc                                  |             |             |               |             |             |             |             |             |
Gui, 1:Add, Tab3, x0 y0 w1281 h731 Background0xFF00FF grefreshtab1 vrefreshtab, 출고지시서▲` |입고지시서▽` |타임라인~>`   ` |상품정보`     ` |사무 루틴`    |현장 루틴`    |수동 루틴`    |일일재고파악|
Gui, 1:Tab, 출고지시서▲` ,,
Gui, 1:Add, GroupBox, x10 y30 w1260 h690, ; [ 사무 루틴   ]
Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x20 y55 w180 h25 , 시작일
Gui, 1:Add, Text, x+10 w150 h25 , 종료일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x20 y+0 w180 h30 vmonth1 Choose%todaynow% gmonth1,  ;;;;;;;;;;;;;;;;;;;;;;;;

Gui, 1:Add, DateTime, x+10 w180 h30 vmonth2 Choose%A_month1% gmonth2,

Gui, 1:Font, S11 CDefault W400, Malgun Gothic
Gui, 1:Add, button, x+10 y60 w50 h50 gbutton4, 이번달
Gui, 1:Add, button, x+10 w50 h50 gbutton3, 요번주
Gui, 1:Add, button, x+10 w50 h50 gbutton1, 오늘
Gui, 1:Add, button, x+10 w50 h50 gbutton2, 내일


Gui, 1:Font, S12 CDefault W700 CRed, Malgun Gothic
gui, 1:Add, text, x+20 y60 w150 h20 ,[오늘날짜]

Gui, 1:Font, S15 CDefault W700 CRed, Malgun Gothic
gui, 1:Add, text, y+2 w170 h27,%todaynow1%

Gui, 1:Font, S11 CDefault W400 CRed, Malgun Gothic
Gui, 1:Add, Button, x+0 y60 w51 h50 greload, 재시작
Gui, 1:Add, Button, x+7 w45 h50 gchange, WMS
Gui, 1:Add, Picture, x+7 y60 w229 h50, %A_WorkingDir%\bum1.png


Gui, 1:Add, Button, x+6 w95 h50 grefresh1, 새로고침



Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x20 y+10 w400 h25 , Ⅰ. 출고 리스트 업
Gui, 1:Font, S13 CDefault W300, Malgun Gothic
Gui, 1:Add, ListView, x20 y+0 w610 h230 vlv1 glv1 Grid hwndHLV1 Sort NoSortHdr -Multi Backgroundfff0f0, 안보임|출하일|日|출고시각|업체명|출고지|컷|門|出|`%|원본날짜
Gui, 1:ListView, lv1
LV_ModifyCol(1, 0) ;
LV_ModifyCol(2, 65)  ;
LV_ModifyCol(3, 30)  ;
LV_ModifyCol(4, 85)  ;
LV_ModifyCol(5, 150)  ;
LV_ModifyCol(6, 130)  ;
LV_ModifyCol(7, 30)  ;
LV_ModifyCol(8, 30)  ;
LV_ModifyCol(9, 30)  ;
LV_ModifyCol(10, "40 Integer" "Integer Right")    ;
LV_ModifyCol(11, 0) ;


Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x20 y+5 w400 h25 , Ⅱ. 준비 중 (리스트 확인)
Gui, 1:Font, S13 CDefault W300, Malgun Gothic
Gui, 1:Add, ListView, y+0 w610 h300 vlv2 glv2 Grid hwndHLV2 NoSortHdr Sort -Multi Backgroundffdbdb, 안보임|출하일|日|출고시각|업체명|출고지|컷|門|出|`%|원본날짜
Gui, 1:ListView, lv2
LV_ModifyCol(1, 0) ;
LV_ModifyCol(2, 65)  ;
LV_ModifyCol(3, 30)  ;
LV_ModifyCol(4, 85)  ;
LV_ModifyCol(5, 150)  ;
LV_ModifyCol(6, 130)  ;
LV_ModifyCol(7, 30)  ;
LV_ModifyCol(8, 30)  ;
LV_ModifyCol(9, 30)  ;
LV_ModifyCol(10, "40 Integer" "Integer Right")    ;
LV_ModifyCol(11, 0) ;

Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x650 y120 w400 h25 , Ⅲ. 준비 완료 (출고 전 제품 수량, 상태 검수까지)
Gui, 1:Font, S13 CDefault W300, Malgun Gothic
Gui, 1:Add, ListView, y+0 w610 h300 vlv3 glv3 Grid hwndHLV3 NoSortHdr Sort -Multi Backgroundffc3c3, 안보임|출하일|日|출고시각|업체명|출고지|컷|門|出|`%|원본날짜
Gui, 1:ListView, lv3
LV_ModifyCol(1, 0) ;
LV_ModifyCol(2, 65)  ;
LV_ModifyCol(3, 30)  ;
LV_ModifyCol(4, 85)  ;
LV_ModifyCol(5, 150)  ;
LV_ModifyCol(6, 130)  ;
LV_ModifyCol(7, 30)  ;
LV_ModifyCol(8, 30)  ;
LV_ModifyCol(9, 30)  ;
LV_ModifyCol(10, "40 Integer" "Integer Right")    ;
LV_ModifyCol(11, 0) ;

Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x650 y+5 w400 h25, Ⅳ. 출하 (상차/배송 완료)
Gui, 1:Font, S13 CDefault W300, Malgun Gothic
Gui, 1:Add, ListView, y+0 w610 h230 vlv11 glv11 Grid hwndHLV11 NoSortHdr Sort -Multi SortDesc Backgroundffa2a2, 안보임|출하일|日|출고시각|업체명|출고지|컷|門|出|`%|원본날짜
Gui, 1:ListView, lv11
LV_ModifyCol(1, 0) ;
LV_ModifyCol(2, 65)  ;
LV_ModifyCol(3, 30)  ;
LV_ModifyCol(4, 85)  ;
LV_ModifyCol(5, 150)  ;
LV_ModifyCol(6, 130)  ;
LV_ModifyCol(7, 30)  ;
LV_ModifyCol(8, 30)  ;
LV_ModifyCol(9, 30)  ;
LV_ModifyCol(10, "40 Integer" "Integer Right")    ;
LV_ModifyCol(11, 0) ;

Gui, 1:Add, edit, x+5 y+5 w1 v1st,
Gui, 1:Add, Picture, x250 y180 W804 H428 vpic0, %A_WorkingDir%/loading.png
GuiControl, hide, pic0


;;□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
;;□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
;;□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
;;□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□

Gui, 1:Tab, 입고지시서▽` ,,

Gui, 1:Add, GroupBox, x10 y30 w1260 h690, ; [  입고 입하  리스트 ]
Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x20 y55 w180 h25 , 시작일
Gui, 1:Add, Text, x+10 w150 h25 , 종료일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x20 y+0 w180 h30 vmonth1_9 Choose%todaynow% gmonth1_9,  ;;;;;;;;;;;;;;;;;;;;;;;;

Gui, 1:Add, DateTime, x+10 w180 h30 vmonth2_9 Choose%A_month1% gmonth2_9,

Gui, 1:Font, S11 CDefault W400, Malgun Gothic
Gui, 1:Add, button, x+10 y60 w50 h50 gbutton4, 이번달
Gui, 1:Add, button, x+10 w50 h50 gbutton3, 요번주
Gui, 1:Add, button, x+10 w50 h50 gbutton1, 오늘
Gui, 1:Add, button, x+10 w50 h50 gbutton2, 내일


Gui, 1:Font, S12 CDefault W700 Cblue, Malgun Gothic
gui, 1:Add, text, x+20 y60 w150 h20 ,[오늘날짜]

Gui, 1:Font, S15 CDefault W700 Cblue, Malgun Gothic
gui, 1:Add, text, y+2 w170 h27,%todaynow1%

Gui, 1:Font, S11 CDefault W400 Cblue, Malgun Gothic
Gui, 1:Add, Button, x+0 y60 w51 h50 greload, 재시작
Gui, 1:Add, Button, x+7 w45 h50 gchange, WMS
Gui, 1:Add, Picture, x+7 y60 w229 h50, %A_WorkingDir%\bum2.png


Gui, 1:Add, Button, x+6 w95 h50 grefresh9, 새로고침



Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x20 y+10 w400 h25 , Ⅰ. 입하 리스트 업
Gui, 1:Font, S13 CDefault W300, Malgun Gothic
Gui, 1:Add, ListView, x20 y+0 w610 h300 vlv91 glv91 Grid hwndHLV91 Sort NoSortHdr -Multi Backgroundecf2ff, 안보임|입하일|日|입하시각|업체명|입고지|픽업|상황|배송자|`%|원본날짜
Gui, 1:ListView, lv91
LV_ModifyCol(1, 0) ;  안보임 ID
LV_ModifyCol(2, 65)  ;  축약날짜
LV_ModifyCol(3, 30)  ;  요일
LV_ModifyCol(4, 85)  ;   시간
LV_ModifyCol(5, 120)  ;   업체
LV_ModifyCol(6, 130)  ;   입고지
LV_ModifyCol(7, 50)  ;     진행
LV_ModifyCol(8, 50)  ;     픽업
LV_ModifyCol(9, 30)  ;     배송자
LV_ModifyCol(10, "40 Integer" "Integer Right"0)  ;     진행률
LV_ModifyCol(11, 0)  ; 원본날짜


Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x20 y+5 w400 h25 , Ⅱ. 입하 준비 중 (리스트 확인함)
Gui, 1:Font, S13 CDefault W300, Malgun Gothic
Gui, 1:Add, ListView, y+0 w610 h230 vlv92 glv92 Grid hwndHLV92 NoSortHdr Sort -Multi Backgroundd5e2ff, 안보임|입하일|日|입하시각|업체명|입고지|픽업|상황|배송자|`%|원본날짜
Gui, 1:ListView, lv92
LV_ModifyCol(1, 0) ;  안보임 ID
LV_ModifyCol(2, 65)  ;  축약날짜
LV_ModifyCol(3, 30)  ;  요일
LV_ModifyCol(4, 85)  ;   시간
LV_ModifyCol(5, 120)  ;   업체
LV_ModifyCol(6, 130)  ;   입고지
LV_ModifyCol(7, 50)  ;     진행
LV_ModifyCol(8, 50)  ;     픽업
LV_ModifyCol(9, 30)  ;     배송자
LV_ModifyCol(10, "40 Integer" "Integer Right"0)  ;     진행률
LV_ModifyCol(11, 0)  ; 원본날짜

Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x650 y120 w400 h25 , Ⅲ. 입하 완료 (수량확인 / 하차까지만 완료)
Gui, 1:Font, S13 CDefault W300, Malgun Gothic
Gui, 1:Add, ListView, y+0 w610 h230 vlv93 glv93 Grid hwndHLV93 NoSortHdr Sort -Multi BackgroundC8DFFF, 안보임|입하일|日|입하시각|업체명|입고지|픽업|상황|배송자|`%|원본날짜
Gui, 1:ListView, lv93
LV_ModifyCol(1, 0) ;  안보임 ID
LV_ModifyCol(2, 65)  ;  축약날짜
LV_ModifyCol(3, 30)  ;  요일
LV_ModifyCol(4, 85)  ;   시간
LV_ModifyCol(5, 120)  ;   업체
LV_ModifyCol(6, 130)  ;   입고지
LV_ModifyCol(7, 50)  ;     진행
LV_ModifyCol(8, 50)  ;     픽업
LV_ModifyCol(9, 30)  ;     배송자
LV_ModifyCol(10, "40 Integer" "Integer Right"0)  ;     진행률
LV_ModifyCol(11, 0)  ; 원본날짜


Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x650 y+5 w400 h25, Ⅳ. 입고 완료 (로케이션 적재 완료)
Gui, 1:Font, S13 CDefault W300, Malgun Gothic
Gui, 1:Add, ListView, y+0 w610 h300 vlv94 glv94 Grid hwndHLV94 NoSortHdr Sort -Multi SortDesc Background9fbdff, 안보임|입하일|日|입하시각|업체명|입고지|픽업|상황|배송자|`%|원본날짜
Gui, 1:ListView, lv94
LV_ModifyCol(1, 0) ;  안보임 ID
LV_ModifyCol(2, 65)  ;  축약날짜
LV_ModifyCol(3, 30)  ;  요일
LV_ModifyCol(4, 85)  ;   시간
LV_ModifyCol(5, 120)  ;   업체
LV_ModifyCol(6, 130)  ;   입고지
LV_ModifyCol(7, 50)  ;     진행
LV_ModifyCol(8, 50)  ;     픽업
LV_ModifyCol(9, 30)  ;     배송자
LV_ModifyCol(10, "40 Integer" "Integer Right"0)  ;     진행률
LV_ModifyCol(11, 0)  ; 원본날짜


Gui, 1:Add, edit, x+5 y+5 w1 v1st_9,
Gui, 1:Add, Picture, x250 y180 W804 H428 vpic09, %A_WorkingDir%/loading.png
GuiControl, hide, pic09



;;□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□

Gui, 1:Tab, 타임라인~>`   ` ,,

Gui, 1:Add, GroupBox, x10 y30 w1260 h690, ; [ 타임 라인   ]
;~ Gui, 1:Font, S13 CDefault W700, Malgun Gothic
;~ Gui, 1:Add, Text, x20 y55 w180 h25 , 날짜
;~ Gui, 1:Add, Text, x+10 w150 h25 , 종료일
Gui, 1:Font, S12 CDefault W700 CRed, Malgun Gothic
gui, 1:Add, text, x20 y55 w150 h20 ,[오늘날짜]

Gui, 1:Font, S15 CDefault W700 CRed, Malgun Gothic
gui, 1:Add, text, y+2 w170 h27,%todaynow1%

Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+10 y75 w180 h30 vmonth1_8 Choose%todaynow% gmonth1_8,  ;;;;;;;;;;;;;;;;;;;;;;;;

;~ Gui, 1:Add, DateTime, x+10 w180 h30 vmonth2_8 Choose%A_month1% gmonth2_8,

Gui, 1:Font, S11 CDefault W400, Malgun Gothic
;~ Gui, 1:Add, button, x+10 y60 w50 h50 gbutton4, 이번달
;~ Gui, 1:Add, button, x+10 w50 h50 gbutton3, 요번주
Gui, 1:Add, button, x+10 y60 w50 h50 gbutton1, 오늘
Gui, 1:Add, button, x+10 w50 h50 gbutton2, 내일
Gui, 1:Add, button, x+10 w50 h50 gbutton81, 모레
Gui, 1:Add, button, x+10 w50 h50 gbutton82, 글피




Gui, 1:Font, S11 CDefault W400 CRed, Malgun Gothic
Gui, 1:Add, Button, x820 y60 w51 h50 greload, 재시작
Gui, 1:Add, Button, x+7 w45 h50 gchange, WMS
Gui, 1:Add, Picture, x+7 y60 w229 h50, %A_WorkingDir%\bum1.png


Gui, 1:Add, Button, x+6 w95 h50 grefresh8, 새로고침


Gui, 1:Add, ListView, x20 y+10 w1240 h280 vLV81 Grid r3 hwndHLV81 readonly gLV81 -Multi Backgroundffffff, 06:30|07:00|07:30|08:00|08:30|09:00|09:30|10:00|10:30|11:00|11:30||
LV_ModifyCol(0, 0) ; 상품명
LV_ModifyCol(1, 111) ; 상품명
LV_ModifyCol(2, 111)  ; 규격
LV_ModifyCol(3, 111)  ; 바코드
LV_ModifyCol(4, 111)  ; 관리코드
LV_ModifyCol(5, 111)  ; 현재재고
LV_ModifyCol(6, 111)  ;   적정재고
LV_ModifyCol(7, 111)  ; 단위
;~ LV_ModifyCol(8, "90 Integer" "Integer Right")  ; A
;~ LV_ModifyCol(9, "90 Integer" "Integer Right")  ; 매출
;~ LV_ModifyCol(10, "90 Integer" "Integer Right")  ; B
;~ LV_ModifyCol(11, "90 Integer" "Integer Right")  ; 소매
LV_ModifyCol(8, 111)  ; A
LV_ModifyCol(9, 111)  ; 매출
LV_ModifyCol(10, 111)  ; B
LV_ModifyCol(11, 111)  ; 소매
LV_ModifyCol(12, 0)  ; 소매

; ImageList 생성  리스트뷰 행 높이 조절
ImageListID := DllCall("ImageList_Create", Int, 16, Int, 120, Int, 0x18, Int, 1, Int, 1)

; ListView에 ImageList 적용
LV_SetImageList(ImageListID, 1)

Gui, 1:Add, ListView, x20 y+30 w1240 h280 vLV82 Grid hwndHLV82 r3 readonly gLV82 -Multi Backgroundffffff, 12:00|12:30|13:00|13:30|14:00|14:30|15:00|15:30|16:00|16:30|17:00||

LV_ModifyCol(0, 0) ; 상품명
LV_ModifyCol(1, 111) ; 상품명
LV_ModifyCol(2, 111)  ; 규격
LV_ModifyCol(3, 111)  ; 바코드
LV_ModifyCol(4, 111)  ; 관리코드
LV_ModifyCol(5, 111)  ; 현재재고
LV_ModifyCol(6, 111)  ;   적정재고
LV_ModifyCol(7, 111)  ; 단위
;~ LV_ModifyCol(8, "90 Integer" "Integer Right")  ; A
;~ LV_ModifyCol(9, "90 Integer" "Integer Right")  ; 매출
;~ LV_ModifyCol(10, "90 Integer" "Integer Right")  ; B
;~ LV_ModifyCol(11, "90 Integer" "Integer Right")  ; 소매
LV_ModifyCol(8, 111)  ; A
LV_ModifyCol(9, 111)  ; 매출
LV_ModifyCol(10, 111)  ; B
LV_ModifyCol(11, 111)  ; 소매
LV_ModifyCol(12, 0)  ; 소매



; ImageList 생성  리스트뷰 행 높이 조절
ImageListID := DllCall("ImageList_Create", Int, 16, Int, 120, Int, 0x18, Int, 1, Int, 1)

; ListView에 ImageList 적용
LV_SetImageList(ImageListID, 1)



;;□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□



Gui, 1:Tab, 상품정보`     ` ,,
Gui, 1:Add, GroupBox, x10 y30 w1260 h690, ; [ 상 품 정 보   ]
Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x20 y45 w180 h25 , Ⅰ. 중분류
Gui, 1:Font, S13 CDefault W700, Malgun Gothic

Gui, 1:Add, button, x+670 w80 h35 g상품선택, 상품선택
Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, button, x+10 w80 h35 g소분류3, 새로고침

Gui, 1:Add, dropdownlist, x+10 w200 h25 v단가군3 g단가군3 r5, C|소매|B|매출|A


Gui, 1:Add, dropdownlist, x20 y+0 w200 h30 v중분류3 g중분류3 r30 choose1, 선택|A.목재|B.합판|C.구조목|D.방부목|E.집성/목망|F.합성목재|G.천정재|H.바닥재|I.벽체/루바|J.석고보드|K.단열재|L.철물|M.비엘텍|N.기타,운송비,잡비|O.차음재|P.재현하늘창|R.우딘|S.은성프레임|T.크로스|50.화장실용|V.내장재|W.재단/절단|X.예림|Z.업무
Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x20 y+10 w180 h25 , Ⅱ. 소분류
Gui, 1:Font, S12 CDefault W400, Malgun Gothic
Gui, 1:Add, Listbox, y+0 w200 h570 v소분류3 g소분류3 hwndH소분류3 Backgroundf8eeff,
Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x230 y45 w180 h25 , Ⅲ. 제품정보

Gui, 1:Font, S11 CDefault W300, Malgun Gothic

Gui, 1:Add, ListView,  y+10 w1020 h630 vLV31 Grid hwndHLV31 gLV31 -Multi Backgrounde5c1ff, 상품명|규격|바코드|관리코드|적정재고|현재고|단위|A단가|매출단가|B단가|소매단가|C단가|중분류|소분류

LV_ModifyCol(1, 240) ; 상품명
LV_ModifyCol(2, 230)  ; 규격
LV_ModifyCol(3, 70)  ; 바코드
LV_ModifyCol(4, 95)  ; 관리코드
LV_ModifyCol(5, "90 Integer" "Integer Right")  ; 현재재고
LV_ModifyCol(6, "90 Integer" "Integer Right")  ;   적정재고
LV_ModifyCol(7, 40)  ; 단위
;~ LV_ModifyCol(8, "90 Integer" "Integer Right")  ; A
;~ LV_ModifyCol(9, "90 Integer" "Integer Right")  ; 매출
;~ LV_ModifyCol(10, "90 Integer" "Integer Right")  ; B
;~ LV_ModifyCol(11, "90 Integer" "Integer Right")  ; 소매
LV_ModifyCol(8, 0)  ; A
LV_ModifyCol(9, 0)  ; 매출
LV_ModifyCol(10, 0)  ; B
LV_ModifyCol(11, 0)  ; 소매

LV_ModifyCol(12, "90 Integer" "Integer Right")  ; C
LV_ModifyCol(13, 0)  ; 중분류
LV_ModifyCol(14, 0)  ; 소분류

Gui, 1:Add, Picture, x250 y180 W804 H428 vpic03, %A_WorkingDir%/loading.png

;;□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□



Gui, 1:Tab, 사무 루틴`    ,,
Gui, 1:Add, GroupBox, x10 y30 w1260 h690, ; [ 사무 루틴   ]





Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x20 y45 w180 h25 , Ⅰ. 월간 체크

Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, x20 y+5 w55 h22 , 시작일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w140 h30 vmonth1_4 Choose%todaynow% gmonth_41,
Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, x+10 w55 h22 , 종료일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w140 h30 vmonth2_4 Choose%A_month1% gmonth_42,



Gui, 1:Font, S10 CDefault W300, Malgun Gothic
Gui, 1:Add, ListView, x20 y+5 w400 h595 vLV41 Grid hwndHLV41 gLV41 Sort NoSortHdr -Multi Backgroundfffddb, 안보임|날짜|日|순|내용|비고|人|진행률
Gui, 1:ListView, LV41
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 50)  ;
LV_ModifyCol(3, 25)  ;
LV_ModifyCol(4, 0)  ;
LV_ModifyCol(5, 113)  ;
LV_ModifyCol(6, 130)  ;
LV_ModifyCol(7, 25)  ;
LV_ModifyCol(8, "50 Integer" "Integer Right")

Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x435 y45 w175 h25 , Ⅱ. 주간 체크

Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, y+5 w55 h22 , 시작일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w140 h30 vmonth3_4 Choose%todaynow% gmonth_43,
Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, x+10 w55 h22 , 종료일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w145 h30 vmonth4_4 Choose%A_month1% gmonth_44,

Gui, 1:Font, S10 CDefault w400, Malgun Gothic
Gui, 1:Add, ListView, x435 y+5 w405 h595 vLV42 gLV42 Grid hwndHLV42 Sort NoSortHdr -Multi Backgroundfffbc1, 안보임|날짜|日|순|내용|비고|人|진행률
Gui, 1:ListView, LV42
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 50)  ;
LV_ModifyCol(3, 25)  ;
LV_ModifyCol(4, 0)  ;
LV_ModifyCol(5, 113)  ;
LV_ModifyCol(6, 130)  ;
LV_ModifyCol(7, 25)  ;
LV_ModifyCol(8, "50 Integer" "Integer Right")


Gui, 1:Font, S13 CDefault W700 C666600, Malgun Gothic
gui, 1:Add, text, x855 y45 h25 ,[오늘]
Gui, 1:Font, S13 CDefault W700 C666600, Malgun Gothic
gui, 1:Add, text, x+5 w170 h25,%todaynow1%
;~ Gui, 1:Font, S11 CDefault W400, Malgun Gothic



Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, MonthCal, x855 y+5 v4monthcal g4monthcal, ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Gui, 1:Font, S10 CDefault W400, Malgun Gothic

Gui, 1:Add, Button, x1088 y74 w50 h50 grefresh4, 새로`n고침
Gui, 1:Add, Button, x+10 w51 h50 greload, 재시작
Gui, 1:Add, Button, x+10 w51 h50 gGuiClose, 닫기

Gui, 1:Add, Button, x1088 y+13 w50 h50 g추가4_1, 월간`n추가
Gui, 1:Add, Button, x+10 w51 h50 g추가4_2, 주간`n추가
Gui, 1:Add, Button, x+10 w51 h50 g추가4_3, 일일`n추가

Gui, 1:Add, button, x1088 y+13 w35 h35 gbutton1, 오늘
Gui, 1:Add, button, x+10 w35 h35 gbutton2, 내일
Gui, 1:Add, button, x+10 w35 h35 gbutton3, 요번주
Gui, 1:Add, button, x+10 w35 h35 gbutton4, 이번달




Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x855 y+5 w180 h25 , Ⅲ. 일일 체크

Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, y+5 w55 h22 , 시작일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w140 h30 vmonth5_4 Choose%todaynow% gmonth_45,  ;;;;;;;;;;;;;;;;;;;;;;;;
Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, x+10 w55 h22 , 종료일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w145 h30 vmonth6_4 Choose%A_month1% gmonth_46,

Gui, 1:Font, S10 CDefault w400, Malgun Gothic

Gui, 1:Add, ListView, x855 y+5 w405 h400 vLV43 gLV43 Grid hwndHLV43 Sort NoSortHdr -Multi Backgroundfffaa5, 안보임|날짜|日|순|내용|비고|人|진행률
Gui, 1:ListView, LV43
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 50)  ;
LV_ModifyCol(3, 25)  ;
LV_ModifyCol(4, 0)  ;
LV_ModifyCol(5, 90)  ;
LV_ModifyCol(6, 158)  ;
LV_ModifyCol(7, 25)  ;
LV_ModifyCol(8, "50 Integer" "Integer Right")

Gui, 1:Add, Picture, x250 y180 W804 H428 vpic04, %A_WorkingDir%/loading.png

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Gui, 1:Tab, 현장 루틴`    ,,
Gui, 1:Add, GroupBox, x10 y30 w1260 h690, ; [ 현장 루틴   ]





Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x20 y45 w180 h25 , Ⅰ. 월간 체크

Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, x20 y+5 w55 h22 , 시작일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w140 h30 vmonth1_5 Choose%todaynow% gmonth_51,
Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, x+10 w55 h22 , 종료일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w140 h30 vmonth2_5 Choose%A_month1% gmonth_52,



Gui, 1:Font, S10 CDefault W300, Malgun Gothic
Gui, 1:Add, ListView, x20 y+5 w400 h595 vLV51 Grid hwndHLV51 gLV51 Sort NoSortHdr -Multi Backgroundddffe6, 안보임|날짜|日|순|내용|비고|人|진행률
Gui, 1:ListView, LV51
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 50)  ;
LV_ModifyCol(3, 25)  ;
LV_ModifyCol(4, 0)  ;
LV_ModifyCol(5, 113)  ;
LV_ModifyCol(6, 130)  ;
LV_ModifyCol(7, 25)  ;
LV_ModifyCol(8, "50 Integer" "Integer Right")

Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x435 y45 w175 h25 , Ⅱ. 주간 체크

Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, y+5 w55 h22 , 시작일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w140 h30 vmonth3_5 Choose%todaynow% gmonth_53,
Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, x+10 w55 h22 , 종료일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w145 h30 vmonth4_5 Choose%A_month1% gmonth_54,

Gui, 1:Font, S10 CDefault w400, Malgun Gothic
Gui, 1:Add, ListView, x435 y+5 w405 h595 vLV52 gLV52 Grid hwndHLV52 Sort NoSortHdr -Multi Backgroundc6ffd5, 안보임|날짜|日|순|내용|비고|人|진행률
Gui, 1:ListView, LV52
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 50)  ;
LV_ModifyCol(3, 25)  ;
LV_ModifyCol(4, 0)  ;
LV_ModifyCol(5, 113)  ;
LV_ModifyCol(6, 130)  ;
LV_ModifyCol(7, 25)  ;
LV_ModifyCol(8, "50 Integer" "Integer Right")


Gui, 1:Font, S13 CDefault W700 C003300, Malgun Gothic
gui, 1:Add, text, x855 y45 h25 ,[오늘]
Gui, 1:Font, S13 CDefault W700 C003300, Malgun Gothic
gui, 1:Add, text, x+5 w170 h25,%todaynow1%
;~ Gui, 1:Font, S11 CDefault W400, Malgun Gothic



Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, MonthCal, x855 y+5 v5monthcal g5monthcal, ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Gui, 1:Font, S10 CDefault W400, Malgun Gothic

Gui, 1:Add, Button, x1088 y74 w50 h50 grefresh5, 새로`n고침
Gui, 1:Add, Button, x+10 w51 h50 greload, 재시작
Gui, 1:Add, Button, x+10 w51 h50 gGuiClose, 닫기

Gui, 1:Add, Button, x1088 y+13 w50 h50 g추가5_1, 월간`n추가
Gui, 1:Add, Button, x+10 w51 h50 g추가5_2, 주간`n추가
Gui, 1:Add, Button, x+10 w51 h50 g추가5_3, 일일`n추가

Gui, 1:Add, button, x1088 y+13 w35 h35 gbutton1, 오늘 ;
Gui, 1:Add, button, x+10 w35 h35 gbutton2, 내일
Gui, 1:Add, button, x+10 w35 h35 gbutton3, 요번주
Gui, 1:Add, button, x+10 w35 h35 gbutton4, 이번달




Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x855 y+5 w180 h25 , Ⅲ. 일일 체크

Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, y+5 w55 h22 , 시작일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w140 h30 vmonth5_5 Choose%todaynow% gmonth_55,  ;;;;;;;;;;;;;;;;;;;;;;;;
Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, x+10 w55 h22 , 종료일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w145 h30 vmonth6_5 Choose%A_month1% gmonth_56,

Gui, 1:Font, S10 CDefault w400, Malgun Gothic

Gui, 1:Add, ListView, x855 y+5 w405 h400 vLV53 gLV53 Grid hwndHLV53 Sort NoSortHdr -Multi Backgrounda9ffbf, 안보임|날짜|日|순|내용|비고|人|진행률
Gui, 1:ListView, LV53
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 50)  ;
LV_ModifyCol(3, 25)  ;
LV_ModifyCol(4, 0)  ;
LV_ModifyCol(5, 90)  ;
LV_ModifyCol(6, 158)  ;
LV_ModifyCol(7, 25)  ;
LV_ModifyCol(8, "50 Integer" "Integer Right")

Gui, 1:Add, Picture, x250 y180 W804 H428 vpic05, %A_WorkingDir%/loading.png

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Gui, 1:Tab, 수동 루틴`    ,,

Gui, 1:Add, GroupBox, x10 y30 w1260 h690, ; [ 출 하 장 ]
gui, 1:Add, button, x100 y100 w200 h200 ,



Gui, 1:Tab, 일일재고파악,,

Gui, 1:Font, S13 CDefault W700, Malgun Gothic

Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, x20 y45 w55 h22 , 시작일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w140 h30 ;vmonth1_4 Choose%todaynow% gmonth_41,
Gui, 1:Font, S13 CDefault W400, Malgun Gothic
Gui, 1:Add, Text, x+10 w55 h22 , 종료일
Gui, 1:Font, S15 CDefault W400, Malgun Gothic
Gui, 1:Add, DateTime, x+0 w140 h30 ;vmonth2_4 Choose%A_month1% gmonth_42,
Gui, 1:Font, S10 CDefault W400, Malgun Gothic

Gui, 1:Add, Button, x+690 w65 h50 grefreshedsm, 새로고침
Gui, 1:Add, Button, x+10 w65 h50 gGuiClose, 닫기
Gui, 1:Font, S13 CDefault W700, Malgun Gothic
Gui, 1:Add, Text, x20 y90 h25 w175, Ⅰ. 일일재고관리
Gui, 1:Add, Text, x+10 h25 w150, Ⅱ. 부족재고관리
Gui, 1:Add, Text, x+20 h25, ▼ 중분류 필터

Gui, 1:Add, combobox, x+10 h25 w200 r30 v부족중분류 g부족중분류1, 12.철물|15.차음재|21.우딘|40.은성프레임|A.목재|B.합판|C.구조목|D.방부목|E.집성/목망|F.합성목재|G.천정재|H.바닥재|I.벽체/루바|J.석고보드|K.단열재|L.철물|M.비엘텍|N.기타.운송비.잡비|O.차음재|P.재현하늘창|R.우딘|S.은성프레임|T.크로스|U.화장실용

Gui, 1:Add, Text, x+20 h25, ▼ 소분류 필터

Gui, 1:Add, combobox, x+10 h25 w200 r30 v부족소분류 g부족소분류1, |



;~ Gui, 1:Add, Button, x+10 w35 h30 gedsmedit_1, 수정
;~ Gui, 1:Add, Button, x+10 w35 h30 gedsmadd_1, 추가
;~ Gui, 1:Add, Button, x+10 w35 h30, 삭제

Gui, 1:Font, S12 CDefault W400, Malgun Gothic



Gui, 1:Add, ListView, x20 y+0 w175 h590 vlvedsm glvedsm Grid hwndHLVedsm NoSortHdr Sort -Multi SortDesc Backgroundfff7ee, 안보임|년도|발주일|日|진행률
Gui, 1:ListView, LVedsm
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 0)  ;
LV_ModifyCol(3, 65)  ;
LV_ModifyCol(4, 30)  ;
LV_ModifyCol(5, 70)  ;

Gui, 1:Add, ListView, x+10 w1060 h590 vlvco glvco Grid hwndHLVco Sort -Multi Backgroundffe3c2, 중분류>|소분류>|★상품명|규격|적정|현재|단위|기호|부족|밴딩
;~ Gui, 1:Add, ListView, x+10 y+0 w700 h570 vlvco glvco Grid hwndHLVco NoSortHdr -Multi BackgroundFFFCF3, 안보임|년도|발주일|日|진행률
LV_ModifyCol(1, 100)
LV_ModifyCol(2, 130)  ;
LV_ModifyCol(3, 250)  ;
LV_ModifyCol(4, 220)  ;
LV_ModifyCol(5, "55 Integer" "Integer Right")  ;
LV_ModifyCol(6, "55 Integer" "Integer Right")
LV_ModifyCol(7, "55 Integer" "Integer Right")
LV_ModifyCol(8, "55 Integer" "Integer Right")
LV_ModifyCol(9, "55 Integer" "Integer Right")
LV_ModifyCol(10, "55 Integer" "Integer Right")

containr = % A_WorkingDir "\부족재고관리\부족재고관리.CSV"
errorlevel =
FileRead, dataCO, %containr%
	;~ if not ErrorLevel  ; 성공적으로 적재됨.
	;~ {
	;~ }
	;~ elseW
	;~ {
		;~ MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
		;~ return

	;~ }

IfWinNotExist, %받는분%
{
Sleep,50
	WinWait, 카카오톡,
IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
WinWaitActive, 카카오톡,

Sleep,50
	GuiControl,, myprogress, +10

ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23

Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	Sleep,100
			GuiControl,, myprogress, +10
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100
	;~ myprogress, +10
	WinWait, 카카오톡,
IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
WinWaitActive, 카카오톡,
	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
;~ ControlSetText, Edit2, %받는분%, 카카오톡
ControlSetText, Edit2, %받는분%, 카카오톡
Sleep, 1000
	;~ GuiControl,, myprogress, +10
	;~ WinWait, 카카오톡,
;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
;~ WinWaitActive, 카카오톡,
controlsend, EVA_Window2, {Enter}, 카카오톡
}
else
{
}




CLV1 := New LV_Colors(HLV1)
CLV2 := New LV_Colors(HLV2)
CLV3 := New LV_Colors(HLV3)
CLV11 := New LV_Colors(HLV11)
CLV81 := New LV_Colors(HLV81)
CLV82 := New LV_Colors(HLV82)

CLV1.Critical := 100
CLV2.Critical := 100
CLV3.Critical := 100
CLV11.Critical := 100
CLV81.Critical := 100
CLV82.Critical := 100

WinSet, Redraw, , ahk_id %HLV1%
WinSet, Redraw, , ahk_id %HLV2%
WinSet, Redraw, , ahk_id %HLV3%
WinSet, Redraw, , ahk_id %HLV11%
WinSet, Redraw, , ahk_id %HLV81%
WinSet, Redraw, , ahk_id %HLV82%

 CLV1.OnMessage()
 CLV2.OnMessage()
 CLV3.OnMessage()
 CLV11.OnMessage()
 CLV81.OnMessage()
 CLV82.OnMessage()



CLV91 := New LV_Colors(HLV91)
CLV92 := New LV_Colors(HLV92)
CLV93 := New LV_Colors(HLV93)
CLV94 := New LV_Colors(HLV94)
WinSet, Redraw, , ahk_id %HLV91%
WinSet, Redraw, , ahk_id %HLV92%
WinSet, Redraw, , ahk_id %HLV93%
WinSet, Redraw, , ahk_id %HLV94%
   CLV91.OnMessage()
   CLV92.OnMessage()
   CLV93.OnMessage()
   CLV94.OnMessage()


SysGet, countm, MonitorCount
if (countm = 5)
{
	;~ Gui, 1:Show, w1280 h730 x-526 y-1138, 신흥목재 전산프로그램
	Gui, 1:Show, w1280 h730 x0 y0, 신흥목재 전산프로그램
}
else if (countm = 3)
{
	Gui, 1:Show, w1280 h730 x1920 y0, 신흥목재 전산프로그램
}
else
{
	Gui, 1:Show, w1280 h730 x0 y0, 신흥목재 전산프로그램
}








;~ CLV41 := New LV_Colors(HLV41)
;~ CLV42 := New LV_Colors(HLV42)
;~ CLV43 := New LV_Colors(HLV43)
;~ WinSet, Redraw, , ahk_id %HLV41%
;~ WinSet, Redraw, , ahk_id %HLV42%
;~ WinSet, Redraw, , ahk_id %HLV43%
   ;~ CLV41.OnMessage()
   ;~ CLV42.OnMessage()
   ;~ CLV43.OnMessage()



;~ CLV51 := New LV_Colors(HLV51)
;~ CLV52 := New LV_Colors(HLV52)
;~ CLV53 := New LV_Colors(HLV53)
;~ WinSet, Redraw, , ahk_id %HLV51%
;~ WinSet, Redraw, , ahk_id %HLV52%
;~ WinSet, Redraw, , ahk_id %HLV53%
   ;~ CLV51.OnMessage()
   ;~ CLV52.OnMessage()
   ;~ CLV53.OnMessage()


   ;~ CLV3.OnMessage()



refresh:

gosub, refresh1

return






부족중분류1:
Gui, 1:submit, nohide
;~ MsgBox, % 부족중분류



Gui, 1:ListView, lvCO

{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}


loop, parse, dataCO, `n
{
	x:=[]
	IF 부족중분류 contains %A_LoopField%
	{

			loop, parse, A_LoopField, CSV
			x.Insert(A_LoopField)
			LV_Add("", x*)

	}
	else
	{
	}
}


if (부족중분류= "선택")
	GuiControl,, 부족소분류, |선택
else if (부족중분류= "A.목재")
	GuiControl,, 부족소분류, |01.뉴송|02.소송|03.미송|04.특수목
else if (부족중분류= "B.합판")
	GuiControl,, 부족소분류, |01.국산합판|02.말리.인니|03.베트남/중국산MLH|04.MDF|05.미송옹이|06.엠보|07.태고|08.코아|09.인테리어합판|10.OSB.TNG|11.자작합판
else if (부족중분류= "C.구조목")
	GuiControl,, 부족소분류, |01.판재(골만)|02.각재|03.적삼목|04.기타구조목|05.히노끼
else if (부족중분류= "D.방부목")
	GuiControl,, 부족소분류, |01.방부데크|02.방부각재|03.방부기타|04.천연방부
else if (부족중분류= "E.집성/목망")
	GuiControl,, 부족소분류, |01.집성판|02.집성계단|03.집성각재|04.대소봉|05.목망|06.기타집성재
else if (부족중분류= "F.합성목재")
	GuiControl,, 부족소분류, |01.합성목 데크|02.합성목 사이딩|03.합성목 루버|04.합성목 난간|05.합성목 벽체|06.품절
else if (부족중분류= "G.천정재")
	GuiControl,, 부족소분류, |01.텍스
else if (부족중분류= "H.바닥재")
	GuiControl,, 부족소분류, |01.구정마루|02.KCC마루|03.후로링|04.다해F&C마루|05.스타강마루
else if (부족중분류= "I.벽체/루바")
	GuiControl,, 부족소분류, |01.루바|02.유니탑|03.디자인월|04.집성루바|05.하이틴보드
else if (부족중분류= "J.석고보드")
	GuiControl,, 부족소분류, |01.석고보드|02.시멘트보드
else if (부족중분류= "K.단열재")
	GuiControl,, 부족소분류, |01.열반사|02.인슐레이션 외|03.스치로폴|04.아이소핑크|05.내벽재
else if (부족중분류= "L.철물")
	GuiControl,, 부족소분류, |01.피스.못|02.타카|03.실리콘.접착|04.스프레이|05.실린더 경첩 뎀퍼|06.오일스테인/바니쉬|07.기타
else if (부족중분류= "M.비엘텍")
	GuiControl,, 부족소분류, |01.주춧돌.베이스|02.이음쇠|03.메가타이
else if (부족중분류= "N.기타.운송비.잡비")
	GuiControl,, 부족소분류, |01.운송비|02.파레트|03.잡다함
else if (부족중분류= "O.차음재")
	GuiControl,, 부족소분류, |01.패브릭보드|02.타공판|03.목모보드|04.아트보드|05.폴리계란판|06.슈퍼론
else if (부족중분류= "P.재현하늘창")|03.미송|
	GuiControl,, 부족소분류, |00.몰딩|01.리딩도어|02.리딩 현관도어|03.12바 리딩|04.20바 리딩|05.12바 하늘창|06.20바 하늘창|07.40바 리딩|08.40바 하늘창|09.원슬림|10.리딩목재3연동80바|11.인테리어필름(방염|12.엣지필름|13.ABS도어 시트 변경|14.발포문틀 시트 변|15.연동도어 시트 변|16.고급형 칼라 현관|17.ABS도어|18.맴브레인도어|19.블라인드도어|20.타공도어|21.히든도어|
else if (부족중분류= "R.우딘")
	GuiControl,, 부족소분류, |01.시그니처도어|02.도어|03.3연동도어|04.피노도어|05.글라스도어|06.기타도어|07.프레임 & 하드웨어|08.보드&마루&아트월
else if (부족중분류= "S.은성프레임")
	GuiControl,, 부족소분류, |01.은/C012-3(백색)|02.PVC몰딩|03.웨인스코팅||||||||||||||||||||
else if (부족중분류= "T.크로스")
	GuiControl,, 부족소분류, |||||||||||||||||||||||
else if (부족중분류= "U.화장실용")
	GuiControl,, 부족소분류, |01.리빙보드|02.PVC몰딩|||||||||||||||||||||
else if (부족중분류= "V.내장재")
	GuiControl,, 부족소분류, |||||||||||||||||||||||
else if (부족중분류= "W.재단/절단")
	GuiControl,, 부족소분류, |01.재단|02.타공|||||||||||||||||||||
else if (부족중분류= "X.예림")
	GuiControl,, 부족소분류, |||||||||||||||||||||||
else if (부족중분류= "Z.업무")
	GuiControl,, 부족소분류, |||||||||||||||||||||||

else
{
}

return

부족소분류1:
Gui, 1:submit, nohide



Gui, 1:ListView, lvCO

{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}


loop, parse, dataCO, `n
{
	x:=[]
	IF 부족중분류 contains %A_LoopField%
	{
		IF 부족소분류 in %A_LoopField%
		{
			loop, parse, A_LoopField, CSV
			x.Insert(A_LoopField)
			LV_Add("", x*)
		}
		else
		{
		}
	}
	else
	{
	}
}



GuiControl, +Redraw, %HLVedsm%



GuiControl, show, lvedsm

GuiControl, hide, pic06



return




btt3:

Gui, 1:submit, nohide
Sleep, 100
	WinWait, 신흥목재 전산프로그램,
	IfWinNotActive, 신흥목재 전산프로그램, , WinActivate, 신흥목재 전산프로그램,
	WinWaitActive, 신흥목재 전산프로그램,
Sleep,100

GuiControl, 1:Choose, refreshtab, 3
Sleep,1000
GuiControl, 1:Choose, 중분류3, 1
Sleep,100
GuiControl, 1:Choose, 소분류3, 1
;~ gosub, 중분류3

return

LV31:

;~ gosub, refresh3
	Gui, 1:ListView, lv31 ;
	Gui, 1:submit, nohide

;~ if (A_GuiEvent = "DoubleClick")
상품선택:

	WinWait, 신흥목재 전산프로그램,
	IfWinNotActive, 신흥목재 전산프로그램, , WinActivate, 신흥목재 전산프로그램,
	WinWaitActive, 신흥목재 전산프로그램,
	Sleep, 10
{
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(31상품명, selectRowNum, 1)
	LV_GetText(31규격, selectRowNum, 2)
	LV_GetText(31바코드, selectRowNum, 3)
	LV_GetText(31관리코드, selectRowNum, 4)
	LV_GetText(31적정재고, selectRowNum, 5)
	LV_GetText(31현재고, selectRowNum, 6)
	LV_GetText(31단위, selectRowNum, 7)
;~ MsgBox, % 31단위

Sleep, 10
	IfWinExist, 출고장
	{
		WinWait, 출고장,
		IfWinNotActive, 출고장, , WinActivate, 출고장,
		WinWaitActive, 출고장,
		Sleep, 10

		ControlSetText, edit2, %31바코드%, 출고장
		ControlSetText, edit3, %31상품명%/%31규격%, 출고장
		ControlSetText, edit5, %31단위%, 출고장
		ControlSetText, edit4, , 출고장
		Sleep, 500
		ControlFocus, edit4, 출고장
		;~ gosub, keyboard

	}
	else
	{
	}
}
return





삭제1:
SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
MsgBox, 262196, 일정 삭제, 일정을 삭제 하시겠습니까?,

{
	IfMsgBox Yes
	{
		SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
		MsgBox, 262196, 일정 삭제, 정말 입니까?
		{
			IfMsgBox Yes
			{
				GuiControl,, myprogress, 20
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
				Sleep, 100
				GuiControl,, myprogress, 30


Gui, submit, nohide



				TempFile := "A" t1 "_B" t2 "_C" t3 "_D" t4 "_E" t5 "_V" t6 "_G" t7 "_T" t8 "_" 상태 ".CSV"
				TempFile1 := "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_V" e6 "_G" e7 "_T" e8 "_" 상태 ".CSV"

;~ MsgBox, % TempFile "`n" TempFile1
				root1 := % A_WorkingDir "\매출\" TempFile
				root2 := % A_WorkingDir "\매출\삭제일정\" TempFile1
				GuiControl,, myprogress, 40
				FileDelete, %root1%
				GuiControl,, myprogress, 60
				Sleep, 300
				GuiControl,, myprogress, 80
				Sleep, 300
				GuiControl,, myprogress, 100
				Sleep, 300
				gosub, 상태close
				return
			}
			IfMsgBox NO
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
				Sleep, 1000
			}
		}
	}
	IfMsgBox NO
	{
		SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
		Sleep, 1000
	}

}
return


refreshtab1:
Gui, 1:submit, nohide
Sleep, 10
if (refreshtab = "출고지시서▲` "){
	Sleep, 300
gosub, refresh1
}

else if (refreshtab = "입고지시서▽` "){
	Sleep, 300
gosub, refresh9
}

else if (refreshtab = "상품정보`     ` "){
	Sleep, 300
gosub, refresh3
}

else if (refreshtab = "사무 루틴`    "){
	Sleep, 300
gosub, refresh4
}

else if (refreshtab = "현장 루틴`    "){
	Sleep, 300
gosub, refresh5
}

else if (refreshtab = "타임라인~>`   ` "){
	Sleep, 300
gosub, refresh8
}

else if (refreshtab = "일일재고파악"){
	Sleep, 300
gosub, refreshedsm
}

else
{
	;~ Gui, submit, nohide
}
Sleep, 300
return



button1: ; 오늘
if (refreshtab = "출고지시서▲` "){
GuiControl, 1:, month1 , %todaynow%
GuiControl, 1:, month2 , %todaynow%
gosub, refresh1
}
else if (refreshtab = "입고지시서▽` "){
GuiControl, 1:, month1_9 , %todaynow%
GuiControl, 1:, month2_9 , %todaynow%
gosub, refresh9
}
else if (refreshtab = "사무 루틴`    "){
GuiControl, 1:, month1_4 , %todaynow%
GuiControl, 1:, month2_4 , %todaynow%
gosub, refresh4
}
else if (refreshtab = "현장 루틴`    "){
GuiControl, 1:, month1_5 , %todaynow%
GuiControl, 1:, month2_5 , %todaynow%
gosub, refresh5
}
else if (refreshtab = "타임라인~>`   ` "){
GuiControl, 1:, month1_8 , %todaynow%
;~ GuiControl, 1:, month2_8 , %todaynow%
gosub, refresh8
}
return

button2: ; 내일
if (refreshtab = "출고지시서▲` "){
GuiControl, 1:, month1 , %A_tmrw%
GuiControl, 1:, month2 , %A_tmrw%
gosub, refresh1
}
else if (refreshtab = "입고지시서▽` "){
GuiControl, 1:, month1_9 , %A_tmrw%
GuiControl, 1:, month2_9 , %A_tmrw%
gosub, refresh9
}
else if (refreshtab = "사무 루틴`    "){
GuiControl, 1:, month1_4 , %A_tmrw%
GuiControl, 1:, month2_4 , %A_tmrw%
gosub, refresh4
}
else if (refreshtab = "현장 루틴`    "){
GuiControl, 1:, month1_5 , %A_tmrw%
GuiControl, 1:, month2_5 , %A_tmrw%
gosub, refresh5
}
else if (refreshtab = "타임라인~>`   ` "){
GuiControl, 1:, month1_8 , %A_tmrw%
;~ GuiControl, 1:, month2_8 , %A_tmrw%
gosub, refresh8
}
return

button3: ; 이번주
if (refreshtab = "출고지시서▲` "){
GuiControl, 1:, month1 , %vDate1%
GuiControl, 1:, month2 , %vDate2%
gosub, refresh1
}
else if (refreshtab = "입고지시서▽` "){
GuiControl, 1:, month1_9 , %vDate1%
GuiControl, 1:, month2_9 , %vDate2%
gosub, refresh9
}
else if (refreshtab = "사무 루틴`    "){
GuiControl, 1:, month1_4 , %vDate1%
GuiControl, 1:, month2_4 , %vDate2%
gosub, refresh4
}
else if (refreshtab = "현장 루틴`    "){
GuiControl, 1:, month1_5 , %vDate1%
GuiControl, 1:, month2_5 , %vDate2%
gosub, refresh5
}
;~ else if (refreshtab = "타임라인~>`   ` "){
;~ GuiControl, 1:, month1_8 , %vDate1%
;~ GuiControl, 1:, month2_8 , %vDate2%
;~ gosub, refresh8
;~ }
return

button4: ; 이번달
if (refreshtab = "출고지시서▲` "){
GuiControl, 1:, month1 , %vMonthStart%
GuiControl, 1:, month2 , %vMonthEnd%
gosub, refresh1
}
else if (refreshtab = "입고지시서▽` "){
GuiControl, 1:, month1_9 , %vMonthStart%
GuiControl, 1:, month2_9 , %vMonthEnd%
gosub, refresh9
}
else if (refreshtab = "사무 루틴`    "){
GuiControl, 1:, month1_4 , %vMonthStart%
GuiControl, 1:, month2_4 , %vMonthEnd%
gosub, refresh4
}
else if (refreshtab = "현장 루틴`    "){
GuiControl, 1:, month1_5 , %vMonthStart%
GuiControl, 1:, month2_5 , %vMonthEnd%
gosub, refresh5
}
return


button81: ; 모레
if (refreshtab = "타임라인~>`   ` "){
GuiControl, 1:, month1_8 , %A_tmrw1%
;~ GuiControl, 1:, month2_8 , %A_tmrw%
gosub, refresh8
}
else
{
}
return


button82: ; 글피
if (refreshtab = "타임라인~>`   ` "){
GuiControl, 1:, month1_8 , %A_tmrw2%
;~ GuiControl, 1:, month2_8 , %A_tmrw%
gosub, refresh8
}
else
{
}
return



시간가르기1:
{
	GuiControl,1:, PG1, +5 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Gui, 1:ListView, lv81 ; 추가된 출고 리스트
	if (time81 < 0700){
				LV_GetText(기존1, 81f, 1 )
				gosub, 문자열정리1
	LV_Modify(81f, ,81output3,,,,,,,,,,,"")
	}
	else if (time81 >= 0700 && time81 < 0730){
				LV_GetText(기존1, 81f, 2 )
				gosub, 문자열정리1
	LV_Modify(81f, ,,81output3,,,,,,,,,,"")
	}
	else if (time81 >= 0730 && time81 < 0800){
				LV_GetText(기존1, 81f, 3 )
				gosub, 문자열정리1
	LV_Modify(81f, ,,,81output3,,,,,,,,,"")
	}
	else if (time81 >= 0800 && time81 < 0830){
				LV_GetText(기존1, 81f, 4 )
				gosub, 문자열정리1
	LV_Modify(81f, ,,,,81output3,,,,,,,,"")
	}
	else if (time81 >= 0830 && time81 < 0900){
				LV_GetText(기존1, 81f, 5 )
				gosub, 문자열정리1
	LV_Modify(81f, ,,,,,81output3,,,,,,,"")
	}
	else if (time81 >= 0900 && time81 < 0930){
				LV_GetText(기존1, 81f, 6 )
				gosub, 문자열정리1
	LV_Modify(81f, ,,,,,,81output3,,,,,,"")
	}
	else if (time81 >= 0930 && time81 < 1000){
				LV_GetText(기존1, 81f, 7 )
				gosub, 문자열정리1
	LV_Modify(81f, ,,,,,,,81output3,,,,,"")
	}
	else if (time81 >= 1000 && time81 < 1030){
				LV_GetText(기존1, 81f, 8 )
				gosub, 문자열정리1
	LV_Modify(81f, ,,,,,,,,81output3,,,,"")
	}
	else if (time81 >= 1030 && time81 < 1100){
				LV_GetText(기존1, 81f, 9 )
				gosub, 문자열정리1
	LV_Modify(81f, ,,,,,,,,,81output3,,,"")
	}
	else if (time81 >= 1100 && time81 < 1130){
				LV_GetText(기존1, 81f, 10 )
				gosub, 문자열정리1
	LV_Modify(81f, ,,,,,,,,,,81output3,,"")
	}
	else if (time81 >= 1130 && time81 < 1200){
				LV_GetText(기존1, 81f, 11 )
				gosub, 문자열정리1
	LV_Modify(81f, ,,,,,,,,,,,81output3,"")
	}
	else
	{
	}
return
}

문자열정리1:
{
	81output3 := SubStr(81output3, 1, 6)
	if(기존1 != ""){
		81output3 := 기존1 "`n+" 81output3
	}else{
	}
return
}
문자열정리2:
{
	82output3 := SubStr(82output3, 1, 6)
	if(기존2 != ""){
		82output3 := 기존2 "`n+" 82output3
	}else{
	}
return
}

시간가르기2:
{

	;~ if (time82 >= 1200 && time82 < 1700){

	GuiControl,1:, PG1, +5 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Gui, 1:ListView, lv82 ; 추가된 출고 리스트
		     if (time82 >= 1200 && time82 < 1230){
				LV_GetText(기존2, 82f, 1 )
				gosub, 문자열정리2
		LV_Modify(82f, , 82output3,,,,,,,,,,,"")
		}
		else if (time82 >= 1230 && time82 < 1300){
				LV_GetText(기존2, 82f, 2 )
				gosub, 문자열정리2
		LV_Modify(82f, ,,82output3,,,,,,,,,,"")
		}
		else if (time82 >= 1300 && time82 < 1330){
				LV_GetText(기존2, 82f, 3 )
				gosub, 문자열정리2
		LV_Modify(82f, ,,,82output3,,,,,,,,,"")
		}
		else if (time82 >= 1330 && time82 < 1400){
				LV_GetText(기존2, 82f, 4 )
				gosub, 문자열정리2
		LV_Modify(82f, ,,,,82output3,,,,,,,,"")
		}
		else if (time82 >= 1400 && time82 < 1430){
				LV_GetText(기존2, 82f, 5 )
				gosub, 문자열정리2
		LV_Modify(82f, ,,,,,82output3,,,,,,,"")
		}
		else if (time82 >= 1430 && time82 < 1500){
				LV_GetText(기존2, 2, 6 )
				gosub, 문자열정리2
		LV_Modify(82f, ,,,,,,82output3,,,,,,"")
		}
		else if (time82 >= 1500 && time82 < 1530){
				LV_GetText(기존2, 82f, 7 )
				gosub, 문자열정리2
		LV_Modify(82f, ,,,,,,,82output3,,,,,"")
		}
		else if (time82 >= 1530 && time82 < 1600){
				LV_GetText(기존2, 82f, 8 )
				gosub, 문자열정리2
		LV_Modify(82f, ,,,,,,,,82output3,,,,"")
		}
		else if (time82 >= 1600 && time82 < 1630){
				LV_GetText(기존2, 82f, 9 )
				gosub, 문자열정리2
		LV_Modify(82f, ,,,,,,,,,82output3,,,"")
		}
		else if (time82 >= 1630 && time82 < 1700){
				LV_GetText(기존2, 82f, 10 )
				gosub, 문자열정리2
		LV_Modify(82f, ,,,,,,,,,,82output3,,"")
		}
		else
		{
		}

return
}


LV81:
if (A_GuiEvent = "Normal")
{
    SelectedRow := LV_GetNext()
    GuiControl, -Choose, LV81
}
return

LV82:
if (A_GuiEvent = "Normal")
{
    SelectedRow := LV_GetNext()
    GuiControl, -Choose, LV82
}
return






refresh8:
month1_8:
month2_8:
Gui, 1:Submit, NoHide


RegExMatch(month1_8, "(.*)000000", month8)
;~ RegExMatch(month2, "(.*)000000", month2)

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;~ Gui, 1:ListView, lv8 ; 추가된 출고 리스트

Gui, 1:ListView, lv81 ; 추가된 출고 리스트
{
   ;~ CLV1.OnMessage(False)
	CLV81.Clear(1, 1)
	{
		LV_Delete()
	;~ Loop,A_LoopField
	  ;~ LV_Add("", x*)
	}

	Loop,  3
	{
			LV_Add("")
	}


	Loop, %A_WorkingDir%\매출\*.CSV
	{
		RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_V(.*)_G(.*)_T(.*)_", 81output)
		RegExMatch(81output1, "2024-(.*)-(.*)", 81date)
		;~ 81dater := 81date1 81date2 81date3


		NewStr := RegExReplace(81output1, "-" , Replacement := "")

;~ month1_8

		If (month81 = NewStr)
		{
			time81 := 81output2
			time81 := RegExReplace(time81, "시" , Replacement := "")
			time81 := RegExReplace(time81, A_Space , Replacement := "")
			time81 := RegExReplace(time81, ":" , Replacement := "")
			time81 := RegExReplace(time81, "착" , Replacement := "")
			time81 := RegExReplace(time81, "출" , Replacement := "")
			time81 := RegExReplace(time81, "," , Replacement := "")
			Length := StrLen(time81)
			if (Length = "2"){
				time81 := time81 "00"
			}else{
			}

			if(81output8="여"){
				81f = 1

				if (time81 >= 0630 && time81 < 1200){
				GuiControl,1:, PG1, +5 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
				Gui, 1:ListView, lv81 ; 추가된 출고 리스트
				gosub, 시간가르기1
				}
				else
				{
				}

			}else if(81output8="최"){
				81f = 2

				if (time81 >= 0630 && time81 < 1200){
				GuiControl,1:, PG1, +5 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
				Gui, 1:ListView, lv81 ; 추가된 출고 리스트
				gosub, 시간가르기1
				}
				else
				{
				}

			}else{
				81f = 0
			}

			;~ MsgBox, % 81f "`n" A_LoopFileName "`n" time81 "`n" A_Index



		}
		else
		{
		}
	}
		;~ MsgBox, % A_LoopFileName
}



Gui, 1:ListView, lv82 ; 추가된 출고 리스트
{   ;
;~ ~ CLV1.OnMessage(False)
	CLV82.Clear(1, 1)
	{
	LV_Delete()
	;~ Loop,A_LoopField
	  ;~ LV_Add("", x*)
	}

	Loop,  3
	{
			LV_Add("")
	}


	Loop, %A_WorkingDir%\매출\*.CSV
	{
	RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_V(.*)_G(.*)_T(.*)_", 82output)
	RegExMatch(82output1, "2024-(.*)-(.*)", 82date)
	NewStr := RegExReplace(82output1, "-" , Replacement := "")
		If (month81 = NewStr)
		{
			;~ MsgBox, % A_LoopFileName
			time82 := 82output2
			time82 := RegExReplace(time82, "시" , Replacement := "")
			time82 := RegExReplace(time82, A_Space , Replacement := "")
			time82 := RegExReplace(time82, ":" , Replacement := "")
			time82 := RegExReplace(time82, "착" , Replacement := "")
			time82 := RegExReplace(time82, "출" , Replacement := "")
			time82 := RegExReplace(time82, "," , Replacement := "")
			Length := StrLen(time82)
			if (Length = "2"){
				time82 := time82 "00"
			}else{
			}

				if(82output8="여"){
					82f = 1

					if (time82 >= 1200 && time82 < 1700){
					GuiControl,1:, PG1, +5 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
					Gui, 1:ListView, lv82 ; 추가된 출고 리스트
					gosub, 시간가르기2
					}
					else
					{
					}

				}else if(82output8="최"){
					82f = 2

					if (time82 >= 1200 && time82 < 1700){
					GuiControl,1:, PG1, +5 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
					Gui, 1:ListView, lv82 ; 추가된 출고 리스트
					gosub, 시간가르기2
					}
					else
					{
					}

				}else{
					82f = 0
				}
			;~ MsgBox, % 82f "`n" A_LoopFileName "`n" time82 "`n" A_Index



		}
		else
		{
		}
	}
}
;~ MsgBox, % A_time

Gui, 1:ListView, lv81 ; 추가된 출고 리스트
{

	Loop % LV_GetCount("Column")
	{
		LV_GetText(여배송1, 1, A_Index )

		여배송1 := RegExReplace(여배송1, A_Space , Replacement := "")
		if (여배송1 != ""){
		CLV81.Cell(1, A_Index, 0xFF9843, 0x000000)
		}
		else
		{
		CLV81.Cell(1, A_Index, 0xFFFFFF, 0x000000)
		}
		;~ MsgBox, % LV_GetCount("Column") "`n" LV_GetText(여배송1, 1, A_Index ) "`n" A_Index "`n" 여배송1
	}

	Loop % LV_GetCount("Column")
	{
		LV_GetText(최배송1, 2, A_Index )
		if (최배송1 != ""){
		CLV81.Cell(2, A_Index, 0x00FFE0, 0x000000)
		}
		else
		{
		CLV81.Cell(2, A_Index, 0xFFFFFF, 0x000000)
		}
	}
	;~ A_time   >   시간
	;~ realtime81   >    날짜
	realtime81 := RTrim(todaynow, "0") ; 날짜 일
	;~ MsgBox, % month81 "`n" 81dater "`n" A_tmrw "`n" realtime81
	if( month81 = realtime81 )
	{
		if (A_time < 0700){
			colcolor1=1
		}
		else if (A_time >= 0700 && A_time < 0730){
			colcolor1=2
		}
		else if (A_time >= 0730 && A_time < 0800){
			colcolor1=3
		}
		else if (A_time >= 0800 && A_time < 0830){
			colcolor1=4
		}
		else if (A_time >= 0830 && A_time < 0900){
			colcolor1=5
		}
		else if (A_time >= 0900 && A_time < 0930){
			colcolor1=6
		}
		else if (A_time >= 0930 && A_time < 1000){
			colcolor1=7
		}
		else if (A_time >= 1000 && A_time < 1030){
			colcolor1=8
		}
		else if (A_time >= 1030 && A_time < 1100){
			colcolor1=9
		}
		else if (A_time >= 1100 && A_time < 1130){
			colcolor1=10
		}
		else if (A_time >= 1130 && A_time < 1200){
			colcolor1=11
		}
		else
		{
			Loop, 11
			{
				CLV81.Cell(1, A_Index, 0xCCCCCC, 0x000000)
				CLV81.Cell(2, A_Index, 0xCCCCCC, 0x000000)
				CLV81.Cell(3, A_Index, 0xCCCCCC, 0x000000)
			}
		}


		81colcolor1 := colcolor1 - 1
		;~ MsgBox, % 81colcolor1 "`n" colcolor1
		if (81colcolor1 = ""){
		}else{
			CLV81.Cell(1, colcolor1, 0xFFF000, 0x000000)
			CLV81.Cell(2, colcolor1, 0xFFF000, 0x000000)
			CLV81.Cell(3, colcolor1, 0xFFF000, 0x000000)
		}

;~ MsgBox, % 81colcolor1
			81n = 0
		Loop, % 81colcolor1
		{

			;~ MsgBox, % 81n "`n" 81colcolor1
			IF(81colcolor1 = 81n)
			{
				break
			}
			else
			{
				81n++
				CLV81.Cell(1, 81n, 0xCCCCCC, 0x000000)
				CLV81.Cell(2, 81n, 0xCCCCCC, 0x000000)
				CLV81.Cell(3, 81n, 0xCCCCCC, 0x000000)
			}
		}
	}
	else if( month81 < realtime81 ){
			Loop, 11
			{
				CLV81.Cell(1, A_Index, 0xCCCCCC, 0x000000)
				CLV81.Cell(2, A_Index, 0xCCCCCC, 0x000000)
				CLV81.Cell(3, A_Index, 0xCCCCCC, 0x000000)
			}
	}
	else
	{

	}
}




Gui, 1:ListView, lv82 ; 추가된 출고 리스트
{

	Loop % LV_GetCount("Column")
	{
		LV_GetText(여배송2, 1, A_Index )

		여배송1 := RegExReplace(여배송2, A_Space , Replacement := "")
		if (여배송1 != ""){
		CLV82.Cell(1, A_Index, 0xFF9843, 0x000000)
		}
		else
		{
		CLV82.Cell(1, A_Index, 0xFFFFFF, 0x000000)
		}
		;~ MsgBox, % LV_GetCount("Column") "`n" LV_GetText(여배송1, 1, A_Index ) "`n" A_Index "`n" 여배송1
	}

	Loop % LV_GetCount("Column")
	{
		LV_GetText(최배송2, 2, A_Index )
		if (최배송2 != ""){
		CLV82.Cell(2, A_Index, 0x00FFE0, 0x000000)
		}
		else
		{
		CLV82.Cell(2, A_Index, 0xFFFFFF, 0x000000)
		}
	}
	realtime82 := RTrim(todaynow, "0")
	if( month81 = realtime82 )
	{

		if (A_time >= 1200 && A_time < 1230){
			colcolor2=1
		}
		else if (A_time >= 1230 && A_time < 1300){
			colcolor2=2
		}
		else if (A_time >= 1300 && A_time < 1330){
			colcolor2=3
		}
		else if (A_time >= 1330 && A_time < 1400){
			colcolor2=4
		}
		else if (A_time >= 1400 && A_time < 1430){
			colcolor2=5
		}
		else if (A_time >= 1430 && A_time < 1500){
			colcolor2=6
		}
		else if (A_time >= 1500 && A_time < 1530){
			colcolor2=7
		}
		else if (A_time >= 1530 && A_time < 1600){
			colcolor2=8
		}
		else if (A_time >= 1600 && A_time < 1630){
			colcolor2=9
		}
		else if (A_time >= 1630 ){
			colcolor2=10
		}
		else if (A_time < 1200 ){
		}
		else
		{
			Loop, 11
			{
				CLV82.Cell(1, A_Index, 0xCCCCCC, 0x000000)
				CLV82.Cell(2, A_Index, 0xCCCCCC, 0x000000)
				CLV82.Cell(3, A_Index, 0xCCCCCC, 0x000000)
			}
		}
		82colcolor2 := colcolor2 - 1

		if (82colcolor2 = ""){
		}else{
			CLV82.Cell(1, colcolor2, 0xFFF000, 0x000000)
			CLV82.Cell(2, colcolor2, 0xFFF000, 0x000000)
			CLV82.Cell(3, colcolor2, 0xFFF000, 0x000000)
		}


			82n = 0

		Loop, % 82colcolor1
		{
			IF(82colcolor1 = 82n)
			{
				break
			}
			else
			{
				82n++
				CLV82.Cell(1, 82n, 0xCCCCCC, 0x000000)
				CLV82.Cell(2, 82n, 0xCCCCCC, 0x000000)
				CLV82.Cell(3, 82n, 0xCCCCCC, 0x000000)
			}
		}
	}
	else if( month81 < realtime82 ){
			Loop, 11
			{
				CLV82.Cell(1, A_Index, 0xCCCCCC, 0x000000)
				CLV82.Cell(2, A_Index, 0xCCCCCC, 0x000000)
				CLV82.Cell(3, A_Index, 0xCCCCCC, 0x000000)
			}
	}
	else
	{

	}

}



GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
GuiControl,1:, PG1, 100 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
WinSet, Redraw, , ahk_id %HLV81%
WinSet, Redraw, , ahk_id %HLV82%
GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

Sleep, 10
return



refresh1:
;~ Run explore \\192.168.0.1\hdd1\일정표 최근\일정표220730, , hide, PID
	;~ Gui, 1:Restore
month1:
month2:

        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	;~ WinWait, 신흥목재 전산프로그램,
	;~ IfWinNotActive, 신흥목재 전산프로그램, , WinActivate, 신흥목재 전산프로그램,
	;~ WinWaitActive, 신흥목재 전산프로그램,
Sleep, 10
Gui, 1:submit, nohide

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		SoundPlay, %A_WorkingDir%\sound\효과음12.mp3

;~ GuiControl, hide, LV1
;~ GuiControl, hide, LV2
;~ GuiControl, hide, LV3
;~ GuiControl, hide, LV11

;~ GuiControl, disable, LV1
;~ GuiControl, disable, LV2
;~ GuiControl, disable, LV3
;~ GuiControl, disable, LV11
;~ GuiControl, disable, LV22
;~ GuiControl, disable, LV33




																												GuiControl, 1:-Redraw, %HLV1%
																												GuiControl, 1:-Redraw, %HLV2%
																												GuiControl, 1:-Redraw, %HLV3%
																												GuiControl, 1:-Redraw, %HLV11%
;~ Run explore \\192.168.0.1\hdd1\일정표 최근\일정표220730, , hide, PID


Sleep, 10
;~ GuiControl, 1:show, pic0
;~ GuiControl, hide, lv1
;~ GuiControl, hide, lv2
;~ GuiControl, hide, lv3
;~ GuiControl, hide, lv11


RegExMatch(month1, "(.*)000000", month1)
RegExMatch(month2, "(.*)000000", month2)


        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
Gui, 1:ListView, lv1 ; 추가된 출고 리스트

   ;~ CLV1.OnMessage(False)
CLV1.Clear(1, 1)
{
LV_Delete()
}

		값1_1 := "%" . "m-" . "%d"
		값1_2 := "%Y" . "%m" . "%d"

		myQuery =
		(

		SELECT
		  tms.ID,
		  DATE_FORMAT(tms.날짜, '%값1_1%') AS 날짜,
		  CASE DAYOFWEEK(tms.날짜)
			WHEN 1 THEN '일'
			WHEN 2 THEN '월'
			WHEN 3 THEN '화'
			WHEN 4 THEN '수'
			WHEN 5 THEN '목'
			WHEN 6 THEN '금'
			WHEN 7 THEN '토'
		  END AS 요일,
		  tms.시간,
		  tms.업체,
		  tms.출고지,
		  tms.절단,
		  tms.도어,
		  tms.배송자,
		  FLOOR(
			(SELECT COUNT(*)
			 FROM tms_list
			 WHERE tms_list.ID = tms.ID AND tms_list.출 = '●') * 100.0 /
			(SELECT COUNT(*)
			 FROM tms_list
			 WHERE tms_list.ID = tms.ID) / 10.0 ) * 10 AS 진행률,
		  tms.날짜 AS 원본_날짜,
		  tms.비고
		FROM tms
		WHERE DATE_FORMAT(tms.날짜, '%값1_2%') BETWEEN '%month11%' AND '%month21%'
		AND tms.상태 = 'Y';



		)
		result := dbQuery(myDB, myQuery)
		for index1, 1_arr in result
		{
			;		  1_arr[1] 1_arr[2] 1_arr[3] 1_arr[4] 1_arr[5] 1_arr[6] 1_arr[7] 1_arr[8] 1_arr[9] 1_arr[10] 1_arr[11]
			; 			ID      축약날짜   요알   시간     업체    출고지    절단    도어     배송자    상태    원본날짜
			LV_Add("", 1_arr[1], 1_arr[2], 1_arr[3], 1_arr[4], 1_arr[5], 1_arr[6], 1_arr[7], 1_arr[8], 1_arr[9], 1_arr[10], 1_arr[11])
		}


/*
Loop, %A_WorkingDir%\매출\*_Y.CSV
{
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_V(.*)_G(.*)_T(.*)_Y", 1output)
RegExMatch(1output1, "2024-(.*)-(.*)", 1date)
NewStr := RegExReplace(1output1, "-" , Replacement := "")
	If ((month11 <= NewStr) && (NewStr <= month21))
	{

				rootfile1 = % A_WorkingDir "\매출\" A_LoopFileName

		PERCENT9(rootfile1)
		;~ COUNT
		LV_Add("", "A" 1output1 "_B" 1output2 "_C" 1output3 "_D" 1output4 "_E"  1output5 "_V" 1output6 "_G" 1output7 "_T" 1output8 "_Y.CSV", 1date1 "-" 1date2, Get_Weekday(NewStr, parmMode), 1output2, 1output3, 1output4, 1output6, 1output7, 1output8, COUNT)
	}
	                             ; 안보임																							|출하일|				日|			출고시각|업체명|출고지|완료
	else
	{
	}

}

*/


Sleep, 10






;~ GuiControl, +Redraw, %HLV1%
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;~ LV_ModifyCol(1, 0)
;~ LV_ModifyCol(2, 55)  ;
;~ LV_ModifyCol(3, 25)  ;
;~ LV_ModifyCol(4, 70)  ;
;~ LV_ModifyCol(5, 150)  ;
;~ LV_ModifyCol(6, 125)  ;
;~ LV_ModifyCol(7, 155)  ;
;~ LV_ModifyCol(8, 0)  ;
;~ GuiControl, -Redraw, %HLV2%
;~ WinSet, Redraw, , ahk_id %HLV2%


        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
Gui, 1:ListView, lv2 ; 출고 중

   ;~ CLV2.OnMessage(False)
CLV2.Clear(1, 1)
{
LV_Delete()
}

		값1_1 := "%" . "m-" . "%d"
		값1_2 := "%Y" . "%m" . "%d"

		myQuery =
		(

		SELECT
		  tms.ID,
		  DATE_FORMAT(tms.날짜, '%값1_1%') AS 날짜,
		  CASE DAYOFWEEK(tms.날짜)
			WHEN 1 THEN '일'
			WHEN 2 THEN '월'
			WHEN 3 THEN '화'
			WHEN 4 THEN '수'
			WHEN 5 THEN '목'
			WHEN 6 THEN '금'
			WHEN 7 THEN '토'
		  END AS 요일,
		  tms.시간,
		  tms.업체,
		  tms.출고지,
		  tms.절단,
		  tms.도어,
		  tms.배송자,
		  FLOOR(
			(SELECT COUNT(*)
			 FROM tms_list
			 WHERE tms_list.ID = tms.ID AND tms_list.출 = '●') * 100.0 /
			(SELECT COUNT(*)
			 FROM tms_list
			 WHERE tms_list.ID = tms.ID) / 10.0 ) * 10 AS 진행률,
		  tms.날짜 AS 원본_날짜,
		  tms.비고
		FROM tms
		WHERE DATE_FORMAT(tms.날짜, '%값1_2%') BETWEEN '%month11%' AND '%month21%'
		AND tms.상태 = 'X';



		)
		result := dbQuery(myDB, myQuery)
		for index1, 1_arr in result
		{
			;		  1_arr[1] 1_arr[2] 1_arr[3] 1_arr[4] 1_arr[5] 1_arr[6] 1_arr[7] 1_arr[8] 1_arr[9] 1_arr[10] 1_arr[11]
			; 			ID    축약날짜     시간      요일     업체    출고지    절단    도어     배송자    상태    원본날짜
			LV_Add("", 1_arr[1], 1_arr[2], 1_arr[3], 1_arr[4], 1_arr[5], 1_arr[6], 1_arr[7], 1_arr[8], 1_arr[9], 1_arr[10], 1_arr[11])
		}

Sleep, 10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;~ GuiControl, +Redraw, %HLV2%
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;~ GuiControl, -Redraw, %HLV3%
;~ WinSet, Redraw, , ahk_id %HLV3%



        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
Gui, 1:ListView, lv3 ; 출고 끝

   ;~ CLV3.OnMessage(False)
CLV3.Clear(1, 1)
{
LV_Delete()
}

		값1_1 := "%" . "m-" . "%d"
		값1_2 := "%Y" . "%m" . "%d"

		myQuery =
		(

		SELECT
		  tms.ID,
		  DATE_FORMAT(tms.날짜, '%값1_1%') AS 날짜,
		  CASE DAYOFWEEK(tms.날짜)
			WHEN 1 THEN '일'
			WHEN 2 THEN '월'
			WHEN 3 THEN '화'
			WHEN 4 THEN '수'
			WHEN 5 THEN '목'
			WHEN 6 THEN '금'
			WHEN 7 THEN '토'
		  END AS 요일,
		  tms.시간,
		  tms.업체,
		  tms.출고지,
		  tms.절단,
		  tms.도어,
		  tms.배송자,
		  FLOOR(
			(SELECT COUNT(*)
			 FROM tms_list
			 WHERE tms_list.ID = tms.ID AND tms_list.출 = '●') * 100.0 /
			(SELECT COUNT(*)
			 FROM tms_list
			 WHERE tms_list.ID = tms.ID) / 10.0 ) * 10 AS 진행률,
		  tms.날짜 AS 원본_날짜,
		  tms.비고
		FROM tms
		WHERE DATE_FORMAT(tms.날짜, '%값1_2%') BETWEEN '%month11%' AND '%month21%'
		AND tms.상태 = 'Z';



		)
		result := dbQuery(myDB, myQuery)
		for index1, 1_arr in result
		{
			;		  1_arr[1] 1_arr[2] 1_arr[3] 1_arr[4] 1_arr[5] 1_arr[6] 1_arr[7] 1_arr[8] 1_arr[9] 1_arr[10] 1_arr[11]
			; 			ID    축약날짜     시간      요일     업체    출고지    절단    도어     배송자    상태    원본날짜
			LV_Add("", 1_arr[1], 1_arr[2], 1_arr[3], 1_arr[4], 1_arr[5], 1_arr[6], 1_arr[7], 1_arr[8], 1_arr[9], 1_arr[10], 1_arr[11])
		}

Sleep, 10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;~ GuiControl, +Redraw, %HLV3%
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
Gui, 1:ListView, lv11 ; 출고 끝

   ;~ CLV11.OnMessage(False)
CLV11.Clear(1, 1)
;~ Gui, submit, nohide
{
LV_Delete()
}

		값1_1 := "%" . "m-" . "%d"
		값1_2 := "%Y" . "%m" . "%d"

		myQuery =
		(

		SELECT
		  tms.ID,
		  DATE_FORMAT(tms.날짜, '%값1_1%') AS 날짜,
		  CASE DAYOFWEEK(tms.날짜)
			WHEN 1 THEN '일'
			WHEN 2 THEN '월'
			WHEN 3 THEN '화'
			WHEN 4 THEN '수'
			WHEN 5 THEN '목'
			WHEN 6 THEN '금'
			WHEN 7 THEN '토'
		  END AS 요일,
		  tms.시간,
		  tms.업체,
		  tms.출고지,
		  tms.절단,
		  tms.도어,
		  tms.배송자,
		  FLOOR(
			(SELECT COUNT(*)
			 FROM tms_list
			 WHERE tms_list.ID = tms.ID AND tms_list.출 = '●') * 100.0 /
			(SELECT COUNT(*)
			 FROM tms_list
			 WHERE tms_list.ID = tms.ID) / 10.0 ) * 10 AS 진행률,
		  tms.날짜 AS 원본_날짜,
		  tms.비고
		FROM tms
		WHERE DATE_FORMAT(tms.날짜, '%값1_2%') BETWEEN '%month11%' AND '%month21%'
		AND tms.상태 = 'W';



		)
		result := dbQuery(myDB, myQuery)
		for index1, 1_arr in result
		{
			;		  1_arr[1] 1_arr[2] 1_arr[3] 1_arr[4] 1_arr[5] 1_arr[6] 1_arr[7] 1_arr[8] 1_arr[9] 1_arr[10] 1_arr[11]
			; 			ID    축약날짜     시간      요일     업체    출고지    절단    도어     배송자    상태    원본날짜
			LV_Add("", 1_arr[1], 1_arr[2], 1_arr[3], 1_arr[4], 1_arr[5], 1_arr[6], 1_arr[7], 1_arr[8], 1_arr[9], 1_arr[10], 1_arr[11])
		}

Sleep, 20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ gui, 1:restore
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;~ CLV1.OnMessage()
;~ Gui, Submit, NoHide

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Gui, 1:ListView, lv1 ; 출고 중
	;~ Sleep, 1
   ;~ CLV1.OnMessage()

Loop % LV_GetCount()
{



		    ;~ LV_GetText(OutputVar0, A_Index, 1)
	;~ datacsv =
	;~ CSV_Load(OutputVar0, "datacsv")
	;~ newtext := CSV_Search("datacsv", "△")
	;~ NewStr := RegExReplace(newtext, "," , Replacement := "")
	;~ if (NewStr = "0"){
	;~ CLV1.ROW(A_Index, 0xFF31E2, 0x000000)
	;~ }
	;~ else
	;~ {
	;~ CLV1.ROW(A_Index, 0xfff0f0, 0x000000)
	;~ }

		    LV_GetText(OutputVar1_1, A_Index, 2)
				2어제날짜=%A_Now%
	EnvAdd,2어제날짜,+1,days
	FormatTime,2어제날짜,%2어제날짜%,MM-dd
	FormatTime, Yellowtime1 , , MM-dd
	;~ MsgBox, %Yellowtime1%`n%2output1%
	if (Yellowtime1 = OutputVar1_1){
	CLV1.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else if (2어제날짜 = OutputVar1_1){
	CLV1.ROW(A_Index, 0x1F00FF, 0xFFFFFF)
	}
	else
	{
	CLV1.ROW(A_Index, 0xfff0f0, 0x000000)
	}

	;~ Sleep, 1
    LV_GetText(RetrievedText, A_Index, 9)

    if (RetrievedText = "여"){
	CLV1.Cell(A_Index, 9, 0xFF9843, 0x000000)
	}
	else if (RetrievedText = "최"){
	CLV1.Cell(A_Index, 9, 0x00FFE0, 0xFFFFFF)
	}
	else if (RetrievedText = "")
	{
		if (Yellowtime1 = OutputVar1_1){
		CLV1.Cell(A_Index, 9, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_1){
		CLV1.Cell(A_Index, 9, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV1.Cell(A_Index, 9, 0xfff0f0, 0x000000)
		}
	}
	else
	{
	}	;~ Sleep, 1


    LV_GetText(RetrievedText, A_Index, 8)

    if (RetrievedText = "예"){
	CLV1.Cell(A_Index, 8, 0xFF31E2, 0x000000)
	}
	else if (RetrievedText = "우"){
	CLV1.Cell(A_Index, 8, 0x61C600, 0xFFFFFF)
	}
	else if (RetrievedText = "재"){
	CLV1.Cell(A_Index, 8, 0x00B9F2, 0xFFFFFF)
	}
	else if (RetrievedText = "크"){
	CLV1.Cell(A_Index, 8, 0xFF1733, 0xffffff)
	}
	else if (RetrievedText = "")
	{
		if (Yellowtime1 = OutputVar1_1){
		CLV1.Cell(A_Index, 8, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_1){
		CLV1.Cell(A_Index, 8, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV1.Cell(A_Index, 8, 0xfff0f0, 0x000000)
		}
	}
	else
	{
	}
	;~ Sleep, 1


		    LV_GetText(OutputVar7, A_Index, 7)
	if (OutputVar7 = "컷"){
	CLV1.Cell(A_Index, 7, 0xFF00CC, 0xFFFFFF)
	}
	else
	{
		if (Yellowtime1 = OutputVar1_1){
		CLV1.Cell(A_Index, 7, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_1){
		CLV1.Cell(A_Index, 7, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV1.Cell(A_Index, 7, 0xfff0f0, 0x000000)
		}
	}
	;~ Sleep, 1

}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Gui, 1:ListView, lv2 ; 출고 중
   ;~ CLV2.OnMessage()
Loop % LV_GetCount()
{




		    LV_GetText(OutputVar1_2, A_Index, 2)
				2어제날짜=%A_Now%
	EnvAdd,2어제날짜,+1,days
	FormatTime,2어제날짜,%2어제날짜%,MM-dd
	FormatTime, Yellowtime1 , , MM-dd
	;~ MsgBox, %Yellowtime1%`n%2output1%
	if (Yellowtime1 = OutputVar1_2){
	CLV2.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else if (2어제날짜 = OutputVar1_2){
	CLV2.ROW(A_Index, 0x1F00FF, 0xFFFFFF)
	}
	else
	{
	CLV2.ROW(A_Index, 0xffdbdb, 0x000000)
	}

	;~ Sleep, 1
    LV_GetText(RetrievedText, A_Index, 8)

    if (RetrievedText = "예"){
	CLV2.Cell(A_Index, 8, 0xFF31E2, 0x000000)
	}
	else if (RetrievedText = "우"){
	CLV2.Cell(A_Index, 8, 0x61C600, 0xFFFFFF)
	}
	else if (RetrievedText = "재"){
	CLV2.Cell(A_Index, 8, 0x00B9F2, 0xFFFFFF)
	}
	else if (RetrievedText = "크"){
	CLV2.Cell(A_Index, 8, 0xFF1733, 0xffffff)
	}
	else if (RetrievedText = "")
	{
		if (Yellowtime1 = OutputVar1_2){
		CLV2.Cell(A_Index, 8, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_2){
		CLV2.Cell(A_Index, 8, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV2.Cell(A_Index, 8, 0xffdbdb, 0x000000)
		}
	}
	else
	{
	}

	;~ Sleep, 1
    LV_GetText(RetrievedText, A_Index, 9)

    if (RetrievedText = "여"){
	CLV2.Cell(A_Index, 9, 0xFF9843, 0x000000)
	}
	else if (RetrievedText = "최"){
	CLV2.Cell(A_Index, 9, 0x00FFE0, 0xFFFFFF)
	}
	else
	{
		if (Yellowtime1 = OutputVar1_2){
		CLV2.Cell(A_Index, 9, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_2){
		CLV2.Cell(A_Index, 9, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV2.Cell(A_Index, 9, 0xffdbdb, 0x000000)
		}
	}	;~ Sleep, 1


	;~ Sleep, 1
		    LV_GetText(OutputVar7, A_Index, 7)
	if (OutputVar7 = "컷"){
	CLV2.Cell(A_Index, 7, 0xFF00CC, 0xFFFFFF)
	}

	else
	{
		if (Yellowtime1 = OutputVar1_2){
		CLV2.Cell(A_Index, 7, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_2){
		CLV2.Cell(A_Index, 7, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV2.Cell(A_Index, 7, 0xffdbdb, 0x000000)
		}
	}

}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;~ CLV3.OnMessage()
;~ Gui, Submit, NoHide
;~ GuiControl, -Redraw, %HLV3%
	;~ Sleep, 1
        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Gui, 1:ListView, lv3 ; 출고 끝
   ;~ CLV3.OnMessage()
Loop % LV_GetCount()
{


		    ;~ LV_GetText(OutputVar0, A_Index, 1)
	;~ datacsv =
	;~ CSV_Load(OutputVar0, "datacsv")
	;~ newtext := CSV_Search("datacsv", "△")
	;~ NewStr := RegExReplace(newtext, "," , Replacement := "")
	;~ if (NewStr = "0"){
	;~ CLV3.ROW(A_Index, 0xFF31E2, 0x000000)
	;~ }
	;~ else
	;~ {
	;~ CLV3.ROW(A_Index, 0xffc3c3, 0x000000)
	;~ }

		    LV_GetText(OutputVar1_3, A_Index, 2)
				2어제날짜=%A_Now%
	EnvAdd,2어제날짜,+1,days
	FormatTime,2어제날짜,%2어제날짜%,MM-dd
	FormatTime, Yellowtime1 , , MM-dd
	;~ MsgBox, %Yellowtime1%`n%2output1%
	if (Yellowtime1 = OutputVar1_3){
	CLV3.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else if (2어제날짜 = OutputVar1_3){
	CLV3.ROW(A_Index, 0x1F00FF, 0xFFFFFF)
	}
	else
	{
	CLV3.ROW(A_Index, 0xffc3c3, 0x000000)
	}

	;~ Sleep, 1

	;~ Sleep, 1
    LV_GetText(RetrievedText, A_Index, 9)

    if (RetrievedText = "여"){
	CLV3.Cell(A_Index, 9, 0xFF9843, 0x000000)
	}
	else if (RetrievedText = "최"){
	CLV3.Cell(A_Index, 9, 0x00FFE0, 0xFFFFFF)
	}
	else if (RetrievedText = "")
	{
		if (Yellowtime1 = OutputVar1_3){
		CLV3.Cell(A_Index, 9, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_3){
		CLV3.Cell(A_Index, 9, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV3.Cell(A_Index, 9, 0xffc3c3, 0x000000)
		}
	}
	else
	{
	}	;~ Sleep, 1


    LV_GetText(RetrievedText, A_Index, 8)

    if (RetrievedText = "예"){
	CLV3.Cell(A_Index, 8, 0xFF31E2, 0x000000)
	}
	else if (RetrievedText = "우"){
	CLV3.Cell(A_Index, 8, 0x61C600, 0xFFFFFF)
	}
	else if (RetrievedText = "재"){
	CLV3.Cell(A_Index, 8, 0x00B9F2, 0xFFFFFF)
	}
	else if (RetrievedText = "크"){
	CLV3.Cell(A_Index, 8, 0xFF1733, 0xffffff)
	}
	else if (RetrievedText = ""){
	{
		if (Yellowtime1 = OutputVar1_3){
		CLV3.Cell(A_Index, 8, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_3){
		CLV3.Cell(A_Index, 8, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV3.Cell(A_Index, 8, 0xffc3c3, 0xFFFFFF)
		}
	}
	;~ Clv3.Cell(A_Index, 8, 0xffc3c3, 0x000000)
	}
	else
	{
	;~ Clv3.Cell(A_Index, 8, 0xffc3c3, 0x000000)
	}

	;~ Sleep, 1

		    LV_GetText(OutputVar7, A_Index, 7)
	if (OutputVar7 = "컷"){
	CLV3.Cell(A_Index, 7, 0xFF00CC, 0xFFFFFF)
	}

	else
	{
		if (Yellowtime1 = OutputVar1_3){
		CLV3.Cell(A_Index, 7, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_3){
		CLV3.Cell(A_Index, 7, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV3.Cell(A_Index, 7, 0xffc3c3, 0x000000)
		}
	}








}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;~ CLV11.OnMessage()
        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
   Gui, 1:ListView, lv11 ; 출고 끝
   ;~ CLV11.OnMessage()
;~ Gui, Submit, NoHide
;~ GuiControl, -Redraw, %HLV11%
	;~ Sleep, 1
Loop % LV_GetCount()
{



		    ;~ LV_GetText(OutputVar0, A_Index, 1)
	;~ datacsv =
	;~ CSV_Load(OutputVar0, "datacsv")
	;~ newtext := CSV_Search("datacsv", "△")
	;~ NewStr := RegExReplace(newtext, "," , Replacement := "")
	;~ if (NewStr = "0"){
	;~ CLV11.ROW(A_Index, 0xFF31E2, 0x000000)
	;~ }
	;~ else
	;~ {
	;~ CLV11.ROW(A_Index, 0xFFF0FA, 0x000000)
	;~ }

		    LV_GetText(OutputVar1_4, A_Index, 2)
				2어제날짜=%A_Now%
	EnvAdd,2어제날짜,+1,days
	FormatTime,2어제날짜,%2어제날짜%,MM-dd
	FormatTime, Yellowtime1 , , MM-dd
	;~ MsgBox, %Yellowtime1%`n%2output1%
	if (Yellowtime1 = OutputVar1_4){
	CLV11.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else if (2어제날짜 = OutputVar1_4){
	CLV11.ROW(A_Index, 0x1F00FF, 0xFFFFFF)
	}
	else
	{
	CLV11.ROW(A_Index, 0xffa2a2, 0x000000)
	}


	;~ Sleep, 1

	;~ Sleep, 1
    LV_GetText(RetrievedText, A_Index, 9)

    if (RetrievedText = "여"){
	CLV11.Cell(A_Index, 9, 0xFF9843, 0x000000)
	}
	else if (RetrievedText = "최"){
	CLV11.Cell(A_Index, 9, 0x00FFE0, 0xFFFFFF)
	}
	else if (RetrievedText = "")
	{
		if (Yellowtime1 = OutputVar1_4){
		CLV11.Cell(A_Index, 9, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_4){
		CLV11.Cell(A_Index, 9, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV11.Cell(A_Index, 9, 0xffa2a2, 0x000000)
		}
	}
	else
	{
	}	;~ Sleep, 1



    LV_GetText(RetrievedText, A_Index, 8)

    if (RetrievedText = "예"){
	CLV11.Cell(A_Index, 8, 0xFF31E2, 0x000000)
	}
	else if (RetrievedText = "우"){
	CLV11.Cell(A_Index, 8, 0x61C600, 0xFFFFFF)
	}
	else if (RetrievedText = "재"){
	CLV11.Cell(A_Index, 8, 0x00B9F2, 0xFFFFFF)
	}
	else if (RetrievedText = "크"){
	CLV11.Cell(A_Index, 8, 0xFF1733, 0xffffff)
	}

	else if (RetrievedText = "")
	{
		if (Yellowtime1 = OutputVar1_4){
		CLV11.Cell(A_Index, 8, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_4){
		CLV11.Cell(A_Index, 8, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV11.Cell(A_Index, 8, 0xffa2a2, 0xFFFFFF)
		}
	}
	else
	{
	}

	;~ Sleep, 1

		    LV_GetText(OutputVar7, A_Index, 7)
	if (OutputVar7 = "컷"){
	CLV11.Cell(A_Index, 7, 0xFF00CC, 0xFFFFFF)
	}

	else
	{
		if (Yellowtime1 = OutputVar1_4){
		CLV11.Cell(A_Index, 7, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar1_4){
		CLV11.Cell(A_Index, 7, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV11.Cell(A_Index, 7, 0xffa2a2, 0x000000)
		}
	}


}
        GuiControl,1:, PG1, 100 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
Sleep,100
GuiControl, 1:+Redraw, %HLV1%
GuiControl, 1:+Redraw, %HLV2%
GuiControl, 1:+Redraw, %HLV3%
GuiControl, 1:+Redraw, %HLV11%


WinSet, Redraw, , ahk_id %HLV1%
WinSet, Redraw, , ahk_id %HLV2%
WinSet, Redraw, , ahk_id %HLV3%
WinSet, Redraw, , ahk_id %HLV11%
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;~ Sleep, 1
;~ GuiControl, enable, LV1
;~ GuiControl, enable, LV2
;~ GuiControl, enable, LV3
;~ GuiControl, enable, LV11


;~ GuiControl, show, LV1
;~ GuiControl, show, LV2
;~ GuiControl, show, LV3
;~ GuiControl, show, LV11




OutputVar :=
;~ GuiControl, 1:Hide, pic0
;~ Gui, 1:Restore
        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
return







refresh9:


		SoundPlay, %A_WorkingDir%\sound\효과음12.mp3


refresh91:


month1_9:
month2_9:





        GuiControl,1:, PG1, 10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



Gui, 1:Submit, NoHide
;~ GuiControl, hide, LV91
;~ GuiControl, hide, LV92
;~ GuiControl, hide, LV93
;~ GuiControl, hide, LV94

;~ GuiControl, disable, LV91
;~ GuiControl, disable, LV92
;~ GuiControl, disable, LV93
;~ GuiControl, disable, LV94



;~ GuiControl, 1:-Redraw, %HLV91%
;~ GuiControl, 1:-Redraw, %HLV92%
;~ GuiControl, 1:-Redraw, %HLV93%
;~ GuiControl, 1:-Redraw, %HLV94%
;~ WinSet, Redraw, , ahk_id %HLV91%

;~ GuiControl, 1:show, pic09

RegExMatch(month1_9, "(.*)000000", month1_9)
RegExMatch(month2_9, "(.*)000000", month2_9)


        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;~ Gui, 1:restore
Gui, 1:ListView, LV91 ; 입고 전
CLV91.Clear(1, 1)
{
LV_Delete()
}

		값1_1 := "%" . "m-" . "%d"
		값1_2 := "%Y" . "%m" . "%d"

		myQuery =
		(

		SELECT
			tms_2.ID,
			DATE_FORMAT(tms_2.날짜, '%값1_1%') AS 날짜,
			CASE DAYOFWEEK(tms_2.날짜)
				WHEN 1 THEN '일'
				WHEN 2 THEN '월'
				WHEN 3 THEN '화'
				WHEN 4 THEN '수'
				WHEN 5 THEN '목'
				WHEN 6 THEN '금'
				WHEN 7 THEN '토'
			END AS 요일,
			tms_2.시간,
			tms_2.업체,
			tms_2.입고지,
			tms_2.진행,
			tms_2.픽업,
			tms_2.배송자,
			FLOOR(
				(SELECT COUNT(*)
				 FROM tms_list
				 WHERE tms_list.ID = tms_2.ID AND tms_list.출 = '●') * 100.0 /
				(SELECT COUNT(*)
				 FROM tms_list
				 WHERE tms_list.ID = tms_2.ID) / 10.0 ) * 10 AS 진행률,
			tms_2.날짜 AS 원본_날짜,
			tms_2.비고
		FROM tms_2
		WHERE DATE_FORMAT(tms_2.날짜, '%값1_2%') BETWEEN '%month1_91%' AND '%month2_91%'
		AND tms_2.상태 = 'A';
		)

		result := dbQuery(myDB, myQuery)
		for index1, 1_arr in result
		{
			;		  1_arr[1]   1_arr[2]   1_arr[3] 1_arr[4] 1_arr[5] 1_arr[6]    1_arr[7]   1_arr[8]  1_arr[9]  1_arr[10]   1_arr[11]
			; 			ID       축약날짜     요일     시간     업체     입고지     진행       픽업    배송자    상태       원본날짜
			LV_Add("", 1_arr[1], 1_arr[2], 1_arr[3], 1_arr[4], 1_arr[5], 1_arr[6], 1_arr[7], 1_arr[8], 1_arr[9], 1_arr[10], 1_arr[11])
		}

Sleep, 10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;~ GuiControl, +Redraw, %HLV91%
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;~ CLV92 := New LV_Colors(HLV92)
;~ WinSet, Redraw, , ahk_id %HLV92%

;~ GuiControl, -Redraw, %HLV92%
;~ WinSet, Redraw, , ahk_id %HLV92%


        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

Gui, 1:ListView, LV92 ; 출고 끝
	Sleep, 10
CLV92.Clear(1, 1)
{
LV_Delete()
}

		값1_1 := "%" . "m-" . "%d"
		값1_2 := "%Y" . "%m" . "%d"

		myQuery =
		(

		SELECT
			tms_2.ID,
			DATE_FORMAT(tms_2.날짜, '%값1_1%') AS 날짜,
			CASE DAYOFWEEK(tms_2.날짜)
				WHEN 1 THEN '일'
				WHEN 2 THEN '월'
				WHEN 3 THEN '화'
				WHEN 4 THEN '수'
				WHEN 5 THEN '목'
				WHEN 6 THEN '금'
				WHEN 7 THEN '토'
			END AS 요일,
			tms_2.시간,
			tms_2.업체,
			tms_2.입고지,
			tms_2.진행,
			tms_2.픽업,
			tms_2.배송자,
			FLOOR(
				(SELECT COUNT(*)
				 FROM tms_list
				 WHERE tms_list.ID = tms_2.ID AND tms_list.출 = '●') * 100.0 /
				(SELECT COUNT(*)
				 FROM tms_list
				 WHERE tms_list.ID = tms_2.ID) / 10.0 ) * 10 AS 진행률,
			tms_2.날짜 AS 원본_날짜,
			tms_2.비고
		FROM tms_2
		WHERE DATE_FORMAT(tms_2.날짜, '%값1_2%') BETWEEN '%month1_91%' AND '%month2_91%'
		AND tms_2.상태 = 'B';


		)
		result := dbQuery(myDB, myQuery)
		for index1, 1_arr in result
		{
			;		  1_arr[1]   1_arr[2]   1_arr[3] 1_arr[4] 1_arr[5] 1_arr[6]    1_arr[7]   1_arr[8]  1_arr[9]  1_arr[10]   1_arr[11]
			; 			ID       축약날짜     요일     시간     업체     입고지     진행       픽업    배송자    상태       원본날짜
			LV_Add("", 1_arr[1], 1_arr[2], 1_arr[3], 1_arr[4], 1_arr[5], 1_arr[6], 1_arr[7], 1_arr[8], 1_arr[9], 1_arr[10], 1_arr[11])
		}



Sleep, 10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;~ GuiControl, +Redraw, %HLV92%
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;~ CLV93 := New LV_Colors(HLV93)
;~ WinSet, Redraw, , ahk_id %HLV93%

;~ GuiControl, -Redraw, %HLV93%
;~ WinSet, Redraw, , ahk_id %HLV93%

	Sleep, 10

Gui, 1:ListView, LV93 ; 출고 끝
CLV93.Clear(1, 1)
{
LV_Delete()
}

		값1_1 := "%" . "m-" . "%d"
		값1_2 := "%Y" . "%m" . "%d"

		myQuery =
		(

		SELECT
			tms_2.ID,
			DATE_FORMAT(tms_2.날짜, '%값1_1%') AS 날짜,
			CASE DAYOFWEEK(tms_2.날짜)
				WHEN 1 THEN '일'
				WHEN 2 THEN '월'
				WHEN 3 THEN '화'
				WHEN 4 THEN '수'
				WHEN 5 THEN '목'
				WHEN 6 THEN '금'
				WHEN 7 THEN '토'
			END AS 요일,
			tms_2.시간,
			tms_2.업체,
			tms_2.입고지,
			tms_2.진행,
			tms_2.픽업,
			tms_2.배송자,
			FLOOR(
				(SELECT COUNT(*)
				 FROM tms_list
				 WHERE tms_list.ID = tms_2.ID AND tms_list.출 = '●') * 100.0 /
				(SELECT COUNT(*)
				 FROM tms_list
				 WHERE tms_list.ID = tms_2.ID) / 10.0 ) * 10 AS 진행률,
			tms_2.날짜 AS 원본_날짜,
			tms_2.비고
		FROM tms_2
		WHERE DATE_FORMAT(tms_2.날짜, '%값1_2%') BETWEEN '%month1_91%' AND '%month2_91%'
		AND tms_2.상태 = 'C';


		)
		result := dbQuery(myDB, myQuery)
		for index1, 1_arr in result
		{
			;		  1_arr[1]   1_arr[2]   1_arr[3] 1_arr[4] 1_arr[5] 1_arr[6]    1_arr[7]   1_arr[8]  1_arr[9]  1_arr[10]   1_arr[11]
			; 			ID       축약날짜     요일     시간     업체     입고지     진행       픽업    배송자    상태       원본날짜
			LV_Add("", 1_arr[1], 1_arr[2], 1_arr[3], 1_arr[4], 1_arr[5], 1_arr[6], 1_arr[7], 1_arr[8], 1_arr[9], 1_arr[10], 1_arr[11])
		}




Sleep, 10

;~ GuiControl, +Redraw, %HLV92%
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;~ CLV93 := New LV_Colors(HLV93)
;~ WinSet, Redraw, , ahk_id %HLV93%

;~ GuiControl, -Redraw, %HLV93%
;~ WinSet, Redraw, , ahk_id %HLV93%

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Sleep, 10

Gui, 1:ListView, LV94 ; 출고 끝
CLV94.Clear(1, 1)
{
LV_Delete()
}

		값1_1 := "%" . "m-" . "%d"
		값1_2 := "%Y" . "%m" . "%d"

		myQuery =
		(

		SELECT
			tms_2.ID,
			DATE_FORMAT(tms_2.날짜, '%값1_1%') AS 날짜,
			CASE DAYOFWEEK(tms_2.날짜)
				WHEN 1 THEN '일'
				WHEN 2 THEN '월'
				WHEN 3 THEN '화'
				WHEN 4 THEN '수'
				WHEN 5 THEN '목'
				WHEN 6 THEN '금'
				WHEN 7 THEN '토'
			END AS 요일,
			tms_2.시간,
			tms_2.업체,
			tms_2.입고지,
			tms_2.진행,
			tms_2.픽업,
			tms_2.배송자,
			FLOOR(
				(SELECT COUNT(*)
				 FROM tms_list
				 WHERE tms_list.ID = tms_2.ID AND tms_list.출 = '●') * 100.0 /
				(SELECT COUNT(*)
				 FROM tms_list
				 WHERE tms_list.ID = tms_2.ID) / 10.0 ) * 10 AS 진행률,
			tms_2.날짜 AS 원본_날짜,
			tms_2.비고
		FROM tms_2
		WHERE DATE_FORMAT(tms_2.날짜, '%값1_2%') BETWEEN '%month1_91%' AND '%month2_91%'
		AND tms_2.상태 = 'D';


		)
		result := dbQuery(myDB, myQuery)
		for index1, 1_arr in result
		{
			;		  1_arr[1]   1_arr[2]   1_arr[3] 1_arr[4] 1_arr[5] 1_arr[6]    1_arr[7]   1_arr[8]  1_arr[9]  1_arr[10]   1_arr[11]
			; 			ID       축약날짜     요일     시간     업체     입고지     진행       픽업    배송자    상태       원본날짜
			LV_Add("", 1_arr[1], 1_arr[2], 1_arr[3], 1_arr[4], 1_arr[5], 1_arr[6], 1_arr[7], 1_arr[8], 1_arr[9], 1_arr[10], 1_arr[11])
		}



Sleep, 10









;~ gui, 1:restore




        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

   ;~ CLV91.OnMessage()

;~ GuiControl, -Redraw, %HLV91%
	;~ Sleep, 1
	Gui, 1:ListView, LV91 ; 출고 끝
	CLV91.Clear(1, 1)
	Sleep, 10
Loop % LV_GetCount()
{

		    LV_GetText(OutputVar2, A_Index, 2)
				2어제날짜=%A_Now%
	EnvAdd,2어제날짜,+1,days
	FormatTime,2어제날짜,%2어제날짜%,MM-dd
	FormatTime, Yellowtime1 , , MM-dd
	;~ MsgBox, %Yellowtime1%`n%2output1%
	if (Yellowtime1 = OutputVar2){
	CLV91.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else if (2어제날짜 = OutputVar2){
	CLV91.ROW(A_Index, 0x1F00FF, 0xFFFFFF)
	}
	else
	{
	CLV91.ROW(A_Index, 0xecf2ff, 0x000000)
	}

    LV_GetText(RetrievedText, A_Index, 8)
    if (RetrievedText = "주문"){
	CLV91.Cell(A_Index, 8, 0xFF9843, 0x000000)
	}
	else if (RetrievedText = "보류"){
	CLV91.ROW(A_Index, 0xFF0000, 0xFFFFFF)
	}
	else if (RetrievedText = "재고"){
	CLV91.Cell(A_Index, 8, 0x00B9F2, 0x000000)
	}
	else if (RetrievedText = "")
	{
		if (Yellowtime1 = OutputVar2){
		CLV91.Cell(A_Index, 8, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar2){
		CLV91.Cell(A_Index, 8, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV91.Cell(A_Index, 8, 0xecf2ff, 0x000000)
		}
	}
	else
	{
	}

		    LV_GetText(OutputVar7, A_Index, 6)
	if (OutputVar7 = "매장입고"){
		if (Yellowtime1 = OutputVar2){
		CLV91.Cell(A_Index, 6, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar2){
		CLV91.Cell(A_Index, 6, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV91.Cell(A_Index, 6, 0xecf2ff, 0x000000)
		}
	}
	else
	{
		CLV91.Cell(A_Index, 6, 0x00ff00, 0x000000)

	}
}


        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
   CLV92.OnMessage()
;~ Gui, Submit, NoHide
;~ GuiControl, -Redraw, %HLV92%
	;~ Sleep, 1
	Gui, 1:ListView, LV92 ; 출고 끝
	CLV92.Clear(1, 1)
Loop % LV_GetCount()
{

		    LV_GetText(OutputVar2, A_Index, 2)
				2어제날짜=%A_Now%
	EnvAdd,2어제날짜,+1,days
	FormatTime,2어제날짜,%2어제날짜%,MM-dd
	FormatTime, Yellowtime1 , , MM-dd
	;~ MsgBox, %Yellowtime1%`n%2output1%
	if (Yellowtime1 = OutputVar2){
	CLV92.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else if (2어제날짜 = OutputVar2){
	CLV92.ROW(A_Index, 0x1F00FF, 0xFFFFFF)
	}
	else
	{
	CLV92.ROW(A_Index, 0xd5e2ff, 0x000000)
	}

    LV_GetText(RetrievedText, A_Index, 8)
    if (RetrievedText = "주문"){
	CLV92.Cell(A_Index, 8, 0xFF9843, 0x000000)
	}
	else if (RetrievedText = "보류"){
	CLV92.ROW(A_Index, 0xFF0000, 0xFFFFFF)
	}
	else if (RetrievedText = "재고"){
	CLV92.Cell(A_Index, 8, 0x00B9F2, 0x000000)
	}
	else if (RetrievedText = "")
	{
		if (Yellowtime1 = OutputVar2){
		CLV92.Cell(A_Index, 8, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar2){
		CLV92.Cell(A_Index, 8, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV92.Cell(A_Index, 8, 0xd5e2ff, 0x000000)
		}
	}
	else
	{
	}

		    LV_GetText(OutputVar7, A_Index, 6)
	if (OutputVar7 = "매장입고"){
		if (Yellowtime1 = OutputVar2){
		CLV92.Cell(A_Index, 6, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar2){
		CLV92.Cell(A_Index, 6, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV92.Cell(A_Index, 6, 0xd5e2ff, 0x000000)
		}
	}
	else
	{
		CLV92.Cell(A_Index, 6, 0x00ff00, 0x000000)

	}
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;~ CLV93.OnMessage()
;~ Gui, Submit, NoHide
;~ GuiControl, -Redraw, %HLV93%
	;~ Sleep, 1
	Gui, 1:ListView, LV93 ; 출고 끝
	CLV93.Clear(1, 1)
Loop % LV_GetCount()
{

		    LV_GetText(OutputVar2, A_Index, 2)
				2어제날짜=%A_Now%
	EnvAdd,2어제날짜,+1,days
	FormatTime,2어제날짜,%2어제날짜%,MM-dd
	FormatTime, Yellowtime1 , , MM-dd
	;~ MsgBox, %Yellowtime1%`n%2output1%
	if (Yellowtime1 = OutputVar2){
	CLV93.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else if (2어제날짜 = OutputVar2){
	CLV93.ROW(A_Index, 0x1F00FF, 0xFFFFFF)
	}
	else
	{
	CLV93.ROW(A_Index, 0xbcd1ff, 0x000000)
	}

    LV_GetText(RetrievedText, A_Index, 8)
    if (RetrievedText = "주문"){
	CLV93.Cell(A_Index, 8, 0xFF9843, 0x000000)
	}
	else if (RetrievedText = "보류"){
	CLV93.ROW(A_Index, 0xFF0000, 0xFFFFFF)
	}
	else if (RetrievedText = "재고"){
	CLV93.Cell(A_Index, 8, 0x00B9F2, 0x000000)
	}
	else if (RetrievedText = "")
	{
		if (Yellowtime1 = OutputVar2){
		CLV93.Cell(A_Index, 8, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar2){
		CLV93.Cell(A_Index, 8, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV93.Cell(A_Index, 8, 0xbcd1ff, 0x000000)
		}
	}
	else
	{
	}

		    LV_GetText(OutputVar7, A_Index, 6)
	if (OutputVar7 = "매장입고"){
		if (Yellowtime1 = OutputVar2){
		CLV93.Cell(A_Index, 6, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar2){
		CLV93.Cell(A_Index, 6, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV93.Cell(A_Index, 6, 0xbcd1ff, 0x000000)
		}
	}
	else
	{
		CLV93.Cell(A_Index, 6, 0x00ff00, 0x000000)

	}
}



        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;~ CLV94.OnMessage()
;~ Gui, Submit, NoHide
;~ GuiControl, -Redraw, %HLV94%
	;~ Sleep, 1
	Gui, 1:ListView, LV94 ; 출고 끝
	CLV94.Clear(1, 1)
Loop % LV_GetCount()
{

		    LV_GetText(OutputVar2, A_Index, 2)
				2어제날짜=%A_Now%
	EnvAdd,2어제날짜,+1,days
	FormatTime,2어제날짜,%2어제날짜%,MM-dd
	FormatTime, Yellowtime1 , , MM-dd
	;~ MsgBox, %Yellowtime1%`n%2output1%
	if (Yellowtime1 = OutputVar2){
	CLV94.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else if (2어제날짜 = OutputVar2){
	CLV94.ROW(A_Index, 0x1F00FF, 0xFFFFFF)
	}
	else
	{
	CLV94.ROW(A_Index, 0x9fbdff, 0x000000)
	}

    LV_GetText(RetrievedText, A_Index, 8)
    if (RetrievedText = "주문"){
	CLV94.Cell(A_Index, 8, 0xFF9843, 0x000000)
	}
	else if (RetrievedText = "보류"){
	CLV94.ROW(A_Index, 0xFF0000, 0xFFFFFF)
	}
	else if (RetrievedText = "재고"){
	CLV94.Cell(A_Index, 8, 0x00B9F2, 0x000000)
	}
	else if (RetrievedText = "")
	{
		if (Yellowtime1 = OutputVar2){
		CLV94.Cell(A_Index, 8, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar2){
		CLV94.Cell(A_Index, 8, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV94.Cell(A_Index, 8, 0x9fbdff, 0x000000)
		}
	}
	else
	{
	}

		    LV_GetText(OutputVar7, A_Index, 6)
	if (OutputVar7 = "매장입고"){
		if (Yellowtime1 = OutputVar2){
		CLV94.Cell(A_Index, 6, 0xFFF000, 0x000000)
		}
		else if (2어제날짜 = OutputVar2){
		CLV94.Cell(A_Index, 6, 0x1F00FF, 0xFFFFFF)
		}
		else
		{
		CLV94.Cell(A_Index, 6, 0x9fbdff, 0x000000)
		}
	}
	else
	{
		CLV94.Cell(A_Index, 6, 0x00ff00, 0x000000)

	}
}


        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
Sleep, 100


;~ GuiControl, 1:+Redraw, %HLV91%
;~ GuiControl, 1:+Redraw, %HLV92%
;~ GuiControl, 1:+Redraw, %HLV93%
;~ GuiControl, 1:+Redraw, %HLV94%

WinSet, Redraw, , ahk_id %HLV91%
WinSet, Redraw, , ahk_id %HLV92%
WinSet, Redraw, , ahk_id %HLV93%
WinSet, Redraw, , ahk_id %HLV94%
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        GuiControl,1:, PG1, 100 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;~ GuiControl, enable, LV91
;~ GuiControl, enable, LV92
;~ GuiControl, enable, LV93
;~ GuiControl, enable, LV94

;~ GuiControl, show, LV91
;~ GuiControl, show, LV92
;~ GuiControl, show, LV93
;~ GuiControl, show, LV94
OutputVar :=
;~ GuiControl, 1:hide, pic09
        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		;~ Gui, 1:Restore
return

refreshedsm:


		SoundPlay, %A_WorkingDir%\sound\효과음12.mp3


refreshedsm1:




CLVedsm := New LV_Colors(HLVedsm)
WinSet, Redraw, , ahk_id %HLVedsm%

GuiControl, 1:-Redraw, %HLVedsm%
;~ WinSet, Redraw, , ahk_id %HLVedsm%

CLVedsm.Clear(1, 1)
GuiControl, 1:hide, lvedsm

GuiControl, 1:show, pic06


Gui, 1:ListView, lvedsm ; 출고 중
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\일일재고관리\*.CSV
{
RegExMatch(A_LoopFileName, "A(.*)_B(.*).CSV", edsmoutput)


RegExMatch(edsmoutput1, "(.*)-(.*)-(.*)", 2date)
;~ NewStr := RegExReplace(edsmoutput1, "-" , Replacement := "")
NewStr := 2date1 2date2 2date3
;~ MsgBox, % NewStr
	;~ If ((month11 <= NewStr) && (NewStr <= month21))
	;~ {
		LV_Add("", "A" edsmoutput1 "_B" edsmoutput2 ".CSV", 2date1, 2date2 "-" 2date3, Get_Weekday(NewStr, parmMode), edsmoutput2)
	;~ }
	;~ else
	;~ {
	;~ }
}
Sleep, 10


;~ Clipboard =

containr = % A_WorkingDir "\부족재고관리\부족재고관리.CSV"


errorlevel =
FileRead, dataCO, %containr%
	if not ErrorLevel  ; 성공적으로 적재됨.
	{
		;~ SoundPlay, %A_WorkingDir%\sound\soundopen.mp3
	}
	else
	{
		;~ SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
		MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
		;~ FileRead, data, %contain%
		return

	}


Gui, 1:ListView, lvCO

{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}

loop, parse, dataCO, `n
{
	x:=[]
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	LV_Add("", x*)
}



GuiControl, 1:+Redraw, %HLVedsm%



GuiControl, 1:show, lvedsm

GuiControl, 1:hide, pic06


lvCO:
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	/*
   CLVedsm.OnMessage()
Gui, Submit, NoHide
;~ GuiControl, -Redraw, %HLV2%
	;~ Sleep, 1

	Gui, 1:ListView, lvedsm ; 출고 중
Loop % LV_GetCount()
{

    LV_GetText(RetrievedText, A_Index, 8)

    if (RetrievedText = "예"){
	CLVedsm.Cell(A_Index, 8, 0xFF31E2, 0x000000)
	}
	else if (RetrievedText = "우"){
	CLVedsm.Cell(A_Index, 8, 0x61C600, 0xFFFFFF)
	}
	else if (RetrievedText = "재"){
	CLVedsm.Cell(A_Index, 8, 0x00B9F2, 0x000000)
	}
	else if (RetrievedText = "크"){
	CLVedsm.Cell(A_Index, 8, 0xFF1733, 0xffffff)
	}
	else if (RetrievedText = ""){
	CLVedsm.Cell(A_Index, 8, 0xFAFBED, 0x000000)
	}
	else
	{
	CLVedsm.Cell(A_Index, 8, 0xFAFBED, 0x000000)
	}


		    LV_GetText(OutputVar7, A_Index, 7)
	if (OutputVar7 = "여"){
	CLVedsm.Cell(A_Index, 7, 0x6CFFEA, 0x000000)
	}
	else if (OutputVar7 = "채"){
	CLVedsm.Cell(A_Index, 7, 0xFFB278, 0x000000)
	}
	else
	{
	CLVedsm.Cell(A_Index, 7, 0xFAFBED, 0x000000)
	}


		    LV_GetText(OutputVar0, A_Index, 1)
	datacsv =
	CSV_Load(OutputVar0, "datacsv")
	newtext := CSV_Search("datacsv", "△")
	NewStr := RegExReplace(newtext, "," , Replacement := "")
	if (NewStr = "0"){
	CLVedsm.ROW(A_Index, 0xFAFBED, 0x000000)
	}
	else
	{
	CLVedsm.ROW(A_Index, 0xFFF000, 0x000000)
}

}
GuiControl, +Redraw, %HLV2%

*/
return



lvedsm:
Gui, 1:ListView, lvedsm
{
if A_GuiEvent = "DoubleClick"
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
LV_GetText(OutputVar, selectRowNum)
Sleep, 100
}
RegExMatch(OutputVar, "A(.*)_B(.*).CSV", ed)


gosub, READedsm
return






refresh3:

		SoundPlay, %A_WorkingDir%\sound\효과음12.mp3


refresh31:




return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Gui, 1:ListView, LV31
Gui, 1:submit, nohide
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}

WinSet, Redraw, , ahk_id %HLV31%

GuiControl, 1:-Redraw, %HLV31%
CLV31.Clear(1, 1)
GuiControl, 1:hide, LV31
GuiControl, 1:disable, LV31


GuiControl, 1:show, pic03

Gui, 1:ListView, LV31 ; 월 간 루 틴
;~ gui, submit, nohide

contain = %A_WorkingDir%\최근제품정보\통합 문서1.csv
errorlevel =
if (data33 = "")
{
FileRead, data33, %contain%
	if not ErrorLevel  ; 성공적으로 적재됨.
	{
		;~ SoundPlay, %A_WorkingDir%\sound\효과음12.mp3
	}
	else
	{
		SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
		MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
		;~ FileRead, data, %contain%
		return

	}
}
else
{
}



중분류3:



Gui, 1:ListView, LV31
Gui, 1:submit, nohide
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}



Sleep, 10
;~ Gui, submit, nohide
if (중분류3 = "선택")
	GuiControl,1:, 소분류3, |선택
else if (중분류3 = "A.목재")
	GuiControl,1:, 소분류3, |01.뉴송|02.소송|03.미송|04.특수목
else if (중분류3 = "B.합판")
	GuiControl,1:, 소분류3, |01.국산합판|02.말리.인니|03.베트남/중국산MLH|04.MDF|05.미송옹이|06.엠보|07.태고|08.코아|09.인테리어합판|10.OSB.TNG|11.자작합판
else if (중분류3 = "C.구조목")
	GuiControl,1:, 소분류3, |01.판재(골만)|02.각재|03.적삼목|04.기타구조목|05.히노끼
else if (중분류3 = "D.방부목")
	GuiControl,1:, 소분류3, |01.방부데크|02.방부각재|03.방부기타|04.천연방부
else if (중분류3 = "E.집성/목망")
	GuiControl,1:, 소분류3, |01.집성판|02.집성계단|03.집성각재|04.대소봉|05.목망|06.기타집성재
else if (중분류3 = "F.합성목재")
	GuiControl,1:, 소분류3, |01.합성목 데크|02.합성목 사이딩|03.합성목 루버|04.합성목 난간|05.합성목 벽체|06.품절
else if (중분류3 = "G.천정재")
	GuiControl,1:, 소분류3, |01.텍스
else if (중분류3 = "H.바닥재")
	GuiControl,1:, 소분류3, |01.구정마루|02.KCC마루|03.후로링|04.다해F&C마루|05.스타강마루
else if (중분류3 = "I.벽체/루바")
	GuiControl,1:, 소분류3, |01.루바|02.유니탑|03.디자인월|04.집성루바|05.하이틴보드
else if (중분류3 = "J.석고보드")
	GuiControl,1:, 소분류3, |01.석고보드|02.시멘트보드
else if (중분류3 = "K.단열재")
	GuiControl,1:, 소분류3, |01.열반사|02.인슐레이션 외|03.스치로폴|04.아이소핑크|05.내벽재
else if (중분류3 = "L.철물")
	GuiControl,1:, 소분류3, |01.피스.못|02.타카|03.실리콘.접착|04.스프레이|05.실린더 경첩 뎀퍼|06.오일스테인/바니쉬|07.기타
else if (중분류3 = "M.비엘텍")
	GuiControl,1:, 소분류3, |01.주춧돌.베이스|02.이음쇠|03.메가타이
else if (중분류3 = "N.기타.운송비.잡비")
	GuiControl,1:, 소분류3, |01.운송비|02.파레트|03.잡다함
else if (중분류3 = "O.차음재")
	GuiControl,1:, 소분류3, |01.패브릭보드|02.타공판|03.목모보드|04.아트보드|05.폴리계란판|06.슈퍼론
else if (중분류3 = "P.재현하늘창")|03.미송|
	GuiControl,1:, 소분류3, |00.몰딩|01.리딩도어|02.리딩 현관도어|03.12바 리딩|04.20바 리딩|05.12바 하늘창|06.20바 하늘창|07.40바 리딩|08.40바 하늘창|09.원슬림|10.리딩목재3연동80바|11.인테리어필름(방염|12.엣지필름|13.ABS도어 시트 변경|14.발포문틀 시트 변|15.연동도어 시트 변|16.고급형 칼라 현관|17.ABS도어|18.맴브레인도어|19.블라인드도어|20.타공도어|21.히든도어|
else if (중분류3 = "R.우딘")
	GuiControl,1:, 소분류3, |01.시그니처도어|02.도어|03.3연동도어|04.피노도어|05.글라스도어|06.기타도어|07.프레임 & 하드웨어|08.보드&마루&아트월
else if (중분류3 = "S.은성프레임")
	GuiControl,1:, 소분류3, |01.은/C012-3(백색)|02.PVC몰딩|03.웨인스코팅||||||||||||||||||||
else if (중분류3 = "T.크로스")
	GuiControl,1:, 소분류3, |||||||||||||||||||||||
else if (중분류3 = "U.화장실용")
	GuiControl,1:, 소분류3, |01.리빙보드|02.PVC몰딩|||||||||||||||||||||
else if (중분류3 = "V.내장재")
	GuiControl,1:, 소분류3, |||||||||||||||||||||||
else if (중분류3 = "W.재단/절단")
	GuiControl,1:, 소분류3, |01.재단|02.타공|||||||||||||||||||||
else if (중분류3 = "X.예림")
	GuiControl,1:, 소분류3, |||||||||||||||||||||||
else if (중분류3 = "Z.업무")
	GuiControl,1:, 소분류3, |||||||||||||||||||||||

else
{
}

GuiControl, disable, LV31
GuiControl, disable, 중분류3
GuiControl, disable, 소분류3


loop, parse, data33, `n
{
	Gui, 1:ListView, LV31
	x:=[]
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	if (중분류3 = ""){
		LV_Add("", x*)
	}
	else
	{
		if InStr(A_LoopField, 중분류3){
		LV_Add("", x*)
		}
		else
		{
		}
	}


}

Sleep, 200
GuiControl, 1:enable, LV31
GuiControl, 1:enable, 중분류3
GuiControl, 1:enable, 소분류3

GuiControl, 1:+Redraw, %HLV31%


GuiControl, 1:enable, LV31
GuiControl, 1:show, LV31



GuiControl, 1:hide, pic03

Sleep, 10
OutputVar :=



return


소분류3:

Gui, 1:submit, nohide
GuiControl, 1:disable, LV31
GuiControl, 1:disable, 중분류3
GuiControl, 1:disable, 소분류3
GuiControl, 1:-Redraw, %HLV31%
WinSet, Redraw, , ahk_id %HLV31%

Gui, 1:ListView, LV31
{
LV_Delete()
;~ Loop,A_LoopField
  ;~ LV_Add("", x*)
}



loop, parse, data33, `n
{
	x:=[]
		Gui, 1:ListView, LV31
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	if (중분류3 = ""){
		LV_Add("", x*)
	}
	else
	{
		if InStr(A_LoopField, 중분류3)&&InStr(A_LoopField, 소분류3){
		LV_Add("", x*)
		}
		else
		{
		}
	}
}
GuiControl, 1:enable, LV31
GuiControl, 1:enable, 중분류3
GuiControl, 1:enable, 소분류3
GuiControl, 1:+Redraw, %HLV31%
return

단가군3:
Gui, 1:submit, nohide
if (단가군3 = "A"){


LV_ModifyCol(9, 0)  ; 매출
LV_ModifyCol(10, 0)  ; B
LV_ModifyCol(11, 0)  ; 소매
LV_ModifyCol(12, 0)  ; C
LV_ModifyCol(8, "90 Integer" "Integer Right")  ; A
}
else if (단가군3 = "매출"){

LV_ModifyCol(8, 0)  ; A

LV_ModifyCol(10, 0)  ; B
LV_ModifyCol(11, 0)  ; 소매
LV_ModifyCol(12, 0)  ; C
LV_ModifyCol(9, "90 Integer" "Integer Right")  ; 매출
}
else if (단가군3 = "B"){

LV_ModifyCol(8, 0)  ; A
LV_ModifyCol(9, 0)  ; 매출

LV_ModifyCol(11, 0)  ; 소매
LV_ModifyCol(12, 0)  ; C
LV_ModifyCol(10, "90 Integer" "Integer Right")  ; B
}
else if (단가군3 = "소매"){

LV_ModifyCol(8, 0)  ; A
LV_ModifyCol(9, 0)  ; 매출
LV_ModifyCol(10, 0)  ; B

LV_ModifyCol(12, 0)  ; C
LV_ModifyCol(11, "90 Integer" "Integer Right")  ; 소매
}
else
{

LV_ModifyCol(8, 0)  ; A
LV_ModifyCol(9, 0)  ; 매출
LV_ModifyCol(10, 0)  ; B
LV_ModifyCol(11, 0)  ; 소매
LV_ModifyCol(12, "90 Integer" "Integer Right")  ; C
}
return




;;;;;;;;;;;;;;;;;;

추가4_1:
{
	FormatTime, addtimetoday, yyyyMMdd, yyyy-MM-dd
상태 := "30"

gosub, 추가4_제거
gosub, read4_1
	FormatTime, addtimetoday1, %vMonthStart1%, yyyy-MM-dd
	FormatTime, addtimetoday2, %vMonthEnd1%, yyyy-MM-dd
GuiControl, 1:, 5t1, %addtimetoday1%
GuiControl, 1:, 5t2, %addtimetoday2%
GuiControl, 1:, 4e1, %addtimetoday1%
GuiControl, 1:, 4e2, %addtimetoday2%
return
}

추가4_2:
{
상태 := "7"
;~ 4ed1 = vDate43
;~ 4ed2 = vDate44
gosub, 추가4_제거
gosub, read4_1
	FormatTime, addtimetoday1, %vDate43%, yyyy-MM-dd
	FormatTime, addtimetoday2, %vDate44%, yyyy-MM-dd
GuiControl, 1:, 5t1, %addtimetoday1%
GuiControl, 1:, 5t2, %addtimetoday2%
GuiControl, 1:, 4e1, %addtimetoday1%
GuiControl, 1:, 4e2, %addtimetoday2%
return
}

추가4_3:
{
	FormatTime, addtimetoday, yyyyMMdd, yyyy-MM-dd
상태 := "2"
4ed1 = 4monthcal
4ed2 = 4monthcal
gosub, 추가4_제거
gosub, read4_1
	FormatTime, addtimetoday1, %4monthcal%, yyyy-MM-dd
	FormatTime, addtimetoday2, %4monthcal%, yyyy-MM-dd
GuiControl, 1:, 5t1, %addtimetoday1%
GuiControl, 1:, 5t2, %addtimetoday2%
GuiControl, 1:, 4e1, %addtimetoday1%
GuiControl, 1:, 4e2, %addtimetoday2%
return

}

추가4_제거:
{
gui, 1:submit, nohide
;~ FormatTime, addtimetoday, %4monthcal%, yyyy-MM-dd
Loop, 7
{
	4ed%A_Index% :=
}
OutputVar :=
data :=
제목 :=

}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




refresh4:

		;~ Gui, 1:Restore
		SoundPlay, %A_WorkingDir%\sound\효과음12.mp3
   CLV41.OnMessage()
   CLV42.OnMessage()
   CLV43.OnMessage()
4monthcal:
refresh41:



SysGet, 권한, MonitorCount
if (권한 >= 2){
}
else
{
	MsgBox, 262192, 알림, 권한이 없어서 안열림, 1
	return
}


Gui, 1:submit, nohide
GuiControl, 1:hide, LV41
GuiControl, 1:hide, LV42
GuiControl, 1:hide, LV43


GuiControl, 1:disable, LV41
GuiControl, 1:disable, LV42
GuiControl, 1:disable, LV43

;~ WinSet, Redraw, , ahk_id %HLV41%
;~ WinSet, Redraw, , ahk_id %HLV42%
;~ WinSet, Redraw, , ahk_id %HLV43%
		;~ SoundPlay, %A_WorkingDir%\sound\효과음12.mp3

GuiControl, 1:-Redraw, %HLV41%
GuiControl, 1:-Redraw, %HLV42%
GuiControl, 1:-Redraw, %HLV43%

;~ WinSet, Redraw, , ahk_id %HLV31%

GuiControl, 1:show, pic04

data:=
data1:=
data2:=
data3:=
data4:=
;~ MsgBox, % 4monthcal
vDate1 := 4monthcal
vMonthStart1 := SubStr(vDate1, 1, 6) "01"
vDay1 := SubStr(vDate1, 7, 2)
vMonthEnd1 := DateAdd(vDate1, -vDay1+32, "Days")
vMonthEnd1 := SubStr(vMonthEnd1, 1, 6)
vMonthEnd1 := DateAdd(vMonthEnd1, -1, "Days")
vMonthEnd1 := SubStr(vMonthEnd1, 1, 8)

GuiControl, , month1_4, %vMonthStart1%
GuiControl, , month2_4, %vMonthEnd1%





vdata := 4monthcal
vDate43 := DateGetWeekStart(vdata,, "yyyyMMdd")
vDate44 := DateGetWeekEnd(vdata,, "yyyyMMdd")
GuiControl, 1:, month3_4, %vDate43%
GuiControl, 1:, month4_4, %vDate44%

GuiControl, 1:, month5_4, %4monthcal%
GuiControl, 1:, month6_4, %4monthcal%





gosub, month_41
gosub, month_43
gosub, month_45



GuiControl, 1:+Redraw, %HLV41%
GuiControl, 1:+Redraw, %HLV42%
GuiControl, 1:+Redraw, %HLV43%



GuiControl, 1:enable, LV41
GuiControl, 1:enable, LV42
GuiControl, 1:enable, LV43


GuiControl, 1:show, LV41
GuiControl, 1:show, LV42
GuiControl, 1:show, LV43

GuiControl, 1:hide, pic04

return




month_41:
month_42:





Gui, 1:ListView, LV41 ; 월 간 루 틴
CLV41.Clear(1, 1)
;~ GuiControl, -Redraw, %HLV41%
;~ GuiControl, -Redraw, %HLV42%
;~ GuiControl, -Redraw, %HLV43%
;~ gui, submit, nohide
OutputVar :=
;~ Clipboard :=
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\사무루틴\*.CSV
{
RegExMatch(A_LoopFileName, "30_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 41output)
RegExMatch(41output1, "2024-(.*)-(.*)", 41date1_)
RegExMatch(41output2, "2024-(.*)-(.*)", 41date2_)

RegExMatch(month1_4, "(.*)000000", month41_1)
RegExMatch(month2_4, "(.*)000000", month41_2)

NewStr4 := RegExReplace(41output1, "-" , Replacement := "")
	If ((month41_11 <= NewStr4) && (NewStr4 <= month41_21))
	{

		rootfile1 = % A_WorkingDir "\사무루틴\" A_LoopFileName

		PERCENT4(rootfile1)
		;~ MsgBox, % COUNT




		LV_Add("", A_WorkingDir "\사무루틴\30_P" 41output1 "_R" 41output2 "_S" 41output3 "_T" 41output4 "_U" 41output5 ".CSV", 41date1_1 "-" 41date1_2, Get_Weekday(NewStr4, parmMode), 41output2, 41output3, 41output4, 41output5, COUNT "%")



}
	else
	{
	}

;~ GuiControl, +Redraw, %HLV41%

}
Sleep, 10
OutputVar :=
return


month_43:
month_44:

Gui, 1:ListView, LV42 ; 주 간 루 틴
CLV42.Clear(1, 1)
;~ gui, submit, nohide
;~ GuiControl, -Redraw, %HLV42%
OutputVar :=
;~ Clipboard :=
data:=
data1:=
data2:=
data3:=
data4:=
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\사무루틴\*.CSV
{
RegExMatch(A_LoopFileName, "7_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 42output)
RegExMatch(42output1, "2024-(.*)-(.*)", 42date1_)
RegExMatch(42output2, "2024-(.*)-(.*)", 42date2_)

RegExMatch(month3_4, "(.*)000000", month42_1)
RegExMatch(month4_4, "(.*)000000", month42_2)

NewStr4 := RegExReplace(42output1, "-" , Replacement := "")
	If ((month42_11 <= NewStr4) && (NewStr4 <= month42_21))
	{

		rootfile2 = % A_WorkingDir "\사무루틴\" A_LoopFileName

		PERCENT4(rootfile2)
		;~ MsgBox, % COUNT




		LV_Add("", A_WorkingDir "\사무루틴\7_P" 42output1 "_R" 42output2 "_S" 42output3 "_T" 42output4 "_U" 42output5 ".CSV", 42date1_1 "-" 42date1_2, Get_Weekday(NewStr4, parmMode), 42output2, 42output3, 42output4, 42output5, COUNT "%")



	}
	else
	{
	}
}
OutputVar :=
;~ GuiControl, +Redraw, %HLV42%
return

month_45:
month_46:


Gui, 1:ListView, LV43 ; 일 일 루 틴
CLV43.Clear(1, 1)
;~ MsgBox, % month1_4
;~ gui, submit, nohide
;~ GuiControl, -Redraw, %HLV43%
OutputVar :=
;~ Clipboard :=
data:=
data1:=
data2:=
data3:=
data4:=

{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\사무루틴\*.CSV
{
RegExMatch(A_LoopFileName, "2_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 43output)
RegExMatch(43output1, "2024-(.*)-(.*)", 43date1_)
RegExMatch(43output2, "2024-(.*)-(.*)", 43date2_)

RegExMatch(month5_4, "(.*)000000", month43_1)
RegExMatch(month6_4, "(.*)000000", month43_2)

NewStr4 := RegExReplace(43output1, "-" , Replacement := "")
	If ((month43_11 <= NewStr4) && (NewStr4 <= month43_21))
	{

		rootfile3 = % A_WorkingDir "\사무루틴\" A_LoopFileName

		PERCENT4(rootfile3)
		;~ MsgBox, % COUNT




		LV_Add("", A_WorkingDir "\사무루틴\2_P" 43output1 "_R" 43output2 "_S" 43output3 "_T" 43output4 "_U" 43output5 ".CSV", 43date1_1 "-" 43date1_2, Get_Weekday(NewStr4, parmMode), 43output2, 43output3, 43output4, 43output5, COUNT "%")


	Sleep, 1
	}

}


return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




추가5_1:
{
	FormatTime, addtimetoday, yyyyMMdd, yyyy-MM-dd
상태 := "30"

gosub, 추가5_제거
gosub, read5_1
	FormatTime, addtimetoday1, %vMonthStart1%, yyyy-MM-dd
	FormatTime, addtimetoday2, %vMonthEnd1%, yyyy-MM-dd
GuiControl, 1:, 5t1, %addtimetoday1%
GuiControl, 1:, 5t2, %addtimetoday2%
GuiControl, 1:, 5e1, %addtimetoday1%
GuiControl, 1:, 5e2, %addtimetoday2%
return
}

추가5_2:
{
상태 := "7"
;~ 5ed1 = vDate43
;~ 5ed2 = vDate44
gosub, 추가5_제거
gosub, read5_1
	FormatTime, addtimetoday1, %vDate43%, yyyy-MM-dd
	FormatTime, addtimetoday2, %vDate44%, yyyy-MM-dd
GuiControl, 1:, 5t1, %addtimetoday1%
GuiControl, 1:, 5t2, %addtimetoday2%
GuiControl, 1:, 5e1, %addtimetoday1%
GuiControl, 1:, 5e2, %addtimetoday2%
return
}

추가5_3:
{
	FormatTime, addtimetoday, yyyyMMdd, yyyy-MM-dd
상태 := "2"
5ed1 = 5monthcal
5ed2 = 5monthcal
gosub, 추가5_제거
gosub, read5_1
	FormatTime, addtimetoday1, %4monthcal%, yyyy-MM-dd
	FormatTime, addtimetoday2, %4monthcal%, yyyy-MM-dd
GuiControl, 1:, 5t1, %addtimetoday1%
GuiControl, 1:, 5t2, %addtimetoday2%
GuiControl, 1:, 5e1, %addtimetoday1%
GuiControl, 1:, 5e2, %addtimetoday2%
return

}

추가5_제거:
{
gui, 1:submit, nohide
;~ FormatTime, addtimetoday, %4monthcal%, yyyy-MM-dd
Loop, 7
{
	5ed%A_Index% :=
}
OutputVar :=
data :=
제목 :=

}
return



refresh5:
	;~ Gui, 1:Restore
		SoundPlay, %A_WorkingDir%\sound\효과음12.mp3

5monthcal:
refresh51:


Gui, 1:submit, nohide
GuiControl, 1:show, pic05

;~ GuiControl, hide, LV51
;~ GuiControl, hide, LV52
;~ GuiControl, hide, LV53

;~ GuiControl, disable, LV51
;~ GuiControl, disable, LV52
;~ GuiControl, disable, LV53

		;~ SoundPlay, %A_WorkingDir%\sound\효과음12.mp3

GuiControl, 1:-Redraw, %HLV51%
GuiControl, 1:-Redraw, %HLV52%
GuiControl, 1:-Redraw, %HLV53%

;~ WinSet, Redraw, , ahk_id %HLV51%
;~ WinSet, Redraw, , ahk_id %HLV52%
;~ WinSet, Redraw, , ahk_id %HLV53%
;~ WinSet, Redraw, , ahk_id %HLV31%

data:=
data1:=
data2:=
data3:=
data4:=
;~ MsgBox, % 5monthcal
vDate1 := 5monthcal
vMonthStart1 := SubStr(vDate1, 1, 6) "01"
vDay1 := SubStr(vDate1, 7, 2)
vMonthEnd1 := DateAdd(vDate1, -vDay1+32, "Days")
vMonthEnd1 := SubStr(vMonthEnd1, 1, 6)
vMonthEnd1 := DateAdd(vMonthEnd1, -1, "Days")
vMonthEnd1 := SubStr(vMonthEnd1, 1, 8)

GuiControl, 1:, month1_5, %vMonthStart1%
GuiControl, 1:, month2_5, %vMonthEnd1%





vdata := 5monthcal
vDate53 := DateGetWeekStart(vdata,, "yyyyMMdd")
vDate54 := DateGetWeekEnd(vdata,, "yyyyMMdd")
GuiControl, 1:, month3_5, %vDate53%
GuiControl, 1:, month4_5, %vDate54%

GuiControl, 1:, month5_5, %5monthcal%
GuiControl, 1:, month6_5, %5monthcal%


gosub, month_51
gosub, month_53
gosub, month_55

GuiControl, 1:hide, pic05

return




month_51:
month_52:




;~ GUI, SUBMIT, NOHIDE

Gui, 1:ListView, LV51 ; 월 간 루 틴
CLV51.Clear(1, 1)
;~ gui, submit, nohide
OutputVar :=
;~ Clipboard :=
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\현장루틴\*.CSV
{
RegExMatch(A_LoopFileName, "30_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 51output)
RegExMatch(51output1, "2024-(.*)-(.*)", 51date1_)
RegExMatch(51output2, "2024-(.*)-(.*)", 51date2_)

RegExMatch(month1_5, "(.*)000000", month51_1)
RegExMatch(month2_5, "(.*)000000", month51_2)

NewStr1 := RegExReplace(51output1, "-" , Replacement := "")
NewStr2 := RegExReplace(51output2, "-" , Replacement := "")
	If ((month51_11 <= NewStr1) && (NewStr1 <= month51_21))
	{

		rootfile51 = % A_WorkingDir "\현장루틴\" A_LoopFileName

		PERCENT(rootfile51)
		;~ MsgBox, % COUNT




		LV_Add("", A_WorkingDir "\현장루틴\30_P" 51output1 "_R" 51output2 "_S" 51output3 "_T" 51output4 "_U" 51output5 ".CSV", 51date1_1 "-" 51date1_2, Get_Weekday(NewStr1, parmMode), 51output2, 51output3, 51output4, 51output5, COUNT "%")



}
	else
	{
	}

;~ GuiControl, +Redraw, %HLV51%

}
Sleep, 10
OutputVar :=
return


month_53:
month_54:

Gui, 1:ListView, LV52 ; 주 간 루 틴
CLV52.Clear(1, 1)
;~ gui, submit, nohide
;~ GuiControl, -Redraw, %HLV52%
OutputVar :=
;~ Clipboard :=
data:=
data1:=
data2:=
data3:=
data4:=
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\현장루틴\*.CSV
{
RegExMatch(A_LoopFileName, "7_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 52output)
RegExMatch(52output1, "2024-(.*)-(.*)", 52date1_)
RegExMatch(52output2, "2024-(.*)-(.*)", 52date2_)

RegExMatch(month3_5, "(.*)000000", month52_1)
RegExMatch(month4_5, "(.*)000000", month52_2)

NewStr1 := RegExReplace(52output1, "-" , Replacement := "")
NewStr2 := RegExReplace(52output2, "-" , Replacement := "")
	If ((month52_11 <= NewStr1) && (NewStr1 <= month52_21))
	{

		rootfile52 = % A_WorkingDir "\현장루틴\" A_LoopFileName

		PERCENT(rootfile52)
		;~ MsgBox, % COUNT




		LV_Add("", A_WorkingDir "\현장루틴\7_P" 52output1 "_R" 52output2 "_S" 52output3 "_T" 52output4 "_U" 52output5 ".CSV", 52date1_1 "-" 52date1_2, Get_Weekday(NewStr1, parmMode), 52output2, 52output3, 52output4, 52output5, COUNT "%")



	}
	else
	{
	}
}
OutputVar :=
;~ GuiControl, +Redraw, %HLV52%
return

month_55:
month_56:


Gui, 1:ListView, LㄹansV53 ; 일 일 루 틴
CLV53.Clear(1, 1)
;~ MsgBox, % month1_4
;~ gui, submit, nohide
;~ GuiControl, -Redraw, %HLV53%
OutputVar :=
;~ Clipboard :=
data:=
data1:=
data2:=
data3:=
data4:=

{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\현장루틴\*.CSV
{
RegExMatch(A_LoopFileName, "2_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 53output)
RegExMatch(53output1, "2024-(.*)-(.*)", 53date1_)
RegExMatch(53output2, "2024-(.*)-(.*)", 53date2_)

RegExMatch(month5_5, "(.*)000000", month53_1)
RegExMatch(month6_5, "(.*)000000", month53_2)

NewStr1 := RegExReplace(53output1, "-" , Replacement := "")
NewStr2 := RegExReplace(53output2, "-" , Replacement := "")
	If ((month53_11 <= NewStr1) && (NewStr1 <= month53_21))
	{

		rootfile53 = % A_WorkingDir "\현장루틴\" A_LoopFileName

		PERCENT(rootfile53)
		;~ MsgBox, % COUNT




		LV_Add("", A_WorkingDir "\현장루틴\2_P" 53output1 "_R" 53output2 "_S" 53output3 "_T" 53output4 "_U" 53output5 ".CSV", 53date1_1 "-" 53date1_2, Get_Weekday(NewStr1, parmMode), 53output2, 53output3, 53output4, 53output5, COUNT "%")


	Sleep, 1
	}

}

GuiControl, 1:+Redraw, %HLV51%
GuiControl, 1:+Redraw, %HLV52%
GuiControl, 1:+Redraw, %HLV53%



;~ GuiControl, enable, LV51
;~ GuiControl, enable, LV52
;~ GuiControl, enable, LV53



;~ GuiControl, show, LV51
;~ GuiControl, show, LV52
;~ GuiControl, show, LV53

		;~ Gui, 1:Restore
return



























return

일정추가:
상태 := "F"
목록 := "내용|장소|담당자|진행률"
밑1칸 := "내용"
밑2칸 := "장소"
밑3칸 := "담당자"
1칸 := "시작일"
2칸 := "목표일"
3칸 := "내용"
gosub, READ9
return


발주서추가:
상태 := "I"
목록 := "품목|단위|수량"
밑1칸 := "품목"
밑2칸 := "단위"
밑3칸 := "수량"
1칸 := "발주일"
2칸 := "입고예정일"
3칸 := "품목"
gosub, READ9
return



입고장추가:

상태 := "J"
목록 := "품목|단위|수량"
밑1칸 := "품목"
밑2칸 := "단위"
밑3칸 := "수량"
1칸 := "입고일"
2칸 := "입고시간"
3칸 := "수량"
gosub, READ9
return


reload:
Reload

GuiClose:
{
	dbDisconnect(myDB)
	exit_sql()
	ExitApp
}

change:
{

WinWait, WMS_VER2 2.0,
IfWinNotActive, WMS_VER2 2.0, , WinActivate, WMS_VER2 2.0,
WinWaitActive, WMS_VER2 2.0,

}

return








; 폴더로부터 파일 이름 목록을 수집해 그것을 ListView에 넣습니다:
lv1:
{
;~ GuiControl, show, pic0
gui, 1:submit, nohide
Gui, 1:ListView, lv1

        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
if A_GuiEvent = DoubleClick
{
	RowNumber = 0
	Loop
	{
		RowNumber := LV_GetNext(RowNumber)

		if not RowNumber
			break
		selectRowNum := RowNumber
	}
	LV_GetText(lv_id, selectRowNum, 1)  ; OutputVar ID
	LV_GetText(lv_날짜, selectRowNum, 11)  ; OutputVar ID
	LV_GetText(lv_요일, selectRowNum, 3)  ; OutputVar ID
	LV_GetText(lv_시간, selectRowNum, 4)  ; OutputVar ID
	LV_GetText(lv_업체, selectRowNum, 5)  ; OutputVar ID
	LV_GetText(lv_출고지, selectRowNum, 6)  ; OutputVar ID
	LV_GetText(lv_절단, selectRowNum, 7)  ; OutputVar ID
	LV_GetText(lv_도어, selectRowNum, 8)  ; OutputVar ID
	LV_GetText(lv_배송자, selectRowNum, 9)  ; OutputVar ID
	LV_GetText(lv_비고, selectRowNum, 12)  ; OutputVar ID
	Sleep, 10
}
	;~ RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_V(.*)_G(.*)_T(.*)_Y", ed)


	;~ wantread = % A_WorkingDir "\매출\" OutputVar

/*
	If FileExist(wantread)
	{
	}
	else
	{
		MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2

			GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		return
	}

			GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	if (ed1="")
	{
			SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
			MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
			GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			;~ FileRead, data, %contain%
			return
	}
	else
	{
		SoundPlay, %A_WorkingDir%\sound\효과음2_4.mp3
	}

		WinShow, 카카오톡

	순수포멧 := "X"
	저장포멧 := "X.CSV"
	변환결과 := "준비중으로저장"
	문구 := "■□□ [Ⅱ. 준비중]"

		FormatTime, time, , yyyy년 MM월 dd일 HH시 mm분
		Sleep, 30
				;~ GuiControl,, myprogress, 0
				RegExMatch(e1, "2024-(.*)-(.*)", edate)
		2NewStr := RegExReplace(e1, "-" , Replacement := "")
		9yoil := Get_Weekday(2NewStr, parmMode)

	요약=
	(
	%문구%

	- 상호 : %ed3%
	- 시간 : %edate1%월%edate2%일(%9yoil%) %ed2%
	- 장소 : %ed4%
	)


	if WinExist(받는분)
	{

		;~ WinWait, 카카오톡,
	;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	;~ WinWaitActive, 카카오톡,

			GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		Sleep, 60
		GuiControl,, myprogress, +10

		Sleep, 10

		GuiControl,, myprogress, +10
		ControlFocus, RICHEDIT50W1, %받는분%

			GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		Sleep, 100
		ControlSend, RICHEDIT50W1,{Space}{Backspace}, %받는분%

		Sleep, 100
		ControlSetText, , %요약%, %받는분%
		ControlSend, , {Enter}, %받는분%
		Sleep, 50

				GuiControl,, myprogress, +10
		Sleep, 100

		;~ Winkill, %받는분%
		Sleep,50

			GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		ControlSend, Edit2, {del 10}{Backspace 10}, 카카오톡
		Sleep, 50
					GuiControl,, myprogress, +10
		;~ WinHide, 카카오톡
	}


	else
	{


	Sleep,50
		;~ WinWait, 카카오톡,
	;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	;~ WinWaitActive, 카카오톡,

	Sleep,50
		GuiControl,, myprogress, +10

	ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23

			GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Sleep,10
	ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
		Sleep,100
				GuiControl,, myprogress, +10
		ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
		Sleep,100
		;~ myprogress, +10
				GuiControl,, myprogress, +10
		ControlSetText, Edit2, , 카카오톡
		Sleep, 50
	;~ ControlSetText, Edit2, %받는분%, 카카오톡
	ControlSend, Edit2, %받는분%, 카카오톡
	Sleep, 100
			GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		GuiControl,, myprogress, +10
		;~ WinWait, 카카오톡,
	;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	;~ WinWaitActive, 카카오톡,
		Sleep, 1000
	controlsend, EVA_Window2, {Enter}, 카카오톡
				GuiControl,, myprogress, +10


		;~ Gui, 출고장:Restore
		;~ WinWait, 출고장,
		;~ IfWinNotActive, 출고장, , WinActivate, 출고장,
		;~ WinWaitActive, 출고장,
		Sleep, 60
		GuiControl,, myprogress, +10

			GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		;~ GuiControl, , e9, %문구%`n`n상호 : %e3%`n시간 : %edate1%월%edate2%일(%yoil%) %e2%`n장소 : %e4%
		;~ ControlSetText, Edit21, %문구%`n`n상호 : %e3%`n시간 : %edate1%월%edate2%일(%yoil%) %e2%`n장소 : %e4%, 출고장
		;~ Sleep, 60
		;~ ControlSend, Edit21, {Ctrl Down}ac{Ctrl Up}, 출고장
		;~ ControlSend, Edit21, {Ctrl Down}ac{Ctrl Up}, 출고장
		;~ Sleep, 100

		;~ WinWait, %받는분%,
		;~ IfWinNotActive, %받는분%, , WinActivate, %받는분%,
		;~ WinWaitActive, %받는분%,
		Sleep, 10


		Sleep, 10

		GuiControl,, myprogress, +10
		ControlFocus, RICHEDIT50W1, %받는분%

		Sleep, 60
		ControlSend, RICHEDIT50W1,{Space}{Backspace}, %받는분%
			Sleep, 100
		ControlSetText, , %요약%, %받는분%
		ControlSend, , {Enter}, %받는분%
		Sleep, 50

			GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
				GuiControl,, myprogress, +10
		;~ Sleep, 100

		;~ Winkill, %받는분%
		;~ Sleep,50

		ControlSend, Edit2, {del 10}{Backspace 10}, 카카오톡
		Sleep, 50
					GuiControl,, myprogress, +10
		;~ WinHide, 카카오톡

	}



	;~ 새로운포멧 = % OutputVar
	;~ 새로운포멧1 = % "A" ed1 "_B" ed2 "_C" ed3 "_D" ed4 "_E" ed5 "_V" ed6 "_G" ed7 "_T" ed8 "_X.CSV"


	;~ MsgBox, %새로운포멧%`n%새로운포멧1%

	1st변환:


			GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			/*
	Sleep, 20
	errorlevel =
	Loop
	{
			;~ GuiControl,, myprogress, +10
		FileMove, %A_WorkingDir%\매출\%새로운포멧%, %A_WorkingDir%\매출\%새로운포멧1% , 1
		if errorlevel = 1
		{
			Sleep, 200
		}
		else
		{
			break
		}
	}
			GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Sleep, 20

	OutputVar = % 새로운포멧1

	;~ MsgBox, % OutputVar
*/
	RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_V(.*)_G(.*)_T(.*)_X", ed)
	상태 = X
		라벨 := "M"
	파일이름 := OutputVar
		제목 := "[Ⅱ. 준비중]"



	;~ SoundPlay, %A_WorkingDir%\sound\1.mp3
		;~ GuiControl,, myprogress, 100
		;~ MsgBox, 262192, 알림, %변환결과%`n변환했습니다!, 0.2
		;~ GuiControl,, myprogress, 0




	  myQuery =
		(
		UPDATE tms
		SET
			상태 = '%상태%'
		WHERE ID = '%lv_id%'
		;

		)
		result := dbQuery(myDB, myQuery)
		if(errorCheck(result)){
			MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
		}else{
		}







	gosub, READ1


	;~ Sleep, 1
	Gui, 출고장:Submit, NoHide
	Gui, 출고장:ListView, lv7
	/*
	Loop % LV_GetCount()
	{
		LV_GetText(RetrievedText, A_Index)
		if (RetrievedText = "●"){
		  ;~ LV_GetNext(StartingRowNumber, RowType)
			CLV7.ROW(A_Index, 0xFF0000, 0xffffff)
		}
		else if (RetrievedText = "★"){
		  ;~ LV_GetNext(StartingRowNumber, RowType)
			CLV7.ROW(A_Index, 0x48ff00, 0x000000)
		}
		else if (RetrievedText = "△"){
		;~ LV_GetNext(StartingRowNumber, RowType)
		CLV7.ROW(A_Index, 0xFFF000, 0x000000)
		}
		else
		{
			CLV7.ROW(A_Index, 0x%칼라%, 0x000000)
		}
	}
	*/
WinSet, Redraw, , ahk_id %HLV7%
;~ GuiControl, hide, pic0



        GuiControl,1:, PG1, 100 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
guicontrol, 출고장:show, direction2
	GuiControl, 출고장:, e0, X
	;~ Gui, 출고장:restore
	}

        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

return





lv2:
	SoundPlay, %A_WorkingDir%\sound\효과음92.mp3
;~ GuiControl, show, pic0

        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
Gui, 1:submit, nohide
Gui, 1:ListView, lv2

if A_GuiEvent = DoubleClick
{
	RowNumber = 0
	Loop
	{
		RowNumber := LV_GetNext(RowNumber)

		if not RowNumber
			break
		selectRowNum := RowNumber
	}
	LV_GetText(lv_id, selectRowNum, 1)  ; OutputVar ID
	LV_GetText(lv_날짜, selectRowNum, 11)  ; OutputVar ID
	LV_GetText(lv_요일, selectRowNum, 3)  ; OutputVar ID
	LV_GetText(lv_시간, selectRowNum, 4)  ; OutputVar ID
	LV_GetText(lv_업체, selectRowNum, 5)  ; OutputVar ID
	LV_GetText(lv_출고지, selectRowNum, 6)  ; OutputVar ID
	LV_GetText(lv_절단, selectRowNum, 7)  ; OutputVar ID
	LV_GetText(lv_도어, selectRowNum, 8)  ; OutputVar ID
	LV_GetText(lv_배송자, selectRowNum, 9)  ; OutputVar ID
	LV_GetText(lv_비고, selectRowNum, 12)  ; OutputVar ID
	Sleep, 10
}



상태 := "X"
	라벨 := "M"
파일이름 := OutputVar
	제목 := "[Ⅱ. 준비중]"

gosub, READ1
        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

        GuiControl,1:, PG1, 100 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
guicontrol, 출고장:show, direction2
;~ GuiControl, hide, pic0

        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
return



lv3:
        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	SoundPlay, %A_WorkingDir%\sound\효과음92.mp3
;~ GuiControl, show, pic0
Gui, 1:submit, nohide
Gui, 1:ListView, lv3

if A_GuiEvent = DoubleClick
{
	RowNumber = 0
	Loop
	{
		RowNumber := LV_GetNext(RowNumber)

		if not RowNumber
			break
		selectRowNum := RowNumber
	}
	LV_GetText(lv_id, selectRowNum, 1)  ; OutputVar ID
	LV_GetText(lv_날짜, selectRowNum, 11)  ; OutputVar ID
	LV_GetText(lv_요일, selectRowNum, 3)  ; OutputVar ID
	LV_GetText(lv_시간, selectRowNum, 4)  ; OutputVar ID
	LV_GetText(lv_업체, selectRowNum, 5)  ; OutputVar ID
	LV_GetText(lv_출고지, selectRowNum, 6)  ; OutputVar ID
	LV_GetText(lv_절단, selectRowNum, 7)  ; OutputVar ID
	LV_GetText(lv_도어, selectRowNum, 8)  ; OutputVar ID
	LV_GetText(lv_배송자, selectRowNum, 9)  ; OutputVar ID
	LV_GetText(lv_비고, selectRowNum, 12)  ; OutputVar ID
	Sleep, 10
}
상태 := "Z"
	라벨 := "M"
파일이름Z := OutputVar
	제목 := "[Ⅲ. 준비끝 완료]"
;~ msgbox, % OutputVar

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
gosub, READ1

        GuiControl,1:, PG1, 100 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
guicontrol, 출고장:show, direction3
        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;~ GuiControl, hide, pic0
return



lv11:
        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	SoundPlay, %A_WorkingDir%\sound\효과음92.mp3
;~ GuiControl, show, pic0
Gui, 1:submit, nohide
Gui, 1:ListView, lv11

if A_GuiEvent = DoubleClick
{
	RowNumber = 0
	Loop
	{
		RowNumber := LV_GetNext(RowNumber)

		if not RowNumber
			break
		selectRowNum := RowNumber
	}
	LV_GetText(lv_id, selectRowNum, 1)  ; OutputVar ID
	LV_GetText(lv_날짜, selectRowNum, 11)  ; OutputVar ID
	LV_GetText(lv_요일, selectRowNum, 3)  ; OutputVar ID
	LV_GetText(lv_시간, selectRowNum, 4)  ; OutputVar ID
	LV_GetText(lv_업체, selectRowNum, 5)  ; OutputVar ID
	LV_GetText(lv_출고지, selectRowNum, 6)  ; OutputVar ID
	LV_GetText(lv_절단, selectRowNum, 7)  ; OutputVar ID
	LV_GetText(lv_도어, selectRowNum, 8)  ; OutputVar ID
	LV_GetText(lv_배송자, selectRowNum, 9)  ; OutputVar ID
	LV_GetText(lv_비고, selectRowNum, 12)  ; OutputVar ID
	Sleep, 10
}


상태 := "W"
	라벨 := "M"
파일이름 := OutputVar
	제목 := "[Ⅳ. 출하 당일]"

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
gosub, READ1

        GuiControl,1:, PG1, 100 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
guicontrol, 출고장:show, direction4
;~ GuiControl, hide, pic0
        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

return






;▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒



;▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒




READ1:

입출고=출고장

;~ Gui, Submit, NoHide
;~ IfExist, \\192.168.0.1\hdd1 or Z:\hdd1
;~ {
;~ }
;~ else
;~ {
	;~ Reload
;~ }

/*
if (ed1="")
{
		SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
		MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
		;~ FileRead, data, %contain%
		return
}
else
{
}
*/

{
	;~ if (상태 = "Y")
		;~ 칼라 := "FFFCF3"
	;~ ELSE if (상태 = "X")
		;~ 칼라 := "FAFBED"
	;~ ELSE if (상태 = "Z")
		;~ 칼라 := "F9FFF5"
	;~ ELSE if (상태 = "F")
		;~ 칼라 := "FFF0FA"
	;~ ELSE if (상태 = "I")
		;~ 칼라 := "FFF0FF"
	;~ ELSE if (상태 = "J")https://melodybox.tistory.com/1952
		;~ 칼라 := "EAF5F8"
	;~ ELSE if (상태 = "W")
	;~ 칼라 := "E0F0F0"
	;~ else
	;~ {
		칼라 := "fff0f0"
	;~ }
}


		;~ Clipboard = %A_WorkingDir%\매출\%OutputVar%


;~ contain := % Clipboard


/*
contain = % A_WorkingDir "\매출\" OutputVar

if (contain = "\\192.168.0.1\hdd1\일정표 최근\일정표220730\")
{
}
else
{
	errorlevel =
FileRead, data, %contain%
	if not ErrorLevel  ; 성공적으로 적재됨.
	{
		;~ SoundPlay, %A_WorkingDir%\sound\soundopen.mp3
	}
	else
	{
		SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
		MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
		;~ FileRead, data, %contain%
		return

	}

}
*/
        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;~ Clipboard :=



Gui, 출고장:Destroy
Gui, 출고장:Default
Gui, 출고장:-SysMenu
Gui, 출고장:+alwaysontop
Gui, 출고장:Font, S19 CDefault W400, Malgun Gothic


Gui, 출고장:Add, picture, x1144 y184 w87 h114 vdirection1, %A_WorkingDir%\direation2.png
Gui, 출고장:Add, picture, y+0 w85 h114 vdirection2, %A_WorkingDir%\direation1.png
Gui, 출고장:Add, picture, y+0 w85 h114 vdirection3, %A_WorkingDir%\direation1.png
Gui, 출고장:Add, picture, y+0 w86 h113 vdirection4, %A_WorkingDir%\direation3.png

guicontrol, 출고장:hide, direction1
guicontrol, 출고장:hide, direction2
guicontrol, 출고장:hide, direction3
guicontrol, 출고장:hide, direction4

gui, 출고장:Add, progress, smooth x10 y135 w1120 h35 cFFBF00 vmyprogress, 0




        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

Gui, 출고장:Font, S13 CDefault W400, Malgun Gothic
Gui, 출고장:Add, button, x10 y+0 w178 h32 g라인추출1,라인 추출
Gui, 출고장:Add, button, x+10 w178 h32 g라인수정1,라인 수정
Gui, 출고장:Font, S13 CDefault W700, Malgun Gothic
Gui, 출고장:Add, button, x+10 w178 h32 g라인추가1,라인 추가
Gui, 출고장:Font, S13 Cred W400, Malgun Gothic
Gui, 출고장:Add, button, x+10 w179 h32 g라인삽입1,라인 삽입
Gui, 출고장:Add, button, x+10 w179 h32 g라인삭제1,라인 삭제
Gui, 출고장:Add, button, x+10 w179 h32 g지우기1,텍스트 지우기
Gui, 출고장:Add, combobox, x10 y+3 w60 h40 vtt1 r3,△|●|★
Gui, 출고장:Add, Edit, x+0 w150 h40 vtt2,
Gui, 출고장:Add, Edit, x+0 w480 h40 vtt3,
Gui, 출고장:Font, S13 CDefault W700, Malgun Gothic
Gui, 출고장:Add, button, x+0 w50 h40 gbtt3, 품목
Gui, 출고장:Font, S17 Cred W400, Malgun Gothic
Gui, 출고장:Add, Edit, x+0 w80 h40 vtt4 ,
Gui, 출고장:Add, UpDown
Gui, 출고장:Add, Edit, x+0 w80 h40 vtt5,
Gui, 출고장:Add, Edit, x+0 w220 h40 vtt6,
Gui, 출고장:Font, S17 CDefault W400, Malgun Gothic
Gui, 출고장:Add, ListView, x10 y+4 w1120 h463 grid vLV7 gLV7 hwndHLV7 -ReadOnly WantF2 NoSortHdr Background%칼라%, 出|로케이션|내용|수량|단위|비고 및 주의사항|no|현재재고|pdt_code


		myQuery =
		(
		SELECT
			tms_list.출,
			wms.loca_1 AS 로케이션,
			tms_list.내용,
			tms_list.수량,
			temp_products4_1.단위 AS 단위,
			tms_list.비고,
			tms_list.no,
			temp_products4_2.현재재고 AS 현재재고,
			tms_list.pdt_code
		FROM
			tms_list
		LEFT JOIN
			temp_products4 AS temp_products4_1 ON tms_list.pdt_code = temp_products4_1.상품코드
		LEFT JOIN
			temp_products4 AS temp_products4_2 ON tms_list.pdt_code = temp_products4_2.상품코드
		LEFT JOIN
			temp_products4 AS temp_products4_3 ON tms_list.pdt_code = temp_products4_3.상품코드
		LEFT JOIN
			wms ON temp_products4_3.관리코드 = wms.product_id
		WHERE
			tms_list.ID = '%lv_id%'
		ORDER BY
			로케이션 ASC;


		)
		result := dbQuery(myDB, myQuery)
		for index1, 1_arr in result
		{
			;		  1_arr[1]  1_arr[2]  1_arr[3]  1_arr[4]   1_arr[5]  1_arr[6]  1_arr[7]  1_arr[8] 1_arr[8]
			; 			출      로케이션     내용     수량     j단위     비고        no       현재재고  pdt코드
			LV_Add("", 1_arr[1], 1_arr[2], 1_arr[3], 1_arr[4], 1_arr[5], 1_arr[6], 1_arr[7], 1_arr[8], 1_arr[9])
		}






LV_ModifyCol(1, "60 Integer" "Integer Center")
LV_ModifyCol(2, "150 Integer" "Integer Left")
LV_ModifyCol(3, 530)
LV_ModifyCol(4, "80 Integer" "Integer Right")
LV_ModifyCol(5, 80)
LV_ModifyCol(6, 190)
LV_ModifyCol(7, 40)
LV_ModifyCol(8, 120)
LV_ModifyCol(9, 120)
Gui, 출고장:Font, S13 CDefault W400, Malgun Gothic
Gui, 출고장:Add, button, x1140 y680 w90 h32 g삭제1,일정 삭제

Gui, 출고장:Font, S19 CDefault W400, Malgun Gothic
Gui, 출고장:Add, Text, x10 y10 w170 h30 -VScroll, 출고날짜
Gui, 출고장:Add, Text, x+10 w130 h30 -VScroll, 출고시각
Gui, 출고장:Add, Text, x+10 w200 h30 -VScroll, 업체명
Gui, 출고장:Add, Text, x+10 w170 h30 -VScroll, 출고지
Gui, 출고장:Add, Text, x+10 w150 h30 -VScroll, 기타사항
Gui, 출고장:Font, S24 CRED W700, Malgun Gothic
Gui, 출고장:Add, Text, x+45 y2 w315 h40 +right -VScroll vtitle, %제목%
Gui, 출고장:Font, S19 c99004C W400, Malgun Gothic
Gui, 출고장:Add, Edit, ReadOnly x10 y+5 w170 h40 -VScroll vt1, %lv_날짜%
Gui, 출고장:Add, Edit, ReadOnly x+10 w130 h40 -VScroll vt2, %lv_시간%
Gui, 출고장:Add, Edit, ReadOnly x+10 w200 h40 -VScroll vt3, %lv_업체%
Gui, 출고장:Add, Edit, ReadOnly x+10 w170 h40 -VScroll vt4, %lv_출고지%
Gui, 출고장:Add, Edit, ReadOnly x+10 w200 h40 -VScroll vt5, %lv_비고%

Gui, 출고장:Add, Edit, ReadOnly x+10 w60 h40 -VScroll vt6, %lv_절단%
Gui, 출고장:Add, Edit, ReadOnly x+10 w60 h40 -VScroll vt7, %lv_도어%
Gui, 출고장:Add, Edit, ReadOnly x+10 w60 h40 -VScroll vt8, %lv_배송자%

Gui, 출고장:Font, S19 CDefault W400, Malgun Gothic
Gui, 출고장:Add, Edit, x10 y+5 w170 h40 -VScroll ve1,
Gui, 출고장:Add, Edit, x+10 w130 h40 -VScroll ve2,
Gui, 출고장:Add, Edit, x+10 w200 h40 -VScroll ve3,
Gui, 출고장:Add, Edit, x+10 w170 h40 -VScroll ve4,
Gui, 출고장:Add, Edit, x+10 w200 h40 -VScroll ve5,

Gui, 출고장:Add, combobox, x+10 w60 h40 -VScroll ve6 r3, |컷|
Gui, 출고장:Add, combobox, x+10 w60 h40 -VScroll ve7 r5, |재|우|크
Gui, 출고장:Add, combobox, x+10 w60 h40 -VScroll ve8 r3, |여|최

Gui, 출고장:Font, S19 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 출고장:Add, button, x1140 y45 w90 h60 c0xFF2211 v상태close g상태close, 닫기

Gui, 출고장:Add, button, y+4 w90 h40 c0xFF2211 v저장1 g저장1, 저장

Gui, 출고장:Font, S13 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 출고장:Add, button, y+5 w90 h20 c0xFF2211 v재시작1 greload, 재시작
;~ Gui, 출고장:Add, button, y+5 w90 h33 c0xFF2211 v카메라1 g카메라1, 카메라

Gui, 출고장:Font, S13 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 출고장:Add, button, y+6 w90 h106 cRED  v리스트로저장 g리스트로저장, Ⅰ`n출고`n리스트업
Gui, 출고장:Add, button, y+10 w90 h108 c0xFF2211  v준비중으로저장 g준비중으로저장, Ⅱ`n준비중
Gui, 출고장:Add, button, y+10 w90 h108 c0xFF2211  v준비완료로저장 g준비완료로저장, Ⅲ`n준비완료
Gui, 출고장:Add, button, y+10 w90 h108 c0xFF2211  v완료출하로저장 g완료출하로저장, Ⅳ`n출하
Gui, 출고장:Font, S1 CDefault W400, Malgun Gothic
Gui, 출고장:Add, Edit, y+10 w50 h30 ve9,
Gui, 출고장:Add, Edit, ReadOnly x+5 w15 h30 vt0 -VScroll,
Gui, 출고장:Add, Edit, x+5 w15 h30 ve0 -VScroll,

Gui, 출고장:Add, Picture, x250 y180 W804 H428 vpic2, %A_WorkingDir%/loading.png
GuiControl, 출고장:hide, pic2

SoundPlay, %A_WorkingDir%\sound\효과음90.mp3


Gui, 출고장:ListView, LV7




;~ CSV_Load(OutputVar, "datacsv")
;~ MsgBox, % CSV_Search("datacsv", "a")


        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;~ MsgBox, % datacsv
;~ loop, parse, data, `n
;~ {
	;~ x:=[]
	;~ loop, parse, A_LoopField, CSV
		;~ x.Insert(A_LoopField)
	;~ LV_Add("", x*)
;~ }
/*
if( ed1 = "")
{
GuiControl, 출고장:, t1, %addtime1%
}
else
{
GuiControl, 출고장:, t1, %ed1%
}

GuiControl, 출고장:, t2, %ed2%
GuiControl, 출고장:, t3, %ed3%
GuiControl, 출고장:, t4, %ed4%
GuiControl, 출고장:, t5, %ed5%
GuiControl, 출고장:, t6, %ed6%
GuiControl, 출고장:, t7, %ed7%
GuiControl, 출고장:, t8, %ed8%
GuiControl, 출고장:, t0, 출고장


if( ed1 = "")
{
GuiControl, 출고장:, e1, %addtime1%
}

else
{
GuiControl, 출고장:, e1, %ed1%
}

*/

GuiControl, 출고장:, e1, %lv_날짜%
GuiControl, 출고장:, e2, %lv_시간%
GuiControl, 출고장:, e3, %lv_업체%
GuiControl, 출고장:, e4, %lv_출고지%
GuiControl, 출고장:, e5, %lv_비고%
GuiControl, 출고장:text, e6, %lv_절단%
GuiControl, 출고장:text, e7, %lv_도어%
GuiControl, 출고장:text, e8, %lv_배송자%
GuiControl, 출고장:, e0, 출고장



;~ recentfile := "A" ed1 "_B" ed2 "_C" ed3 "_D" ed4 "_E" ed5 "_V" ed6 "_G" ed7 "_T"  ed8 "_" 상태 ".CSV"


        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

Sleep, 200

Gui, 출고장:ListView, LV7

CLV7 := New LV_Colors(HLV7)

CLV7.Critical := 100
If !IsObject(CLV7) {
   MsgBox, 0, ERROR, Couldn't create a new LV_Colors object!, 0.1
   ExitApp
}

WinSet, Redraw, , ahk_id %HLV7%
   CLV7.OnMessage()
CLV7.Clear(1, 1)
;~ Gui, 출고장:Submit, NoHide
;~ If (ColorsOn)
   ;~ CLV7.OnMessage()
;~ GuiControl, Focus, %HLV7%
Sleep, 20
리프레쉬:
Loop,1
{
	;~ Sleep, 1
	;~ Gui, 출고장:Submit, NoHide
	Gui, 출고장:ListView, lv7
	Loop % LV_GetCount()
	{
		LV_GetText(RetrievedText, A_Index)
		if (RetrievedText = "●"){
		  ;~ LV_GetNext(StartingRowNumber, RowType)
			CLV7.ROW(A_Index, 0xFF0000, 0xffffff)
		}
		else if (RetrievedText = "★"){
		  ;~ LV_GetNext(StartingRowNumber, RowType)
			CLV7.ROW(A_Index, 0x48ff00, 0x000000)
		}
		else if (RetrievedText = "△"){
		;~ LV_GetNext(StartingRowNumber, RowType)
		CLV7.ROW(A_Index, 0xFFF000, 0x000000)
		}
		else
		{
			CLV7.ROW(A_Index, 0x%칼라%, 0x000000)
		}
	}
;~ WinSet, Redraw, , ahk_id %HLV7%
}

	if (상태 = "Y")
	{
		guicontrol, 출고장:hide, 리스트로저장
		guicontrol, 출고장:show, 준비중으로저장
		guicontrol, 출고장:hide, 준비완료로저장
		guicontrol, 출고장:hide, 완료출하로저장
	}
	else if (상태 = "X")
	{
		guicontrol, 출고장:show, 리스트로저장
		guicontrol, 출고장:hide, 준비중으로저장
		guicontrol, 출고장:show, 준비완료로저장
		guicontrol, 출고장:hide, 완료출하로저장
	}
	else if (상태 = "Z")
	{
		guicontrol, 출고장:hide, 리스트로저장
		guicontrol, 출고장:show, 준비중으로저장
		guicontrol, 출고장:hide, 준비완료로저장
		guicontrol, 출고장:show, 완료출하로저장
	}
	else if (상태 = "W")
	{
		guicontrol, 출고장:hide, 리스트로저장
		guicontrol, 출고장:hide, 준비중으로저장
		guicontrol, 출고장:show, 준비완료로저장
		guicontrol, 출고장:hide, 완료출하로저장
	}
	else
	{
		guicontrol, 출고장:hide, 리스트로저장
		guicontrol, 출고장:hide, 준비중으로저장
		guicontrol, 출고장:show, 준비완료로저장
		guicontrol, 출고장:hide, 완료출하로저장
	}


        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;~ MsgBox, 262144, 알림, 일정 가저오기 완료, 0.8

;~ if (상태 = "Y")
;~ GuiControl, show, pic2
;~ 순수포멧 := "Y"
;~ 저장포멧 := "Y.CSV"
;~ 변환결과 := "[Ⅰ. 출고 리스트 업]"
;~ GuiControl, , e0, Y

	;~ gosub, 리스트만따로문자보내기

GUI, 출고장:Show, w1240 h730 x25 y0, 출고장

WinWait, 출고장,
IfWinNotActive, 출고장, , WinActivate, 출고장,
WinWaitActive, 출고장,

data :=

	입출고 = 출고장

return





카메라1:
{
		if( 상태 = "C" ) or ( 상태 = "B" ) or ( 상태 = "A" ) or ( 상태 = "D" ){
		받는분 = 신흥목재매입
		}
		else
		{
		받는분 = 신흥목재카톡방
		}


	gui, 출고장:submit, nohide
					GuiControl,, myprogress, 0
					;~ GuiControl,, myprogress, +10
	Winshow, 카메라
Runwait, %ComSpec% /c start microsoft.windows.camera:
Sleep, 1000
	Winshow, 카메라
WinWaitActive, 카메라
				GuiControl,, myprogress, +10
;~ WinSet, AlwaysOnTop , On, 카메라
WinMaximize, 카메라
		SoundBeep, 1000, 1000
						GuiControl,, myprogress, +10
SoundPlay, %A_WorkingDir%\sound\인증샷.mp3

MsgBox, 262209, 카메라 동작, 사진을 찍으시겠습니까?
	IfMsgBox OK
	{

		Sleep, 10
		;~ gui, submit, nohide
		;~ WinSet, AlwaysOnTop , On, 출고장

		WinShow, 카카오톡
				Sleep, 10
			WinWait, 카카오톡,
			IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
			WinWaitActive, 카카오톡,
				GuiControl,, myprogress, +10
		Sleep,100
ControlClick, EVA_ChildWindow1, 카카오톡 ,,,, x36 y85
		Sleep,300
		;~ MsgBox, 262209, 1,1
				GuiControl,, myprogress, +10
Sleep,100

ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
		Sleep,500

ControlSetText, Edit2, , 카카오톡
GuiControl,, myprogress, +10
controlsend, Edit2, %받는분%, 카카오톡
Sleep, 100
;~ controlsend, Edit2, {Enter}, 카카오톡
		GuiControl,, myprogress, +10
Sleep, 500
controlsend, Edit2, {Enter}, 카카오톡
		;~ FormatTime, time, , yyyy년 MM월 dd일 HH시 mm분
		Sleep, 300
				;~ GuiControl,, myprogress, +10
				;~ RegExMatch(e1, "2024-(.*)-(.*)", edate)


		;~ GuiControl, , e9, %문구%`n`n상호 : %e3%`n시간 : %edate1%월%edate%일 %e2%`n장소 : %e4%
		;~ Sleep, 200
		;~ ControlSend, Edit21, {CtrlDown}a{CtrlUp}, 출고장
		;~ Sleep, 200
		;~ ControlSend, Edit21, {CtrlDown}x{CtrlUp}, 출고장
		;~ Sleep, 200

				GuiControl,, myprogress, +10

	CaptureScreen("140, 140, 1700, 970", False, 0)
	WinHide, 카메라
				;~ GuiControl,, myprogress, +10
						WinWait, %받는분%,
IfWinNotActive, %받는분%, , WinActivate, %받는분%,
WinWaitActive, %받는분%,
		ControlFocus, RICHEDIT50W1, %받는분%

	ControlSend, RICHEDIT50W1,{Space}{Backspace}, %받는분%
		Sleep, 100
		if( 상태 = "C" ) or ( 상태 = "B" ) or ( 상태 = "A" ) or ( 상태 = "D" ){

			ControlSend, RICHEDIT50W1, 상호 : %e3%{Enter}, %받는분%
			;~ Send, 상호 : %e3%{Enter}
			}
		else
		{
			;~ Send, 상호 : %e3%{Enter}
			ControlSend, RICHEDIT50W1, 상호 : %e3%{Enter}, %받는분%
		}

		Sleep, 100

				GuiControl,, myprogress, +10
		;~ Send, {CtrlDown}v{CtrlUp}{Enter}
		;~ Send,{Enter}


			ControlSend, RICHEDIT50W1, {CtrlDown}v{CtrlUp}{Enter}, %받는분%
			ControlSend, RICHEDIT50W1, {Enter}, %받는분%

		Sleep, 1000



				GuiControl,, myprogress, 100
		Sleep, 300

		;~ Winkill, %받는분%
		Sleep,300

		ControlSetText, Edit2, , 카카오톡
		Sleep, 300

		;~ WinHide, 카카오톡
		;~ WinSet, AlwaysOnTop , Off, 출고장
		;~ guicontrol, show, 상태close
		;~ guicontrol, show, 저장1
		;~ guicontrol, show, 리스트로저장
		;~ guicontrol, show, 피킹으로저장
		;~ guicontrol, show, 준비완료로저장
		;~ guicontrol, show, 완료출하로저장
		;~ GuiControl, hide, pic2
		ControlSend, Edit2, {Del 30}{BackSpace 30}, ahk_class EVA_Window_Dblclk
		Sleep, 100
						SoundPlay, %A_WorkingDir%\sound\사진전송완료.mp3
				GuiControl,, myprogress, 0
	}
	IfMsgBox cancel
	{
		SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
		WinMinimize, 카메라


		return
	}

}
return




라인추출1:

ControlGet, Col1, List , selected Col1, SysListView321, 출고장 ;2 모델
GuiControl, 출고장:, tt1 , %Col1%
ControlGet, Col2, List , selected Col2, SysListView321, 출고장 ;2 모델
GuiControl, 출고장:, tt2 , %Col2%
ControlGet, Col3, List , selected Col3, SysListView321, 출고장 ;2 모델
GuiControl, 출고장:, tt3 , %Col3%
ControlGet, Col4, List , selected Col4, SysListView321, 출고장 ;2 모델
GuiControl, 출고장:, tt4 , %Col4%
ControlGet, Col5, List , selected Col5, SysListView321, 출고장 ;2 모델
GuiControl, 출고장:, tt5 , %Col5%
ControlGet, Col6, List , selected Col6, SysListView321, 출고장 ;2 모델
GuiControl, 출고장:, tt6 , %Col6%

;~ gosub, 리프레쉬
return





라인추가1:

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Add(,tt1,tt2,tt3,tt4,tt5,tt6)
	;~ gosub, 리프레쉬
return




라인삽입1:

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Insert(selectRowNum , ,tt1,tt2,tt3,tt4,tt5,tt6)
	gosub, 리프레쉬
return




라인삭제1:

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Delete(selectRowNum)
	gosub, 리프레쉬
return




라인수정1:

Gui, 출고장:Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_Modify(selectRowNum , ,tt1,tt2,tt3,tt4,tt5,tt6)
	gosub, 리프레쉬
return




라인완료1:

지우기1:
GuiControl, 출고장:, tt1,
GuiControl, 출고장:, tt2,
GuiControl, 출고장:, tt3,
GuiControl, 출고장:, tt4,
GuiControl, 출고장:, tt5,
GuiControl, 출고장:, tt6,



return









LV7:




Gui, %입출고%:ListView, lv7
if (A_GuiEvent = "DoubleClick")
{






SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(OutputVar, selectRowNum)
	if (OutputVar = "●" || OutputVar = "" || OutputVar = "△")
	{

		;~ Gui, 1:-alwaysontop
		;~ Gui, %입출고%:-alwaysontop
		MsgBox, 262196, 제품 준비 여부, `n`n`        준비 됐습니까?        `n`n
		{
			IfMsgBox Yes
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3

				;~ Send, {F2}
				ControlSend, SysListView321, {F2}, %입출고%
								Sleep, 100
				;~ ControlSend, SysListView321, ●{ENTER}, %입출고%
				;~ Sleep, 100
				SEND, ●{ENTER}
					;~ Sleep, 100



			}
			IfMsgBox NO
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3

				;~ Send, {F2}
				ControlSend, SysListView321, {F2}, %입출고%
								Sleep, 100
				;~ ControlSend, SysListView321, {del 3}{Backspace }, %입출고%
				;~ Sleep, 100
				SEND, {del 3}{Backspace 3}
				;~ Sleep, 100
			}

		}
	}
	else
	{
		Sleep, 50
		return
	}

;~ WinSet, Redraw, , ahk_id %HLV7%
   ;~ CLV7.OnMessage()

Gui, %입출고%:Submit, NoHide
;~ If (ColorsOn)
   ;~ CLV7.OnMessage()
GuiControl, Focus, %HLV7%

Gui, %입출고%:Submit, NoHide



Gui, %입출고%:ListView, lv7


If(입출고 = "입고장")
{

	Loop % LV_GetCount()
	{
		LV_GetText(RetrievedText, A_Index)
		if (RetrievedText = "●"){
		  ;~ LV_GetNext(StartingRowNumber, RowType)
			CLV7.ROW(A_Index, 0x0000ff, 0xffffff)
		}
		else if (RetrievedText = "★"){
		  ;~ LV_GetNext(StartingRowNumber, RowType)
			CLV7.ROW(A_Index, 0x6600FF, 0xffff)
		}
		else if (RetrievedText = "△"){
		;~ LV_GetNext(StartingRowNumber, RowType)
			CLV7.ROW(A_Index, 0xFFF000, 0x000000)
		}
		else
		{
			CLV7.ROW(A_Index, 0x%칼라%, 0x000000)
		}
	}
}
else
{
	Loop % LV_GetCount()
	{
		LV_GetText(RetrievedText, A_Index)
		if (RetrievedText = "●"){
		  ;~ LV_GetNext(StartingRowNumber, RowType)
			CLV7.ROW(A_Index, 0xFF0000, 0xffffff)
		}
		else if (RetrievedText = "★"){
		  ;~ LV_GetNext(StartingRowNumber, RowType)
			CLV7.ROW(A_Index, 0x48ff00, 0x000000)
		}
		else if (RetrievedText = "△"){
		;~ LV_GetNext(StartingRowNumber, RowType)
			CLV7.ROW(A_Index, 0xFFF000, 0x000000)
		}
		else
		{
			CLV7.ROW(A_Index, 0x%칼라%, 0x000000)
		}
	}
}
GuiControl, %입출고%:Choose, LV7, 0
;~ Gui, %입출고%:Restore

return
}
/*

if (A_GuiEvent = "D")
{
	SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(OutputVar, selectRowNum)
	Sleep, 10
	;~ MsgBox, % OutputVar
	if (OutputVar = "●" || OutputVar = "★")
	{
		;~ Gui, 1:-alwaysontop
		;~ Gui, %입출고%:-alwaysontop
		MsgBox, 262212, 크로스체크, 크로스채크 하셨습니까?
		{
			IfMsgBox Yes
			{
								SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
				Sleep, 100
				Send, {F2}
				Sleep, 100
				SEND, ★{ENTER}
					Sleep, 100



			}
			IfMsgBox NO
			{
								SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
				Sleep, 100
				Send, {F2}
				Sleep, 100
				SEND, ●{ENTER}
				Sleep, 100
			}

		}
	}
	else
	{
		Sleep, 100
		return
	}
WinSet, Redraw, , ahk_id %HLV7%
   CLV7.OnMessage()

Gui, Submit, NoHide
If (ColorsOn)
   CLV7.OnMessage()
GuiControl, Focus, %HLV7%
}
;~ Gui, Submit, NoHide

Gui, %입출고%:ListView, lv7
Loop % LV_GetCount()
{
	LV_GetText(RetrievedText, A_Index)
	if (RetrievedText = "●"){
	  ;~ LV_GetNext(StartingRowNumber, RowType)
		CLV7.ROW(A_Index, 0xFF0000, 0xffffff)
	}
	else if (RetrievedText = "★"){
	  ;~ LV_GetNext(StartingRowNumber, RowType)
		CLV7.ROW(A_Index, 0x48ff00, 0x000000)
	}
	else if (RetrievedText = "△"){
	;~ LV_GetNext(StartingRowNumber, RowType)
	CLV7.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else
	{
		CLV7.ROW(A_Index, 0x%칼라%, 0x000000)
	}
}


*/

return






리스트로저장:
	GuiControl,, myprogress, +10
gui, 출고장:submit, nohide
SoundPlay, %A_WorkingDir%\sound\효과음201.mp3
GuiControl, 출고장:show, pic2
순수포멧 := "Y"
저장포멧 := "Y.CSV"
변환결과 := "[Ⅰ. 출고 리스트 업]"
문구 := "□□□ [Ⅰ. 출고리스트업]"
이전포멧 := 상태
GuiControl, 출고장:, e0, Y
;~ WinSetTitle, 출고장, , Y
상태 := 순수포멧
;~ SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\골리앗1.mp3
gosub, 문자보내기
Sleep,100
return

준비중으로저장:
	GuiControl,, myprogress, +10
gui, 출고장:submit, nohide
SoundPlay, %A_WorkingDir%\sound\효과음202.mp3
GuiControl, 출고장:show, pic2
순수포멧 := "X"
저장포멧 := "X.CSV"
변환결과 := "준비중으로저장"
문구 := "■□□ [Ⅱ. 준비중]"
이전포멧 := 상태
;~ WinSetTitle, 출고장, , X
상태 := 순수포멧
GuiControl, 출고장:, e0, X
gosub, 문자보내기
Sleep,100
return

준비완료로저장:
	GuiControl,, myprogress, +10
gui, 출고장:submit, nohide
SoundPlay, %A_WorkingDir%\sound\효과음203.mp3
GuiControl, 출고장:show, pic2
순수포멧 := "Z"
저장포멧 := "Z.CSV"
변환결과 := "준비완료로저장"
문구 := "■■□ [Ⅲ. 준비완료]"
이전포멧 := 상태
;~ WinSetTitle, 출고장, , Z
상태 := 순수포멧
GuiControl, 출고장:, e0, Z

gosub, 문자보내기
Sleep,100
return


완료출하로저장:
	GuiControl,, myprogress, +10
gui, 출고장:submit, nohide
SoundPlay, %A_WorkingDir%\sound\효과음204.mp3
GuiControl, 출고장:show, pic2
순수포멧 := "W"
저장포멧 := "W.CSV"
변환결과 := "완료(출고)로저장"
문구 := "■■■ [Ⅳ. 출고 끝 당일]"
이전포멧 := 상태
;~ WinSetTitle, 출고장, , W
상태 := 순수포멧
GuiControl, 출고장:, e0, W
gosub, 문자보내기
Sleep,100
return





문자보내기:
;~ SoundPlay, %A_WorkingDir%\sound\골리앗2.mp3
;~ WinGetTitle, 상태 ,





리스트만따로문자보내기:
	WinShow, 카카오톡

;~ Sleep,10

gui, 출고장:submit,nohide

guicontrol, 출고장:hide, direction1
guicontrol, 출고장:hide, direction2
guicontrol, 출고장:hide, direction3
guicontrol, 출고장:hide, direction4

guicontrol, 출고장:hide, 상태close
guicontrol, 출고장:hide, 저장1
guicontrol, 출고장:hide, 리스트로저장
guicontrol, 출고장:hide, 준비중으로저장
guicontrol, 출고장:hide, 준비완료로저장
guicontrol, 출고장:hide, 완료출하로저장
;~ WinSet, AlwaysOnTop , On, 출고장



if WinExist(받는분)
{


	;~ WinWait, 카카오톡,
;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
;~ WinWaitActive, 카카오톡,


	FormatTime, time, , yyyy년 MM월 dd일 HH시 mm분
	Sleep, 30
			;~ GuiControl,, myprogress, 0
			RegExMatch(lv_날짜, "20(.*)-(.*)-(.*)", edate)
	;~ 2NewStr := RegExReplace(e1, "-" , Replacement := "")
	;~ 9yoil := Get_Weekday(2NewStr, parmMode)

요약=
(
%문구%

- 상호 : %lv_업체%
- 시간 : %edate2%월%edate3%일(%lv_요일%) %lv_시간%
- 장소 : %lv_출고지%
)


	;~ Gui, 출고장:Restore
	;~ WinWait, 출고장,
	;~ IfWinNotActive, 출고장, , WinActivate, 출고장,
	;~ WinWaitActive, 출고장,
	Sleep, 60
	GuiControl,, myprogress, +10

	;~ GuiControl, , e9, %문구%`n`n상호 : %e3%`n시간 : %edate1%월%edate2%일(%yoil%) %e2%`n장소 : %e4%
	;~ ControlSetText, Edit21, %문구%`n`n상호 : %e3%`n시간 : %edate1%월%edate2%일(%yoil%) %e2%`n장소 : %e4%, 출고장
	;~ Sleep, 60
	;~ ControlSend, Edit21, {Ctrl Down}ac{Ctrl Up}, 출고장
	;~ Loop
	;~ {
		;~ if (Clipboard = ""){
			;~ ControlSend, Edit21, {Ctrl Down}ac{Ctrl Up}, 출고장
		;~ }
		;~ else
		;~ {
			;~ break
		;~ }
	;~ }

	;~ ControlSend, Edit21, {Ctrl Down}ac{Ctrl Up}, 출고장
	;~ Sleep, 100

	;~ WinWait, %받는분%,
	;~ IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	;~ WinWaitActive, %받는분%,
	Sleep, 10

	GuiControl,, myprogress, +10
	ControlFocus, RICHEDIT50W1, %받는분%

	Sleep, 60
	ControlSend, RICHEDIT50W1,{Space}{Backspace}, %받는분%
		Sleep, 100
	ControlSetText, , %요약%, %받는분%
	ControlSend, , {Enter}, %받는분%
	;~ Sleep, 50

	Sleep, 50

			GuiControl,, myprogress, +10
	;~ Winkill, %받는분%
	Sleep,50

	ControlSend, Edit2, {del 10}{Backspace 10}, 카카오톡
	;~ Sleep, 50
				GuiControl,, myprogress, +10
	;~ WinHide, 카카오톡
}
else
{


;~ Sleep,50
	;~ WinWait, 카카오톡,
;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
;~ WinWaitActive, 카카오톡,

Sleep,50
	GuiControl,, myprogress, +10

ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23

Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	Sleep,100
			GuiControl,, myprogress, +10
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100
	;~ myprogress, +10
			GuiControl,, myprogress, +10
	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
;~ ControlSetText, Edit2, %받는분%, 카카오톡
ControlSend, Edit2, %받는분%, 카카오톡
Sleep, 100
	GuiControl,, myprogress, +10
	;~ WinWait, 카카오톡,
;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
;~ WinWaitActive, 카카오톡,
	Sleep, 100
controlsend, EVA_Window2, {Enter}, 카카오톡
			GuiControl,, myprogress, +10

	FormatTime, time, , yyyy년 MM월 dd일 HH시 mm분
	Sleep, 30
			;~ GuiControl,, myprogress, 0
			RegExMatch(lv_날짜, "20(.*)-(.*)-(.*)", edate)
	;~ 2NewStr := RegExReplace(e1, "-" , Replacement := "")
	;~ 9yoil := Get_Weekday(2NewStr, parmMode)

요약=
(
%문구%

- 상호 : %lv_업체%
- 시간 : %edate2%월%edate3%일(%lv_요일%) %lv_시간%
- 장소 : %lv_출고지%
)



	;~ Gui, 출고장:Restore
	;~ WinWait, 출고장,
	;~ IfWinNotActive, 출고장, , WinActivate, 출고장,
	;~ WinWaitActive, 출고장,
	Sleep, 60
	GuiControl,, myprogress, +10

	;~ GuiControl, , e9, %문구%`n`n상호 : %e3%`n시간 : %edate1%월%edate2%일(%yoil%) %e2%`n장소 : %e4%
	;~ ControlSetText, Edit21, %문구%`n`n상호 : %e3%`n시간 : %edate1%월%edate2%일(%yoil%) %e2%`n장소 : %e4%, 출고장
	;~ Sleep, 60
	;~ ControlSend, Edit21, {Ctrl Down}ac{Ctrl Up}, 출고장
	;~ ControlSend, Edit21, {Ctrl Down}ac{Ctrl Up}, 출고장
	;~ Sleep, 100

	;~ WinWait, %받는분%,
	;~ IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	;~ WinWaitActive, %받는분%,
	Sleep, 10


	Sleep, 10

	GuiControl,, myprogress, +10
	ControlFocus, RICHEDIT50W1, %받는분%

	Sleep, 60
	ControlSend, RICHEDIT50W1,{Space}{Backspace}, %받는분%
		Sleep, 100
	ControlSetText, , %요약%, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 50

			GuiControl,, myprogress, +10
	;~ Sleep, 100

	;~ Winkill, %받는분%
	;~ Sleep,50

	ControlSend, Edit2, {del 10}{Backspace 10}, 카카오톡
	Sleep, 50
				GuiControl,, myprogress, +10
	;~ WinHide, 카카오톡

}



          myQuery =
            (
			UPDATE tms
			SET
				상태 = '%상태%'
			WHERE ID = '%lv_id%'
			;

			)
            result := dbQuery(myDB, myQuery)
			if(errorCheck(result)){
				MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
			}else{
			}



;~ SoundPlay, %A_WorkingDir%\sound\1.mp3
	GuiControl,, myprogress, 100
	;~ MsgBox, 262192, 알림, %변환결과%`n변환했습니다!, 0.1

Sleep, 10

;~ guicontrol, show, 리스트로저장
;~ guicontrol, show, 피킹으로저장
;~ guicontrol, show, 준비완료로저장
;~ guicontrol, show, 완료출하로저장
guicontrol, 출고장:,title, %변환결과%

Sleep, 10
if (순수포멧 = "Y")
{

guicontrol, 출고장:show, direction1
guicontrol, 출고장:hide, direction2
guicontrol, 출고장:hide, direction3
guicontrol, 출고장:hide, direction4

guicontrol, 출고장:hide, 리스트로저장
guicontrol, 출고장:show, 준비중으로저장
guicontrol, 출고장:hide, 준비완료로저장
guicontrol, 출고장:hide, 완료출하로저장
SoundPlay, %A_WorkingDir%\sound\출고로이동완료.mp3
}
else if (순수포멧 = "X")
{
guicontrol, 출고장:hide, direction1
guicontrol, 출고장:show, direction2
guicontrol, 출고장:hide, direction3
guicontrol, 출고장:hide, direction4

guicontrol, 출고장:show, 리스트로저장
guicontrol, 출고장:hide, 준비중으로저장
guicontrol, 출고장:show, 준비완료로저장
guicontrol, 출고장:hide, 완료출하로저장
SoundPlay, %A_WorkingDir%\sound\준비중으로이동완료.mp3
}
else if (순수포멧 = "Z")
{
guicontrol, 출고장:hide, direction1
guicontrol, 출고장:hide, direction2
guicontrol, 출고장:show, direction3
guicontrol, 출고장:hide, direction4

guicontrol, 출고장:hide, 리스트로저장
guicontrol, 출고장:show, 준비중으로저장
guicontrol, 출고장:hide, 준비완료로저장
guicontrol, 출고장:show, 완료출하로저장
SoundPlay, %A_WorkingDir%\sound\준비완료.mp3
}
else if (순수포멧 = "W")
{
guicontrol, 출고장:hide, direction1
guicontrol, 출고장:hide, direction2
guicontrol, 출고장:hide, direction3
guicontrol, 출고장:show, direction4

guicontrol, 출고장:hide, 리스트로저장
guicontrol, 출고장:hide, 준비중으로저장
guicontrol, 출고장:show, 준비완료로저장
guicontrol, 출고장:hide, 완료출하로저장
SoundPlay, %A_WorkingDir%\sound\촐하완료.mp3
}
else
{
}

Sleep, 10
GuiControl, 출고장:, t1, %e1%
GuiControl, 출고장:, t2, %e2%
GuiControl, 출고장:, t3, %e3%
GuiControl, 출고장:, t4, %e4%
GuiControl, 출고장:, t5, %e5%
GuiControl, 출고장:ChooseString, t6, %e6%
GuiControl, 출고장:ChooseString, t7, %e7%
GuiControl, 출고장:ChooseString, t8, %e8%
GuiControl, 출고장:, t0, %e0%


Sleep, 10


GuiControl, 출고장:Hide, pic2
guicontrol, 출고장:show, 상태close
guicontrol, 출고장:show, 저장1
Sleep, 100


;~ MsgBox, 출고장
;~ WinSet, AlwaysOnTop , on, 출고장
	;~ FileMove, %A_WorkingDir%\매출\삭제일정\%새로운포멧%, %A_WorkingDir%\매출\%새로운포멧1% , 1
	GuiControl,, myprogress, 0

	Clipboard =
	;~ Gui, 출고장:Restore
return





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ "A" ed1 "_B" ed2 "_C" ed3 "_D" ed4 "_E" ed5 "_V" ed6 "_G" ed7 "_" 상태 ".CSV"

저장1:
		SoundPlay, %A_WorkingDir%\sound\효과음92.mp3

IF(( 상태 = "B" ) or ( 상태 = "C" ) or ( 상태 = "A" ) or ( 상태 = "D" ))
{
	gui, 입고장:submit, nohide


	/*
	AA = 0
	Loop, 8
	{
		AA++
	bA := RegExReplace(e%A%, "_" , Replacement := "")
	GuiControl, 입고장:, e%A%, %bA%
	}
	AA = 0
	Sleep, 10

	deletefile := % "A" t1 "_B" t2 "_C" t3 "_D" t4 "_E" t5 "_V" t6 "_G" t7 "_" 상태 ".CSV"
	;~ deletefile := % "A" t1 "_B" t2 "_C" t3 "_D" t4 "_E" t5 "_V" t6 "_G" t7  "_T" t8 "_" 상태 ".CSV"
	   newfile := % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_V" e6 "_G" e7 "_" 상태 ".CSV"
	   ;~ newfile := % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_V" e6 "_G" e7  "_T" e8 "_" 상태 ".CSV"
	root1 := % A_WorkingDir "\매입\" deletefile
	root2 := % A_WorkingDir "\매입\삭제일정\" deletefile

	If FileExist(root1)
	{
	}
	else
	{
		MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요1, 2
		return
	}


		Sleep, 20
		GuiControl,, myprogress, 10
		GuiControl, 입고장:show, pic2
		guicontrol, 입고장:hide, 상태close
		guicontrol, 입고장:hide, 저장1
		guicontrol, 입고장:hide, 입하리스트업저장
		guicontrol, 입고장:hide, 입하입고진행중저장
		guicontrol, 입고장:hide, 입하완료
		guicontrol, 입고장:hide, 입고완료저장

	*/
}
else
{
	gui, 출고장:submit, nohide
	/*
	AA = 0
	Loop, 8
	{
		AA++
	bA := RegExReplace(e%A%, "_" , Replacement := "")
	GuiControl, 출고장:, e%A%, %bA%
	}
	AA = 0
	Sleep, 10

	deletefile := % "A" t1 "_B" t2 "_C" t3 "_D" t4 "_E" t5 "_V" t6 "_G" t7  "_T" t8 "_" 상태 ".CSV"
	newfile := % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_V" e6 "_G" e7 "_T" e8 "_" 상태 ".CSV"
	root1 := % A_WorkingDir "\매출\" deletefile
	root2 := % A_WorkingDir "\매출\삭제일정\" deletefile
	root5 := % A_WorkingDir "\매출\" newfile


	;~ MsgBox, % 상태 "`n" root1 "`n" root5
	If FileExist(root1)
	{
	}
	else
	{
		MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요2, 2
		return
	}


	Sleep, 20
	GuiControl,, myprogress, 10
	GuiControl, 출고장:show, pic2
	guicontrol, 출고장:hide, 상태close
	guicontrol, 출고장:hide, 저장1
	guicontrol, 출고장:hide, 리스트로저장
	guicontrol, 출고장:hide, 준비중으로저장
	guicontrol, 출고장:hide, 준비완료로저장
	guicontrol, 출고장:hide, 완료출하로저장
	*/
}


Sleep, 100
;~ root1 := % A_WorkingDir "\" deletefile
;~ root2 := % A_WorkingDir "\삭제일정\" deletefile



;~ TempFile := "A" t1 "_B" t2 "_C" t3 "_D" t4 "_E" t5 "_V" t6 "_G" t7 "_" t0 ".CSV"
;~ TempFile1 := "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_V" e6 "_G" e7 "_" e0 ".CSV"

;~ root1 := % TempFile
;~ root2 := % TempFile1

저장하기:





Sleep, 50


	;~ root5 := % A_WorkingDir "\매출\" newfile

makefile:

		;~ GuiControl,, myprogress, 100
;~ SoundPlay, %A_WorkingDir%\sound\1.mp3
errorlevel =



IF(( 상태 = "B" ) or ( 상태 = "C" ) or ( 상태 = "A" ) or ( 상태 = "D" ))
{


		CONT1=
          myQuery =
            (
			UPDATE tms_2
			SET
			  날짜 = '%e1%',
			  시간 = '%e2%',
			  업체 = '%e3%',
			  입고지 = '%e4%',
			  비고 = '%e5%',
			  진행 = '%e6%',
			  픽업 = '%e7%',
			  배송자 = '%e8%',
			  상태 = '%상태%'
			WHERE ID = '%lv_id%';


			)
            result := dbQuery(myDB, myQuery)
			if(errorCheck(result)){
				MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
			}else{
			}

          myQuery =
            (

			DELETE FROM tms_list
			WHERE ID = '%lv_id%';



			)
            result := dbQuery(myDB, myQuery)
			if(errorCheck(result)){
				MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
			}else{
			}

			행 := LV_GetCount()

			행마1 := 행 - 0
			행마2 := 행 - 1
			if(행마2!=0){
				Loop, % 행마2 ; csv 파일 값 입력 하기
				{



					LV_GetText(출, A_index , 1)
					if(출=""){
						출=NULL
					}else{
						출 := "'" 출
						출 := 출 "'"
					}

					LV_GetText(내용, A_index , 3)
					if(내용=""){
						내용=NULL
					}else{
						내용 := "'" 내용
						내용 := 내용 "'"
					}

					LV_GetText(수량, A_index , 4)
					if(수량=""){
						수량=0
					}else{
					}

					LV_GetText(pdt_code, A_index , 9)
					if(pdt_code=""){
						pdt_code=0
					}else{
					}


					LV_GetText(비고, A_index , 6)
					if(비고=""){
						비고=NULL
					}else{
						비고 := 비고 "'"
						비고 := "'" 비고
					}

					;~ LV_GetText(no, A_index , 7)
					;~ if(no=""){
						;~ no=0
					;~ }else{
					;~ }

					CONT = (%lv_id%, %출%, %내용%, %수량%, %pdt_code%, %비고%, %A_index%),`n
					CONT1 .= CONT
					;~ MsgBox, % CONT1 "`n" A_Index "`n" 행 "`n" 전표번호 "`n" 내용 "`n" 수량 "`n" pdtcode "`n" 비고
				}
			}else{
			}


					LV_GetText(출, 행마1 , 1)
					if(출=""){
						출=NULL
					}else{
						출 := "'" 출
						출 := 출 "'"
					}

					LV_GetText(내용, 행마1 , 3)
					if(내용=""){
						내용=NULL
					}else{
						내용 := "'" 내용
						내용 := 내용 "'"
					}

					LV_GetText(수량, 행마1 , 4)
					if(수량=""){
						수량=0
					}else{
					}

					LV_GetText(pdt_code, 행마1 , 9)
					if(pdt_code=""){
						pdt_code=0
					}else{
					}

					LV_GetText(비고, 행마1 , 6)
					if(비고=""){
						비고=NULL
					}else{
						비고 := 비고 "'"
						비고 := "'" 비고
					}

					LV_GetText(no, 행마1 , 7)
					if(no=""){
						no=0
					}else{
					}


					CONT = (%lv_id%, %출%, %내용%, %수량%, %pdt_code%, %비고%, %행마1%)`n;
				CONT1 .= CONT

				;~ CONT1 .= "`n;"


			;~ MsgBox, % CONT1

			if(행마2!="0"){
				myQuery =
				(

				INSERT INTO tms_list (ID, 출, 내용, 수량, pdt_code, 비고, no)
				VALUES
				%CONT1%

				)
				;~ MsgBox, % "myQuery`n" myQuery
				result := dbQuery(myDB, myQuery)
				if(errorCheck(result)){
					MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
				}else{
				}
			}else{
			}

		GuiControl,, myprogress, 70
		;~ Sleep, 200
SoundPlay, %A_WorkingDir%\sound\1.mp3
		;~ root3 = % A_WorkingDir "\매출\" newfile
		;~ CSV_Load(root3, "rootcsv")
		;~ CSV_Save(root3, "rootcsv", 1)

Sleep, 10
	if (상태 = "A")
	{
		guicontrol, 입고장:hide, 리스트로저장
		guicontrol, 입고장:show, 준비중으로저장
		guicontrol, 입고장:hide, 준비완료로저장
		guicontrol, 입고장:hide, 완료출하로저장
	}
	else if (상태 = "B")
	{
		guicontrol, 입고장:show, 리스트로저장
		guicontrol, 입고장:hide, 준비중으로저장
		guicontrol, 입고장:show, 준비완료로저장
		guicontrol, 입고장:hide, 완료출하로저장
	}
	else if (상태 = "C")
	{
		guicontrol, 입고장:hide, 리스트로저장
		guicontrol, 입고장:show, 준비중으로저장
		guicontrol, 입고장:hide, 준비완료로저장
		guicontrol, 입고장:show, 완료출하로저장
	}
	else if (상태 = "D")
	{
		guicontrol, 입고장:hide, 리스트로저장
		guicontrol, 입고장:hide, 준비중으로저장
		guicontrol, 입고장:show, 준비완료로저장
		guicontrol, 입고장:hide, 완료출하로저장
	}
	else
	{
	}



GuiControl, 입고장:hide, pic2
guicontrol, 입고장:show, 상태close
guicontrol, 입고장:show, 저장1
;~ guicontrol, 출고장:show, 리스트로저장
;~ guicontrol, 출고장:show, 준비중으로저장
;~ guicontrol, 출고장:show, 준비완료로저장
;~ guicontrol, 출고장:show, 완료출하로저장
		;~ GuiControl,, myprogress, 0

;~ gui, submit, no출고장:hide
GuiControl, 입고장:, t1, %e1%
GuiControl, 입고장:, t2, %e2%
GuiControl, 입고장:, t3, %e3%
GuiControl, 입고장:, t4, %e4%
GuiControl, 입고장:, t5, %e5%
GuiControl, 입고장:, t6, %e6%
GuiControl, 입고장:, t7, %e7%
GuiControl, 입고장:, t8, %e8%
GuiControl, 입고장:, t0, %e0%
}



else
{


		CONT1=
          myQuery =
            (
			UPDATE tms
			SET
			  날짜 = '%e1%',
			  시간 = '%e2%',
			  업체 = '%e3%',
			  출고지 = '%e4%',
			  비고 = '%e5%',
			  절단 = '%e6%',
			  도어 = '%e7%',
			  배송자 = '%e8%',
			  상태 = '%상태%'
			WHERE ID = '%lv_id%';


			)
            result := dbQuery(myDB, myQuery)
			if(errorCheck(result)){
				MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
			}else{
			}

          myQuery =
            (

			DELETE FROM tms_list
			WHERE ID = '%lv_id%';



			)
            result := dbQuery(myDB, myQuery)
			if(errorCheck(result)){
				MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
			}else{
			}

			행 := LV_GetCount()

			행마1 := 행 - 0
			행마2 := 행 - 1
			if(행마2!=0){
				Loop, % 행마2 ; csv 파일 값 입력 하기
				{



					LV_GetText(출, A_index , 1)
					if(출=""){
						출=NULL
					}else{
						출 := "'" 출
						출 := 출 "'"
					}

					LV_GetText(내용, A_index , 3)
					if(내용=""){
						내용=NULL
					}else{
						내용 := "'" 내용
						내용 := 내용 "'"
					}

					LV_GetText(수량, A_index , 4)
					if(수량=""){
						수량=0
					}else{
					}

					LV_GetText(pdt_code, A_index , 9)
					if(pdt_code=""){
						pdt_code=0
					}else{
					}


					LV_GetText(비고, A_index , 6)
					if(비고=""){
						비고=NULL
					}else{
						비고 := 비고 "'"
						비고 := "'" 비고
					}

					;~ LV_GetText(no, A_index , 7)
					;~ if(no=""){
						;~ no=0
					;~ }else{
					;~ }

					CONT = (%lv_id%, %출%, %내용%, %수량%, %pdt_code%, %비고%, %A_index%),`n
					CONT1 .= CONT
					;~ MsgBox, % CONT1 "`n" A_Index "`n" 행 "`n" 전표번호 "`n" 내용 "`n" 수량 "`n" pdtcode "`n" 비고
				}
			}else{
			}


					LV_GetText(출, 행마1 , 1)
					if(출=""){
						출=NULL
					}else{
						출 := "'" 출
						출 := 출 "'"
					}

					LV_GetText(내용, 행마1 , 3)
					if(내용=""){
						내용=NULL
					}else{
						내용 := "'" 내용
						내용 := 내용 "'"
					}

					LV_GetText(수량, 행마1 , 4)
					if(수량=""){
						수량=0
					}else{
					}

					LV_GetText(pdt_code, 행마1 , 9)
					if(pdt_code=""){
						pdt_code=0
					}else{
					}

					LV_GetText(비고, 행마1 , 6)
					if(비고=""){
						비고=NULL
					}else{
						비고 := 비고 "'"
						비고 := "'" 비고
					}

					LV_GetText(no, 행마1 , 7)
					if(no=""){
						no=0
					}else{
					}


					CONT = (%lv_id%, %출%, %내용%, %수량%, %pdt_code%, %비고%, %행마1%)`n;
				CONT1 .= CONT

				;~ CONT1 .= "`n;"


			;~ MsgBox, % CONT1

			if(행마2!="0"){
				myQuery =
				(

				INSERT INTO tms_list (ID, 출, 내용, 수량, pdt_code, 비고, no)
				VALUES
				%CONT1%

				)
				;~ MsgBox, % "myQuery`n" myQuery
				result := dbQuery(myDB, myQuery)
				if(errorCheck(result)){
					MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
				}else{
				}
			}else{
			}

		GuiControl,, myprogress, 70
		;~ Sleep, 200
SoundPlay, %A_WorkingDir%\sound\1.mp3
		;~ root3 = % A_WorkingDir "\매출\" newfile
		;~ CSV_Load(root3, "rootcsv")
		;~ CSV_Save(root3, "rootcsv", 1)

Sleep, 10
	if (상태 = "Y")
	{
		guicontrol, 출고장:hide, 리스트로저장
		guicontrol, 출고장:show, 준비중으로저장
		guicontrol, 출고장:hide, 준비완료로저장
		guicontrol, 출고장:hide, 완료출하로저장
	}
	else if (상태 = "X")
	{
		guicontrol, 출고장:show, 리스트로저장
		guicontrol, 출고장:hide, 준비중으로저장
		guicontrol, 출고장:show, 준비완료로저장
		guicontrol, 출고장:hide, 완료출하로저장
	}
	else if (상태 = "Z")
	{
		guicontrol, 출고장:hide, 리스트로저장
		guicontrol, 출고장:show, 준비중으로저장
		guicontrol, 출고장:hide, 준비완료로저장
		guicontrol, 출고장:show, 완료출하로저장
	}
	else if (상태 = "W")
	{
		guicontrol, 출고장:hide, 리스트로저장
		guicontrol, 출고장:hide, 준비중으로저장
		guicontrol, 출고장:show, 준비완료로저장
		guicontrol, 출고장:hide, 완료출하로저장
	}
	else
	{
	}



GuiControl, 출고장:hide, pic2
guicontrol, 출고장:show, 상태close
guicontrol, 출고장:show, 저장1
;~ guicontrol, 출고장:show, 리스트로저장
;~ guicontrol, 출고장:show, 준비중으로저장
;~ guicontrol, 출고장:show, 준비완료로저장
;~ guicontrol, 출고장:show, 완료출하로저장
		;~ GuiControl,, myprogress, 0

;~ gui, submit, no출고장:hide
GuiControl, 출고장:, t1, %e1%
GuiControl, 출고장:, t2, %e2%
GuiControl, 출고장:, t3, %e3%
GuiControl, 출고장:, t4, %e4%
GuiControl, 출고장:, t5, %e5%
GuiControl, 출고장:, t6, %e6%
GuiControl, 출고장:, t7, %e7%
GuiControl, 출고장:, t8, %e8%
GuiControl, 출고장:, t0, %e0%

}
;~ Sleep, 100


출=
내용=
수량=
pdt_code=
비고=
SoundPlay, %A_WorkingDir%\sound\저장완료.mp3
		GuiControl,, myprogress, 0

MsgBox, 262192, 알림, 저장 완료됐습니다, 0.8
;~ WinSet, AlwaysOnTop , On, 출고장
	;~ Gui, 출고장:Restore







return




상태close:

gui, 출고장:hide
gui, 출고장:submit
;~ winkill, 출고장

Sleep, 10
;~ GuiControl, 1:Choose, refreshtab, 1
Sleep, 100
ControlClick, Button8, 신흥목재 전산프로그램

Sleep, 10
;~ Gui, 1:restore
return

상태close9:
;~ winkill, 입고장

gui, 입고장:hide
gui, 입고장:submit
Sleep, 10
;~ GuiControl, 1:Choose, refreshtab, 2
Sleep, 100
ControlClick, Button16, 신흥목재 전산프로그램

Sleep, 10
;~ Gui, 1:restore
return


/*
if ((상태 = "C") or (상태 = "B") or (상태 = "A"))
{

}
else
{
	Sleep, 10
	GuiControl, 1:Choose, refreshtab, 1
		;~ ControlClick, Button5, 신흥목재 전산프로그램
}
Sleep, 100

if ((상태 = "C") or (상태 = "B") or (상태 = "A"))
{
	;~ Sleep, 100
	;~ ControlClick, Button10, 신흥목재 전산프로그램
			;~ Sleep, 1
			;~ gosub, refresh9
		;~ ControlClick, Button17, 신흥목재 전산프로그램
		;~ Send, {enter}
}
else
{
		ControlClick, Button8, 신흥목재 전산프로그램
		;~ Sleep, 1
				;~ ControlClick, Button6, 신흥목재 전산프로그램
			;~ gosub, refresh1
}





Sleep, 10

return

*/

9add_1:
상태 := "C"
OutputVar :=
ed1 :=
ed2 :=
ed3 :=
ed4 :=
ed5 :=
ed6 :=
ed7 :=
ed0 :=


gosub, READ9

return

9add_2:
상태 := "B"
OutputVar :=
ed1 :=
ed2 :=
ed3 :=
ed4 :=
ed5 :=
ed6 :=
ed7 :=
ed0 :=


gosub, READ9

return



READ9:

data9 =
입출고=입고장

/*
if (ed1="")
{
		SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
		MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
		;~ FileRead, data, %contain%
		return
}
else
{
}

contain9 = % A_WorkingDir "\매입\" OutputVar
errorlevel =
if (contain9 = "\\192.168.0.1\hdd1\일정표 최근\일정표220730\")
{

}
else
{
FileRead, data9, %contain9%
	if not ErrorLevel  ; 성공적으로 적재됨.
	{
		;~ SoundPlay, %A_WorkingDir%\sound\soundopen.mp3
	}
	else
	{
		SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
		MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
		;~ FileRead, data, %contain%
		return

	}

}

*/



		칼라 := "ecf2ff"

read9_1:

Gui, 입고장:Destroy
Gui, 입고장:Default
Gui, 입고장:-SysMenu
Gui, 입고장:+alwaysontop
Gui, 입고장:Submit, NoHide
Gui, 입고장:Font, S19 CDefault W400, Malgun Gothic
gui, 입고장:Add, progress, smooth x10 y135 w1120 h35 c00ffe0 vmyprogress, 0

Gui, 입고장:Font, S13 CDefault W400, Malgun Gothic
Gui, 입고장:Add, button, x10 y+0 w178 h32 g라인추출9,라인 추출
Gui, 입고장:Add, button, x+10 w178 h32 g라인수정9,라인 수정
Gui, 입고장:Font, S13 CDefault W700, Malgun Gothic
Gui, 입고장:Add, button, x+10 w178 h32 g라인추가9,라인 추가
Gui, 입고장:Font, S13 Cred W400, Malgun Gothic
Gui, 입고장:Add, button, x+10 w179 h32 g라인삽입9,라인 삽입
Gui, 입고장:Add, button, x+10 w179 h32 g라인삭제9,라인 삭제
Gui, 입고장:Add, button, x+10 w179 h32 g지우기9,텍스트 지우기
Gui, 입고장:Add, combobox, x10 y+3 w60 h40 vtt1 r3,△|●|★
Gui, 입고장:Add, Edit, x+0 w150 h40 vtt2,
Gui, 입고장:Add, Edit, x+0 w480 h40 vtt3,
Gui, 입고장:Font, S13 CDefault W700, Malgun Gothic
Gui, 입고장:Add, button, x+0 w50 h40 gbtt3, 품목
Gui, 입고장:Font, S17 Cred W400, Malgun Gothic
Gui, 입고장:Add, Edit, x+0 w80 h40 vtt4 ,
Gui, 입고장:Add, UpDown
Gui, 입고장:Add, Edit, x+0 w80 h40 vtt5,
Gui, 입고장:Add, Edit, x+0 w220 h40 vtt6,
Gui, 입고장:Font, S17 CDefault W400, Malgun Gothic
Gui, 입고장:Add, ListView, x10 y+4 w1120 h463 grid vLV7 gLV7 hwndHLV7 -ReadOnly WantF2 NoSortHdr Background%칼라%, 出|로케이션|내용|수량|단위|비고 및 주의사항|no|현재재고|pdt_code


		myQuery =
		(
		SELECT
			tms_list.출,
			wms.loca_1 AS 로케이션,
			tms_list.내용,
			tms_list.수량,
			temp_products4_1.단위 AS 단위,
			tms_list.비고,
			tms_list.no,
			temp_products4_2.현재재고 AS 현재재고,
			tms_list.pdt_code
		FROM
			tms_list
		LEFT JOIN
			temp_products4 AS temp_products4_1 ON tms_list.pdt_code = temp_products4_1.상품코드
		LEFT JOIN
			temp_products4 AS temp_products4_2 ON tms_list.pdt_code = temp_products4_2.상품코드
		LEFT JOIN
			temp_products4 AS temp_products4_3 ON tms_list.pdt_code = temp_products4_3.상품코드
		LEFT JOIN
			wms ON temp_products4_3.관리코드 = wms.product_id
		WHERE
			tms_list.ID = '%lv_id%'
		ORDER BY
			로케이션 ASC;


		)
		result := dbQuery(myDB, myQuery)
		for index1, 1_arr in result
		{
			;		  1_arr[1]  1_arr[2]  1_arr[3]  1_arr[4]   1_arr[5]  1_arr[6]  1_arr[7]  1_arr[8] 1_arr[8]
			; 			출      로케이션     내용     수량     j단위     비고        no       현재재고  pdt코드
			LV_Add("", 1_arr[1], 1_arr[2], 1_arr[3], 1_arr[4], 1_arr[5], 1_arr[6], 1_arr[7], 1_arr[8], 1_arr[9])
		}



LV_ModifyCol(1, "60 Integer" "Integer Center")
LV_ModifyCol(2, "150 Integer" "Integer Left")
LV_ModifyCol(3, 530)
LV_ModifyCol(4, "80 Integer" "Integer Right")
LV_ModifyCol(5, 80)
LV_ModifyCol(6, 190)




Gui, 입고장:Font, S19 Cblue W400, Malgun Gothic
Gui, 입고장:Add, Text, x10 y10 w170 h30 -VScroll, 입하날짜
Gui, 입고장:Add, Text, x+10 w130 h30 -VScroll, 입하시각
Gui, 입고장:Add, Text, x+10 w200 h30 -VScroll, 매입처
Gui, 입고장:Add, Text, x+10 w170 h30 -VScroll, 입하지
Gui, 입고장:Add, Text, x+10 w200 h30 -VScroll, 기타사항
Gui, 입고장:Add, Text, x+10 w95 h30 -VScroll, 픽업
Gui, 입고장:Add, Text, x+10 w95 h30 -VScroll, 상태
Gui, 입고장:Font, S13 Cblue W700, Malgun Gothic
Gui, 입고장:Add, Text, x+10 w80 h40 +right -VScroll vtitle, %제목%
Gui, 입고장:Font, S19 C00459E W400, Malgun Gothic
Gui, 입고장:Add, Edit, ReadOnly x10 y+5 w170 h40 -VScroll vt1, %lv_날짜%
Gui, 입고장:Add, Edit, ReadOnly x+10 w130 h40 -VScroll vt2, %lv_시간%
Gui, 입고장:Add, Edit, ReadOnly x+10 w200 h40 -VScroll vt3, %lv_업체%
Gui, 입고장:Add, Edit, ReadOnly x+10 w170 h40 -VScroll vt4, %lv_입고지%
Gui, 입고장:Add, Edit, ReadOnly x+10 w200 h40 -VScroll vt5, %lv_비고%

Gui, 입고장:Add, Edit, ReadOnly x+10 w60 h40 -VScroll vt6, %lv_진행%
Gui, 입고장:Add, Edit, ReadOnly x+10 w60 h40 -VScroll vt7, %lv_픽업%
Gui, 입고장:Add, Edit, ReadOnly x+10 w60 h40 -VScroll vt8, %lv_배송자%



Gui, 입고장:Font, S19 CDefault W400, Malgun Gothic
Gui, 입고장:Add, Edit, x10 y+5 w170 h40 -VScroll ve1,
Gui, 입고장:Add, Edit, x+10 w130 h40 -VScroll ve2,
Gui, 입고장:Add, Edit, x+10 w200 h40 -VScroll ve3,
Gui, 입고장:Add, Edit, x+10 w170 h40 -VScroll ve4,
Gui, 입고장:Add, Edit, x+10 w200 h40 -VScroll ve5,

Gui, 입고장:Add, combobox, x+10 w60 h40 -VScroll ve6 r3, |매장|픽업
Gui, 입고장:Add, combobox, x+10 w60 h40 -VScroll ve7 r5, |주문|보류|재고
Gui, 입고장:Add, combobox, x+10 w60 h40 -VScroll ve8 r3, |여|최

Gui, 입고장:Font, S19 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 입고장:Add, button, x1140 y45 w90 h40 c0xFF2211 v상태close9 g상태close9, 닫기

Gui, 입고장:Add, button, y+10 w90 h40 c0xFF2211 v저장1 g저장1, 저장

Gui, 입고장:Font, S13 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 입고장:Add, button, y+35 w90 h60 cRED g카메라1, 카메라 ;gbutton9_1


Gui, 입고장:Add, button, y+10 w90 h106 cRED  v입하리스트업저장 g입하리스트업저장, Ⅰ`n입하`n리스트업
Gui, 입고장:Add, button, y+10 w90 h108 c0xFF2211  v입하입고진행중저장 g입하입고진행중저장, Ⅱ`n준비중
Gui, 입고장:Add, button, y+10 w90 h108 c0xFF2211  v입하완료 g입하완료, Ⅲ`n입하완료`n(하차까지만)
Gui, 입고장:Add, button, y+10 w90 h108 c0xFF2211  v입고완료저장 g입고완료저장, Ⅳ`n입고완료`n(보관)



;~ Gui, 입고장:Add, button, y+40 w90 h125 c0xFF2211 v입하리스트업저장 g입하리스트업저장, Ⅰ`n입하`n리스트업
;~ Gui, 입고장:Add, button, y+10 w90 h125 c0xFF2211 v입하입고진행중저장 g입하입고진행중저장, Ⅱ`n진행중
;~ Gui, 입고장:Add, button, y+10 w90 h125 c0xFF2211 v입고완료저장 g입고완료저장, Ⅲ`n완료

Gui, 입고장:Font, S1 CDefault W400, Malgun Gothic
Gui, 입고장:Add, Edit, y+10 w50 h15 ve9,
Gui, 입고장:Add, Edit, ReadOnly x+5 w15 h15 vt0 -VScroll,
Gui, 입고장:Add, Edit, x+5 w15 h15 ve0 -VScroll,

Gui, 입고장:Font, S13 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 입고장:Add, button, x1140 y+10 w90 h32 g삭제9,일정 삭제


Gui, 입고장:Add, Picture, x250 y180 W804 H428 vpic2, %A_WorkingDir%/loading.png
GuiControl, hide, pic2

SoundPlay, %A_WorkingDir%\sound\효과음90.mp3



Gui, 입고장:ListView, LV7




;~ CSV_Load(OutputVar, "datacsv")
;~ MsgBox, % CSV_Search("datacsv", "a")

/*

;~ MsgBox, % datacsv
loop, parse, data9, `n
{
	x:=[]
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	LV_Add("", x*)
}


if( ed1 = "")
{
GuiControl, 입고장:, t1, %addtime1%
}
else
{
GuiControl, 입고장:, t1, %ed1%
}

GuiControl, 입고장:, t2, %ed2%
GuiControl, 입고장:, t3, %ed3%
GuiControl, 입고장:, t4, %ed4%
GuiControl, 입고장:, t5, %ed5%
GuiControl, 입고장:, t6, %ed6%
GuiControl, 입고장:, t7, %ed7%
GuiControl, 입고장:, t0, 입고장


if( ed1 = "")
{
GuiControl, 입고장:, e1, %addtime1%
}

else
{
GuiControl, 입고장:, e1, %ed1%
}

*/

GuiControl, 입고장:, e1, %lv_날짜%
GuiControl, 입고장:, e2, %lv_시간%
GuiControl, 입고장:, e3, %lv_업체%
GuiControl, 입고장:, e4, %lv_입고지%
GuiControl, 입고장:, e5, %lv_비고%
GuiControl, 입고장:text, e6, %lv_진행%
GuiControl, 입고장:text, e7, %lv_픽업%
GuiControl, 입고장:text, e8, %lv_배송자%
GuiControl, 입고장:, e0, 입고장



;~ recentfile := "A" ed1 "_B" ed2 "_C" ed3 "_D" ed4 "_E" ed5 "_V" ed6 "_G" ed7 "_" 상태 ".CSV"

Sleep, 100

Gui, 입고장:ListView, LV7



; Create a new instance of LV_Colors
CLV7 := New LV_Colors(HLV7)
; Set the colors for selected rows
CLV7.SelectionColors(0xffcccc)
If !IsObject(CLV7) {
   MsgBox, 0, ERROR, Couldn't create a new LV_Colors object!
   ExitApp
}

WinSet, Redraw, , ahk_id %HLV7%
   CLV7.OnMessage()


Gui, 입고장:Submit, NoHide
Gui, 입고장:ListView, lv7

CLV7.Clear(1, 1)
Loop % LV_GetCount()
{
    LV_GetText(RetrievedText, A_Index)
    if (RetrievedText = "●"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLV7.ROW(A_Index, 0x0000ff, 0xffffff)
	}
	else if (RetrievedText = "★"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLV7.ROW(A_Index, 0x6600FF, 0xffffff)
	}
	else if (RetrievedText = "△"){
	;~ LV_GetNext(StartingRowNumber, RowType)
	CLV7.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else
	{
		CLV7.ROW(A_Index, 0x%칼라%, 0x000000)
	}
}



	if (상태 = "A")
	{
		guicontrol, 입고장:hide, 입하리스트업저장
		guicontrol, 입고장:show, 입하입고진행중저장
		guicontrol, 입고장:hide, 입하완료
		guicontrol, 입고장:hide, 입고완료저장
	}
	else if (상태 = "B")
	{
		guicontrol, 입고장:show, 입하리스트업저장
		guicontrol, 입고장:hide, 입하입고진행중저장
		guicontrol, 입고장:show, 입하완료
		guicontrol, 입고장:hide, 입고완료저장
	}
	else if (상태 = "C")
	{
		guicontrol, 입고장:hide, 입하리스트업저장
		guicontrol, 입고장:show, 입하입고진행중저장
		guicontrol, 입고장:hide, 입하완료
		guicontrol, 입고장:show, 입고완료저장
	}
	else
	{
		guicontrol, 입고장:hide, 입하리스트업저장
		guicontrol, 입고장:hide, 입하입고진행중저장
		guicontrol, 입고장:show, 입하완료
		guicontrol, 입고장:hide, 입고완료저장
	}
GUI, 입고장:Show, w1240 h730 x25 y25, 입고장

WinWait, 입고장,
IfWinNotActive, 입고장, , WinActivate, 입고장,
WinWaitActive, 입고장,

data :=
	입출고 = 입고장

return








라인추출9:

ControlGet, Col1, List , selected Col1, SysListView321, 입고장 ;2 모델
GuiControl, 입고장:, tt1 , %Col1%
ControlGet, Col2, List , selected Col2, SysListView321, 입고장 ;2 모델
GuiControl, 입고장:, tt2 , %Col2%
ControlGet, Col3, List , selected Col3, SysListView321, 입고장 ;2 모델
GuiControl, 입고장:, tt3 , %Col3%
ControlGet, Col4, List , selected Col4, SysListView321, 입고장 ;2 모델
GuiControl, 입고장:, tt4 , %Col4%
ControlGet, Col5, List , selected Col5, SysListView321, 입고장 ;2 모델
GuiControl, 입고장:, tt5 , %Col5%
ControlGet, Col6, List , selected Col6, SysListView321, 입고장 ;2 모델
GuiControl, 입고장:, tt6 , %Col6%

;~ gosub, 리프레쉬
return





라인추가9:

Gui, 입고장:Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Add(,tt1,tt2,tt3,tt4,tt5,tt6)
	;~ gosub, 리프레쉬
return




라인삽입9:

Gui, 입고장:Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Insert(selectRowNum , ,tt1,tt2,tt3,tt4,tt5,tt6)
	gosub, 리프레쉬
return




라인삭제9:

Gui, 입고장:Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Delete(selectRowNum)
	gosub, 리프레쉬
return




라인수정9:

Gui, 입고장:Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_Modify(selectRowNum , ,tt1,tt2,tt3,tt4,tt5,tt6)
	gosub, 리프레쉬
return




라인완료9:

지우기9:
GuiControl, 입고장:, tt1,
GuiControl, 입고장:, tt2,
GuiControl, 입고장:, tt3,
GuiControl, 입고장:, tt4,
GuiControl, 입고장:, tt5,
GuiControl, 입고장:, tt6,



return



















삭제9:
SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
MsgBox, 262196, 일정 삭제, 일정을 삭제 하시겠습니까?,

{
	IfMsgBox Yes
	{
		SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
		MsgBox, 262196, 일정 삭제, 정말 입니까?
		{
			IfMsgBox Yes
			{
				GuiControl,, myprogress, 20
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
				Sleep, 100
				GuiControl,, myprogress, 30
				TempFile := "A" t1 "_A" t2 "_B" t3 "_C" t4 "_D" t5 "_E" t6 "_V" t7 "_G" t8 "_" t0 ".CSV"
				TempFile1 := "A" e1 "_A" e2 "_B" e3 "_C" e4 "_D" e5 "_E" e6 "_V" e7 "_G" e8 "_" e0 ".CSV"
				root1 := % A_WorkingDir "\매입\" TempFile
				root2 := % A_WorkingDir "\매입\삭제일정\" TempFile1
				GuiControl,, myprogress, 40
				FileDelete, %root1%
				GuiControl,, myprogress, 60
				Sleep, 300
				GuiControl,, myprogress, 80
				Sleep, 300
				GuiControl,, myprogress, 100
				Sleep, 300
				gosub, 상태close9
				return
			}
			IfMsgBox NO
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
				Sleep, 1000
			}
		}
	}
	IfMsgBox NO
	{
		SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
		Sleep, 1000
	}

}
return


Gui, 입고장:Add, button, y+10 w90 h106 cRED  v입하리스트업저장 g입하리스트업저장, Ⅰ`n입하`n리스트업
Gui, 입고장:Add, button, y+10 w90 h108 c0xFF2211  v입하입고진행중저장 g입하입고진행중저장, Ⅱ`n준비중
Gui, 입고장:Add, button, y+10 w90 h108 c0xFF2211  v입하완료 g입하완료, Ⅲ`n입하완료(하차까지만)
Gui, 입고장:Add, button, y+10 w90 h108 c0xFF2211  v입고완료저장 g입고완료저장, Ⅳ`n입고완료(보관)




입하리스트업저장:
SoundPlay, %A_WorkingDir%\sound\효과음93.mp3
GuiControl, 입고장:show, pic2
순수포멧 := "A"
저장포멧 := "A.CSV"
변환결과 := "[Ⅰ. 입하 리스트 업] ◇◇◇"
이전포멧 := 상태
;~ WinSetTitle, 입고장, , C
상태 := 순수포멧
GuiControl, 입고장:, e0, C
;~ SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\골리앗1.mp3
gosub, 문자보내기9
;~ gosub, 변환9
return

입하입고진행중저장:
SoundPlay, %A_WorkingDir%\sound\효과음93.mp3
GuiControl, 입고장:show, pic2
순수포멧 := "B"
저장포멧 := "B.CSV"
변환결과 := "입하 / 입고 진행중으로 저장"
문구 := "[Ⅱ. 입하 / 입고 진행중] ◆◇◇"
이전포멧 := 상태
;~ WinSetTitle, 입고장, , B
상태 := 순수포멧
GuiControl, 입고장:, e0, B
gosub, 문자보내기9
;~ gosub, 변환9
return


입하완료:
SoundPlay, %A_WorkingDir%\sound\효과음93.mp3
GuiControl, 입고장:show, pic2
순수포멧 := "C"
저장포멧 := "C.CSV"
변환결과 := "입하 / 입고 진행중으로 저장"
문구 := "[Ⅱ. 입하 / 입고 진행중] ◆◆◇"
이전포멧 := 상태
;~ WinSetTitle, 입고장, ,A
상태 := 순수포멧
GuiControl, 입고장:, e0, A
gosub, 문자보내기9
;~ gosub, 변환9
return


입고완료저장:
SoundPlay, %A_WorkingDir%\sound\효과음93.mp3
GuiControl, 입고장:show, pic2
순수포멧 := "D"
저장포멧 := "D.CSV"
변환결과 := "입고 완료로 저장"
문구 := "[Ⅲ. 입고 완료] ◆◆◆"
이전포멧 := 상태
;~ WinSetTitle, 입고장, , D
상태 := 순수포멧
GuiControl, 입고장:, e0, D
gosub, 문자보내기9
;~ gosub, 변환9
return





문자보내기9:
;~ SoundPlay, %A_WorkingDir%\sound\골리앗2.mp3

리스트만따로문자보내기9:
	WinShow, 카카오톡
	Sleep, 100
;~ WinGetTitle, 상태 ,
;~ gui, submit, nohide
guicontrol, 입고장:hide, 상태close9
guicontrol, 입고장:hide, 저장1
guicontrol, 입고장:hide, 입하리스트업저장
guicontrol, 입고장:hide, 입하입고진행중저장
guicontrol, 입고장:hide, 입고완료저장
;~ WinSet, AlwaysOnTop , On, %상태%

if WinExist(받는분)
{


	;~ WinWait, 카카오톡,
;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
;~ WinWaitActive, 카카오톡,


	FormatTime, time, , yyyy년 MM월 dd일 HH시 mm분
	Sleep, 30
			;~ GuiControl,, myprogress, 0
			RegExMatch(e1, "2024-(.*)-(.*)", edate)
	2NewStr := RegExReplace(e1, "-" , Replacement := "")
	9yoil := Get_Weekday(2NewStr, parmMode)

요약=
(
%문구%

- 상호 : %ed4%
- 시간 : %ed11%월%ed12%일(%9yoil%) %ed3%
- 장소 : %ed5%
)




	;~ GuiControl, , e9, %문구%`n`n업체명 : %ed4%`n시간 : %ed11%월%ed12%일(%9yoil%) %ed3%`n장소 : %ed5%







	Sleep, 60
	GuiControl,, myprogress, +10
	Sleep, 10
	GuiControl,, myprogress, +10
	ControlFocus, RICHEDIT50W1, %받는분%
		Sleep, 100
	ControlSend, RICHEDIT50W1,{Space}{Backspace}, %받는분%
	Sleep, 100
	ControlSetText, , %요약%, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 50
			GuiControl,, myprogress, +10
	Sleep,50
	ControlSend, Edit2, {del 10}{Backspace 10}, 카카오톡
				GuiControl,, myprogress, +10
}
else
{

Sleep,50
	GuiControl,, myprogress, +10

ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23

Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	Sleep,100
			GuiControl,, myprogress, +10
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100
			GuiControl,, myprogress, +10
	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
ControlSend, Edit2, %받는분%, 카카오톡
Sleep, 100
	GuiControl,, myprogress, +10
	Sleep, 100
controlsend, EVA_Window2, {Enter}, 카카오톡
			GuiControl,, myprogress, +10

	FormatTime, time, , yyyy년 MM월 dd일 HH시 mm분
	Sleep, 30
			RegExMatch(e1, "2024-(.*)-(.*)", edate)
	2NewStr := RegExReplace(e1, "-" , Replacement := "")
	9yoil := Get_Weekday(2NewStr, parmMode)

요약=
(
%문구%

- 상호 : %lv_업체%
- 시간 : %edate2%월%edate3%일(%lv_요일%) %lv_시간%
- 장소 : %lv_입고지%
)
	Sleep, 60
	GuiControl,, myprogress, +10

	Sleep, 10


	Sleep, 10

	GuiControl,, myprogress, +10
	ControlFocus, RICHEDIT50W1, %받는분%

	Sleep, 60
	ControlSend, RICHEDIT50W1,{Space}{Backspace}, %받는분%
		Sleep, 100
	ControlSetText, , %요약%, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 50

			GuiControl,, myprogress, +10

	ControlSend, Edit2, {del 10}{Backspace 10}, 카카오톡
	Sleep, 50
				GuiControl,, myprogress, +10

}

          myQuery =
            (
			UPDATE tms_2
			SET
				상태 = '%상태%'
			WHERE ID = '%lv_id%'
			;

			)
            result := dbQuery(myDB, myQuery)
			if(errorCheck(result)){
				MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
			}else{
			}




변환9:
gui, 입고장:submit,nohide







/*
Sleep, 200
		GuiControl,, myprogress, +10
새로운포멧 = % "A" t1 "_B" t2 "_C" t3 "_D" t4 "_E" t5 "_V" t6 "_G" t7 "_" 이전포멧 ".CSV"
새로운포멧1 = % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_V" e6 "_G" e7 "_" 순수포멧 ".CSV"

;~ MsgBox, %새로운포멧%`n%새로운포멧1%
;~ Sleep, 200


		errorlevel =

wantread = %A_WorkingDir%\매입\%새로운포멧%

If FileExist(wantread)
{
}
else
{
	MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
	return
}


Sleep, 10
		GuiControl,, myprogress, +10
		;~ MsgBox, %새로운포멧%`n%새로운포멧1%

Loop
{

	FileMove, %A_WorkingDir%\매입\%새로운포멧%, %A_WorkingDir%\매입\%새로운포멧1% , 1
	if(errorlevel = 1)
	{
		Sleep, 200
	}
	else
	{
		break
	}
}
	GuiControl,, myprogress, 100
*/
Sleep, 10

guicontrol, 입고장:,title, %변환결과%

Sleep, 10




/*
		GuiControl,, myprogress, +10
		errorlevel =
Loop
{
	FileMove, %A_WorkingDir%\매입\%새로운포멧%, %A_WorkingDir%\매입\%새로운포멧1% , 1
	if errorlevel = 1
	{
		Sleep, 200
	}
	else
	{
		break
	}
}
SoundPlay, %A_WorkingDir%\sound\1.mp3
	GuiControl,, myprogress, 100
	MsgBox, 262192, 알림, %변환결과%`n변환했습니다!, 0.8
	GuiControl,, myprogress, 0

;~ guicontrol, show, 리스트로저장
;~ guicontrol, show, 피킹으로저장
;~ guicontrol, show, 준비완료로저장
;~ guicontrol, show, 완료출하로저장
guicontrol, 입고장:,title, %변환결과%
*/
if (순수포멧 = "A")
{
guicontrol, 입고장:hide, 입하리스트업저장
guicontrol, 입고장:show, 입하입고진행중저장
guicontrol, 입고장:hide, 입하완료
guicontrol, 입고장:hide, 입고완료저장
}
else if (순수포멧 = "B")
{
guicontrol, 입고장:show, 입하리스트업저장
guicontrol, 입고장:hide, 입하입고진행중저장
guicontrol, 입고장:show, 입하완료
guicontrol, 입고장:hide, 입고완료저장
}
else if (순수포멧 = "C")
{
guicontrol, 입고장:hide, 입하리스트업저장
guicontrol, 입고장:show, 입하입고진행중저장
guicontrol, 입고장:hide, 입하완료
guicontrol, 입고장:show, 입고완료저장
}
else if (순수포멧 = "D")
{
guicontrol, 입고장:hide, 입하리스트업저장
guicontrol, 입고장:hide, 입하입고진행중저장
guicontrol, 입고장:show, 입하완료
guicontrol, 입고장:hide, 입고완료저장
}
else
{
}

GuiControl, 입고장:, t1, %e1%
GuiControl, 입고장:, t2, %e2%
GuiControl, 입고장:, t3, %e3%
GuiControl, 입고장:, t4, %e4%
GuiControl, 입고장:, t5, %e5%
GuiControl, 입고장:ChooseString, t6, %e6%
GuiControl, 입고장:ChooseString, t7, %e7%
GuiControl, 입고장:ChooseString, t8, %e8%
GuiControl, 입고장:, t0, %e0%
;~ WinSet, AlwaysOnTop , on, 입고장




GuiControl, 입고장:Hide, pic2
guicontrol, 입고장:show, 상태close9
guicontrol, 입고장:show, 저장1

	GuiControl,, myprogress, 0

	Clipboard =
return


















tt4:
if A_GuiEvent = "F"


keyboard:
Sleep, 1000
;~ Gui, kb:+alwaysontop
Gui, kb:Default
Gui, kb:-SysMenu
Gui, kb:Color, EEAA99
Gui, kb:Submit, NoHide
Gui, kb:Font, S16 Cred W400, Malgun Gothic

gui, kb:add, button, x5 y5 w80 h80 gbtn7, 7
gui, kb:add, button, x+5 w80 h80 gbtn8, 8
gui, kb:add, button, x+5 w80 h80 gbtn9, 9

Gui, kb:Font, S16 CDefault W700, Malgun Gothic
gui, kb:add, button, x+5 w80 h335 gbtnadd, 추가

Gui, kb:Font, S16 Cred W400, Malgun Gothic
gui, kb:add, button, x5 y90 w80 h80 gbtn4, 4
gui, kb:add, button, x+5 w80 h80 gbtn5, 5
gui, kb:add, button, x+5 w80 h80 gbtn6, 6
gui, kb:add, button, x5 y+5 w80 h80 gbtn1, 1
gui, kb:add, button, x+5 w80 h80 gbtn2, 2
gui, kb:add, button, x+5 w80 h80 gbtn3, 3

Gui, kb:Font, S16 CDefault W700, Malgun Gothic
gui, kb:add, button, x5 y+5 w80 h80 gbtndel, 지우기

Gui, kb:Font, S16 CDefault W400, Malgun Gothic
gui, kb:add, button, x+5 w80 h80 gbtn0, 0

Gui, kb:Font, S16 CDefault W700, Malgun Gothic
gui, kb:add, button, x+5 w80 h80 gbtnesc, 닫기

GUI, kb:Show, x1300 y500 w345 h345, kb
Sleep, 2000
;~ WinSet, AlwaysOnTop , ON, kb

return

btnadd:
Sleep, 100
ControlClick, Button3, %상태%
Sleep, 100
return

btndel:
ControlSetText, Edit4, , %상태%
Sleep, 100
return

btnesc:
winkill, kb
return

btn1:
Controlsend, Edit4, 1, %상태%
Sleep, 100
return

btn2:
Controlsend, Edit4, 2, %상태%
Sleep, 100
return

btn3:
Controlsend, Edit4, 3, %상태%
Sleep, 100
return

btn4:
Controlsend, Edit4, 4, %상태%
Sleep, 100
return

btn5:
Controlsend, Edit4, 5, %상태%
Sleep, 100
return

btn6:
Controlsend, Edit4, 6, %상태%
Sleep, 100
return

btn7:
Controlsend, Edit4, 7, %상태%
Sleep, 100
return

btn8:
Controlsend, Edit4, 8, %상태%
Sleep, 100
return

btn9:
Controlsend, Edit4, 9, %상태%
Sleep, 100
return

btn0:
Controlsend, Edit4, 0, %상태%
Sleep, 100
return








; 폴더로부터 파일 이름 목록을 수집해 그것을 ListView에 넣습니다:
lv91:

	gui, 1:submit, nohide
Gui, 1:ListView, lv91

if A_GuiEvent = DoubleClick
{
	RowNumber = 0
	Loop
	{
		RowNumber := LV_GetNext(RowNumber)

		if not RowNumber
			break
		selectRowNum := RowNumber
	}
	LV_GetText(lv_id, selectRowNum, 1)  ; OutputVar ID
	LV_GetText(lv_날짜, selectRowNum, 11)  ; OutputVar ID
	LV_GetText(lv_요일, selectRowNum, 3)  ; OutputVar ID
	LV_GetText(lv_시간, selectRowNum, 4)  ; OutputVar ID
	LV_GetText(lv_업체, selectRowNum, 5)  ; OutputVar ID
	LV_GetText(lv_입고지, selectRowNum, 6)  ; OutputVar ID
	LV_GetText(lv_진행, selectRowNum, 7)  ; OutputVar ID
	LV_GetText(lv_픽업, selectRowNum, 8)  ; OutputVar ID
	LV_GetText(lv_배송자, selectRowNum, 9)  ; OutputVar ID
	LV_GetText(lv_비고, selectRowNum, 12)  ; OutputVar ID
	Sleep, 10
}
/*
If FileExist(wantread)
{
}
else
{
	MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2

        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	return
}

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
if (ed1="")
{
		SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
		MsgBox , 262192, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		;~ FileRead, data, %contain%
		return
}
else
{
	SoundPlay, %A_WorkingDir%\sound\효과음2_4.mp3
}
*/
	WinShow, 카카오톡


순수포멧 := "B"
저장포멧 := "B.CSV"
변환결과 := "입하준비중"
문구 := "[Ⅱ. 입하 / 입고 진행중] ◇◇◇"



/*
요약=
(
%문구%

- 상호 : %ed3%
- 시간 : %ed11%월%ed12%일(%9yoil%) %ed2%
- 장소 : %ed4%
)




Sleep,100

if WinExist("카카오톡")
{



	FormatTime, time, , yyyy년 MM월 dd일 HH시 mm분
	Sleep, 30
			RegExMatch(e1, "2024-(.*)-(.*)", edate)
	2NewStr := RegExReplace(e1, "-" , Replacement := "")
	9yoil := Get_Weekday(2NewStr, parmMode)


        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Sleep, 60
	GuiControl,, myprogress, +10
	Sleep, 10

	GuiControl,, myprogress, +10
	ControlFocus, RICHEDIT50W1, %받는분%

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	Sleep, 60
	ControlSend, RICHEDIT50W1,{Space}{Backspace}, %받는분%
		Sleep, 100
	ControlSetText, , %요약%, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 50

			GuiControl,, myprogress, +10
	Sleep, 100

	;~ Winkill, %받는분%
	Sleep,50

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	ControlSend, Edit2, {del 10}{Backspace 10}, 카카오톡
	Sleep, 50
				GuiControl,, myprogress, +10
	;~ WinHide, 카카오톡
}

else
{


Sleep,50
	;~ WinWait, 카카오톡,
;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
;~ WinWaitActive, 카카오톡,

Sleep,50
	GuiControl,, myprogress, +10

ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
Sleep,10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	Sleep,100
			GuiControl,, myprogress, +10
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,100
	;~ myprogress, +10
			GuiControl,, myprogress, +10
	ControlSetText, Edit2, , 카카오톡
	Sleep, 50
;~ ControlSetText, Edit2, %받는분%, 카카오톡
ControlSend, Edit2, %받는분%, 카카오톡
Sleep, 100
        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	GuiControl,, myprogress, +10
	;~ WinWait, 카카오톡,
;~ IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
;~ WinWaitActive, 카카오톡,
	Sleep, 1000
controlsend, EVA_Window2, {Enter}, 카카오톡
			GuiControl,, myprogress, +10

	FormatTime, time, , yyyy년 MM월 dd일 HH시 mm분
	Sleep, 30
			;~ GuiControl,, myprogress, 0
			RegExMatch(e1, "2024-(.*)-(.*)", edate)
	2NewStr := RegExReplace(e1, "-" , Replacement := "")
	9yoil := Get_Weekday(2NewStr, parmMode)


	;~ Gui, 출고장:Restore
	;~ WinWait, 출고장,
	;~ IfWinNotActive, 출고장, , WinActivate, 출고장,
	;~ WinWaitActive, 출고장,
	Sleep, 60
	GuiControl,, myprogress, +10

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	;~ GuiControl, , e9, %문구%`n`n상호 : %e3%`n시간 : %edate1%월%edate2%일(%yoil%) %e2%`n장소 : %e4%
	;~ ControlSetText, Edit21, %문구%`n`n상호 : %e3%`n시간 : %edate1%월%edate2%일(%yoil%) %e2%`n장소 : %e4%, 출고장
	;~ Sleep, 60
	;~ ControlSend, Edit21, {Ctrl Down}ac{Ctrl Up}, 출고장
	;~ ControlSend, Edit21, {Ctrl Down}ac{Ctrl Up}, 출고장
	;~ Sleep, 100

	;~ WinWait, %받는분%,
	;~ IfWinNotActive, %받는분%, , WinActivate, %받는분%,
	;~ WinWaitActive, %받는분%,
	Sleep, 10


	Sleep, 10

	GuiControl,, myprogress, +10
	ControlFocus, RICHEDIT50W1, %받는분%

	Sleep, 60
	ControlSend, RICHEDIT50W1,{Space}{Backspace}, %받는분%
		Sleep, 100
	ControlSetText, , %요약%, %받는분%
	ControlSend, , {Enter}, %받는분%
	Sleep, 50

        GuiControl,1:, PG1, +10 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			GuiControl,, myprogress, +10
	;~ Sleep, 100

	;~ Winkill, %받는분%
	;~ Sleep,50

	ControlSend, Edit2, {del 10}{Backspace 10}, 카카오톡
	Sleep, 50
				GuiControl,, myprogress, +10
	;~ WinHide, 카카오톡

}




Sleep, 200
새로운포멧 = % OutputVar
새로운포멧1 = % "A" ed1 "_B" ed2 "_C" ed3 "_D" ed4 "_E" ed5 "_V" ed6 "_G" ed7 "_B.CSV"

;~ MsgBox, %새로운포멧%`n%새로운포멧1%`n%A_WorkingDir%
9rd변환:

errorlevel =
Sleep, 200
		;~ GuiControl,, myprogress, +10
	FileMove, %A_WorkingDir%\매입\%새로운포멧%, %A_WorkingDir%\매입\%새로운포멧1% , 1
	if errorlevel = 1
	{
		Sleep, 200
		MsgBox, 에러남
	}
	else
	{
		;~ gosub, 9rd변환
	}
Sleep, 200

OutputVar = % 새로운포멧1

;~ MsgBox, % OutputVar

RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_V(.*)_G(.*)_B", ed)
*/

	상태 := "B"
	파일이름 = OutputVar
	라벨 := "M"
	;~ GuiControl, , e1, %ed1%
	제목 := "[입하준비중]"

	  myQuery =
		(
		UPDATE tms_2
		SET
			상태 = '%상태%'
		WHERE ID = '%lv_id%'
		;

		)
		result := dbQuery(myDB, myQuery)
		if(errorCheck(result)){
			MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
		}else{
		}

SoundPlay, %A_WorkingDir%\sound\1.mp3



		gosub, READ9
	GuiControl, , e0, B

	Gui, 입고장:Submit, NoHide
	Gui, 입고장:ListView, lv7

WinSet, Redraw, , ahk_id %HLV7%
;~ GuiControl, hide, pic0

GuiControl,1:, PG1, 100 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
guicontrol, 입고장:show, direction2
	GuiControl, 입고장:, e0, B
	;~ Gui, 출고장:restore


        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

return


lv92:

SoundPlay, %A_WorkingDir%\sound\효과음92.mp3
;~ GuiControl, show, pic0

GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
gui, 1:submit, nohide
Gui, 1:ListView, lv92

if A_GuiEvent = DoubleClick
{
	RowNumber = 0
	Loop
	{
		RowNumber := LV_GetNext(RowNumber)

		if not RowNumber
			break
		selectRowNum := RowNumber
	}
	LV_GetText(lv_id, selectRowNum, 1)  ; OutputVar ID
	LV_GetText(lv_날짜, selectRowNum, 11)  ; OutputVar ID
	LV_GetText(lv_요일, selectRowNum, 3)  ; OutputVar ID
	LV_GetText(lv_시간, selectRowNum, 4)  ; OutputVar ID
	LV_GetText(lv_업체, selectRowNum, 5)  ; OutputVar ID
	LV_GetText(lv_입고지, selectRowNum, 6)  ; OutputVar ID
	LV_GetText(lv_진행, selectRowNum, 7)  ; OutputVar ID
	LV_GetText(lv_픽업, selectRowNum, 8)  ; OutputVar ID
	LV_GetText(lv_배송자, selectRowNum, 9)  ; OutputVar ID
	LV_GetText(lv_비고, selectRowNum, 12)  ; OutputVar ID
	Sleep, 10
}
/*
	RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_V(.*)_G(.*)_B", ed)
*/

	Gui, 입고장:Submit, NoHide
	Gui, 입고장:ListView, lv7

;~ MsgBox, % lv_id "`n" lv_업체

	상태 := "B"
	라벨 := "M"
파일이름 := OutputVar
	제목 := "[입하 준비중]"


		gosub, READ9



;~ WinSet, Redraw, , ahk_id %HLV7%
;~ GuiControl, hide, pic0

GuiControl,1:, PG1, 100 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
guicontrol, 입고장:show, direction2
	GuiControl, 입고장:, e0, B
	;~ Gui, 출고장:restore


        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

return




lv93:

gui, 1:submit, nohide
Gui, 1:ListView, lv93

if A_GuiEvent = DoubleClick
{
	RowNumber = 0
	Loop
	{
		RowNumber := LV_GetNext(RowNumber)

		if not RowNumber
			break
		selectRowNum := RowNumber
	}
	LV_GetText(lv_id, selectRowNum, 1)  ; OutputVar ID
	LV_GetText(lv_날짜, selectRowNum, 11)  ; OutputVar ID
	LV_GetText(lv_요일, selectRowNum, 3)  ; OutputVar ID
	LV_GetText(lv_시간, selectRowNum, 4)  ; OutputVar ID
	LV_GetText(lv_업체, selectRowNum, 5)  ; OutputVar ID
	LV_GetText(lv_입고지, selectRowNum, 6)  ; OutputVar ID
	LV_GetText(lv_진행, selectRowNum, 7)  ; OutputVar ID
	LV_GetText(lv_픽업, selectRowNum, 8)  ; OutputVar ID
	LV_GetText(lv_배송자, selectRowNum, 9)  ; OutputVar ID
	LV_GetText(lv_비고, selectRowNum, 12)  ; OutputVar ID
	Sleep, 10
}
	상태 := "C"
	파일이름 = OutputVar
	라벨 := "M"
	;~ GuiControl, , e1, %ed1%
	제목 := "[입고완료]"


	Gui, 입고장:Submit, NoHide
	Gui, 입고장:ListView, lv7
		gosub, READ9


WinSet, Redraw, , ahk_id %HLV7%
;~ GuiControl, hide, pic0

GuiControl,1:, PG1, 100 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
guicontrol, 입고장:show, direction2
	GuiControl, 입고장:, e0, C
	;~ Gui, 출고장:restore


        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

return







lv94:

gui, 1:submit, nohide
Gui, 1:ListView, lv94

if A_GuiEvent = DoubleClick
{
	RowNumber = 0
	Loop
	{
		RowNumber := LV_GetNext(RowNumber)

		if not RowNumber
			break
		selectRowNum := RowNumber
	}
	LV_GetText(lv_id, selectRowNum, 1)  ; OutputVar ID
	LV_GetText(lv_날짜, selectRowNum, 11)  ; OutputVar ID
	LV_GetText(lv_요일, selectRowNum, 3)  ; OutputVar ID
	LV_GetText(lv_시간, selectRowNum, 4)  ; OutputVar ID
	LV_GetText(lv_업체, selectRowNum, 5)  ; OutputVar ID
	LV_GetText(lv_입고지, selectRowNum, 6)  ; OutputVar ID
	LV_GetText(lv_진행, selectRowNum, 7)  ; OutputVar ID
	LV_GetText(lv_픽업, selectRowNum, 8)  ; OutputVar ID
	LV_GetText(lv_배송자, selectRowNum, 9)  ; OutputVar ID
	LV_GetText(lv_비고, selectRowNum, 12)  ; OutputVar ID
	Sleep, 10
}

	Gui, 입고장:Submit, NoHide
	Gui, 입고장:ListView, lv7

		gosub, READ9

WinSet, Redraw, , ahk_id %HLV7%
;~ GuiControl, hide, pic0

GuiControl,1:, PG1, 100 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
guicontrol, 입고장:show, direction2
	GuiControl, 입고장:, e0, D
	;~ Gui, 출고장:restore


        GuiControl,1:, PG1, 0 ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

return













LV41:
{
Gui, 1:ListView, LV41

if A_GuiEvent = DoubleClick
{
		;~ Clipboard :=
		RowNumber = 0
		Loop
		{
			RowNumber := LV_GetNext(RowNumber)

			if not RowNumber
				break
			selectRowNum := RowNumber
		}
	LV_GetText(OutputVar, selectRowNum)
	Sleep, 100

	RegExMatch(OutputVar, "30_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 4ed)
	;~ MsgBox, % OutputVar
Clipboard4 := OutputVar
	상태 := "30"
	파일이름 = OutputVar
	라벨 := "M"
	GuiControl, , 4e1, %4ed1%
	제목 := "[월간 리스트]"
}
	gosub, READ4
}
return









LV42:
Gui, 1:ListView, LV42
{
if A_GuiEvent = DoubleClick
{
	;~ Clipboard :=
		RowNumber = 0
		Loop
		{
			RowNumber := LV_GetNext(RowNumber)

			if not RowNumber
				break
			selectRowNum := RowNumber
		}
	LV_GetText(OutputVar, selectRowNum)
	Sleep, 100

	RegExMatch(OutputVar, "7_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 4ed)
	;~ MsgBox, % OutputVar
Clipboard4 := OutputVar
	상태 := "7"
	파일이름 = OutputVar
	라벨 := "M"
	GuiControl, , 4e1, %4ed1%
	제목 := "[주간 리스트]"
}
	gosub, READ4
}
return





LV43:
Gui, 1:ListView, LV43
	상태 := "2"
{
if A_GuiEvent = DoubleClick
{
		;~ Clipboard :=
		RowNumber = 0
		Loop
		{
			RowNumber := LV_GetNext(RowNumber)

			if not RowNumber
				break
			selectRowNum := RowNumber
		}
	LV_GetText(OutputVar, selectRowNum)
	Sleep, 100
;~ MsgBox,
	RegExMatch(OutputVar, "2_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 4ed)
	;~ MsgBox, % OutputVar

Clipboard4 := OutputVar


	파일이름 := OutputVar
	라벨 := "M"
	GuiControl, , 4e1, %4ed1%
	제목 := "[일일 리스트]"

}
	;~ MsgBox, % OutputVar
	gosub, READ4
}
return





READ4:

errorlevel =

FileRead, data4, %OutputVar%
	if not ErrorLevel  ; 성공적으로 적재됨.
	{

	}
	else
	{
		SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
		MsgBox , 262160, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
		return

	}

	;~ if (OutputVar = ){
		;~ gosub, READ4_1
		;~ return
	;~ }
	;~ else
	;~ {

	;~ }




READ4_1:

SysGet, 권한, MonitorCount
;~ MsgBox, % 권한


if (권한 >= 2)
{
}

else
{
	MsgBox, 262192, 권한이 없어서 안열림, 1
	return
}




		SoundPlay, %A_WorkingDir%\sound\매입.mp3
	;~ MsgBox, % OutputVar
	;~ Sleep, 1000

Gui, 사무:Destroy
	;~ MsgBox, % OutputVar
Gui, 사무:Default
Gui, 사무:-SysMenu
;~ Gui, 사무:+alwaysontop
	Gui, 사무:Submit, NoHide
Gui, 사무:Font, S19 CDefault W400, Malgun Gothic
gui, 사무:Add, progress, smooth x10 y135 w1120 h35 c00FFFF vmyprogress, 0
Gui, 사무:Add, ListView, x10 y+4 w1120 h463 grid vLV47 gLV47 hwndHLV47 -ReadOnly WantF2 -Multi NoSortHdr, 진행률|내용|비고 및 주의사항



LV_ModifyCol(1, 200)
LV_ModifyCol(2, 500)
LV_ModifyCol(3, 380)
;~ LV_ModifyCol(4, "80 Integer" "Integer Right")
;~ LV_ModifyCol(5, 80)
;~ LV_ModifyCol(6, 190)
Gui, 사무:Add, combobox, x10 y+3 w200 h40 v5tt1 r3, |진행중|완료
Gui, 사무:Add, Edit, x+0 w500 h40 v5tt2,
Gui, 사무:Add, Edit, x+0 w380 h40 v5tt3,

Gui, 사무:Font, S19 CDefault W400, Malgun Gothic
Gui, 사무:Add, Text, x10 y10 w170 h35 -VScroll, 시작일 ;1
Gui, 사무:Add, Text, x+10 w60 h35 -VScroll, 번호 ;2
Gui, 사무:Add, Text, x+10 w330 h35 -VScroll, 내용 ;3
Gui, 사무:Add, Text, x+10 w330 h35 -VScroll, 기타사항 ;4
Gui, 사무:Add, Text, x+10 w70 h35 -VScroll, 담당 ;4
Gui, 사무:Font, S24 CRED W700, Malgun Gothic
Gui, 사무:Add, Text, x+10 y2 w205 h40 +right -VScroll vtitle, %제목%


Gui, 사무:Font, S19 c99004C W400, Malgun Gothic
Gui, 사무:Add, Edit, ReadOnly x10 y+5 w170 h40 -VScroll v5t1, ; 시작일
Gui, 사무:Add, Edit, ReadOnly x+10 w60 h40 -VScroll v5t2, ; 번호
Gui, 사무:Add, Edit, ReadOnly x+10 w330 h40 -VScroll v5t3, ; 내용
Gui, 사무:Add, Edit, ReadOnly x+10 w330 h40 -VScroll v5t4, ; 기타사항
Gui, 사무:Add, Edit, ReadOnly x+10 w70 h40 -VScroll v5t5, ;누가



Gui, 사무:Font, S19 CDefault W400, Malgun Gothic
Gui, 사무:Add, Edit, x10 y+5 w170 h40 -VScroll v4e1, ; 시작일
Gui, 사무:Add, Edit, x+10 w60 h40 -VScroll v4e2, ; 번호
if(상태 = "30"){
루틴목록 := 루틴목록30
}
else if(상태 = "7"){
루틴목록 := 루틴목록7
}
else {
	루틴목록 := 루틴목록1
}
Gui, 사무:Add, combobox, x+10 w330 h40 -VScroll v4e3 r15, %루틴목록% ; 내용
Gui, 사무:Add, Edit, x+10 w330 h40 -VScroll v4e4,
Gui, 사무:Add, combobox, x+10 w70 h40 -VScroll v4e5 r5, |예|준
;~ Gui, 사무:Add, combobox, x+10 w60 h40 -VScroll v4e7 r6, |예|우|재|크



Gui, 사무:Font, S19 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 사무:Add, button, x1140 y45 w90 h40 c0xFF2211 v상태close4 g상태close4, 닫기
Gui, 사무:Add, button, y+10 w90 h40 c0xFF2211 v저장4 g저장4, 저장
Gui, 사무:Font, S13 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 사무:Add, button, y+40 w90 h60 cRED  g라인추출4,Get
Gui, 사무:Add, button, y+10 w90 h60 c0xFF2211  g라인수정4,Modify
Gui, 사무:Add, button, y+30 w90 h60 c0xFF2211  g라인추가4,Add
Gui, 사무:Add, button, y+10 w90 h60 c0xFF2211  g라인삽입4,Inset
Gui, 사무:Add, button, y+30 w90 h60 c0xFF2211  g라인삭제4,Delete
Gui, 사무:Add, button, y+10 w90 h60 c0xFF2211  g지우기4,Clear


Gui, 사무:Font, S1 CDefault W400, Malgun Gothic
Gui, 사무:Add, Edit, y+10 w50 h30 v4e9,
Gui, 사무:Add, Edit, ReadOnly x+5 w15 h30 v5t0 -VScroll,
Gui, 사무:Add, Edit, x+5 w15 h30 v4e0 -VScroll,
Gui, 사무:Font, S13 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 사무:Add, button, x1140 y+10 w90 h26 c0xFF2211  g삭제4,일정 삭제
Gui, 사무:Add, Picture, x250 y180 W804 H428 v4pic2, %A_WorkingDir%/loading.png
GuiControl, hide, 4pic2

GUI, 사무:Show, w1240 h730 x25 y25, 사무



Gui, 사무:ListView, LV47




;~ CSV_Load(OutputVar, "datacsv")
;~ MsgBox, % CSV_Search("datacsv", "a")



;~ MsgBox, % datacsv
loop, parse, data4, `n
{
	x:=[]
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	LV_Add("", x*)
}
GuiControl, , 5t1, %4ed1%
GuiControl, , 5t2, %4ed2%
GuiControl, , 5t3, %4ed3%
GuiControl, , 5t4, %4ed4%
GuiControl, , 5t5, %4ed5%
GuiControl, , 5t0, 사무

GuiControl, , 4e1, %4ed1%
GuiControl, , 4e2, %4ed2%
GuiControl, text, 4e3, %4ed3%
GuiControl, , 4e4, %4ed4%
GuiControl, text, 4e5, %4ed5%
GuiControl, , 4e0, 사무


recentfile := 상태 "_P" 4ed1 "_R" 4ed2 "_S" 4ed3 "_T" 4ed4 "_U" 4ed5 ".CSV"

;~ "30_P(.*)_Q(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV"



Gui, 사무:ListView, LV47

ICELV2 := New LV_InCellEdit(HLV47, True, True)

   ICELV2.OnMessage()




/*
; Create a new instance of LV_Colors
CLV47 := New LV_Colors(HLV47)
; Set the colors for selected rows
CLV47.SelectionColors(0xffcccc)
If !IsObject(CLV47) {
   MsgBox, 0, ERROR, Couldn't create a new LV_Colors object!
   ExitApp
}

WinSet, Redraw, , ahk_id %HLV47%
   CLV47.OnMessage()

Gui, Submit, NoHide
If (ColorsOn)
   CLV47.OnMessage()
GuiControl, Focus, %HLV47%
*/
리프레쉬4:
Gui, 사무:Submit, NoHide
Gui, 사무:ListView, LV47
Loop % LV_GetCount()
{
    LV_GetText(RetrievedText, A_Index)
    if (RetrievedText = "진행중"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLV47.ROW(A_Index, 0xFFBBBB, 0x000000)
	}
	else if (RetrievedText = "완료"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLV47.ROW(A_Index, 0x90FF8D, 0x000000)
	}
	else if (RetrievedText = "리스트업"){
	;~ LV_GetNext(StartingRowNumber, RowType)
	CLV47.ROW(A_Index, 0xFFFFFF, 0x000000)
	}
	else
	{
		CLV47.ROW(A_Index, 0x%칼라%, 0x000000)
	}
}



		WinWait, 사무,
IfWinNotActive, 사무, , WinActivate, 사무,
WinWaitActive, 사무,

return







삭제4:
SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
MsgBox, 262196, 일정 삭제, 일정을 삭제 하시겠습니까?,

{
	IfMsgBox Yes
	{
		SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
		MsgBox, 262196, 일정 삭제, 정말 입니까?
		{
			SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
			IfMsgBox Yes
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
				Sleep, 100
				;~ GuiControl,, myprogress, 10
				TempFile := 상태 "_P" 5t1 "_Q" 5t2 "_R" 5t3 "_S" 5t4 "_T" 5t5 "_U" 5t6 ".CSV" ;  기존
				TempFile1 := 상태 "_P" 4e1 "_Q" 4e2 "_R" 4e3 "_S" 4e4 "_T" 4e5 "_U" 4e6 ".CSV" ; 신규

				root1 := % A_WorkingDir "\사무루틴\" TempFile
				root2 := % A_WorkingDir "\사무루틴\삭제일정\" TempFile1

				FileDelete, %root1%

				gosub, 상태close4
				return
			}
			IfMsgBox NO
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
				Sleep, 1000
			}
		}
	}
	IfMsgBox NO
	{
		SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
		Sleep, 1000
	}

}
return


라인추출4:
;~ MsgBox, 사무

	Gui, 사무:Submit, NoHide

;~ ControlGet, Col1, List , selected Col1, SysListView321, 사무 ;2 모델

;~ GuiControl, choosestring, 5tt1 , %Col1%
;~ ControlGet, Col2, List , selected Col2, SysListView321, 사무 ;2 모델
;~ GuiControl, , 5tt2 , %Col2%
;~ ControlGet, Col3, List , selected Col3, SysListView321, 사무 ;2 모델
;~ GuiControl, , 5tt3 , %Col3%
;~ MsgBox , %Col1% %Col2% %Col3%

;~ Gui, Submit, NoHide

    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
		LV_GetText(OutputVar2, selectRowNum , 1)
		GuiControl, choosestring, 5tt1 , %OutputVar2%
		LV_GetText(OutputVar2, selectRowNum , 2)
		GuiControl, , 5tt2 , %OutputVar2%
		LV_GetText(OutputVar2, selectRowNum , 3)
		GuiControl, , 5tt3 , %OutputVar2%
	}



gosub, 리프레쉬4
return





라인추가4:

Gui, 사무:Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Add(,5tt1,5tt2,5tt3)
	gosub, 리프레쉬4
return




라인삽입4:

Gui, 사무:Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Insert(selectRowNum , ,5tt1,5tt2,5tt3)
	gosub, 리프레쉬4
return




라인삭제4:

Gui, 사무:Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Delete(selectRowNum)
	gosub, 리프레쉬4
return




라인수정4:

Gui, 사무:Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_Modify(selectRowNum , ,5tt1,5tt2,5tt3)
	gosub, 리프레쉬4
return




라인완료4:

지우기4:
GuiControl, , 5tt1,
GuiControl, , 5tt2,
GuiControl, , 5tt3,



return









LV47:

Gui, 사무:ListView, LV47

If (A_GuiEvent == "K") && (Chr(A_EventInfo) = "e") {
   Gui, ListView, %A_GuiControl%
   If (Row := LV_GetNext(0, "Focused"))
      ICELV2.EditCell(Row)
}

/*
if (A_GuiEvent = "DoubleClick")
{
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(OutputVar, selectRowNum)
	if (OutputVar = "진행중" || OutputVar = "완료" || OutputVar = "리스트업" || OutputVar = "")
	{
		MsgBox, 262179, 진행정도 수정하시겠습니까?,  ↓ 완료  /  ↓ 진행중   /   ↓ 초기화
		{
			IfMsgBox Yes
			{
				Sleep, 10
				Send, {F2}
				Sleep, 10
				SEND, 완료{ENTER}
				Sleep, 10



			}
			IfMsgBox NO
			{
				Sleep, 10
				Send, {F2}
				Sleep, 10
				SEND, 진행중{ENTER}
				Sleep, 10
			}
			IfMsgBox CANCEL
			{
				Sleep, 10
				Send, {F2}
				Sleep, 10
				SEND, {Del 5}{Backspace 5}{ENTER}
				Sleep, 10
			}

		}
	}
	else
	{
		Sleep, 100
		return
	}

WinSet, Redraw, , ahk_id %HLV47%
   CLV47.OnMessage()

Gui, Submit, NoHide
If (ColorsOn)
   CLV47.OnMessage()
GuiControl, Focus, %HLV47%

Gui, Submit, NoHide
Gui, 1:ListView, LV47
Loop % LV_GetCount()
{
    LV_GetText(RetrievedText, A_Index)
    if (RetrievedText = "진행중"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLV47.ROW(A_Index, 0xFFBBBB, 0x000000)
	}
	else if (RetrievedText = "완료"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLV47.ROW(A_Index, 0x90FF8D, 0x000000)
	}
	else if (RetrievedText = ""){
	;~ LV_GetNext(StartingRowNumber, RowType)
	CLV47.ROW(A_Index, 0xFFFFFF, 0x000000)
	}
	else
	{
	CLV47.ROW(A_Index, 0xFFFFFF, 0x000000)
	}
}
GuiControl, Choose, LV47, 0
Gui, 사무:Restore
}
*/
return







리스트로저장4:
;~ GuiControl, show, 4pic2
;~ 순수포멧 := "Y"
;~ 저장포멧 := "Y.CSV"
;~ 변환결과 := "[Ⅰ. 출고 리스트 업]"
;~ GuiControl, , 4e0, Y

;~ gosub, 변환
return

준비중으로저장4:
;~ GuiControl, show, 4pic2
;~ 순수포멧 := "X"
;~ 저장포멧 := "X.CSV"
;~ 변환결과 := "준비중으로저장"
;~ 문구 := "[Ⅱ. 준비중] ■□□"
;~ GuiControl, , 4e0, X
;~ gosub, 문자보내기4
;~ gosub, 변환4
return

준비완료로저장4:
;~ GuiControl, show, 4pic2
;~ 순수포멧 := "Z"
;~ 저장포멧 := "Z.CSV"
;~ 변환결과 := "준비완료로저장"
;~ 문구 := "[Ⅲ. 준비완료] ■■□"
;~ GuiControl, , 4e0, Z
;~ gosub, 문자보내기4
;~ gosub, 변환4
return


완료출하로저장4:
;~ GuiControl, show, 4pic2
;~ 순수포멧 := "W"
;~ 저장포멧 := "W.CSV"
;~ 변환결과 := "완료(출고)로저장"
;~ 문구 := "[Ⅳ. 출고 끝 당일] ■■■"
;~ GuiControl, , 4e0, W
;~ gosub, 문자보내기4
;~ gosub, 변환4
return





문자보내기4:
SoundPlay, %A_WorkingDir%\sound\저장중2.mp3
	WinShow, 카카오톡
	Sleep, 100
리스트만따로문자보내기4:

gui, 사무:submit, nohide
guicontrol, 사무:hide, 상태close4
guicontrol, 사무:hide, 저장14
guicontrol, 사무:hide, 리스트로저장4
guicontrol, 사무:hide, 준비중으로저장4
guicontrol, 사무:hide, 준비완료로저장4
guicontrol, 사무:hide, 완료출하로저장4
;~ WinSet, AlwaysOnTop , On, 사무

if WinExist("카카오톡")
{


		WinWait, 카카오톡,
	IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	WinWaitActive, 카카오톡,
Sleep,100

		WinWait, 카카오톡,
	IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	WinWaitActive, 카카오톡,
Sleep,100

			GuiControl,, myprogress, +10
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	Sleep,300
			GuiControl,, myprogress, +10
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,1000
	ControlSetText, Edit2, , 카카오톡
	GuiControl,, myprogress, +10
	controlsend, Edit2, %받는분%, 카카오톡
	Sleep, 100
	;~ controlsend, Edit2, {Enter}, 카카오톡
			GuiControl,, myprogress, +10
	Sleep, 500
	controlsend, Edit2, {Enter}, 카카오톡
			GuiControl,, myprogress, +10
	FormatTime, time, , yyyy년 MM월 dd일 HH시 mm분
	Sleep, 300
			GuiControl,, myprogress, +10
			RegExMatch(4e1, "2024-(.*)-(.*)", edate)
	4NewStr := RegExReplace(4e1, "-" , Replacement := "")
	4yoil := Get_Weekday(2NewStr, parmMode)

	GuiControl, , 4e9, %문구%`n`n%e3%`n%edate1%월%edate2%일(%4yoil%)  %e2%`n%e4%

	Sleep, 200
	ControlSend, Edit21, {CtrlDown}a{CtrlUp}, 사무
	Sleep, 200
	ControlSend, Edit21, {CtrlDown}x{CtrlUp}, 사무
	Sleep, 200
	ClipWait
			GuiControl,, myprogress, +10
	ControlFocus, RICHEDIT50W1, %받는분%
		Sleep, 100
	ControlSend, RICHEDIT50W1,{Space}{Backspace}, %받는분%
		Sleep, 100
	Send, {CtrlDown}a{CtrlUp}{BackSpace}
	Send, {CtrlDown}v{CtrlUp}{Enter}
	Sleep, 100

			GuiControl,, myprogress, +10
	Sleep, 300

	;~ Winkill, %받는분%
	Sleep,300

	ControlSetText, Edit2, , 카카오톡
	Sleep, 300
	WinMinimize, 카카오톡

}
else
{
}

;~ WinSet, AlwaysOnTop , on, 사무
;~ guicontrol, show, 상태close
;~ guicontrol, show, 저장1
;~ guicontrol, show, 리스트로저장
;~ guicontrol, show, 피킹으로저장
;~ guicontrol, show, 준비완료로저장
;~ guicontrol, show, 완료출하로저장
GuiControl, hide, 4pic2
return





변환4:
Gui, 사무:Submit, NoHide
guicontrol, 사무:hide, 상태close
guicontrol, 사무:hide, 저장1
guicontrol, 사무:hide, 리스트로저장
guicontrol, 사무:hide, 준비중으로저장
guicontrol, 사무:hide, 준비완료로저장
guicontrol, 사무:hide, 완료출하로저장

Sleep, 200
		GuiControl,, myprogress, +10
새로운포멧 = % "A" t1 "_B" t2 "_C" t3 "_D" t4 "_E" t5 "_V" t6 "_G" t7 "_" t0 ".CSV"  ;;;
새로운포멧1 = % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_V" e6 "_G" e7 "_" e0 ".CSV"  ;;;

errorlevel =
Sleep, 200
		GuiControl,, myprogress, +10
	FileMove, %A_WorkingDir%\%새로운포멧%, %A_WorkingDir%\%새로운포멧1% , 1
	if errorlevel = 1
	{
		Sleep, 200
	}
	else
	{
		gosub, 변환4
	}
SoundPlay, %A_WorkingDir%\sound\1.mp3
	GuiControl,, myprogress, 100
	MsgBox, 262192, 알림, %변환결과%`n변환했습니다!, 0.8
	GuiControl,, myprogress, 0

GuiControl, Hide, 4pic2
guicontrol, show, 상태close4
guicontrol, show, 저장14
;~ guicontrol, show, 리스트로저장
;~ guicontrol, show, 피킹으로저장
;~ guicontrol, show, 준비완료로저장
;~ guicontrol, show, 완료출하로저장
guicontrol, ,title, %변환결과%

if (순수포멧 = "Y")
{
guicontrol, hide, 리스트로저장4
guicontrol, show, 준비중으로저장4
guicontrol, hide, 준비완료로저장4
guicontrol, hide, 완료출하로저장4
}
else if (순수포멧 = "X")
{
guicontrol, show, 리스트로저장4
guicontrol, hide, 준비중으로저장4
guicontrol, show, 준비완료로저장4
guicontrol, hide, 완료출하로저장4
}
else if (순수포멧 = "Z")
{
guicontrol, hide, 리스트로저장4
guicontrol, show, 준비중으로저장4
guicontrol, hide, 준비완료로저장4
guicontrol, show, 완료출하로저장4
}
else if (순수포멧 = "W")
{
guicontrol, hide, 리스트로저장4
guicontrol, hide, 준비중으로저장4
guicontrol, show, 준비완료로저장4
guicontrol, hide, 완료출하로저장4
}
else
{
}

GuiControl, , 5t1, %4e1%
GuiControl, , 5t2, %4e2%
GuiControl, , 5t3, %4e3%
GuiControl, , 5t4, %4e4%
GuiControl, , 5t5, %4e5%
GuiControl, ChooseString, 5t6, %4e6%
GuiControl, ChooseString, 5t7, %4e7%
GuiControl, , 5t0, %4e0%

return





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ "A" ed1 "_B" ed2 "_C" ed3 "_D" ed4 "_E" ed5 "_V" ed6 "_G" ed7 "_" 상태 ".CSV"

저장4:
		SoundPlay, %A_WorkingDir%\sound\4로딩.mp3
gui, 사무:submit, nohide
A = 0
Loop, 7
{
	A++
bA := RegExReplace(4e%A%, "_" , Replacement := "")
GuiControl, , 4e%A%, %bA%
}
A = 0

;~ recentfile := 상태 "_P" 4ed1 "_Q" 4ed2 "_R" 4ed3 "_S" 4ed4 "_T" 4ed5 "_U" 4ed6 ".CSV"
;~ TempFile := % 상태 "_P" 4ed1 "_Q" 4ed2 "_R" 4ed3 "_S" 4ed4 "_T" 4ed5 "_U" 4ed6 저장포멧
Sleep, 200
;~ MsgBox, % newfile
root1 := % A_WorkingDir "\사무루틴\" recentfile
root2 := % A_WorkingDir "\사무루틴\삭제일정\" newfile
GuiControl,, myprogress, 10


;~ 상태 "_P" 5t1 "_Q" 5t2 "_R" 5t3 "_S" 5t4 "_T" 5t5 "_U" 5t6 저장포멧

TempFile := 상태 "_P" 5t1 "_R" 5t2 "_S" 5t3 "_T" 5t4 "_U" 5t5 ".CSV" ;  기존
TempFile1 := 상태 "_P" 4e1 "_R" 4e2 "_S" 4e3 "_T" 4e4 "_U" 4e5 ".CSV" ; 신규

root1 := % A_WorkingDir "\사무루틴\" TempFile
root2 := % A_WorkingDir "\사무루틴\삭제일정\" TempFile1

;~ root1 := % TempFile
;~ root2 := % TempFile1

;~ MsgBox, %TempFile%`n%TempFile1%`n%root1%`n%root2%


GuiControl, show, 4pic2
guicontrol, hide, 상태close4
guicontrol, hide, 저장4
guicontrol, hide, 리스트로저장4
guicontrol, hide, 준비중으로저장4
guicontrol, hide, 준비완료로저장4
guicontrol, hide, 완료출하로저장4

저장하기4:
errorlevel =
if FileExist(root1)
{
	FileMove, %root1%, %root2%, 1
		if errorlevel = 1
		{
			Sleep, 200
			gosub, 저장하기4
		}
		else
		{
			Sleep, 200
		}
		Sleep, 200
}
else
{
	Reload
}





Sleep, 200



makefile4:
errorlevel =
loop, % LV_GetCount() {

	RowNum := A_Index

	loop, 3
		LV_GetText(col%A_Index% , RowNum, a_index)
			GuiControl,, myprogress, +10
	FileAppend, % col1 "," col2 "," col3 ", `n", % A_MyDocuments "\" TempFile1
	Sleep, 5
    }

	if errorlevel = 1
	{
		Sleep, 1000
		gosub, makefile4
	}
	else
	{
		Sleep, 1000
	}
FileMove, % A_MyDocuments "\" TempFile1, % A_WorkingDir "\사무루틴\" TempFile1, 1
		GuiControl,, myprogress, 70
;~ Sleep, 2000

;~ FileMove, % A_WorkingDir "\사무루틴\" TempFile1, % A_WorkingDir "\사무루틴\수정된일정\" TempFile1, 1
		;~ GuiControl,, myprogress, 80
;~ Sleep, 2000

;~ FileMove, % A_WorkingDir "\사무루틴\수정된일정\" TempFile1, % A_WorkingDir "\사무루틴\" TempFile1, 1
		;~ GuiControl,, myprogress, 90
SoundPlay, %A_WorkingDir%\sound\1.mp3

		GuiControl,, myprogress, 0

	root3 = % A_WorkingDir "\사무루틴\" TempFile1


		GuiControl,, myprogress, 100
SoundPlay, %A_WorkingDir%\sound\1.mp3


GuiControl, hide, 4pic2
guicontrol, show, 상태close4
guicontrol, show, 저장4
guicontrol, show, 리스트로저장4
guicontrol, show, 준비중으로저장4
guicontrol, show, 준비완료로저장4
guicontrol, show, 완료출하로저장4
		GuiControl,, myprogress, 0
SoundPlay, %A_WorkingDir%\sound\저장완료.mp3
MsgBox, 262192, 알림, 저장 완료됐습니다, 0.8
;~ gui, submit, nohide
;~ GuiControl, , 5t1, %4e1%
;~ GuiControl, , 5t2, %4e2%
;~ GuiControl, , 5t3, %4e3%
;~ GuiControl, , 5t4, %4e4%
;~ GuiControl, , 5t5, %4e5%
;~ GuiControl, , 5t6, %4e6%
;~ GuiControl, , 5t7, %4e7%
;~ GuiControl, , 5t0, %4e0%



GuiControl, , 5t1, %4e1%
GuiControl, , 5t2, %4e2%
GuiControl, text, 5t3, %4e3%
GuiControl, , 5t4, %4e4%
GuiControl, text, 5t5, %4e5%
;~ GuiControl, , 4e0, %4e0%

Sleep, 100



	CSV_Load(root3, "rootcsv")
	CSV_Save(root3, "rootcsv", 1)
return




상태close4:


winkill, 사무

Sleep, 10
GuiControl, 1:Choose, refreshtab, 4
Sleep, 100
ControlClick, Button21, 신흥목재 전산프로그램

Sleep, 10
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ㅁㅁㅁㅁㅁㅁ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ㅁ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ㅁ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ㅁㅁㅁㅁㅁㅁ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ㅁ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ㅁㅁㅁㅁㅁㅁ.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



LV51:
{
Gui, 1:ListView, LV51

if A_GuiEvent = DoubleClick
{
		;~ Clipboard :=
		RowNumber = 0
		Loop
		{
			RowNumber := LV_GetNext(RowNumber)

			if not RowNumber
				break
			selectRowNum := RowNumber
		}
	LV_GetText(OutputVar, selectRowNum)
	Sleep, 100

	RegExMatch(OutputVar, "30_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 5ed)
	;~ MsgBox, % OutputVar
Clipboard5 := OutputVar
	상태 := "30"
	파일이름 = OutputVar
	라벨 := "M"
	GuiControl, , 5e1, %5ed1%
	제목 := "[월간 리스트]"
}
	gosub, READ5
}
return









LV52:
Gui, 1:ListView, LV52
{
if A_GuiEvent = DoubleClick
{
	Clipboard5 :=
		RowNumber = 0
		Loop
		{
			RowNumber := LV_GetNext(RowNumber)

			if not RowNumber
				break
			selectRowNum := RowNumber
		}
	LV_GetText(OutputVar, selectRowNum)
	Sleep, 100

	RegExMatch(OutputVar, "7_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 5ed)
	;~ MsgBox, % OutputVar
Clipboard5 := OutputVar
	상태 := "7"
	파일이름 = OutputVar
	라벨 := "M"
	GuiControl, , 5e1, %5ed1%
	제목 := "[주간 리스트]"
}
	gosub, READ5
}
return





LV53:
Gui, 1:ListView, LV53
	상태 := "2"
{
if A_GuiEvent = DoubleClick
{
		;~ Clipboard :=
		RowNumber = 0
		Loop
		{
			RowNumber := LV_GetNext(RowNumber)

			if not RowNumber
				break
			selectRowNum := RowNumber
		}
	LV_GetText(OutputVar, selectRowNum)
	Sleep, 100
;~ MsgBox,
	RegExMatch(OutputVar, "2_P(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV", 5ed)
	;~ MsgBox, % OutputVar

Clipboard5 := OutputVar


	파일이름 := OutputVar
	라벨 := "M"
	GuiControl, , 5e1, %5ed1%
	제목 := "[일일 리스트]"

}
	;~ MsgBox, % OutputVar
	gosub, READ5
}
return





READ5:
errorlevel =


FileRead, data5, %OutputVar%
	if not ErrorLevel  ; 성공적으로 적재됨.
	{

	}
	else
	{
		SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
		MsgBox , 262160, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
		return

	}

	;~ if (OutputVar = ){
		;~ gosub, READ4_1
		;~ return
	;~ }
	;~ else
	;~ {

	;~ }




READ5_1:

;~ SysGet, 권한, MonitorCount
;~ MsgBox, % 권한


;~ if (권한 >= 2)
;~ {
;~ }

;~ else
;~ {
	;~ MsgBox, 262192, 권한이 없어서 안열림
	;~ return
;~ }




		SoundPlay, %A_WorkingDir%\sound\매입.mp3
	;~ MsgBox, % OutputVar
	;~ Sleep, 1000

Gui, 현장루틴:Destroy
	;~ MsgBox, % OutputVar
Gui, 현장루틴:Default
Gui, 현장루틴:-SysMenu
;~ Gui, 현장루틴:+alwaysontop
	;~ Gui, Submit, NoHide
Gui, 현장루틴:Font, S19 CDefault W400, Malgun Gothic
gui, 현장루틴:Add, progress, smooth x10 y135 w1120 h35 c00FFFF vmyprogress, 0
Gui, 현장루틴:Add, ListView, x10 y+4 w1120 h463 grid vLV57 gLV57 hwndHLV57 -ReadOnly WantF2 -Multi NoSortHdr, 진행률|내용|비고 및 주의사항



LV_ModifyCol(1, 200)
LV_ModifyCol(2, 500)
LV_ModifyCol(3, 380)
;~ LV_ModifyCol(4, "80 Integer" "Integer Right")
;~ LV_ModifyCol(5, 80)
;~ LV_ModifyCol(6, 190)
Gui, 현장루틴:Add, combobox, x10 y+3 w200 h40 v5tt1 r3, |진행중|완료
Gui, 현장루틴:Add, Edit, x+0 w500 h40 v5tt2,
Gui, 현장루틴:Add, Edit, x+0 w380 h40 v5tt3,

Gui, 현장루틴:Font, S19 CDefault W400, Malgun Gothic
Gui, 현장루틴:Add, Text, x10 y10 w170 h35 -VScroll, 시작일 ;1
Gui, 현장루틴:Add, Text, x+10 w60 h35 -VScroll, 번호 ;2
Gui, 현장루틴:Add, Text, x+10 w330 h35 -VScroll, 내용 ;3
Gui, 현장루틴:Add, Text, x+10 w330 h35 -VScroll, 기타사항 ;4
Gui, 현장루틴:Add, Text, x+10 w70 h35 -VScroll, 담당 ;4
Gui, 현장루틴:Font, S24 CRED W700, Malgun Gothic
Gui, 현장루틴:Add, Text, x+10 y2 w205 h40 +right -VScroll vtitle, %제목%


Gui, 현장루틴:Font, S19 c99004C W400, Malgun Gothic
Gui, 현장루틴:Add, Edit, ReadOnly x10 y+5 w170 h40 -VScroll v5t1, ; 시작일
Gui, 현장루틴:Add, Edit, ReadOnly x+10 w60 h40 -VScroll v5t2, ; 번호
Gui, 현장루틴:Add, Edit, ReadOnly x+10 w330 h40 -VScroll v5t3, ; 내용
Gui, 현장루틴:Add, Edit, ReadOnly x+10 w330 h40 -VScroll v5t4, ; 기타사항
Gui, 현장루틴:Add, Edit, ReadOnly x+10 w70 h40 -VScroll v5t5, ;누가



Gui, 현장루틴:Font, S19 CDefault W400, Malgun Gothic
Gui, 현장루틴:Add, Edit, x10 y+5 w170 h40 -VScroll v5e1, ; 시작일
Gui, 현장루틴:Add, Edit, x+10 w60 h40 -VScroll v5e2, ; 번호
if(상태 = "30"){
루틴목록 := 루틴목록30
}
else if(상태 = "7"){
루틴목록 := 루틴목록7
}
else {
	루틴목록 := 루틴목록1
}
Gui, 현장루틴:Add, combobox, x+10 w330 h40 -VScroll v5e3 r15, %루틴목록% ; 내용
Gui, 현장루틴:Add, Edit, x+10 w330 h40 -VScroll v5e4,
Gui, 현장루틴:Add, combobox, x+10 w70 h40 -VScroll v5e5 r5, |예|준
;~ Gui, 현장루틴:Add, combobox, x+10 w60 h40 -VScroll v5e7 r6, |예|우|재|크



Gui, 현장루틴:Font, S19 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 현장루틴:Add, button, x1140 y45 w90 h40 c0xFF2211 v상태close5 g상태close5, 닫기
Gui, 현장루틴:Add, button, y+10 w90 h40 c0xFF2211 v저장5 g저장5, 저장
Gui, 현장루틴:Font, S13 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 현장루틴:Add, button, y+40 w90 h60 cRED  g라인추출5,Get
Gui, 현장루틴:Add, button, y+10 w90 h60 c0xFF2211  g라인수정5,Modify
Gui, 현장루틴:Add, button, y+30 w90 h60 c0xFF2211  g라인추가5,Add
Gui, 현장루틴:Add, button, y+10 w90 h60 c0xFF2211  g라인삽입5,Inset
Gui, 현장루틴:Add, button, y+30 w90 h60 c0xFF2211  g라인삭제5,Delete
Gui, 현장루틴:Add, button, y+10 w90 h60 c0xFF2211  g지우기5,Clear


Gui, 현장루틴:Font, S1 CDefault W400, Malgun Gothic
Gui, 현장루틴:Add, Edit, y+10 w50 h30 v5e9,
Gui, 현장루틴:Add, Edit, ReadOnly x+5 w15 h30 v5t0 -VScroll,
Gui, 현장루틴:Add, Edit, x+5 w15 h30 v5e0 -VScroll,
Gui, 현장루틴:Font, S13 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 현장루틴:Add, button, x1140 y+10 w90 h26 c0xFF2211  g삭제5,일정 삭제
Gui, 현장루틴:Add, Picture, x250 y180 W804 H428 v4pic2, %A_WorkingDir%/loading.png
GuiControl, hide, 4pic2

GUI, 현장루틴:Show, w1240 h730 x25 y25, 현장루틴



Gui, 현장루틴:ListView, LV57




;~ CSV_Load(OutputVar, "datacsv")
;~ MsgBox, % CSV_Search("datacsv", "a")



;~ MsgBox, % datacsv
loop, parse, data5, `n
{
	x:=[]
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	LV_Add("", x*)
}
GuiControl, , 5t1, %5ed1%
GuiControl, , 5t2, %5ed2%
GuiControl, , 5t3, %5ed3%
GuiControl, , 5t4, %5ed4%
GuiControl, , 5t5, %5ed5%
GuiControl, , 5t0, 현장루틴

GuiControl, , 5e1, %5ed1%
GuiControl, , 5e2, %5ed2%
GuiControl, text, 5e3, %5ed3%
GuiControl, , 5e4, %5ed4%
GuiControl, text, 5e5, %5ed5%
GuiControl, , 5e0, 현장루틴


recentfile := 상태 "_P" 5ed1 "_R" 5ed2 "_S" 5ed3 "_T" 5ed4 "_U" 5ed5 ".CSV"

;~ "30_P(.*)_Q(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV"



Gui, 현장루틴:ListView, LV57



; Create a new instance of LV_Colors
CLV57 := New LV_Colors(HLV57)
; Set the colors for selected rows
;~ CLV57.SelectionColors(0xffcccc)
If !IsObject(CLV57) {
   MsgBox, 0, ERROR, Couldn't create a new LV_Colors object!, 0.1
   ExitApp
}

WinSet, Redraw, , ahk_id %HLV57%
   CLV57.OnMessage()

Gui, Submit, NoHide
If (ColorsOn)
   CLV57.OnMessage()
GuiControl, Focus, %HLV57%
Sleep, 20
리프레쉬5:
Loop,3
{
	;~ Sleep, 1
	Gui, Submit, NoHide
	Gui, 현장루틴:ListView, LV57
	Loop % LV_GetCount()
	{
		LV_GetText(RetrievedText, A_Index)
		if (RetrievedText = "●"){
		  ;~ LV_GetNext(StartingRowNumber, RowType)
			CLV57.ROW(A_Index, 0xFFCC00, 0x000000)
		}
		else
		{
			CLV57.ROW(A_Index, 0x%칼라%, 0x000000)
		}
	}
WinSet, Redraw, , ahk_id %HLV57%
}



WinWait, 현장루틴,
IfWinNotActive, 현장루틴, , WinActivate, 현장루틴,
WinWaitActive, 현장루틴,

data5 :=
;~ Clipboard :=

return




삭제5:
SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
MsgBox, 262196, 일정 삭제, 일정을 삭제 하시겠습니까?,

{
	IfMsgBox Yes
	{
		SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
		MsgBox, 262196, 일정 삭제, 정말 입니까?
		{
			SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
			IfMsgBox Yes
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
				Sleep, 100
				;~ GuiControl,, myprogress, 10
				TempFile := 상태 "_P" 5t1 "_Q" 5t2 "_R" 5t3 "_S" 5t4 "_T" 5t5 "_U" 5t6 ".CSV" ;  기존
				TempFile1 := 상태 "_P" 5e1 "_Q" 5e2 "_R" 5e3 "_S" 5e4 "_T" 5e5 "_U" 5e6 ".CSV" ; 신규

				root1 := % A_WorkingDir "\현장루틴\" TempFile
				root2 := % A_WorkingDir "\현장루틴\삭제일정\" TempFile1

				FileDelete, %root1%

				gosub, 상태close5
				return
			}
			IfMsgBox NO
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
				Sleep, 1000
			}
		}
	}
	IfMsgBox NO
	{
		SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
		Sleep, 1000
	}

}
return


라인추출5:


Gui, Submit, NoHide

    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
		LV_GetText(OutputVar2, selectRowNum , 1)
		GuiControl, choosestring, 5tt1 , %OutputVar2%
		LV_GetText(OutputVar2, selectRowNum , 2)
		GuiControl, , 5tt2 , %OutputVar2%
		LV_GetText(OutputVar2, selectRowNum , 3)
		GuiControl, , 5tt3 , %OutputVar2%
	}



gosub, 리프레쉬5
return





라인추가5:

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Add(,5tt1,5tt2,5tt3)
	gosub, 리프레쉬5
return




라인삽입5:

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Insert(selectRowNum , ,5tt1,5tt2,5tt3)
	gosub, 리프레쉬5
return




라인삭제5:

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Delete(selectRowNum)
	gosub, 리프레쉬5
return




라인수정5:

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_Modify(selectRowNum , ,5tt1,5tt2,5tt3)
	gosub, 리프레쉬5
return




라인완료5:

지우기5:
GuiControl, , 5tt1,
GuiControl, , 5tt2,
GuiControl, , 5tt3,



return









LV57:

Gui, 현장루틴:ListView, LV57
Gui, Submit, NoHide
if (A_GuiEvent = "DoubleClick")
{
SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(OutputVar, selectRowNum)
	;~ if (OutputVar = "●" || OutputVar = "" )
	;~ {

		;~ Gui, 1:-alwaysontop
		;~ Gui, 현장루틴:-alwaysontop
		MsgBox, 262196, 작업 진행 여부, 완료 하셨나요?
		{
			IfMsgBox Yes
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
				Sleep, 100
				Send, {F2}
				Sleep, 100
				SEND, ●{ENTER}
					Sleep, 100



			}
			IfMsgBox NO
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
				Sleep, 100
				Send, {F2}
				Sleep, 100
				SEND, {del 5}{Backspace 5}
				Sleep, 100
			}

		}
	;~ }
	;~ else
	;~ {
		;~ Sleep, 100
		;~ return
	;~ }

WinSet, Redraw, , ahk_id %HLV57%
   CLV57.OnMessage()

;~ Gui, Submit, NoHide
If (ColorsOn)
   CLV57.OnMessage()
GuiControl, Focus, %HLV57%

;~ Gui, Submit, NoHide
	;~ Sleep, 1
	Gui, Submit, NoHide
	Gui, 현장루틴:ListView, LV57
	Loop % LV_GetCount()
	{
		LV_GetText(RetrievedText, A_Index)
		if (RetrievedText = "●"){
		  ;~ LV_GetNext(StartingRowNumber, RowType)
			CLV57.ROW(A_Index, 0xFFCC00, 0x000000)
		}
		else
		{
			CLV57.ROW(A_Index, 0x%칼라%, 0x000000)
		}
	}
;~ WinSet, Redraw, , ahk_id %HLV57%
GuiControl, Choose, LV57, 0
Gui, 현장루틴:Restore

return
}


return







리스트로저장5:
;~ GuiControl, show, 4pic2
;~ 순수포멧 := "Y"
;~ 저장포멧 := "Y.CSV"
;~ 변환결과 := "[Ⅰ. 출고 리스트 업]"
;~ GuiControl, , 5e0, Y

;~ gosub, 변환
return

준비중으로저장5:
;~ GuiControl, show, 4pic2
;~ 순수포멧 := "X"
;~ 저장포멧 := "X.CSV"
;~ 변환결과 := "준비중으로저장"
;~ 문구 := "[Ⅱ. 준비중] ■□□"
;~ GuiControl, , 5e0, X
;~ gosub, 문자보내기4
;~ gosub, 변환4
return

준비완료로저장5:
;~ GuiControl, show, 4pic2
;~ 순수포멧 := "Z"
;~ 저장포멧 := "Z.CSV"
;~ 변환결과 := "준비완료로저장"
;~ 문구 := "[Ⅲ. 준비완료] ■■□"
;~ GuiControl, , 5e0, Z
;~ gosub, 문자보내기4
;~ gosub, 변환4
return


완료출하로저장5:
;~ GuiControl, show, 4pic2
;~ 순수포멧 := "W"
;~ 저장포멧 := "W.CSV"
;~ 변환결과 := "완료(출고)로저장"
;~ 문구 := "[Ⅳ. 출고 끝 당일] ■■■"
;~ GuiControl, , 5e0, W
;~ gosub, 문자보내기4
;~ gosub, 변환4
return





문자보내기5:
SoundPlay, %A_WorkingDir%\sound\저장중2.mp3
	WinShow, 카카오톡
	Sleep, 100
리스트만따로문자보내기5:
gui, submit, nohide
guicontrol, hide, 상태close5
guicontrol, hide, 저장15
guicontrol, hide, 리스트로저장5
guicontrol, hide, 준비중으로저장5
guicontrol, hide, 준비완료로저장5
guicontrol, hide, 완료출하로저장5
;~ WinSet, AlwaysOnTop , On, 현장루틴

if WinExist("카카오톡")
{

		WinWait, 카카오톡,
	IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	WinWaitActive, 카카오톡,
	Sleep,100
		WinWait, 카카오톡,
	IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
	WinWaitActive, 카카오톡,
	Sleep,100

			GuiControl,, myprogress, +10

	;~ ControlClick, x29 y118, 카카오톡
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y23
ControlClick, EVA_ChildWindow1, 카카오톡,,,,x31 y90
	Sleep,300
			GuiControl,, myprogress, +10
	ControlSend, EVA_Window2, {CtrlDown}F{CtrlUp}, 카카오톡
	Sleep,1000
	ControlSetText, Edit2, , 카카오톡
	GuiControl,, myprogress, +10
	controlsend, Edit2, %받는분%, 카카오톡
	Sleep, 100
	;~ controlsend, Edit2, {Enter}, 카카오톡
			GuiControl,, myprogress, +10
	Sleep, 500
	controlsend, Edit2, {Enter}, 카카오톡
			GuiControl,, myprogress, +10
	FormatTime, time, , yyyy년 MM월 dd일 HH시 mm분
	Sleep, 300
			GuiControl,, myprogress, +10
			RegExMatch(5e1, "2024-(.*)-(.*)", edate)
	4NewStr := RegExReplace(5e1, "-" , Replacement := "")
	4yoil := Get_Weekday(2NewStr, parmMode)

	GuiControl, , 5e9, %문구%`n`n%e3%`n%edate1%월%edate2%일(%4yoil%)  %e2%`n%e4%

	Sleep, 200
	ControlSend, Edit21, {CtrlDown}a{CtrlUp}, 현장루틴
	Sleep, 200
	ControlSend, Edit21, {CtrlDown}x{CtrlUp}, 현장루틴
	Sleep, 200
	ClipWait
			GuiControl,, myprogress, +10
	ControlFocus, RICHEDIT50W1, %받는분%
	ControlSend, RICHEDIT50W1,{Space}{Backspace}, %받는분%
		Sleep, 100
	Send, {CtrlDown}a{CtrlUp}{BackSpace}
	Send, {CtrlDown}v{CtrlUp}{Enter}
	Sleep, 100

			GuiControl,, myprogress, +10
	Sleep, 300

	;~ Winkill, %받는분%
	Sleep,300

	ControlSetText, Edit2, , 카카오톡
	Sleep, 300

	WinMinimize, 카카오톡
}
else
{
}

;~ WinSet, AlwaysOnTop , on, 현장루틴
;~ guicontrol, show, 상태close
;~ guicontrol, show, 저장1
;~ guicontrol, show, 리스트로저장
;~ guicontrol, show, 피킹으로저장
;~ guicontrol, show, 준비완료로저장
;~ guicontrol, show, 완료출하로저장
GuiControl, hide, 4pic2
return





변환5:

Gui, Submit, NoHide
guicontrol, hide, 상태close5
guicontrol, hide, 저장15
guicontrol, hide, 리스트로저장5
guicontrol, hide, 준비중으로저장5
guicontrol, hide, 준비완료로저장5
guicontrol, hide, 완료출하로저장5


Sleep, 200
		GuiControl,, myprogress, +10
새로운포멧 = % "A" t1 "_B" t2 "_C" t3 "_D" t4 "_E" t5 "_V" t6 "_G" t7 "_" t0 ".CSV"  ;;;
새로운포멧1 = % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_V" e6 "_G" e7 "_" e0 ".CSV"  ;;;


Sleep, 200


		GuiControl,, myprogress, +10
		errorlevel =
	FileMove, %A_WorkingDir%\%새로운포멧%, %A_WorkingDir%\%새로운포멧1% , 1
	if errorlevel = 1
	{
		Sleep, 200
	}
	else
	{
		gosub, 변환5
	}
SoundPlay, %A_WorkingDir%\sound\1.mp3
	GuiControl,, myprogress, 100
	MsgBox, 262192, 알림, %변환결과%`n변환했습니다!, 0.8
	GuiControl,, myprogress, 0

GuiControl, Hide, 5pic2
guicontrol, show, 상태close5
guicontrol, show, 저장15
;~ guicontrol, show, 리스트로저장
;~ guicontrol, show, 피킹으로저장
;~ guicontrol, show, 준비완료로저장
;~ guicontrol, show, 완료출하로저장
guicontrol, ,title, %변환결과%



GuiControl, , 5t1, %5e1%
GuiControl, , 5t2, %5e2%
GuiControl, , 5t3, %5e3%
GuiControl, , 5t4, %5e4%
GuiControl, , 5t5, %5e5%
GuiControl, ChooseString, 5t6, %5e6%
GuiControl, ChooseString, 5t7, %5e7%
GuiControl, , 5t0, %5e0%

return





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ "A" ed1 "_B" ed2 "_C" ed3 "_D" ed4 "_E" ed5 "_V" ed6 "_G" ed7 "_" 상태 ".CSV"

저장5:
		SoundPlay, %A_WorkingDir%\sound\4로딩.mp3
gui, submit, nohide
A = 0
Loop, 7
{
	A++
bA := RegExReplace(5e%A%, "_" , Replacement := "")
GuiControl, , 5e%A%, %bA%
}
A = 0

;~ recentfile := 상태 "_P" 5ed1 "_Q" 5ed2 "_R" 5ed3 "_S" 5ed4 "_T" 5ed5 "_U" 5ed6 ".CSV"
;~ TempFile := % 상태 "_P" 5ed1 "_Q" 5ed2 "_R" 5ed3 "_S" 5ed4 "_T" 5ed5 "_U" 5ed6 저장포멧
Sleep, 200
;~ MsgBox, % newfile
root1 := % A_WorkingDir "\현장루틴\" recentfile
root2 := % A_WorkingDir "\현장루틴\삭제일정\" newfile
GuiControl,, myprogress, 10


;~ 상태 "_P" 5t1 "_Q" 5t2 "_R" 5t3 "_S" 5t4 "_T" 5t5 "_U" 5t6 저장포멧

TempFile := 상태 "_P" 5t1 "_R" 5t2 "_S" 5t3 "_T" 5t4 "_U" 5t5 ".CSV" ;  기존
TempFile1 := 상태 "_P" 5e1 "_R" 5e2 "_S" 5e3 "_T" 5e4 "_U" 5e5 ".CSV" ; 신규

root1 := % A_WorkingDir "\현장루틴\" TempFile
root2 := % A_WorkingDir "\현장루틴\삭제일정\" TempFile1

;~ root1 := % TempFile
;~ root2 := % TempFile1

;~ MsgBox, %TempFile%`n%TempFile1%`n%root1%`n%root2%


GuiControl, show, 5pic2
guicontrol, hide, 상태close5
guicontrol, hide, 저장5
guicontrol, hide, 리스트로저장5
guicontrol, hide, 준비중으로저장5
guicontrol, hide, 준비완료로저장5
guicontrol, hide, 완료출하로저장5

저장하기5:
errorlevel =
if FileExist(root1)
{
	FileMove, %root1%, %root2%, 1
		if errorlevel = 1
		{
			Sleep, 200
			gosub, 저장하기5
		}
		else
		{
			Sleep, 200
		}
		Sleep, 200
}
else
{
	Reload
}




GuiControl,, myprogress, 20





Sleep, 200





makefile5:
errorlevel =
loop, % LV_GetCount() {

	RowNum := A_Index

	loop, 3
		LV_GetText(col%A_Index% , RowNum, a_index)
			GuiControl,, myprogress, +10
	FileAppend, % col1 "," col2 "," col3 ", `n", % A_MyDocuments "\" TempFile1
	Sleep, 5
    }
	if errorlevel = 1
	{
		Sleep, 1000
		gosub, makefile5
	}
	else
	{
		Sleep, 1000
	}
FileMove, % A_MyDocuments "\" TempFile1, % A_WorkingDir "\현장루틴\" TempFile1, 1
		GuiControl,, myprogress, 70
;~ Sleep, 2000

;~ FileMove, % A_WorkingDir "\현장루틴\" TempFile1, % A_WorkingDir "\현장루틴\수정된일정\" TempFile1, 1
		;~ GuiControl,, myprogress, 80
;~ Sleep, 2000

;~ FileMove, % A_WorkingDir "\현장루틴\수정된일정\" TempFile1, % A_WorkingDir "\현장루틴\" TempFile1, 1
		;~ GuiControl,, myprogress, 90
SoundPlay, %A_WorkingDir%\sound\1.mp3

		GuiControl,, myprogress, 0

	root5 = % A_WorkingDir "\현장루틴\" TempFile1


		GuiControl,, myprogress, 100
SoundPlay, %A_WorkingDir%\sound\1.mp3


GuiControl, hide, 4pic2
guicontrol, show, 상태close5
guicontrol, show, 저장5
guicontrol, show, 리스트로저장5
guicontrol, show, 준비중으로저장5
guicontrol, show, 준비완료로저장5
guicontrol, show, 완료출하로저장5
		GuiControl,, myprogress, 0
SoundPlay, %A_WorkingDir%\sound\저장완료.mp3
MsgBox, 262192, 알림, 저장 완료됐습니다, 0.8
;~ gui, submit, nohide
;~ GuiControl, , 5t1, %4e1%
;~ GuiControl, , 5t2, %4e2%
;~ GuiControl, , 5t3, %4e3%
;~ GuiControl, , 5t4, %4e4%
;~ GuiControl, , 5t5, %4e5%
;~ GuiControl, , 5t6, %4e6%
;~ GuiControl, , 5t7, %4e7%
;~ GuiControl, , 5t0, %4e0%



GuiControl, , 5t1, %5e1%
GuiControl, , 5t2, %5e2%
GuiControl, text, 5t3, %5e3%
GuiControl, , 5t4, %5e4%
GuiControl, text, 5t5, %5e5%
;~ GuiControl, , 4e0, %4e0%

Sleep, 100



	CSV_Load(root5, "rootcsv")
	CSV_Save(root5, "rootcsv", 1)
return




상태close5:

winkill, 현장루틴

Sleep, 10
GuiControl, 1:Choose, refreshtab, 5
Sleep, 100
ControlClick, Button25, 신흥목재 전산프로그램

Sleep, 10
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;











; 요일 구하기 함수
Get_Weekday(parmDate, parmMode)
{
if StrLen(parmDate) <> 8
return,""
if parmDate is not Integer
return,""
if parmMode not in 0,1
return,""
FormatTime,WeekDay,%parmDate%, ddd
if parmMode = 1
{
objWeekDay := {"일":1, "월":2, "화":3, "수":4, "목":5, "금":6, "토":7}
ReturnString := objWeekDay [WeekDay]
}
else
ReturnString := WeekDay
return,ReturnString
}


;vWDayStart: day defined as first day of week (Sun:1, Sat:7)
DateGetWeekStart(vDate, vWDayStart:=2, vFormat:="yyyyMMddHHmmss")
{
	if (vDate = "")
		vDate := A_Now
	FormatTime, vWDay, % vDate, WDay
	vNum := Mod(vWDayStart+7-vWDay, 7)
	if vNum
		EnvAdd, vDate, % vNum-7, Days
	vDate := SubStr(vDate, 1, 8) "000000"
	if !(vFormat == "yyyyMMddHHmmss")
	{
		FormatTime, vDate, % vDate, % vFormat
		return vDate
	}
	return vDate
}

;vWDayEnd: day defined as last day of week (Sun:1, Sat:7)
DateGetWeekEnd(vDate, vWDayEnd:=1, vFormat:="yyyyMMddHHmmss")
{
	if (vDate = "")
		vDate := A_Now
	FormatTime, vWDay, % vDate, WDay
	vNum := Mod(vWDayEnd+7-vWDay, 7)
	if vNum
		EnvAdd, vDate, % vNum, Days
	vDate := SubStr(vDate, 1, 8) "235959"
	if !(vFormat == "yyyyMMddHHmmss")
	{
		FormatTime, vDate, % vDate, % vFormat
		return vDate
	}
	return vDate
}


;~ MsgBox, % vMonthStart "`r`n" vDate "`r`n" vMonthEnd

DateAdd(DateTime, Time, TimeUnits)
{
	EnvAdd, DateTime, % Time, % TimeUnits
	return DateTime
}




PERCENT(FILENAME)
{

	global
	CSV_Load(FILENAME, "DATA")
	Rows := CSV_TotalRows("DATA")
	COUNT=

	;~ MsgBox % Rows
	Loop, % Rows
	{
	 found:=CSV_Search("DATA", "●", A_Index)
	 if found=0
		break
	 COUNT ++
	}
	COUNT := ( ( COUNT / Rows ) * 100 )


	COUNT := Round(COUNT , -1)

;~ MsgBox % COUNT




return
}



PERCENT4(FILENAME)
{

	global
	CSV_Load(FILENAME, "DATA")
	Rows := CSV_TotalRows("DATA")
	COUNT=

	;~ MsgBox % Rows
	Loop, % Rows
	{
	found1:=CSV_Search("DATA", "!", A_Index)
	;~ found2:=CSV_Search("DATA", "★", A_Index)
		if (found1=0)
		{
		}
		else
		{
		COUNT ++
		}

		;~ if (found2=0)
		;~ {
		;~ }
		;~ else
		;~ {
		;~ COUNT ++
		;~ }

	}

	COUNT := ( ( COUNT / Rows ) * 100 )


	COUNT := Round(COUNT , -1)

;~ MsgBox % COUNT


return
}




PERCENT9(FILENAME)
{

	global
	CSV_Load(FILENAME, "DATA")
	Rows := CSV_TotalRows("DATA")
	COUNT=

	;~ MsgBox % Rows
	Loop, % Rows
	{
	found1:=CSV_Search("DATA", "●", A_Index)
	found2:=CSV_Search("DATA", "★", A_Index)
		if (found1=0)
		{
		}
		else
		{
		COUNT ++
		}

		if (found2=0)
		{
		}
		else
		{
		COUNT ++
		}

	}

	COUNT := ( ( COUNT / Rows ) * 100 )


	COUNT := Round(COUNT , -1)

;~ MsgBox % COUNT


return
}


READedsm:
{



	;~ OutputVar := A_WorkingDir "\" OutputVar




		;~ Clipboard =

containr = % A_WorkingDir "\일일재고관리\" OutputVar


errorlevel =
FileRead, dataedsm, %containr%
	if not ErrorLevel  ; 성공적으로 적재됨.
	{
		SoundPlay, %A_WorkingDir%\sound\soundopen.mp3
	}
	else
	{
		SoundPlay, %A_WorkingDir%\sound\초기화중.mp3
		MsgBox , 262160, 문제발생, 읽기 실패`n관리자에게 문의하세요, 2
		;~ FileRead, data, %contain%
		return

	}

;~ Clipboard :=

;~ FileRead, data, %OutputVar%
SoundPlay, %A_WorkingDir%\sound\열때.mp3
Gui, 재고관리:Destroy
Gui, 재고관리:Default
Gui, 재고관리:-SysMenu
;~ Gui, 재고관리:+alwaysontop
Gui, Submit, NoHide
Gui, 재고관리:Font, S19 CDefault W400, Malgun Gothic
gui, 재고관리:Add, progress, smooth x10 y135 w1120 h35 cCCCCFF vmyprogress, 0
Gui, 재고관리:Add, ListView, x10 y+4 w1120 h463 grid vLVedsm1 gLVedsm1 hwndHLVedsm1 -ReadOnly WantF2 -Multi NoSortHdr, 태|로케이션|품명|규격|단위|현재고

LV_ModifyCol(1, 50)
LV_ModifyCol(2, 150)
LV_ModifyCol(3, 330)
LV_ModifyCol(4, 330)
LV_ModifyCol(5, 70)
LV_ModifyCol(6, "100 Integer" "Integer Right")
;~ LV_ModifyCol(4, "80 Integer" "Integer Right")
;~ LV_ModifyCol(5, 80)
;~ LV_ModifyCol(6, 190)
Gui, 재고관리:Add, combobox, x10 y+3 w200 h40 v5tt1 r3, |진행중|완료
Gui, 재고관리:Add, Edit, x+0 w500 h40 v5tt2,
Gui, 재고관리:Add, Edit, x+0 w380 h40 v5tt3,
;~ Gui, 재고관리:Add, Edit, x+0 w60 h40 v5tt4,
;~ Gui, 재고관리:Add, Edit, x+0 w80 h40 v5tt5,
;~ Gui, 재고관리:Add, Edit, x+0 w190 h40 v5tt6,
Gui, 재고관리:Font, S13 CDefault W400, Malgun Gothic
;~ Gui, 재고관리:Add, button, x10 y+0 w160 h32
;~ Gui, 재고관리:Add, button, x+10 w160 h32
;~ Gui, 재고관리:Add, button, x+50 w160 h32
;~ Gui, 재고관리:Add, button, x+10 w160 h32
;~ Gui, 재고관리:Add, button, x+50 w160 h32
;~ Gui, 재고관리:Add, button, x+10 w160 h32
;~ Gui, 재고관리:Add, button, x+40 w90 h32


Gui, 재고관리:Font, S19 CDefault W400, Malgun Gothic
Gui, 재고관리:Add, Text, x10 y10 w170 h30 -VScroll, 시작일
Gui, 재고관리:Add, Text, x+10 w170 h30 -VScroll, 마감일
Gui, 재고관리:Add, Text, x+10 w60 h30 -VScroll, 번호
Gui, 재고관리:Add, Text, x+10 w310 h30 -VScroll, 내용
Gui, 재고관리:Add, Text, x+10 w230 h30 -VScroll, 기타사항
Gui, 재고관리:Font, S24 CRED W700, Malgun Gothic
Gui, 재고관리:Add, Text, x+40 y2 w205 h40 +right -VScroll vtitle, %제목%
Gui, 재고관리:Font, S19 c99004C W400, Malgun Gothic
Gui, 재고관리:Add, Edit, ReadOnly x10 y+5 w170 h40 -VScroll v5t1,
Gui, 재고관리:Add, Edit, ReadOnly x+10 w170 h40 -VScroll v5t2,
Gui, 재고관리:Add, Edit, ReadOnly x+10 w60 h40 -VScroll v5t3,
Gui, 재고관리:Add, Edit, ReadOnly x+10 w310 h40 -VScroll v5t4,
Gui, 재고관리:Add, Edit, ReadOnly x+10 w230 h40 -VScroll v5t5,

Gui, 재고관리:Add, Edit, ReadOnly x+10 w60 h40 -VScroll v5t6,
Gui, 재고관리:Add, Edit, ReadOnly x+10 w60 h40 -VScroll v5t7,

Gui, 재고관리:Font, S19 CDefault W400, Malgun Gothic
Gui, 재고관리:Add, Edit, x10 y+5 w170 h40 -VScroll v4e1,
Gui, 재고관리:Add, Edit, x+10 w170 h40 -VScroll v4e2,
Gui, 재고관리:Add, Edit, x+10 w60 h40 -VScroll v4e3,



Gui, 재고관리:Add, combobox, x+10 w310 h40 -VScroll v4e4 r15, %루틴목록%
Gui, 재고관리:Add, Edit, x+10 w230 h40 -VScroll v4e5,

Gui, 재고관리:Add, combobox, x+10 w60 h40 -VScroll v4e6 r3, |예|준
Gui, 재고관리:Add, combobox, x+10 w60 h40 -VScroll v4e7 r5, |예|우|재|크

Gui, 재고관리:Font, S19 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 재고관리:Add, button, x1140 y45 w90 h40 c0xFF2211 v상태close4 g상태closeedsm, 닫기

Gui, 재고관리:Add, button, y+10 w90 h40 c0xFF2211 v저장4 g저장4, 저장

Gui, 재고관리:Font, S13 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 재고관리:Add, button, y+40 w90 h60 cRED  g라인추출4,Get
Gui, 재고관리:Add, button, y+10 w90 h60 c0xFF2211  g라인수정4,Modify
Gui, 재고관리:Add, button, y+30 w90 h60 c0xFF2211  g라인추가4,Add
Gui, 재고관리:Add, button, y+10 w90 h60 c0xFF2211  g라인삽입4,Inset
Gui, 재고관리:Add, button, y+30 w90 h60 c0xFF2211  g라인삭제4,Delete
Gui, 재고관리:Add, button, y+10 w90 h60 c0xFF2211  g지우기4,Clear


Gui, 재고관리:Font, S1 CDefault W400, Malgun Gothic
Gui, 재고관리:Add, Edit, y+10 w50 h30 v4e9,
Gui, 재고관리:Add, Edit, ReadOnly x+5 w15 h30 v5t0 -VScroll,
Gui, 재고관리:Add, Edit, x+5 w15 h30 v4e0 -VScroll,
Gui, 재고관리:Font, S13 CDefault W400 c0xFF2211, Malgun Gothic
Gui, 재고관리:Add, button, x1140 y+10 w90 h26 c0xFF2211  g삭제4,일정 삭제
Gui, 재고관리:Add, Picture, x250 y180 W804 H428 v4pic2, %A_WorkingDir%/loading.png
GuiControl, hide, 4pic2

GUI, 재고관리:Show, w1240 h730 x25 y25, 재고관리



Gui, 재고관리:ListView, LVedsm1




;~ CSV_Load(OutputVar, "datacsv")
;~ MsgBox, % CSV_Search("datacsv", "a")

;~ MsgBox, % data4

;~ MsgBox, % datacsv
loop, parse, dataedsm, `n
{
	x:=[]
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	LV_Add("", x*)
}
;~ GuiControl, , 5t1, %4ed1%
;~ GuiControl, , 5t2, %4ed2%
;~ GuiControl, , 5t3, %4ed3%
;~ GuiControl, , 5t4, %4ed4%
;~ GuiControl, , 5t5, %4ed5%
;~ GuiControl, , 5t6, %4ed6%
;~ GuiControl, , 5t7, %4ed7%
;~ GuiControl, , 5t0, 재고관리

;~ GuiControl, , 4e1, %4ed1%
;~ GuiControl, , 4e2, %4ed2%
;~ GuiControl, , 4e3, %4ed3%
;~ GuiControl, Text, 4e4, %4ed4%
;~ GuiControl, , 4e5, %4ed5%
;~ GuiControl, ChooseString, 4e6, %4ed6%
;~ GuiControl, ChooseString, 4e7, %4ed7%
;~ GuiControl, , 4e0, 재고관리

{
	;~ if(5t1 = ""){
		;~ GuiControl, , 5t1, %addtimetoday%
		;~ GuiControl, , 5t2, %addtimetoday%
		;~ GuiControl, , 4e1, %addtimetoday%
		;~ GuiControl, , 4e2, %addtimetoday%
	;~ }
	;~ else
	;~ {
	;~ }
}

recentfile := 상태 "_P" 4ed1 "_Q" 4ed2 "_R" 4ed3 "_S" 4ed4 "_T" 4ed5 "_U" 4ed6 ".CSV"

;~ "30_P(.*)_Q(.*)_R(.*)_S(.*)_T(.*)_U(.*).CSV"

/*

Gui, 재고관리:ListView, LVedsm

ICELV2 := New LV_InCellEdit(HLVedsm, True, True)

   ICELV2.OnMessage()





;~ ; Create a new instance of LV_Colors
;~ CLV47 := New LV_Colors(HLV47)
;~ ; Set the colors for selected rows
;~ CLV47.SelectionColors(0xffcccc)
;~ If !IsObject(CLV47) {
   ;~ MsgBox, 0, ERROR, Couldn't create a new LV_Colors object!
   ;~ ExitApp
;~ }

;~ WinSet, Redraw, , ahk_id %HLV47%
   ;~ CLV47.OnMessage()

;~ Gui, Submit, NoHide
;~ If (ColorsOn)
   ;~ CLV47.OnMessage()
;~ GuiControl, Focus, %HLV47%

리프레쉬4:
Gui, Submit, NoHide
Gui, 재고관리:ListView, LV47
Loop % LV_GetCount()
{
    LV_GetText(RetrievedText, A_Index)
    if (RetrievedText = "진행중"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLV47.ROW(A_Index, 0xFFBBBB, 0x000000)
	}
	else if (RetrievedText = "완료"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLV47.ROW(A_Index, 0x90FF8D, 0x000000)
	}
	else if (RetrievedText = "리스트업"){
	;~ LV_GetNext(StartingRowNumber, RowType)
	CLV47.ROW(A_Index, 0xFFFFFF, 0x000000)
	}
	else
	{
		CLV47.ROW(A_Index, 0x%칼라%, 0x000000)
	}
}



		WinWait, 재고관리,
IfWinNotActive, 재고관리, , WinActivate, 재고관리,
WinWaitActive, 재고관리,
*/
return





상태closeedsm:


winkill, 재고관리

Sleep, 10
GuiControl, 1:Choose, refreshtab, 7
Sleep, 100
ControlClick, Button47, 신흥목재 전산프로그램

Sleep, 10
return





}

LVedsm1:

Gui, 재고관리:ListView, lvedsm1
if (A_GuiEvent = "DoubleClick")
{
SoundPlay, %A_WorkingDir%\sound\SFX_Ui07.mp3
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)

        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_GetText(OutputVar, selectRowNum)
	if (OutputVar = "●" || OutputVar = "" || OutputVar = "△")
	{
		MsgBox, 262196, 제품 준비 여부, 준비 됐습니까?
		{
			IfMsgBox Yes
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui02.mp3
				Sleep, 100
				Send, {F2}
				Sleep, 100
				SEND, ●{ENTER}
					Sleep, 100



			}
			IfMsgBox NO
			{
				SoundPlay, %A_WorkingDir%\sound\SFX_Ui03.mp3
				Sleep, 100
				Send, {F2}
				Sleep, 100
				SEND, {del 5}{Backspace 5}
				Sleep, 100
			}

		}
	}
	else
	{
		Sleep, 100
		return
	}

WinSet, Redraw, , ahk_id %HLVedsm1%
   CLVedsm1.OnMessage()

Gui, Submit, NoHide
If (ColorsOn)
   CLVedsm1.OnMessage()
GuiControl, Focus, %HLVedsm1%

Gui, Submit, NoHide
Gui, 1:ListView, LVedsm1
Loop % LV_GetCount()
{
    LV_GetText(RetrievedText, A_Index)
    if (RetrievedText = "●"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLVedsm1.ROW(A_Index, 0xFF007F, 0xffffff)
	}
	else if (RetrievedText = "△"){
	;~ LV_GetNext(StartingRowNumber, RowType)
	CLVedsm1.ROW(A_Index, 0xFFF000, 0x000000)
	}
	else if (RetrievedText = "★"){
      ;~ LV_GetNext(StartingRowNumber, RowType)
		CLVedsm1.ROW(A_Index, 0x663399, 0xffffff)
	}
	else
	{
		CLVedsm1.ROW(A_Index, 0x%칼라%, 0x000000)
	}
}
GuiControl, Choose, LVedsm1, 0
Gui, 재고관리:Restore
}
return



;~ /*

CheckInactive:
Sleep, 2000

	ControlClick, Button8, 신흥목재 전산프로그램

	/*

currentTick := A_TickCount
inactiveTime := currentTick - lastAction
if (inactiveTime >= timeout) {
	ControlClick, Button8, 신흥목재 전산프로그램
	Sleep, 10
}
else
{
	Sleep, 10
}

Sleep, 10

~$*LButton::
~$*RButton::
~$*MButton::
~$*WheelUp::
~$*WheelDown::
~$*WheelLeft::
~$*WheelRight::
~$*XButton1::
~$*XButton2::
lastAction := A_TickCount
Alramcrt = on

*/
return




resetplzyo:
currentTickplz := A_TickCount
inactiveTimeplz := currentTickplz - lastAction
if (inactiveTimeplz >= resetplz) {
	;~ WinSet, AlwaysOnTop, off, 신흥목재 전산프로그램
	;~ MsgBox, 262192, 장시간 미사용, 장시간 미사용에 따른 재시작 진행하겠습니다
	;~ IfMsgBox ok
		Reload


	;~ Sleep, 10
}
else
{
	Sleep, 10
}

Sleep, 10

return

;~ */

timer:
{
Sleep, 10
;~ GuiControl, 1:Choose, refreshtab, 1
	if FileExist("\\192.168.0.1\hdd1\일정표 최근\일정표220730\broadcast\*.txt")
	{
		SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\siren1.mp3
		Sleep, 5000
		Loop, \\192.168.0.1\hdd1\일정표 최근\일정표220730\broadcast\*.txt
		{
			loopfilename := RegExReplace(A_LoopFileName, ".txt" , Replacement := "")
			;~ MsgBox, % loopfilename
			Voice.Speak(loopfilename "을 상차해주세요")
		}
		FileDelete, \\192.168.0.1\hdd1\일정표 최근\일정표220730\broadcast\%loopfilename%.txt
		SoundPlay, \\192.168.0.1\hdd1\일정표 최근\일정표220730\sound\siren1.mp3

		MsgBox, % loopfilename "을 상차해주세요"
	}
	else
	{
	}
return
}
