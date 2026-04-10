#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;~ SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetControlDelay, -1
SetWinDelay, -1
#SingleInstance, Force
#Persistent



;~ Run explore %A_ScriptDir%\img, , hide, PID
;~ #Include, %A_ScriptDir%\include_ahk\csv.ahk
;~ #Include, %A_ScriptDir%\include_ahk\ScreenCapture.ahk
#Include, %A_ScriptDir%\csv.ahk
#Include, %A_ScriptDir%\ScreenCapture.ahk
;~ SetTimer,Timer,500                                                        ;timer: 의 구문을 200ms(0.2초) 마다 실행하라는 뜻입니다.
WinSet, Style, +0x20000000, 
;~ FormatTime, date, YYYYMMDDHH24MISS, yyyy년 MM월 dd일





Gui, Add, ListView, x42 y89 w600 h640 vlv1 glv1, 안보임|날짜|업체|출고시간|장소|배송지
Gui, Add, ListView, x652 y89 w610 h640 vlv2 glv2, 번호|내용|단위|수량|재고위치 
Gui, Add, DateTime, x42 y49 w180 h30 , 
Gui, Add, DateTime, x232 y49 w150 h30 , 
; Generated using SmartGUI Creator for SciTE
	Gui, ListView, lv1
Loop, %A_ScriptDir%\*.csv
	
{

RegExMatch(A_LoopFileName, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_F", output)

    LV_Add("", "A" output1 "_B" output2 "_C" output3 "_D" output4 "_E" output5 "_F.csv", output1, output2, output3, output4, output5)
}
	
LV_ModifyCol(1, 0)
LV_ModifyCol(2, 60)  ; 
LV_ModifyCol(3, 100)  ; 
LV_ModifyCol(4, 100)  ; 
LV_ModifyCol(5, 100)  ; 
LV_ModifyCol(6, 100)  ; 


;~ VAR := A_LoopFileName
;~ MsgBox, % var
;~ RegExMatch(var, "A(.*)_B(.*)_C(.*)_D(.*)_E(.*)_F", output)
    ;~ LV_Add("", A_LoopFileName, A_LoopFileSizeKB,FileName,FileDir )
    ;~ LV_Add("", A_LoopFileName, output1, output2, output3, output4, output5)
	
;~ LV_ModifyCol(1, 0)
;~ LV_ModifyCol(2, 200)  ; 


Gui, Show, w1366 h750 x0 y0, 일정표
return


; 폴더로부터 파일 이름 목록을 수집해 그것을 ListView에 넣습니다:
lv1:
;~ 정렬의 목적으로, 2 번 열은 정수라는 것을 나타냅니다.

;~ WinKill, %A_ScriptDir%\img
;~ Loop{
;~ if (errorlevel = 1){
    ;~ winkill, %A_ScriptDir%\img
;~ }
;~ else
;~ {
;~ break
;~ }return
;~ }

;~ return


lv2:

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
;~ MsgBox, %OutputVar%
	Gui, ListView, lv2
{
LV_Delete()
Loop,A_LoopField
  LV_Add("", x*)
  }


;~ Sleep, 500
	FileRead, data, %OutputVar%
	;~ CSV_Load("File","data")
	;~ ; Display how many rows we have using CSV_TotalRows()
	;~ MsgBox % "There are " CSV_TotalRows("data") " rows in this CSV file."
	;~ MsgBox % "There are " CSV_Totalcols("data") " rows in this CSV file." 
	Gui, ListView, vl2
	
	LV_ModifyCol(2, 250)
	LV_ModifyCol(3, 100)  ; 

	loop, parse, data, `n
	{
		x:=[]
		loop, parse, A_LoopField, CSV
			x.Insert(A_LoopField)
		LV_Add("", x*)
	}
	
	
return


GuiClose:
ExitApp