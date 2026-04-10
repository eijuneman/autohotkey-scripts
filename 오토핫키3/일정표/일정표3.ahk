#NoEnv
SetWorkingDir, Z:\HDD1\일정표 최근  ; Ensures a consistent starting directory.
;~ SetControlDelay, 1
;~ SetWinDelay, 1
;~ SetKeyDelay, 1
;~ SetMouseDelay, 1
#SingleInstance, Force
#Persistent

Run explore %A_WorkingDir% , hide, PID
;~ #Include, % A_WorkingDir "\csv.ahk"
;~ #Include, % A_WorkingDir "\ScreenCapture.ahk"
WinSet, Style, +0x20000000, 


Gui, Add, ListView, x42 y89 w540 h200 vlv1 glv1 NoSortHdr -Multi, 안보임|출고날짜|출고시각|업체명|출고지|기타사항
Gui, Add, ListView, x42 y+20 w540 h200 vlv2 glv2 NoSortHdr -Multi, 안보임|출고날짜|출고시각|업체명|출고지|기타사항
Gui, Add, ListView, x42 y+20 w540 h200 vlv3 glv3 NoSortHdr -Multi, 안보임|출고날짜|출고시각|업체명|출고지|기타사항
gui, Add, progress, smooth x42 y+5 w1220 h10 vmyprogress, 0
Gui, Add, Button, x592 y89 w50 h200 g리스트로저장, 리스트로저장
Gui, Add, Button, y+20 w50 h200 g진행중으로저장, 진행중으로저장
Gui, Add, Button, y+20 w50 h200 g완료(출고)로저장, 완료(출고)로저장

Gui, Add, ListView, x+10 y89 w610 h640 vlv4 glv4 -ReadOnly WantF2 Checked NoSortHdr, 출|비고 및 주의사항|No|내용|단위|수량|재고위치 
Gui, Add, Text, x652 y30 w90 h30 -VScroll, 날짜
Gui, Add, Text, x+10 w148 h30 -VScroll, 업체명
Gui, Add, Text, x+10 w110 h30 -VScroll, 출고시간
Gui, Add, Text, x+10 w110 h30 -VScroll, 출고장소
Gui, Add, Text, x+10 w110 h30 -VScroll, 배송지
Gui, Add, Edit, x652 y49 w90 h30 -VScroll ve1, 
Gui, Add, Edit, x+10 w148 h30 -VScroll ve2, 
Gui, Add, Edit, x+10 w110 h30 -VScroll ve3, 
Gui, Add, Edit, x+10 w110 h30 -VScroll ve4, 
Gui, Add, Edit, x+10 w110 h30 -VScroll ve5, 
Gui, Add, Text, x42 y30 w180 h30 , 시작일
Gui, Add, Text, x+10 w150 h30 , 종료일
Gui, Add, DateTime, x42 y49 w180 h30 , 
Gui, Add, DateTime, x+10 w150 h30 , 
Gui, Add, Button, x+120 w80 h30 grefresh, 새로고침


	allowed_list = Lv1,Lv2,Lv3
	
	HistoryLv1 := New LV_Rows()
	HistoryLv1.Add()



; Generated using SmartGUI Creator for SciTE
Gui, Show, w1366 h750 x0 y0, 일정표

refresh:

Gui, ListView, lv1
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}

Loop, %A_WorkingDir%\*F.csv
{
RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_F", output)
    LV_Add("", "A" output1 "_B" output2 "_C" output3 "_D" output4 "_E" output5 "_F.csv", output1, output2, output3, output4, output5)
}

LV_ModifyCol(1, 0)
LV_ModifyCol(2, 80)  ; 
LV_ModifyCol(3, 70)  ; 
LV_ModifyCol(4, 130)  ; 
LV_ModifyCol(5, 100)  ; 
LV_ModifyCol(6, 150)  ; 


Gui, ListView, lv2

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
LV_ModifyCol(2, 80)  ; 
LV_ModifyCol(3, 70)  ; 
LV_ModifyCol(4, 130)  ; 
LV_ModifyCol(5, 100)  ; 
LV_ModifyCol(6, 150)  ; 



Gui, ListView, lv3
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
LV_ModifyCol(2, 80)  ; 
LV_ModifyCol(3, 70)  ; 
LV_ModifyCol(4, 130)  ; 
LV_ModifyCol(5, 100)  ; 
LV_ModifyCol(6, 150)  ; 



read:
Gui, ListView, lv4
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
}



	FileRead, data, %OutputVar%
	;~ CSV_Load("File","data")
	;~ ; Display how many rows we have using CSV_TotalRows()
	;~ MsgBox % "There are " CSV_TotalRows("data") " rows in this CSV file."
	;~ MsgBox % "There are " CSV_Totalcols("data") " rows in this CSV file." 
	Gui, ListView, vl4
	
	LV_ModifyCol(2, 130)
	LV_ModifyCol(3, 40)
	LV_ModifyCol(4, 220)
	LV_ModifyCol(5, 40)
	LV_ModifyCol(6, 50)
	LV_ModifyCol(7, 90)

	loop, parse, data, `n
	{
		x:=[]
		loop, parse, A_LoopField, CSV
			x.Insert(A_LoopField)
		LV_Add("", x*)
	}
	
return





;~ Gui, ListView, lv1
;~ {
;~ LV_Delete()
;~ Loop,A_LoopField
  ;~ LV_Add("", x*)
;~ }
;~ Gui, ListView, lv1
;~ Loop, %A_WorkingDir%\*.csv
;~ {
;~ RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_F", output)
    ;~ LV_Add("", "A" output1 "_B" output2 "_C" output3 "_D" output4 "_E" output5 "_F.csv", output1, output2, output3, output4, output5)
;~ }


	
;~ LV_ModifyCol(1, 0)
;~ LV_ModifyCol(2, 100)  ; 
;~ LV_ModifyCol(3, 150)  ; 
;~ LV_ModifyCol(4, 100)  ; 
;~ LV_ModifyCol(5, 100)  ; 
;~ LV_ModifyCol(6, 100)  ; 

  

;~ return



; 폴더로부터 파일 이름 목록을 수집해 그것을 ListView에 넣습니다:
lv1:
Gui, ListView, lv1
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
파일이름1 := % OutputVar
RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_F", ed)
상태 := "F"
;~ 파일이름 := OutputVar
;~ msgbox, % OutputVar
GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
GuiControl, , e4, %ed4%
GuiControl, , e5, %ed5%
gosub, refresh
return





lv2:
Gui, ListView, lv2
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
파일이름1 := % OutputVar
RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_X", ed)
상태 := "X"
;~ 파일이름 := OutputVar
;~ msgbox, % OutputVar
GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
GuiControl, , e4, %ed4%
GuiControl, , e5, %ed5%
gosub, refresh
return






lv3:
Gui, ListView, lv3
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
파일이름1 := % OutputVar
RegExMatch(OutputVar, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_Z", ed)
상태 := "Z"

;~ msgbox, % OutputVar
GuiControl, , e1, %ed1%
GuiControl, , e2, %ed2%
GuiControl, , e3, %ed3%
GuiControl, , e4, %ed4%
GuiControl, , e5, %ed5%

gosub, refresh
return













lv4:	
return



리스트로저장:
저장포멧 := "F"
변환결과 := "리스트로저장"
gosub, 변환
return

진행중으로저장:
저장포멧 := "X"
변환결과 := "진행중으로저장"
gosub, 변환
return

완료(출고)로저장:
저장포멧 := "Z"
변환결과 := "완료(출고)로저장"
gosub, 변환
return

변환:
{
	
	
	

Sleep,500
TempFileZZ := RegExReplace(OutputVar, "_" 상태, "_" 저장포멧)

;~ FileDelete, Z:\HDD1\일정표 최근\일정표\A대기 중_B대기 중_C대기 중_D대기 중_E대기 중_Z.csv

;~ TempFileZ := % "A" output1 "_B" output2 "_C" output3 "_D" output4 "_E" output5 "_Z.csv"
Sleep, 50

loop, % LV_GetCount() {		
Sleep, 1
	RowNum := A_Index
    
	loop, 7
		LV_GetText(col%A_Index% , RowNum, a_index)
	GuiControl,, myprogress, +5
	Sleep, 1
	FileAppend, % col1 "," col2 "," col3 "," col4 "," col5 "," col6 "," col7 ", `n", % A_Desktop "\" TempFileZZ
  
	;~ if (errorlevel = "0"){
		;~ break
	;~ }
	;~ else
	;~ {
		;~ gosub, 변환
	;~ }
	
	
	}
		GuiControl,, myprogress, +10
Sleep, 1000

csv이름 := % A_Desktop "\" TempFileZZ
Loop
{
if FileExist(csv이름)
	{
	FileMove, % A_Desktop "\" TempFileZZ, % A_WorkingDir "\" TempFileZZ, 1	
	break
	}
else
{
}
}

deloutput := % A_WorkingDir "\" 파일이름1 ".csv"
Clipboard := % deloutput
Loop
{
if FileExist(deloutput)
	{
	FileDelete, % deloutput
	break
	}
else
{
	Sleep, 100
}
}

		GuiControl,, myprogress, 100
;~ SoundPlay, %A_WorkingDir%\sound\1.mp3
		GuiControl,, myprogress, 0
		;~ MsgBox, % OutputVar
		;~ MsgBox, % deloutput
		
;~ MsgBox, , 알림, %변환결과%`n변환했습니다!, 0.8

gosub, refresh
return
}



GuiClose:
ExitApp





;~ LVdrag:
	;~ target := LV_DragAndDrop() ; Start the drag function. When released it will return the location (ClassNN) where to drop
	;~ guicontrolget, target_name, name, %target%	; gets the name associated with the target Hwnd
	;~ SetTimer, DDToolTip, Off
	;~ ToolTip
	;~ if ( source = target_name )	; prevent a row to be dragged onto it's own listview
		;~ return
	;~ if target_name not in %allowed_list%	; allowed_list contains variables where the row is allowed to be dragged
		;~ return
	;~ nr_col := LV_GetCount("Column")
	
	;~ loop, %nr_col%
	;~ {
		;~ LV_GetText(col%A_Index%,A_EventInfo,A_Index) ; get the information from the dragged row
		;~ LV_ModifyCol(A_Index,"Autohdr Sort")	; resize columns
		;~ columns .= "col" . A_Index . ","
	;~ }
	;~ LV_Delete(A_EventInfo) ; delete the dragged row from the originating listview
	
	;~ GUI, ListView, %target%	; select target listview		
	;~ LV_ADD("",col1,col2,col3,col4)	; add the dragged row to the new listview		[color=#FF0000]< how do I get this to be more dynamic?[/color]
	;~ loop, %nr_col%
		;~ LV_ModifyCol(A_Index,"Autohdr Sort")	; resize columns
;~ return




LV_DragAndDrop()
{
	While GetKeyState("LButton")
	{
		MouseGetPos, mx,my
		VarSetCapacity( tvht, 16, 0 )
		NumPut( mx, tvht, 0, "int" ), NumPut( my-tvy, tvht, 4, "int" )
		Sleep, 50
	}
	MouseGetPos,,,,control
	Return control
}