#NoEnv
SetWorkingDir, \\192.168.0.1\hdd1\일정표 최근\일정표220730 ; Ensures a consistent starting directory.
SetControlDelay, 1
SetWinDelay, 1
SetKeyDelay, 1
SetMouseDelay, 1
#SingleInstance, Force
#Persistent
MsgBox, % A_workingdir
라벨 := "M"

Run \\192.168.0.1\hdd1\일정표 최근\일정표220730, , hide, PID
;~ #Include, % A_WorkingDir "\csv.ahk"
;~ #Include, % A_WorkingDir "\ScreenCapture.ahk"
WinSet, Style, +0x20000000,
Gui, 1:Destroy
Gui, 1:Default
Gui, 1:-SysMenu
Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, GroupBox, x10 y10 w700 h760, [ 출 하 장 ]


Gui, 1:Add, Text, x20 y60 w180 h25 , 시작일
Gui, 1:Add, Text, x+10 w150 h25 , 종료일
Gui, 1:Font, S15 CDefault W400, Verdana
Gui, 1:Add, DateTime, x20 y+0 w180 h30 ,
Gui, 1:Add, DateTime, x+10 w150 h30 ,
Gui, 1:Font, S13 CDefault W400, Verdana
Gui, 1:Add, Button, x+150 y65 w57 h50 grefresh, 새로`n고침
Gui, 1:Add, Button, x+10 w57 h50 g출고완료삭제작업, 과거`n작업
Gui, 1:Add, Button, x+10 w57 h50 gGuiClose, 닫기

Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x20 y+10 w180 h25 , 출고 리스트 업
Gui, 1:Font, S12 CDefault W400, Verdana
Gui, 1:Add, ListView, x20 y+0 w680 h180 vlv1 glv1 Grid NoSortHdr -Multi  BackgroundFFFCF3, 안보임|출고일|출고시각|업체명|출고지|기타사항
Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x20 y+10 w180 h25 , 출고 준비중
Gui, 1:Font, S12 CDefault W400, Verdana
Gui, 1:Add, ListView, y+0 w680 h180 vlv2 glv2 Grid NoSortHdr -Multi  BackgroundFAFBED, 안보임|출고일|출고시각|업체명|출고지|기타사항
Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x20 y+10 w180 h25 , 출고 준비완료
Gui, 1:Font, S12 CDefault W400, Verdana
Gui, 1:Add, ListView, y+0 w680 h180 vlv3 glv3 Grid NoSortHdr -Multi  BackgroundF9FFF5, 안보임|출고일|출고시각|업체명|출고지|기타사항


Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, GroupBox, x720 y10 w550 h760, [ 회 사 업 무 / 발 주 서 / 입 고 장 ]

Gui, 1:Add, Text, x730 y60 w180 h25 , 시작일
Gui, 1:Add, Text, x+10 w150 h25 , 종료일
Gui, 1:Font, S15 CDefault W400, Verdana
Gui, 1:Add, DateTime, x730 y+0 w180 h30 ,
Gui, 1:Add, DateTime, x+10 w150 h30 ,
Gui, 1:Font, S13 CDefault W400, Verdana
Gui, 1:Add, Button, x+10 y65 w53 h50 grefresh2, 새로`n고침
Gui, 1:Add, Button, x+10 w53 h50 , -
Gui, 1:Add, Button, x+10 w53 h50 gGuiClose2, 닫기

Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x730 y+10 w180 h25 , 회사업무

Gui, 1:Font, S12 CDefault W400, Verdana
Gui, 1:Add, ListView, x730 y+0 w530 h180 vlv4 glv4 Grid NoSortHdr -Multi BackgroundFFF0FA, 안보임|최초일|목표일|내용
Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x730 y+10 w180 h25 , 발주서
Gui, 1:Font, S12 CDefault W400, Verdana
Gui, 1:Add, ListView, y+0 w530 h180 vlv5 glv5 Grid NoSortHdr -Multi BackgroundFFF0FF, 안보임|발주일|입고예정일|품목
Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x730 y+10 w180 h25 , 입고장
Gui, 1:Font, S12 CDefault W400, Verdana
Gui, 1:Add, ListView, y+0 w530 h180 vlv6 glv6 Grid NoSortHdr -Multi BackgroundEAF5F8, 안보임|입고일|입고시간|품목

Gui, 1:Add, Button, x1207 y125 w53 h25 g일정추가, 추가
Gui, 1:Add, Button, x1207 y275 w53 h25 g일정추가, 추가
Gui, 1:Add, Button, x1207 y425 w53 h25 g일정추가, 추가


;~ Gui, 1:Add, Button, x592 y69 w50 h200 g리스트로저장, 리스트로저장
;~ Gui, 1:Add, Button, y+20 w50 h200 g진행중으로저장, 진행중으로저장
;~ Gui, 1:Add, Button, y+20 w50 h200 g완료(출고)로저장, 완료(출고)로저장






	allowed_list = Lv1,Lv2,Lv3

	HistoryLv1 := New LV_Rows()
	HistoryLv1.Add()



; Generated using SmartGUI Creator for SciTE
Gui, 1:Show, w1280 h775 x0 y0, 일정표
;~ return




refresh:
Run, % A_workingdir, , hide, PID
Sleep, 100

Gui, 1:ListView, lv1 ; 추가된 출고 리스트
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*Y.csv
{
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_Y", output)
    LV_Add("", "A" output1 "_B" output2 "_C" output3 "_D" output4 "_E" output5 "_Y.csv", output1, output2, output3, output4, output5)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 106)  ;
LV_ModifyCol(3, 85)  ;
LV_ModifyCol(4, 200)  ;
LV_ModifyCol(5, 120)  ;
LV_ModifyCol(6, 145)  ;

;~ Sleep, 10
Gui, 1:ListView, lv2 ; 출고 중
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*X.csv
{
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_X", output)
    LV_Add("", "A" output1 "_B" output2 "_C" output3 "_D" output4 "_E" output5 "_X.csv", output1, output2, output3, output4, output5)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 106)  ;
LV_ModifyCol(3, 85)  ;
LV_ModifyCol(4, 200)  ;
LV_ModifyCol(5, 120)  ;
LV_ModifyCol(6, 145)  ;


;~ Sleep, 100
Gui, 1:ListView, lv3 ; 출고 완료
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*Z.csv
{
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_Z", output)
    LV_Add("", "A" output1 "_B" output2 "_C" output3 "_D" output4 "_E" output5 "_Z.csv", output1, output2, output3, output4, output5)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 106)  ;
LV_ModifyCol(3, 85)  ;
LV_ModifyCol(4, 200)  ;
LV_ModifyCol(5, 120)  ;
LV_ModifyCol(6, 145)  ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Gui, 1:ListView, lv4 ; 회사 업무
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*F.csv
{
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_F", output)
    LV_Add("", "A" output1 "_B" output2 "_C" output3 "_F.csv", output1, output2, output3)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 106)  ;
LV_ModifyCol(3, 106)  ;
LV_ModifyCol(4, 310)  ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Gui, 1:ListView, lv5 ; 발주서
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*I.csv
{
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_I", output)
    LV_Add("", "A" output1 "_B" output2 "_C" output3 "_I.csv", output1, output2, output3)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 106)  ;
LV_ModifyCol(3, 106)  ;
LV_ModifyCol(4, 310)  ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Gui, 1:ListView, lv6 ; 입고장
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*J.csv
{
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_J", output)
    LV_Add("", "A" output1 "_B" output2 "_C" output3 "_J.csv", output1, output2, output3)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 106)  ;
LV_ModifyCol(3, 106)  ;
LV_ModifyCol(4, 310)  ;

return



READ1:
{
	if (상태 = "Y")
		칼라 := "FFFCF3"
	ELSE if (상태 = "X")
		칼라 := "FAFBED"
	ELSE if (상태 = "Z")
		칼라 := "F9FFF5"
	ELSE if (상태 = "F")
		칼라 := "FFF0FA"
	ELSE if (상태 = "I")
		칼라 := "FFF0FF"
	ELSE if (상태 = "J")
		칼라 := "EAF5F8"
	else
	{
		칼라 := "FFFFFF"
	}
}

if (상태 = K)
 라벨 := "M"
else
 라벨 := "N"
 ;~ MsgBox, % 라벨
Gui, %상태%:Destroy
Gui, %상태%:Default
Gui, %상태%:-SysMenu

Gui, Submit, NoHide
Gui, %상태%:Font, S20 CDefault W400, Verdana

Gui, %상태%:Add, ListView, x10 y95 w1120 h600 grid vLV7 gLV7 -ReadOnly WantF2 NoSortHdr Background%칼라%, 出|No|내용|단위|수량|재고위치|비고 및 주의사항|
Gui, %상태%:Add, Text, x10 y10 w170 h30 -VScroll, 출고날짜
Gui, %상태%:Add, Text, x+10 w170 h30 -VScroll, 출고시각
Gui, %상태%:Add, Text, x+10 w250 h30 -VScroll, 업체명
Gui, %상태%:Add, Text, x+10 w170 h30 -VScroll, 출고지
Gui, %상태%:Add, Text, x+10 w320 h30 -VScroll, 기타사항
Gui, %상태%:Add, Edit, x10 y50 w170 h40 -VScroll ve1,
Gui, %상태%:Add, Edit, x+10 w170 h40 -VScroll ve2,
Gui, %상태%:Add, Edit, x+10 w250 h40 -VScroll ve3,
Gui, %상태%:Add, Edit, x+10 w170 h40 -VScroll ve4,
Gui, %상태%:Add, Edit, x+10 w320 h40 -VScroll ve5,
Gui, %상태%:Add, button, x+10 w90 h38 g상태close, 닫기

Gui, %상태%:Add, button, y+30 w90 h38 g저장1, 저장
Gui, %상태%:Add, Button, y+10 w90 h38 gdelete1, 삭제
Gui, %상태%:Add, button, y+10 w90 h150 g리스트로저장, 리스트`n업`n으로
Gui, %상태%:Add, button, y+10 w90 h150 g진행중으로저장, 준비`n중`n으로
Gui, %상태%:Add, button, y+10 w90 h160 g완료(출고)로저장, 준비`n완료`n로
gui, %상태%:Add, progress, smooth x10 y+5 w1230 h30 vmyprogress, 0
GUI, %상태%:Show, w1240 h740 x25 y25, %상태%

MsgBox, %A_WorkingDir%\%OutputVar%
읽는파일 := % A_WorkingDir "\" OutputVar

Gui, %상태%:ListView, LV7
FileRead, data, *c %A_WorkingDir%\%OutputVar%
if ErrorLevel = "1"
	MsgBox, 1
else if ErrorLevel = "2"
	MsgBox, 2
else if ErrorLevel = "3"
	MsgBox, 3

else
{
		MsgBox, 0
}
MsgBox, % data
FileRead, data2, Z:\HDD1\일정표 최근\일정표220730\%OutputVar%
if ErrorLevel = "1"
	MsgBox, 1
else if ErrorLevel = "2"
	MsgBox, 2
else if ErrorLevel = "3"
	MsgBox, 3

else
{
		MsgBox, 0
}
MsgBox, % data2
Sleep, 200
LV_ModifyCol(1, "40 Integer" "Integer Center")
LV_ModifyCol(2, 50)
LV_ModifyCol(3, 520)
LV_ModifyCol(4, 60)
LV_ModifyCol(5, "80 Integer" "Integer Right")
LV_ModifyCol(6, "150 Integer" "Integer Center")
LV_ModifyCol(7, 200)


loop, parse, data, `n
{
	x:=[]
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	LV_Add("", x*)
}
GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
GuiControl, , e4, %ed4%
GuiControl, , e5, %ed5%
MsgBox, , 알림, 일정 가저오기 완료, 0.8

;~ WinSet, Alwaysontop, on, %상태%
return






저장1:

gui, submit, nohide
		GuiControl,, myprogress, 20
TempFile := "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_" 상태 ".CSV"

;~ MsgBox, % TempFile "`n" outputvar 
;~ MsgBox, % A_WorkingDir "\" TempFile
FileMove, % A_WorkingDir "\" TempFile, % A_WorkingDir "\수정된일정\" TempFile, 1
if errorlevel = 1
{
	gosub, 저장1
}
else
{
}
		GuiControl,, myprogress, 50
Sleep, 2000
loop, % LV_GetCount() {		

	RowNum := A_Index
    
	loop, 7
		LV_GetText(col%A_Index% , RowNum, a_index)
			GuiControl,, myprogress, +1
	FileAppend, % col1 "," col2 "," col3 "," col4 "," col5 "," col6 "," col7 ", `n", % A_Desktop "\" TempFile
    }


FileMove, % A_Desktop "\" TempFile, % A_WorkingDir "\" TempFile
		GuiControl,, myprogress, 100
SoundPlay, %A_workingdir%\1.mp3
MsgBox, , 알림, 발주내역서`n프린트 완료됐습니다, 1
		GuiControl,, myprogress, 0
gosub, 상태close	
return





READ2:

{
	if (상태 = "Y")
		칼라 := "FFFCF3"
	ELSE if (상태 = "X")
		칼라 := "FAFBED"
	ELSE if (상태 = "Z")
		칼라 := "F9FFF5"
	ELSE if (상태 = "F")
		칼라 := "FFF0FA"
	ELSE if (상태 = "I")
		칼라 := "FFF0FF"
	ELSE if (상태 = "J")
		칼라 := "EAF5F8"
	else
	{
		칼라 := "FFFFFF"
	}
}


Gui, %상태%:Destroy
Gui, %상태%:Default
Gui, %상태%:-SysMenu

Gui, Submit, NoHide
Gui, %상태%:Font, S20 CDefault W400, Verdana

Gui, %상태%:Add, ListView, x10 y95 w1120 h500 grid vLV7 gLV7 -ReadOnly WantF2 NoSortHdr AltSubmit, 내용|장소|담당
Gui, %상태%:Add, Text, x10 y+10 w620 h30 -VScroll, 내용
Gui, %상태%:Add, Text, x+0 w220 h30 -VScroll, 장소
Gui, %상태%:Add, Text, x+0 w200 h30 -VScroll, 담당
Gui, %상태%:Add, Edit, x10 y+10 w620 h40 vreadv2_1,
Gui, %상태%:Add, Edit, x+0 w220 h40 vreadv2_2,
Gui, %상태%:Add, Edit, x+0 w200 h40 vreadv2_3,
Gui, %상태%:Add, button, x+0 w80 h40 g지우기2, 지우기
gui, %상태%:Add, progress, smooth y+10 w1220 h10 vmyprogress, 0

Gui, %상태%:Add, Text, x10 y10 w170 h30 -VScroll, 출고날짜
Gui, %상태%:Add, Text, x+10 w170 h30 -VScroll, 출고시각
Gui, %상태%:Add, Text, x+10 w250 h30 -VScroll, 내용
Gui, %상태%:Add, Edit, x10 y50 w170 h40 -VScroll ve1,
Gui, %상태%:Add, Edit, x+10 w170 h40 -VScroll ve2,
Gui, %상태%:Add, Edit, x+10 w660 h40 -VScroll ve3,
Gui, %상태%:Add, button, x+10 w90 h38 g저장2, 저장
Gui, %상태%:Add, button, x+10 w90 h38 g상태close, 닫기
Gui, %상태%:Add, button, y+10 w90 h90 g라인추가2, 라인`n추가
Gui, %상태%:Add, button, y+10 w90 h90 g라인삽입2, 라인`n삽입
Gui, %상태%:Add, button, y+10 w90 h90 g라인추출2, 라인`n추출
Gui, %상태%:Add, button, y+10 w90 h90 g라인수정2, 라인`n수정
Gui, %상태%:Add, button, y+10 w90 h90 g라인삭제2, 라인`n삭제
Gui, %상태%:Add, button, y+10 w90 h90 g라인완료2, 완료로`n넘김

GUI, %상태%:Show, w1240 h740 x25 y25, %상태%

Gui, %상태%:ListView, LV7
LV_ModifyCol(1, 620)
LV_ModifyCol(2, 220)
LV_ModifyCol(3, 200)

return



READ2_2:

FileRead, data, %OutputVar%
loop, parse, data, `n
{
	x:=[]
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	LV_Add("", x*)
}
GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
;~ GuiControl, , e4, %ed4%
;~ GuiControl, , e5, %ed5%
MsgBox, , 알림, 일정 가저오기 완료, 0.8

return


;~ 라인정보2:


LV7:

Gui, 1:ListView, lv7

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

MsgBox, 3, 제품 준비 여부, 준비 됐습니까?
IfMsgBox Yes
{
	Sleep, 100
	Send, {F2}
	Sleep, 100
	SEND, ◎{ENTER}
}
IfMsgBox NO
{
	Sleep, 100
	Send, {F2}
	Sleep, 100
	SEND, Ⅹ{ENTER}
}
else
{
}

return

;~ Gui, Submit, NoHide
;~ if (A_GuiEvent = "DoubleClick")
    ;~ RowNumber = 0
    ;~ Loop
    ;~ {
        ;~ RowNumber := LV_GetNext(RowNumber)
        
        ;~ if not RowNumber
            ;~ break
        ;~ selectRowNum := RowNumber
    ;~ }
;~ LV_GetText(OutputVar, selectRowNum)
;~ Sleep, 100

라인추출2:



ControlGet, Col1, List , selected Col1, SysListView321, %상태% ;2 모델
GuiControl, , readv2_1 , %Col1%

ControlGet, Col2, List , selected Col2, SysListView321, %상태% ;2 모델
GuiControl, , readv2_2 , %Col2%

ControlGet, Col3, List , selected Col3, SysListView321, %상태% ;2 모델
GuiControl, , readv2_3 , %Col3%


return



;~ 추출
;~ ControlGet, Col20, List , selected Col20, SysListView321, 도어발주헬퍼 ; 옵션5


라인추가2: 

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Add(,readv2_1,readv2_2,readv2_3)
return




라인삽입2: 

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Insert(selectRowNum , ,readv2_1,readv2_2,readv2_3)
return



라인삭제2:

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
return



라인수정2:

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_Modify(selectRowNum , ,readv2_1,readv2_2,readv2_3)
return


라인완료2:


지우기2:
GuiControl, , readv2_1, 
GuiControl, , readv2_2, 
GuiControl, , readv2_3, 

저장2:
;~ {
FileDelete, % A_workingdir "\" outputvar
TempFile := "A" e1 "_B" e2 "_C" e3 "_F.csv"
Sleep, 2000
loop, % LV_GetCount() {		

	RowNum := A_Index
    
	loop, 3
		LV_GetText(col%A_Index% , RowNum, a_index)
	FileAppend, % col1 "," col2 "," col3 ", `n", % TempFile
    }
;~ }
SoundPlay, %A_workingdir%\1.mp3
MsgBox, , 알림, 발주내역서`n프린트 완료됐습니다, 1
return



return












READ3:

{
	if (상태 = "Y")
		칼라 := "FFFCF3"
	ELSE if (상태 = "X")
		칼라 := "FAFBED"
	ELSE if (상태 = "Z")
		칼라 := "F9FFF5"
	ELSE if (상태 = "F")
		칼라 := "FFF0FA"
	ELSE if (상태 = "I")
		칼라 := "FFF0FF"
	ELSE if (상태 = "J")
		칼라 := "EAF5F8"
	else
	{
		칼라 := "FFFFFF"
	}
}


Gui, %상태%:Destroy
Gui, %상태%:Default
Gui, %상태%:-SysMenu

Gui, Submit, NoHide
Gui, %상태%:Font, S20 CDefault W400, Verdana

Gui, %상태%:Add, ListView, x10 y95 w1120 h500 grid vLV8 gLV8 -ReadOnly WantF2 NoSortHdr AltSubmit, %목록%
Gui, %상태%:Add, Text, x10 y+10 w620 h30 -VScroll, 품목
Gui, %상태%:Add, Text, x+0 w220 h30 -VScroll, 단위
Gui, %상태%:Add, Text, x+0 w200 h30 -VScroll, 수량
Gui, %상태%:Add, Edit, x10 y+10 w730 h40 vreadv3_1,
Gui, %상태%:Add, Edit, x+0 w110 h40 vreadv3_2,
Gui, %상태%:Add, Edit, x+0 w200 h40 vreadv3_3 right,
Gui, %상태%:Add, button, x+0 w80 h40 g지우기3, 지우기
gui, %상태%:Add, progress, smooth y+10 w1220 h10 vmyprogress, 0

Gui, %상태%:Add, Text, x10 y10 w170 h30 -VScroll, 출고날짜
Gui, %상태%:Add, Text, x+10 w170 h30 -VScroll, 출고시각
Gui, %상태%:Add, Text, x+10 w250 h30 -VScroll, 내용
Gui, %상태%:Add, Edit, x10 y50 w170 h40 -VScroll ve1,
Gui, %상태%:Add, Edit, x+10 w170 h40 -VScroll ve2,
Gui, %상태%:Add, Edit, x+10 w660 h40 -VScroll ve3,

Gui, %상태%:Add, button, x+10 w90 h38 g저장3, 저장
Gui, %상태%:Add, button, x+10 w90 h38 g상태close, 닫기
Gui, %상태%:Add, button, y+10 w90 h90 g라인추가3, 라인`n추가
Gui, %상태%:Add, button, y+10 w90 h90 g라인삽입3, 라인`n삽입
Gui, %상태%:Add, button, y+10 w90 h90 g라인추출3, 라인`n추출
Gui, %상태%:Add, button, y+10 w90 h90 g라인수정3, 라인`n수정
Gui, %상태%:Add, button, y+10 w90 h90 g라인삭제3, 라인`n삭제
Gui, %상태%:Add, button, y+10 w90 h90 g라인완료3, 완료로`n넘김

GUI, %상태%:Show, w1240 h740 x25 y25, %상태%

Gui, %상태%:ListView, LV8
LV_ModifyCol(1, 730)
LV_ModifyCol(2, 110)
LV_ModifyCol(3, "200 Integer" "Integer right")

return



READ3_2:
Gui, %상태%:ListView, LV8
FileRead, data, %OutputVar%
loop, parse, data, `n
{
	x:=[]
	loop, parse, A_LoopField, CSV
		x.Insert(A_LoopField)
	LV_Add("", x*)
}
GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
GuiControl, , e4, %ed4%
GuiControl, , e5, %ed5%

;~ GuiControl, , e4, %ed4%
;~ GuiControl, , e5, %ed5%
MsgBox, , 알림, 일정 가저오기 완료, 0.8

return


;~ 라인정보2:


LV8:
return

;~ Gui, Submit, NoHide
;~ if (A_GuiEvent = "DoubleClick")
    ;~ RowNumber = 0
    ;~ Loop
    ;~ {
        ;~ RowNumber := LV_GetNext(RowNumber)
        
        ;~ if not RowNumber
            ;~ break
        ;~ selectRowNum := RowNumber
    ;~ }
;~ LV_GetText(OutputVar, selectRowNum)
;~ Sleep, 100

라인추출3:



ControlGet, Col1, List , selected Col1, SysListView321, %상태% ;2 모델
GuiControl, , readv3_1 , %Col1%

ControlGet, Col2, List , selected Col2, SysListView321, %상태% ;2 모델
GuiControl, , readv3_2 , %Col2%

ControlGet, Col3, List , selected Col3, SysListView321, %상태% ;2 모델
GuiControl, , readv3_3 , %Col3%


return



;~ 추출
;~ ControlGet, Col20, List , selected Col20, SysListView321, 도어발주헬퍼 ; 옵션5


라인추가3: 

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Add(,readv3_1,readv3_2,readv3_3)
return




라인삽입3: 

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
    LV_Insert(selectRowNum , ,readv3_1,readv3_2,readv3_3)
return



라인삭제3:

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
return



라인수정3:

Gui, Submit, NoHide
    RowNumber = 0
    Loop
    {
        RowNumber := LV_GetNext(RowNumber)
        if not RowNumber
            break
        selectRowNum := RowNumber
    }
	LV_Modify(selectRowNum , ,readv3_1,readv3_2,readv3_3)
return


라인완료3:


지우기3:
GuiControl, , readv3_1, 
GuiControl, , readv3_2, 
GuiControl, , readv3_3, 
return

저장3:
;~ {
FileDelete, % A_workingdir "\" outputvar
TempFile := "A" e1 "_B" e2 "_C" e3 "_" 상태 ".csv"
Sleep, 2000
loop, % LV_GetCount() {		

	RowNum := A_Index
    
	loop, 3
		LV_GetText(col%A_Index% , RowNum, a_index)
	FileAppend, % col1 "," col2 "," col3 ", `n", % A_workingdir "\" TempFile
    }
;~ }
SoundPlay, %A_workingdir%\1.mp3
MsgBox, , 알림, 발주내역서`n프린트 완료됐습니다, 1
return



return






상태close:
{

	Sleep, 1000
	winkill, 제품 준비 여부
	winkill, %상태%

ControlClick, Button2, 일정표
	Sleep, 2000
	ControlClick, Button2, 일정표
}
return





; 폴더로부터 파일 이름 목록을 수집해 그것을 ListView에 넣습니다:
lv1:
{
Gui, 1:ListView, lv1

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
	LV_GetText(OutputVar, selectRowNum)
	Sleep, 100

	RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_Y", ed)
	상태 := "Y"
	파일이름 := OutputVar

	GuiControl, , e1, %ed1%
	GuiControl, , e2, %ed2%
	GuiControl, , e3, %ed3%
	GuiControl, , e4, %ed4%
	GuiControl, , e5, %ed5%
	gosub, READ1
}


}
return





lv2:
Gui, 1:ListView, lv2

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

RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_X", ed)
상태 := "X"
파일이름 := OutputVar

GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
GuiControl, , e4, %ed4%
GuiControl, , e5, %ed5%
gosub, READ1
return


return






lv3:
Gui, 1:ListView, lv3
if (A_GuiEvent = "DoubleClick")
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

RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_Z", ed)
상태 := "Z"
파일이름Z := OutputVar
;~ msgbox, % OutputVar
GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
GuiControl, , e4, %ed4%
GuiControl, , e5, %ed5%

gosub, READ1
return




lv4:
Gui, 1:ListView, lv4
if (A_GuiEvent = "DoubleClick")
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
; 기본 최초일자 목표일자 내용
RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_F", ed)
상태 := "F"
목록 := "체크|내용|장소|담당자"

GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
GuiControl, , e4, %ed4%
GuiControl, , e5, %ed5%
gosub, READ2
gosub, READ2_2
return



lv5:
Gui, 1:ListView, lv5
if (A_GuiEvent = "DoubleClick")
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
; 기본 발주일자 입고예정일 품목 수량 단위

RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_I", ed)
상태 := "I"
목록 := "품목|단위|수량"

GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
GuiControl, , e4, %ed4%
GuiControl, , e5, %ed5%
gosub, READ3
gosub, READ3_2
return





lv6:
Gui, 1:ListView, lv6
if (A_GuiEvent = "DoubleClick")
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
; 기본 입고일자 입고시간 품목 수량 단위
RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_J", ed)
상태 := "J"
목록 := "품목|단위|수량"

GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
GuiControl, , e4, %ed4%
GuiControl, , e5, %ed5%
gosub, READ3
gosub, READ3_2

return





;~ LV7:
;~ return







리스트로저장:
저장포멧 := "Y.csv"
변환결과 := "리스트로저장"
gosub, 변환
return

진행중으로저장:
저장포멧 := "X.csv"
변환결과 := "진행중으로저장"
gosub, 변환
return

완료(출고)로저장:
저장포멧 := "Z.csv"
변환결과 := "완료(출고)로저장"
gosub, 변환
return

변환:

Gui, Submit, NoHide
Sleep, 200
새로운포멧 := % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_" 저장포멧
Sleep, 200

;~ MsgBox, %OutputVar%`n%새로운포멧%
	FileMove, % OutputVar, % A_WorkingDir "\" 새로운포멧, 1
	if errorlevel = 0
	{
		Sleep, 200
	}
	else
	{
		gosub, 변환
	}




		GuiControl,, myprogress, 100
;~ SoundPlay, %A_WorkingDir%\1.mp3
		;~ GuiControl,, myprogress, 0
MsgBox, , 알림, %변환결과%`n변환했습니다!, 0.8
;~ gosub, read3


Sleep, 500
gosub, 상태close
return



delete1:
		;~ MsgBox, % OutputVar
FileMove, % A_WorkingDir "\" OutputVar, % A_WorkingDir "\삭제일정\" OutputVar, 1
	if errorlevel = 1
	{

		MsgBox, , , 안지워짐, 0.8
		gosub, delete1
	}
	else
	{
		MsgBox, , , 완료로 이동, 0.8
	}
Sleep, 1000

gosub, 상태close
return





일정추가:

gosub, READ2
상태 := "F"
목록 := "체크|내용|장소|담당자"
return



refresh2:
delete2:
GuiClose2:
return











GuiClose:
ExitApp



출고완료삭제작업:
라벨 := "N"
WinSet, Style, +0x20000000,
Gui, 2:Destroy
Gui, 2:Default
Gui, 2:-SysMenu
Gui, 2:Font, S15 CDefault W700, Verdana
Gui, 2:Add, GroupBox, x10 y10 w700 h680, [ 과거 일정 ( 완료된 일정 )  ]


Gui, 2:Add, Text, x20 y60 w180 h25 , 시작일
Gui, 2:Add, Text, x+10 w150 h25 , 종료일
Gui, 2:Font, S15 CDefault W400, Verdana
Gui, 2:Add, DateTime, x20 y+0 w180 h30 ,
Gui, 2:Add, DateTime, x+10 w150 h30 ,
Gui, 2:Font, S13 CDefault W400, Verdana
Gui, 2:Add, Button, x+170 y80 w80 h50 grefresh22, 새로`n고침
Gui, 2:Add, Button, x+10 w80 h50 gGuiClose22, 닫기

Gui, 2:Font, S15 CDefault W700, Verdana
Gui, 2:Add, Text, x20 y+10 w180 h25 , 추가된 출고 리스트
Gui, 2:Font, S12 CDefault W400, Verdana
Gui, 2:Add, ListView, x20 y+0 w680 h480 vlv10 glv10 Grid NoSortHdr -Multi SortDesc BackgroundF0FFFF, 안보임|출고일|출고시각|업체명|출고지|기타사항
Gui, 2:Font, S15 CDefault W700, Verdana


; Generated using SmartGUI Creator for SciTE
Gui, 2:Show, w720 h690 x200 y50, 과거 일정 ( 완료된 일정 ) 



refresh22:


Gui, 2:ListView, lv10 ; 추가된 출고 리스트
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\삭제일정\*.csv
{
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_(.*).csv", output)
    LV_Add("", "A" output1 "_B" output2 "_C" output3 "_D" output4 "_E" output5 "_" output6 ".csv", output1, output2, output3, output4, output5)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 106)  ;
LV_ModifyCol(3, 85)  ;
LV_ModifyCol(4, 200)  ;
LV_ModifyCol(5, 120)  ;
LV_ModifyCol(6, 145)  ;

WinActivate, 과거 일정 ( 완료된 일정 ) 
return


movetolist:

MsgBox, %outputvar%
    ;~ Gui, Submit, NoHide
		;~ Sleep, 200
;~ 새로운포멧 := % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_" 저장포멧
		;~ Sleep, 200
	;~ FileMove, % A_WorkingDir "\" OutputVar, % A_WorkingDir "\" 새로운포멧, 1
	;~ if errorlevel = 0
	;~ {
		;~ Sleep, 200
	;~ }
	;~ else
	;~ {
		;~ gosub, 변환
	;~ }

		;~ GuiControl,, myprogress, 100
;~ SoundPlay, %A_WorkingDir%\1.mp3
		;~ GuiControl,, myprogress, 0
;~ MsgBox, , 알림, %변환결과%`n변환했습니다!, 0.8
;~ gosub, read3


;~ Sleep, 500
;~ gosub, GuiClose22
;~ return



;~ filemove, %A_WorkingDir%\삭제일정\*.csv , 

return



GuiClose22:
라벨 := "M"
winkill, 과거 일정 ( 완료된 일정 )
;~ WinActivate, %상태%
return





lv10:

Gui, 1:ListView, lv10
if (A_GuiEvent = "DoubleClick")
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

RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_(.*).csv", ed)
상태 := "K"
OutputVar := % A_WorkingDir "\삭제일정\" OutputVar
;~ msgbox, % OutputVar
;~ MsgBox, % OutputVar
gosub, READ1
winkill, 과거 일정 ( 완료된 일정 )
return




