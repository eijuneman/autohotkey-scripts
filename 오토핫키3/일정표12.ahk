#NoEnv
DetectHiddenWindows, On
SetWorkingDir, Z:\HDD1\일정표 최근\일정표220730 ; Ensures a consistent starting directory.
SetControlDelay, 1
SetWinDelay, 1
SetKeyDelay, 1
SetMouseDelay, 1
;~ SendMode Input
#SingleInstance, Force
#Persistent
#Include Class_LV_InCellEdit.ahk
#Include Class_LV_Colors.ahk
;MsgBox, % A_workingdir
라벨 := "M"
받는분 := "태준"
상태 := "K"
parmMode = 0
Run Z:\hdd1\일정표 최근\일정표220730, , hide, PID
;~ #Include, % A_WorkingDir "\CSV.ahk"
;~ #Include, % A_WorkingDir "\ScreenCapture.ahk"
WinSet, Style, +0x20000000,
Gui, 1:Destroy
Gui, 1:Default
Gui, 1:-SysMenu

Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, GroupBox, x10 y5 w700 h715, [ 출 하 장 ]


Gui, 1:Add, Text, x20 y35 w180 h25 , 시작일
Gui, 1:Add, Text, x+10 w150 h25 , 종료일
Gui, 1:Font, S15 CDefault W400, Verdana
Gui, 1:Add, DateTime, x20 y+0 w180 h30 ,
Gui, 1:Add, DateTime, x+10 w150 h30 ,
Gui, 1:Font, S13 CDefault W400, Verdana
Gui, 1:Add, Button, x+150 y40 w57 h50 grefresh, 전부`n최신화
Gui, 1:Add, Button, x+10 w57 h50 g출고완료삭제작업, 과거`n기록
Gui, 1:Add, Button, x+10 w57 h50 gGuiClose, 닫기

Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x20 y+5 w180 h25 , - 출고 리스트 업
Gui, 1:Font, S10 CDefault W300, Verdana
Gui, 1:Add, ListView, x20 y+0 w680 h85 vlv1 glv1 Grid NoSortHdr -Multi  BackgroundFFFCF3, 안보임|출고일|日|출고시각|업체명|출고지|기타사항
Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x20 y+5 w180 h25 , ○ 준비 중 
Gui, 1:Font, S10 CDefault W400, Verdana
Gui, 1:Add, ListView, y+0 w680 h135 vlv2 glv2 Grid NoSortHdr -Multi  BackgroundFAFBED, 안보임|출고일|日|출고시각|업체명|출고지|기타사항
Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x20 y+5 w160 h25 , ◐ 준비 완료
Gui, 1:Font, S10 CDefault W400, Verdana
Gui, 1:Add, ListView, y+0 w680 h140 vlv3 glv3 Grid NoSortHdr -Multi  BackgroundF9FFF5, 안보임|출고일|日|출고시각|업체명|출고지|기타사항
Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x20 y+5 w180 h25 , ● 출고 완료 당일
Gui, 1:Font, S10 CDefault W400, Verdana
Gui, 1:Add, ListView, y+0 w680 h140 vlv11 glv11 Grid NoSortHdr -Multi  BackgroundE0F0F0, 안보임|출고일|日|출고시각|업체명|출고지|기타사항



Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, GroupBox, x720 y5 w550 h715, [ 회 사 업 무 / 발 주 서 / 입 고 장 ]

Gui, 1:Add, Text, x730 y35 w180 h25 , 시작일
Gui, 1:Add, Text, x+10 w150 h25 , 종료일
Gui, 1:Font, S15 CDefault W400, Verdana
Gui, 1:Add, DateTime, x730 y+0 w180 h30 ,
Gui, 1:Add, DateTime, x+10 w150 h30 ,
Gui, 1:Font, S13 CDefault W400, Verdana
Gui, 1:Add, Button, x+10 y40 w53 h50 grefresh1, 왼쪽`n최신화
Gui, 1:Add, Button, x+10 w53 h50 grefresh2, 오른쪽`n최신화
Gui, 1:Add, Button, x+10 w53 h50 greload, 재시작

Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x730 y+5 w180 h25 , 회사업무
Gui, 1:Font, S10 CDefault W400, Verdana
Gui, 1:Add, ListView, x730 y+0 w530 h175 vlv4 glv4 Grid NoSortHdr -Multi BackgroundFFF0FA, 안보임|시작일|日|목표일|日|내용
Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x730 y+5 w175 h25 , 발주서
Gui, 1:Font, S10 CDefault W400, Verdana
Gui, 1:Add, ListView, y+0 w530 h180 vlv5 glv5 Grid NoSortHdr -Multi BackgroundFFF0FF, 안보임|발주일|日|입고예정일|日|품목
Gui, 1:Font, S15 CDefault W700, Verdana
Gui, 1:Add, Text, x730 y+5 w180 h25 , 입고장
Gui, 1:Font, S10 CDefault W400, Verdana
Gui, 1:Add, ListView, y+0 w530 h175 vlv6 glv6 Grid NoSortHdr -Multi BackgroundEAF5F8, 안보임|입고일|日|입고시간|품목

Gui, 1:Add, Button, x1207 y95 w53 h25 g일정추가, 추가
Gui, 1:Add, Button, x1207 y300 w53 h25 g발주서추가, 추가
Gui, 1:Add, Button, x1207 y510 w53 h25 g입고장추가, 추가
Gui, 1:Add, Picture, x250 y180 W804 H428 vpic, %A_WorkingDir%/loading.png
GuiControl, hide, pic
;~ Gui, 1:Add, Button, x592 y69 w50 h200 g리스트로저장, 리스트로저장
;~ Gui, 1:Add, Button, y+20 w50 h200 g진행중으로저장, 진행중으로저장
;~ Gui, 1:Add, Button, y+20 w50 h200 g완료(출고)로저장, 완료(출고)로저장





OutputVar :=

	allowed_list = Lv1,Lv2,Lv3

	HistoryLv1 := New LV_Rows()
	HistoryLv1.Add()



; Generated using SmartGUI Creator for SciTE
Gui, 1:Show, w1280 h730 x0 y0, 일정표

refresh:
gosub, refresh1
gosub, refresh2

return








refresh1:
;~ Run explore \\192.168.0.1\hdd1\일정표 최근\일정표220730, , hide, PID
Sleep, 100
GuiControl, show, pic
GuiControl, Disable, lv1
GuiControl, Disable, lv2
GuiControl, Disable, lv3
GuiControl, Disable, lv11


GuiControl,+Hidden,pic

GuiControl, show, pic
Gui, 1:ListView, lv1 ; 추가된 출고 리스트
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*Y.CSV
{
		;~ GuiControl,+Hidden,pic
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_Y", 1output)
NewStr := RegExReplace(1output1, "-" , Replacement := "")
    LV_Add("", "A" 1output1 "_B" 1output2 "_C" 1output3 "_D" 1output4 "_E" 1output5 "_Y.CSV", 1output1, Get_Weekday(NewStr, parmMode), 1output2, 1output3, 1output4, 1output5)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 90)  ;
LV_ModifyCol(3, 25)  ;
LV_ModifyCol(4, 70)  ;
LV_ModifyCol(5, 170)  ;
LV_ModifyCol(6, 125)  ;
LV_ModifyCol(7, 175)  ;

;~ MsgBox, %A_WorkingDir%
GuiControl, show, pic
;~ Sleep, 10
Gui, 1:ListView, lv2 ; 출고 중
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}

Loop, %A_WorkingDir%\*X.CSV
{
	;~ GuiControl,+Hidden,pic
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_X", 2output)
NewStr := RegExReplace(2output1, "-" , Replacement := "")
    LV_Add("", "A" 2output1 "_B" 2output2 "_C" 2output3 "_D" 2output4 "_E" 2output5 "_X.CSV",2output1, Get_Weekday(NewStr, parmMode), 2output2, 2output3, 2output4, 2output5)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 90)  ;
LV_ModifyCol(3, 25)  ;
LV_ModifyCol(4, 70)  ;
LV_ModifyCol(5, 170)  ;
LV_ModifyCol(6, 125)  ;
LV_ModifyCol(7, 175)  ;



GuiControl, show, pic
;~ Sleep, 100
Gui, 1:ListView, lv3 ; 출고 완료
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*Z.CSV
{
		;~ GuiControl,+Hidden,pic
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_Z", 3output)
NewStr := RegExReplace(3output1, "-" , Replacement := "")
    LV_Add("", "A" 3output1 "_B" 3output2 "_C" 3output3 "_D" 3output4 "_E" 3output5 "_Z.CSV", 3output1, Get_Weekday(NewStr, parmMode), 3output2, 3output3, 3output4, 3output5)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 90)  ;
LV_ModifyCol(3, 25)  ;
LV_ModifyCol(4, 70)  ;
LV_ModifyCol(5, 170)  ;
LV_ModifyCol(6, 125)  ;
LV_ModifyCol(7, 175)  ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GuiControl, show, pic
;~ Sleep, 100
Gui, 1:ListView, lv11 ; 출고 완료
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*W.CSV
{
		;~ GuiControl,+Hidden,pic
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_W", 11output)
NewStr := RegExReplace(11output1, "-" , Replacement := "")
    LV_Add("", "A" 11output1 "_B" 11output2 "_C" 11output3 "_D" 11output4 "_E" 11output5 "_W.CSV", 11output1, Get_Weekday(NewStr, parmMode), 11output2, 11output3, 11output4, 11output5)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 90)  ;
LV_ModifyCol(3, 25)  ;
LV_ModifyCol(4, 70)  ;
LV_ModifyCol(5, 170)  ;
LV_ModifyCol(6, 125)  ;
LV_ModifyCol(7, 175)  ;
OutputVar :=
GuiControl, Hide, pic


GuiControl, Enable, lv1
GuiControl, Enable, lv2
GuiControl, Enable, lv3
GuiControl, Enable, lv11


return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

refresh2:

GuiControl, Disable, lv4
GuiControl, Disable, lv5
GuiControl, Disable, lv6


GuiControl, show, pic
Gui, 1:ListView, lv4 ; 회사 업무
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*F.CSV
{
		;~ GuiControl,+Hidden,pic
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_F", 4output)
NewStr := RegExReplace(4output1, "-" , Replacement := "")
NewStr2 := RegExReplace(4output2, "-" , Replacement := "")
    ;~ LV_Add("", "A" 4output1 "_B" Get_Weekday(NewStr, parmMode) 4output2 "_C" 4output3 "_F.CSV", 4output1, 4output2, 4output3)


LV_Add("", "A" 4output1 "_B" 4output2 "_C" 4output3 "_F.CSV", 4output1, Get_Weekday(NewStr, parmMode), 4output2, Get_Weekday(NewStr2, parmMode), 4output3)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 90)  ;
LV_ModifyCol(3, 50)  ;
LV_ModifyCol(4, 90)  ;
LV_ModifyCol(5, 50)  ;
LV_ModifyCol(6, 225)  ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GuiControl, show, pic
Gui, 1:ListView, lv5 ; 발주서
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*I.CSV
{
		;~ GuiControl,+Hidden,pic
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_I", 5output)
2NewStr := RegExReplace(5output1, "-" , Replacement := "")
2NewStr2 := RegExReplace(5output2, "-" , Replacement := "")
    ;~ LV_Add("", "A" 5output1 "_B" Get_Weekday(NewStr, parmMode) 5output2 "_C" 5output3 "_F.CSV", 5output1, 5output2, 5output3)


LV_Add("", "A" 5output1 "_B" 5output2 "_C" 5output3 "_I.CSV", 5output1, Get_Weekday(2NewStr, parmMode), 5output2, Get_Weekday(2NewStr2, parmMode), 5output3)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 90)  ;
LV_ModifyCol(3, 50)  ;
LV_ModifyCol(4, 90)  ;
LV_ModifyCol(5, 50)  ;
LV_ModifyCol(6, 225)  ;

GuiControl, show, pic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ 입고일|日|입고시간|품목

Gui, 1:ListView, lv6 ; 입고장
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\*J.CSV
{
		;~ GuiControl,+Hidden,pic
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_J", 6output)

3NewStr := RegExReplace(6output1, "-" , Replacement := "")


    LV_Add("", "A" 6output1 "_B" 6output2 "_C" 6output3 "_J.CSV", 6output1, Get_Weekday(3NewStr, parmMode), 6output2, 6output3)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 90)  ;
LV_ModifyCol(3, 50)  ;
LV_ModifyCol(4, 90)  ;
LV_ModifyCol(5, 275)  ;

OutputVar :=

GuiControl, Enable, lv4
GuiControl, Enable, lv5
GuiControl, Enable, lv6
GuiControl, hide, pic
return



READ1:
Run Z:\hdd1\일정표 최근\일정표220730, , hide, PID
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
	ELSE if (상태 = "W")
	칼라 := "E0F0F0"
	else
	{
		칼라 := "FFFFFF"
	}
}
{
;~ MsgBox, % 라벨
	if (라벨 = "M"){
		Clipboard = %A_WorkingDir%\%OutputVar%
		Clipboard1 = %A_WorkingDir%\%OutputVar%
	}
	else if (라벨 = "N"){
		Clipboard = %A_WorkingDir%\삭제일정\%OutputVar%
		Clipboard1 = %A_WorkingDir%\삭제일정\%OutputVar%
	}
	else
	{
	}
}

FileRead, data, %Clipboard%
	if not ErrorLevel  ; 성공적으로 적재됨.
	{

	}
	else
	{
		MsgBox , 262160, 문제발생, 읽기 실패`n관리자에게 문의하세요
		FileRead, data, %Clipboard%

	}


Gui, %상태%:Destroy
Gui, %상태%:Default
Gui, %상태%:-SysMenu

Gui, Submit, NoHide
Gui, %상태%:Font, S20 CDefault W400, Verdana

Gui, %상태%:Add, ListView, x10 y95 w1120 h540 grid vLV7 gLV7 -ReadOnly WantF2 NoSortHdr Background%칼라%, 出|No|내용|단위|수량|재고위치|비고 및 주의사항|
Gui, %상태%:Add, Text, x10 y10 w170 h30 -VScroll, 출고날짜
Gui, %상태%:Add, Text, x+10 w170 h30 -VScroll, 출고시각
Gui, %상태%:Add, Text, x+10 w250 h30 -VScroll, 업체명
Gui, %상태%:Add, Text, x+10 w170 h30 -VScroll, 출고지
Gui, %상태%:Add, Text, x+10 w100 h30 -VScroll, 기타사항
Gui, %상태%:Font, S24 CRED W700, Verdana
Gui, %상태%:Add, Text, x+10 y2 w315 h40 +right -VScroll vtitle, %제목%

Gui, %상태%:Font, S20 CDefault W400, Verdana
Gui, %상태%:Add, Edit, x10 y50 w170 h40 -VScroll ve1,
Gui, %상태%:Add, Edit, x+10 w170 h40 -VScroll ve2,
Gui, %상태%:Add, Edit, x+10 w250 h40 -VScroll ve3,
Gui, %상태%:Add, Edit, x+10 w170 h40 -VScroll ve4,
Gui, %상태%:Add, Edit, x+10 w320 h40 -VScroll ve5,
Gui, %상태%:Add, button, x+10 w90 h38 v상태close g상태close, 닫기

Gui, %상태%:Add, button, y+10 w90 h38 v저장1 g저장1, 저장
;~ Gui, %상태%:Add, Button, y+10 w90 h38 gdelete1, 삭제
Gui, %상태%:Add, button, y+30 w90 h125 v리스트로저장 g리스트로저장, ㅡ`n리스트`n업으로
Gui, %상태%:Add, button, y+10 w90 h125 v진행중으로저장 g진행중으로저장, ○`n준비`n중으로
Gui, %상태%:Add, button, y+10 w90 h125 v준비완료로저장 g준비완료로저장, ◐`n준비`n완료로
Gui, %상태%:Add, button, y+10 w90 h125 v완료출고끝로저장 g완료출고끝로저장, ●`n출고`n끝으로
Gui, %상태%:Font, S1 CDefault W400, Verdana
Gui, %상태%:Add, Edit, y+10 w90 h30 ve6,
gui, %상태%:Add, progress, smooth x10 y650 w1120 h40 vmyprogress, 0
Gui, %상태%:Add, Picture, x250 y180 W804 H428 vpic2, %A_WorkingDir%/loading2.png
GuiControl, hide, pic2
;~ GuiControl, , title, %상태%



;~ 준비완료로저장:
;~ 저장포멧 := "Z.CSV"
;~ 변환결과 := "준비완료로저장"
;~ gosub, 변환
;~ return


;~ 완료(출고끝)로저장:
;~ 저장포멧 := "W.CSV"
;~ 변환결과 := "완료(출고)로저장"
;~ gosub, 변환
;~ return


GUI, %상태%:Show, w1240 h740 x25 y25, %상태%

Gui, %상태%:ListView, LV7

LV_ModifyCol(1, "60 Integer" "Integer Center")
LV_ModifyCol(2, "50 Integer" "Integer Center")
LV_ModifyCol(3, 520)
LV_ModifyCol(4, 60)
LV_ModifyCol(5, "60 Integer" "Integer Right")
LV_ModifyCol(6, "150 Integer" "Integer Center")
LV_ModifyCol(7, 200)

;~ MsgBox, % A_WorkingDir "\"outputvar
;~ MsgBox, % data

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
recentfile := "A" ed1 "_B" ed2 "_C" ed3 "_D" ed4 "_E" ed5 "_" 상태 ".CSV"
;~ WinSet, Alwaysontop, on, %상태%
return



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

/*
LV_GetText(OutputVar2, selectRowNum , 2)
LV_GetText(OutputVar3, selectRowNum , 3)
LV_GetText(OutputVar4, selectRowNum , 4)
LV_GetText(OutputVar5, selectRowNum , 5)
LV_GetText(OutputVar6, selectRowNum , 6)
LV_GetText(OutputVar7, selectRowNum , 7)

OutputVar33 := RegExReplace(outputvar3, "\*", "곱하기")

ComObjCreate("SAPI.SpVoice").Speak(OutputVar)
ComObjCreate("SAPI.SpVoice").Speak(OutputVar2 "  번")
ComObjCreate("SAPI.SpVoice").Speak(OutputVar33 "의 개수는?")
ComObjCreate("SAPI.SpVoice").Speak(OutputVar5 "개")
ComObjCreate("SAPI.SpVoice").Speak(OutputVar6)
ComObjCreate("SAPI.SpVoice").Speak(OutputVar7)
*/
MsgBox, 262179, 제품 준비 여부, 준비 됐습니까?
{
	IfMsgBox Yes
	{
		Sleep, 100
		Send, {F2}
		Sleep, 100
		SEND, ◎{ENTER}
			Sleep, 1000
	}
	IfMsgBox NO
	{
		Sleep, 100
		Send, {F2}
		Sleep, 100
		SEND, Ⅹ{ENTER}
		Sleep, 1000
	}
}

return



저장1:
GuiControl, show, pic2
guicontrol, disable, 상태close
guicontrol, disable, 저장1
guicontrol, disable, 리스트로저장
guicontrol, disable, 진행중으로저장
guicontrol, disable, 준비완료로저장
guicontrol, disable, 완료출고끝로저장



newfile := % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_" 저장포멧
Sleep, 200

root1 := % A_WorkingDir "\" recentfile
root2 := % A_WorkingDir "\삭제일정\" newfile





gui, submit, nohide
		GuiControl,, myprogress, 20
TempFile := "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_" 상태 ".CSV"
TempFile1 := "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_W.CSV"

;~ MsgBox, % TempFile "`n" outputvar
;~ MsgBox, % A_WorkingDir "\" TempFile
FileMove, % A_WorkingDir "\" TempFile, % A_WorkingDir "\수정된일정\" TempFile, 1
	if errorlevel = 1
	{
		Sleep, 200
		gosub, 저장1
	}
	else
	{
		Sleep, 200
	}

GuiControl,, myprogress, 30
Sleep, 2000

makefile:
loop, % LV_GetCount() {

	RowNum := A_Index

	loop, 7
		LV_GetText(col%A_Index% , RowNum, a_index)
			GuiControl,, myprogress, +1
	FileAppend, % col1 "," col2 "," col3 "," col4 "," col5 "," col6 "," col7 ", `n", % A_Desktop "\" TempFile
	Sleep, 10
    }
	if erorrlevel = 0
	{
		Sleep, 1000
		gosub, makefile
	}
	else
	{
		Sleep, 1000
	}


FileMove, % A_Desktop "\" TempFile, % A_WorkingDir "\" TempFile, 1
		GuiControl,, myprogress, 80
Sleep, 2000

FileMove, % A_WorkingDir "\" TempFile, % A_WorkingDir "\수정된일정\" TempFile1, 1
		GuiControl,, myprogress, 90
Sleep, 2000
FileMove, % A_WorkingDir "\수정된일정\" TempFile1, % A_WorkingDir "\" TempFile, 1

	GuiControl,, myprogress, 100
SoundPlay, %A_ScriptDir%\1.mp3
MsgBox, , 알림, 저장 완료됐습니다, 1
		GuiControl,, myprogress, 0
;gosub, 상태close

GuiControl, hide, pic2
guicontrol, Enable, 상태close
guicontrol, Enable, 저장1
guicontrol, Enable, 리스트로저장
guicontrol, Enable, 진행중으로저장
guicontrol, Enable, 준비완료로저장
guicontrol, Enable, 완료출고끝로저장
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
	ELSE if (상태 = "W")
	칼라 := "E0F0F0"
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

Gui, %상태%:Add, ListView, x10 y95 w1120 h500 grid vLV8 -ReadOnly WantF2 NoSortHdr AltSubmit gSubLV8 hwndHLV8 , %목록%
Gui, %상태%:Add, Text, x10 y+10 w620 h30 -VScroll, %밑1칸%
Gui, %상태%:Add, Text, x+0 w220 h30 -VScroll, %밑2칸%
Gui, %상태%:Add, Text, x+0 w200 h30 -VScroll, %밑3칸%
Gui, %상태%:Add, Edit, x10 y+10 w620 h40 vreadv2_1,
Gui, %상태%:Add, Edit, x+0 w220 h40 vreadv2_2,
Gui, %상태%:Add, Edit, x+0 w200 h40 vreadv2_3,
Gui, %상태%:Add, button, x+0 w80 h40 g지우기2, 지우기
gui, %상태%:Add, progress, smooth y+10 w1220 h10 vmyprogress, 0

Gui, %상태%:Add, Text, x10 y10 w170 h30 -VScroll, %1칸%
Gui, %상태%:Add, Text, x+10 w170 h30 -VScroll, %2칸%
Gui, %상태%:Add, Text, x+10 w250 h30 -VScroll, %3칸%
Gui, %상태%:Add, Edit, x10 y50 w170 h40 -VScroll ve1,
Gui, %상태%:Add, Edit, x+10 w170 h40 -VScroll ve2,
Gui, %상태%:Add, Edit, x+10 w560 h40 -VScroll ve3,
Gui, %상태%:Add, button, x+10 w90 h38 g저장2, 저장
Gui, %상태%:Add, button, x+10 w90 h38 g삭제2, 삭제
Gui, %상태%:Add, button, x+10 w90 h38 g상태close2, 닫기
Gui, %상태%:Add, button, y+10 w90 h90 g라인추가2, 라인`n추가
Gui, %상태%:Add, button, y+10 w90 h90 g라인삽입2, 라인`n삽입
Gui, %상태%:Add, button, y+10 w90 h90 g라인추출2, 라인`n추출
Gui, %상태%:Add, button, y+10 w90 h90 g라인수정2, 라인`n수정
Gui, %상태%:Add, button, y+10 w90 h90 g라인삭제2, 라인`n삭제
Gui, %상태%:Add, button, y+10 w90 h90 g라인완료2, 완료로`n넘김

GUI, %상태%:Show, w1240 h740 x25 y25, %상태%

Gui, %상태%:ListView, LV8
LV_ModifyCol(1, 580)
LV_ModifyCol(2, 220)
LV_ModifyCol(3, 150)
LV_ModifyCol(4, 100)

return


READ2_2:
FileRead, data, %outputvar%
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

ICELV2 := New LV_InCellEdit(HLV8, True, True)
ICELV2.OnMessage()

MsgBox, , 알림, 일정 가저오기 완료, 0.8


return




SubLV8:

If (A_GuiEvent == "K") && (Chr(A_EventInfo) = "e") {
   Gui, ListView, %A_GuiControl%
   If (Row := LV_GetNext(0, "Focused"))
      ICELV2.EditCell(Row)
}

return

;~ 라인정보2:



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
;~ GuiControl, show, pic2
;~ guicontrol, disable, 상태close
;~ guicontrol, disable, 저장1
;~ guicontrol, disable, 리스트로저장
;~ guicontrol, disable, 진행중으로저장
;~ guicontrol, disable, 준비완료로저장
;~ guicontrol, disable, 완료출고끝로저장

;~ newfile := % "A" e1 "_B" e2 "_C" e3 "_" 상태 " .
Sleep, 200

;~ root1 := % A_WorkingDir "\" recentfile
;~ root2 := % A_WorkingDir "\삭제일정\" newfile





gui, submit, nohide
		GuiControl,, myprogress, 20
TempFile := "A" e1 "_B" e2 "_C" e3 "_" 상태 ".CSV"
TempFile1 = %A_WorkingDir%\수정된일정\%TempFile%
;~ MsgBox, % TempFile "`n" outputvar
;~ MsgBox, % A_WorkingDir "\" TempFile
FileMove, %TempFile%, %TempFile1%, 1
	if errorlevel = 1
	{
		Sleep, 200
		gosub, 저장2
	}
	else
	{
		Sleep, 200
	}

GuiControl,, myprogress, 30
;~ Sleep, 2000

makefile2:
loop, % LV_GetCount() {

	RowNum := A_Index

	loop, 3
		LV_GetText(col%A_Index% , RowNum, a_index)
			GuiControl,, myprogress, +1
	FileAppend, % col1 "," col2 "," col3 ", `n", % A_Desktop "\" TempFile
	Sleep, 10
    }
	if erorrlevel = 0
	{
		Sleep, 1000
		gosub, makefile2
	}
	else
	{
		Sleep, 1000
	}


FileMove, % A_Desktop "\" TempFile, % A_WorkingDir "\" TempFile, 1
		GuiControl,, myprogress, 80
Sleep, 2000

;~ FileMove, % A_WorkingDir "\" TempFile, % A_WorkingDir "\수정된일정\" TempFile1, 1
		;~ GuiControl,, myprogress, 90
;~ Sleep, 2000
;~ FileMove, % A_WorkingDir "\수정된일정\" TempFile1, % A_WorkingDir "\" TempFile, 1

	GuiControl,, myprogress, 100
SoundPlay, %A_ScriptDir%\1.mp3
MsgBox, , 알림, 저장 완료됐습니다, 1
		GuiControl,, myprogress, 0
;gosub, 상태close

;~ GuiControl, hide, pic2
;~ guicontrol, Enable, 상태close
;~ guicontrol, Enable, 저장1
;~ guicontrol, Enable, 리스트로저장
;~ guicontrol, Enable, 진행중으로저장
;~ guicontrol, Enable, 준비완료로저장
;~ guicontrol, Enable, 완료출고끝로저장
gosub, 상태close


return



삭제2:
gui, submit, nohide
Sleep, 200
newfile := % "A" e1 "_B" e2 "_C" e3 "_" 상태 ".CSV"
Sleep, 200


Clipboard = %A_WorkingDir%\%newfile%
root1 := Clipboard

Clipboard = %A_WorkingDir%\삭제일정2\%newfile%
root2 := Clipboard

;~ MsgBox, % A_WorkingDir
;~ MsgBox, %root1%`n%root2%


FileMove, %root1%, %root2%, 1
	if errorlevel = 1
	{
		MsgBox, , , 다시시도 중, 0.8
		gosub, 삭제2
	}
	else
	{
		MsgBox, , , 완료로 이동, 0.8
	}


return






/*

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
FileDelete, % outputvar
TempFile := "A" e1 "_B" e2 "_C" e3 "_" 상태 ".CSV"
Sleep, 2000
loop, % LV_GetCount() {

	RowNum := A_Index

	loop, 3
		LV_GetText(col%A_Index% , RowNum, a_index)
	FileAppend, % col1 "," col2 "," col3 ", `n", % TempFile
    }
;~ }
SoundPlay, %A_ScriptDir%\1.mp3
MsgBox, , 알림, 발주내역서`n프린트 완료됐습니다, 1
return



return


*/



상태close:
;~ {
;	Sleep, 2000
;	ControlClick, Button2, 일정표

;	Sleep, 1000
	winkill, 제품 준비 여부
	winkill, %상태%
Sleep, 1000
;~ GOSUB, REFRESH
ControlClick, Button6, 일정표
;~ OutputVar :=
;~ }
return


상태close2:
;~ {
;	Sleep, 2000
;	ControlClick, Button2, 일정표

;	Sleep, 1000
	winkill, 제품 준비 여부
	winkill, %상태%
Sleep, 1000
;~ GOSUB, REFRESH
ControlClick, Button7, 일정표
;~ OutputVar :=
;~ }
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
	파일이름 = OutputVar
	라벨 := "M"
	GuiControl, , e1, %ed1%
	제목 := "[ ㅡ 출고 리스트 업]"

}
	gosub, READ1

}
return





lv2:
Gui, 1:ListView, lv2
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
RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_X", ed)
상태 := "X"
	라벨 := "M"
파일이름 := OutputVar
	제목 := "[ ○ 출고 준비중]"


gosub, READ1
return


return






lv3:
Gui, 1:ListView, lv3
{
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
}
RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_Z", ed)
상태 := "Z"
	라벨 := "M"
파일이름Z := OutputVar
	제목 := "[ ◐ 출고 준비 완료]"
	;~ msgbox, % OutputVar

gosub, READ1
return





lv11:
Gui, 1:ListView, lv11
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
RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_W", ed)
상태 := "W"
	라벨 := "M"
파일이름 := OutputVar
	제목 := "[ ● 출고완료 당일]"


gosub, READ1
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

gosub, READ2
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
gosub, READ2
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
gosub, READ2
return




lv4:
Gui, 1:ListView, lv4
{
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
}
;~ MsgBox, % outputvar
; 기본 최초일자 목표일자 내용
RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_F", ed)
상태 := "F"
목록 := "내용|장소|담당자|진행률"
밑1칸 := "내용"
밑2칸 := "장소"
밑3칸 := "담당자"
1칸 := "시작일"
2칸 := "목표일"
3칸 := "내용"
	라벨 := "M"


gosub, READ2
gosub, READ2_2
return



lv5:
Gui, 1:ListView, lv5
{
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
}
RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_I", ed)
상태 := "I"
목록 := "품목|단위|수량"
밑1칸 := "품목"
밑2칸 := "단위"
밑3칸 := "수량"
1칸 := "발주일"
2칸 := "입고예정일"
3칸 := "품목"

gosub, READ2
gosub, READ2_2
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
밑1칸 := "품목"
밑2칸 := "단위"
밑3칸 := "수량"
1칸 := "입고일"
2칸 := "입고시간"
3칸 := "수량"
	라벨 := "M"

GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
GuiControl, , e4, %ed4%
GuiControl, , e5, %ed5%
gosub, READ2
gosub, READ2_2

return

















리스트로저장:
GuiControl, show, pic2
저장포멧 := "Y.CSV"
변환결과 := "리스트로저장"

gosub, 변환
return

진행중으로저장:
GuiControl, show, pic2
저장포멧 := "X.CSV"
변환결과 := "진행중으로저장"
문구 := "[내용확인했습니다]`n○ 물건 준비중입니다"
gosub, 문자보내기
gosub, 변환
return

준비완료로저장:
GuiControl, show, pic2
저장포멧 := "Z.CSV"
변환결과 := "준비완료로저장"
문구 := "[준비완료]`n◐ 출고 준비 완료했습니다"
gosub, 문자보내기
gosub, 변환
return


완료출고끝로저장:
GuiControl, show, pic2
저장포멧 := "W.CSV"
변환결과 := "완료(출고)로저장"
문구 := "[출고 끝]`n● 출고 완료했습니다"
gosub, 문자보내기
gosub, 변환
return

/*

WinShow, 카카오톡

WinWait, 카카오톡,
IfWinNotActive, 카카오톡, , WinActivate, 카카오톡,
WinWaitActive, 카카오톡,
		GuiControl,, myprogress, +10
Sleep,100
ControlClick, x29 y118, 카카오톡
Sleep,300
		GuiControl,, myprogress, +10
ControlSend, EVA_VH_ListControl_Dblclk3, {CtrlDown}F{CtrlUp}, 카카오톡
Sleep,1000
		GuiControl,, myprogress, +10
controlsend, Edit2, %받는분%{Enter}, 카카오톡

		GuiControl,, myprogress, +10
;~ ControlSetText, Edit2, %받는분%, 카카오톡
Sleep, 1000
controlsend, Edit2, {Enter}, 카카오톡


WinWait, %받는분%,
IfWinNotActive, %받는분%, , WinActivate, %받는분%,
WinWaitActive, %받는분%,
		GuiControl,, myprogress, +10
Gui, Submit, NoHide
;~ Sleep, 200
;~ 새로운포멧 := % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_" 저장포멧
;~ Sleep, 200

완료문구 := % e1 "`n" e2 "`n" e3 "`n" e4 "`n" e5

formattime, time, , yyyy년 MM월 dd일 HH시 mm분

Sleep, 300
		GuiControl,, myprogress, +10
;~ Send, %완료문구%{Enter}
Send, %e1%{shiftdown}{enter}{shiftup}%e3%{shiftdown}{enter}{shiftup}%e2%{shiftdown}{enter}{shiftup}%e4%{shiftdown}{enter 2}{shiftup}%time%{shiftdown}{enter}{shiftup}출고 완료 했습니다{Enter}
Sleep, 100
		GuiControl,, myprogress, +10
Send, {enter}
		GuiControl,, myprogress, +10
Sleep, 300


Winkill, %받는분%

Sleep,300
ControlSetText, Edit2, , 카카오톡
Sleep, 300


*/

변환:

guicontrol, disable, 상태close
guicontrol, disable, 저장1
guicontrol, disable, 리스트로저장
guicontrol, disable, 진행중으로저장
guicontrol, disable, 준비완료로저장
guicontrol, disable, 완료출고끝로저장

Gui, Submit, NoHide
Sleep, 200
		GuiControl,, myprogress, +10
새로운포멧 := % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_" 저장포멧
Sleep, 200
		GuiControl,, myprogress, +10

;~ MsgBox, %OutputVar%`n%새로운포멧%
	FileMove, % Clipboard1, % A_WorkingDir "\" 새로운포멧, 1
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
GuiControl, Hide, pic2
gosub, 상태close
return



문자보내기:

guicontrol, disable, 상태close
guicontrol, disable, 저장1
guicontrol, disable, 리스트로저장
guicontrol, disable, 진행중으로저장
guicontrol, disable, 준비완료로저장
guicontrol, disable, 완료출고끝로저장

gui, submit, nohide


WinSet, AlwaysOnTop , On, %상태%

WinShow, 카카오톡
		GuiControl,, myprogress, +10
Sleep,100
ControlClick, x29 y118, 카카오톡
Sleep,300
		GuiControl,, myprogress, +10
ControlSend, EVA_VH_ListControl_Dblclk3, {CtrlDown}F{CtrlUp}, 카카오톡
Sleep,1000
		GuiControl,, myprogress, +10
controlsend, Edit2, %받는분%{Enter}, 카카오톡

		GuiControl,, myprogress, +10
;~ ControlSetText, Edit2, %받는분%, 카카오톡
Sleep, 1000
controlsend, Edit2, {Enter}, 카카오톡

		GuiControl,, myprogress, +10

FormatTime, time, , yyyy년 MM월 dd일 HH시 mm분

Sleep, 300
		GuiControl,, myprogress, +10


GuiControl, , e6, %e1%`n%e2%`n%e3%`n%e4%`n%e5%`n`n%time%`n %문구%
Sleep, 1000
ControlSend, Edit6, {CtrlDown}a{CtrlUp}, %상태%
Sleep, 200
ControlSend, Edit6, {CtrlDown}x{CtrlUp}, %상태%
;~ ControlSend, RICHEDIT50W1, %완료문구%, %받는분%

Sleep, 200

		GuiControl,, myprogress, +10
ControlFocus, RICHEDIT50W1, %받는분%
Send, {CtrlDown}a{CtrlUp}{BackSpace}
Send, {CtrlDown}v{CtrlUp}{Enter}

Sleep, 100
;~ ControlSend, RICHEDIT50W1, {Enter}, %받는분%

;~ ControlSend, RICHEDIT50W1, {Enter}, %받는분%
		GuiControl,, myprogress, +10
Sleep, 300

Winkill, %받는분%

Sleep,300
ControlSetText, Edit2, , 카카오톡
Sleep, 300
WinHide, 카카오톡

WinSet, AlwaysOnTop , Off, %상태%

guicontrol, Enable, 상태close
guicontrol, Enable, 저장1
guicontrol, Enable, 리스트로저장
guicontrol, Enable, 진행중으로저장
guicontrol, Enable, 준비완료로저장
guicontrol, Enable, 완료출고끝로저장
GuiControl, hide, pic2
return


/*

삭제과정:
gui, submit, nohide
Sleep, 200
newfile := % "A" e1 "_B" e2 "_C" e3 "_D" e4 "_E" e5 "_" 상태 ".CSV"
Sleep, 200


Clipboard = %A_WorkingDir%\%recentfile%
root1 := Clipboard

Clipboard = %A_WorkingDir%\삭제일정\%newfile%
root2 := Clipboard

;~ MsgBox, % A_WorkingDir
;~ MsgBox, %root1%`n%root2%


FileMove, %root1%, %root2%, 1
	if errorlevel = 1
	{
		MsgBox, , , 다시시도 중, 0.8
		gosub, 삭제과정
	}
	else
	{
		MsgBox, , , 완료로 이동, 0.8
	}



Sleep, 500


GuiControl, Enable, button1
GuiControl, Enable, button2
GuiControl, Enable, button3
GuiControl, Enable, button4
GuiControl, Enable, button5
GuiControl, Enable, button6
Sleep, 500
winkill, %상태%

Sleep, 1000

return
*/




reload:
Reload










GuiClose:
ExitApp



출고완료삭제작업:
라벨 := "N"
WinSet, Style, +0x20000000,
Gui, 2:Destroy
Gui, 2:Default
Gui, 2:-SysMenu
Gui, +Alwaysontop
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
Gui, 2:Font, S10 CDefault W400, Verdana
Gui, 2:Add, ListView, x20 y+0 w680 h480 vlv10 glv10 Grid NoSortHdr -Multi SortDesc BackgroundF9FFFF, 안보임|출고일|출고시각|업체명|출고지|기타사항
Gui, 2:Font, S15 CDefault W700, Verdana


; Generated using SmartGUI Creator for SciTE
Gui, 2:Show, w720 h690 x400 y50, 과거 일정 ( 완료된 일정 )



refresh22:


Gui, 2:ListView, lv10 ; 추가된 출고 리스트
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}
Loop, %A_WorkingDir%\삭제일정\*.CSV
{
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_(.*).CSV", output)
    LV_Add("", "A" output1 "_B" output2 "_C" output3 "_D" output4 "_E" output5 "_" output6 ".CSV", output1, output2, output3, output4, output5)
}
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 106)  ;
LV_ModifyCol(3, 85)  ;
LV_ModifyCol(4, 200)  ;
LV_ModifyCol(5, 120)  ;
LV_ModifyCol(6, 145)  ;

;~ WinActivate, 과거 일정 ( 완료된 일정 )
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



;~ filemove, %A_WorkingDir%\삭제일정\*.CSV ,

return



GuiClose22:
라벨 := "M"
winkill, 과거 일정 ( 완료된 일정 )
Sleep, 500
WinActivate, 일정표
Sleep, 1000
GOSUB, REFRESH
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
RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_(.*).CSV", ed)
Sleep, 100
라벨 := "N"
상태 = %ed6%
;~ RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_(.*).CSV", ed)
;~ 상태 := "K"
;~ OutputVar := % A_WorkingDir "\삭제일정\" OutputVar
;~ msgbox, % OutputVar
;~ MsgBox, % OutputVar
gosub, READ1
winkill, 과거 일정 ( 완료된 일정 )
return



; 요일 구하기
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