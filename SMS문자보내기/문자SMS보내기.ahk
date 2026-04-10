#NoEnv
#SingleInstance, Force
#Include, csv.ahk

SetKeyDelay, -1

기본정보1 =
(
[ 단가인상 공지 ]
안녕하세요 신흥목재입니다.
원자재 가격이 지속적으로 상승하다보니
가격인상이 불가피하게 되었습니다.

05월 01일 부터 인상된 가격으로 판매하오니
부디 양해 부탁드립니다.

치오푼
42*42(6)=24,000(부가세포함)

함석투바이
39*81(4)=28,000(부가세포함)

건네일 83=33,000
건네일 90=34,000

※ 더 나은 제품과 서비스로 보답하겠습니다. 
항상 이용해주셔서 감사합니다.
)
;~ [ 단가인상 공지 ]
;~ 안녕하세요 신흥목재입니다.
;~ 원자재 가격이 지속적으로 상승하다보니
;~ 가격인상이 불가피하게 되었습니다.

;~ 05월 01일 부터  인상된 가격으로 판매하오니
;~ 부디 양해 부탁드립니다.

;~ 치오푼
;~ 42*42(6)=24,000(부가세포함)

;~ 함석투바이
;~ 39*81(4)=28,000(부가세포함)

;~ 건네일 83=33,000
;~ 건네일 90=34,000

;~ ※ 더 나은 제품과 서비스로 보답하겠습니다. 
;~ 항상 이용해주셔서 감사합니다.









Gui, Add, ListView, x22 y19 w310 h560 , 업체명|휴대폰번호



FileRead, data, list.csv
;~ CSV_Load("File","data")
;~ ; Display how many rows we have using CSV_TotalRows()
;~ MsgBox % "There are " CSV_TotalRows("data") " rows in this CSV file."
;~ MsgBox % "There are " CSV_Totalcols("data") " rows in this CSV file." 
Gui, ListView
loop, parse, data, `n
{
    x:=[]
    loop, parse, A_LoopField, CSV
        x.Insert(A_LoopField)
    LV_Add("", x*)
}


Gui, Add, Button, x342 y519 w70 h60 gstart, start
Gui, Add, Button, x422 y519 w70 h60 gpause, pause
Gui, Add, Button, x502 y519 w70 h60 greload, reload
Gui, Add, Edit, x342 y19 w230 h490 , %기본정보1%






; Generated using SmartGUI Creator for SciTE


Gui, Show, w601 h608, 문자SMS 보내기
return

GuiClose:
ExitApp

start:
{
	ControlSend, Edit1, {ctrl down}ac{ctrl down}, 문자SMS 보내기
	X := 0
	Loop
	{
		Sleep, 5000
		X ++
		CoordMode, mouse, Screen
		LV_GetText(OutputVar, X , 2)
		if (OutputVar ="")
		{
			break
		}
		else
		{
			MouseClick, l, -767, 256,2,0
			Sleep, 1000
			MouseClick, l, -404, 147,2,0
			Sleep, 1000
			Send, %OutputVar%
			Sleep, 1000
			Send, {enter}
			Sleep, 1000
			MouseClick, l, -450, 1528,2,0
			Sleep, 1000
			Send, {ctrl down}v{ctrl Up}
			Sleep, 1000
			MouseClick, l, -53, 1568,2,0
			Sleep, 2000
		}	
	}
}
return



pause:
{
	
	
}
return



Reload:
{
Reload
	
}
return

