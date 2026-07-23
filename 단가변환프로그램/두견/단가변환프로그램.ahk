;====================================================================
;
;
; Programmer: shwoodkim
; AutoHotkey: v1.1.03.00 (autohotkey_L ANSI version)
;
;====================================================================
#NoEnv
#SingleInstance, force
SetControlDelay -1

   Winwait, ahk_exe JedaeroM.exe
    IfWinNotActive, ahk_exe JedaeroM.exe,
    WinActivate, ahk_exe JedaeroM.exe

    Sleep, 200
    ControlClick, x21 y39, ahk_exe JedaeroM.exe


;~ GuiControl,, PG, +10

    send, {esc 10}{alt}{enter}
    send, {Right 3}{down 4}{enter}
;~ GuiControl,, PG, +10





VERSION := 1.0

RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe
WINTITLE := basename1 " " VERSION

#SingleInstance force
#NoENV              ; Avoids checking empty variables to see if they are environment variables (recommended for all new scripts and increases performance).SetBatchLines -1    ; have the script run at maximum speed and never sleep
ListLines Off       ; a debugging option

;outputdebug DBGVIEWCLEAR

;============================================================
; 1. When this ahk program is compiled into an exe, fileinstall indicates which files should be embedded inside the exe.
; 2. When the program is run, fileinstall extracts the embedded file to the specified folder.
;============================================================

RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath

if Not InStr(FileExist("\\192.168.0.1\hdd1\단가변환프로그램"), "D")    ; create appdata folder if doesnt exist
    FileCreateDir , \\192.168.0.1\hdd1\단가변환프로그램

;============================================================
; Build gui:
;============================================================
Gui, +alwaysontop
Gui, Add, Text, x5 y5 section, [중-소]분류
Gui, Add, ComboBox, x+5 w200 vfrmSAVEDPRESET gPresetChange

Gui, Add, Button, x+5 h21 w60 gSavePreset, 저장
Gui, Add, Button, x+5 h21 w60 gDeletePreset vDELETEBUTTON, 삭제
Gui, Add, Text, x43 y+15 w60 , 중분류
Gui, Add, Text, x+10 w90, 소분류
Gui, Add, Text, x+11 w30, `  C
Gui, Add, Text, x+11 w30, 소매
Gui, Add, Text, x+11 w30, `  B
Gui, Add, Text, x+11 w30, 매출
Gui, Add, Text, x+11 w30, `  A

Gui, Add, Text, x5 section, 분류
Gui, Add, Edit, ys w60 v중분류,
Gui, Add, Edit, ys w90 v소분류y값,
Gui, Add, Text, xm,
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;x 69
;y 40 / 60 / 80 / 100 / 120 / 140 / 160 / 180 / 160
Gui, Add, Text, xm,
Gui, Add, Text, xm w33 ,
Gui, Add, Edit, ys w30 vC,
Gui, Add, Edit, ys w30 v소매,
Gui, Add, Edit, ys w30 vB,
Gui, Add, Edit, ys w30 v매출,
Gui, Add, Edit, ys w30 vA,


Gui, Add, Text, xm,

Gui, Add, Button, x40 y100 h40 w60 gStart, ALL 변환
Gui, Add, Button, x+10 h40 w60 gStartpick, 단독변환
Gui, Add, Button, x+175 h40 w60 greload , 재시작


Gui, Add, StatusBar

;~ GetXY(winx, winy)
Gui, Show,x500 y500,%WINTITLE%

GoSub, UpdatePresetList  ; update drop down to show all preset section names in ini file

return

;============================================================
; do a guirestore for newly selected preset
;============================================================

PresetChange:

    gui, submit, nohide

    ; if drop down text is blank then error message and return
    if (frmSAVEDPRESET = "")
        return
Sleep, 200
    ; save gui values after combobox1 to ini file under given section
    guirestore("presets.ini",frmSAVEDPRESET)

Return

;============================================================
; save preset to presets.ini
;============================================================

SavePreset:

    gui, submit, nohide

    ; if drop down text is blank then error message and return
    if (frmSAVEDPRESET = "") {
        SB_SetText("Preset name required")
        return
    }

    guisave("단가변환프로그램.ini", frmSAVEDPRESET, "DELETEBUTTON")

    GoSub, UpdatePresetList  ; update drop down to show all preset section names in ini file

    GuiControl, Text, frmSAVEDPRESET, % frmSAVEDPRESET  ; update the control

    SB_SetText(frmSAVEDPRESET " 수정된 사항을 저장했습니다")

Return

;============================================================
; delete selected preset section from presets.ini
;============================================================

DeletePreset:

    gui, submit, nohide

    RegExMatch(A_ScriptName, "^(.*?)\.", basename)

    ; if drop down text is blank then error message and return
    if (frmSAVEDPRESET = "") {
        SB_SetText("Preset name required")
        return
    }

    ; delete entire section from ini file
    IniDelete, \\192.168.0.1\hdd1\단가변환프로그램\단가변환프로그램.ini, %frmSAVEDPRESET%

    SB_SetText(frmSAVEDPRESET " 삭제됐습니다" )

    GoSub, UpdatePresetList  ; update drop down to show all preset section names in ini file

Return

;============================================================
; update drop down to show all preset section names in ini file, except section1
;============================================================

UpdatePresetList:

    gui, submit, nohide

    RegExMatch(A_ScriptName, "^(.*?)\.", basename)

    ; get all section names in ini file
    IniRead, sectionNames, \\192.168.0.1\hdd1\단가변환프로그램\단가변환프로그램.ini
    sectionNames := RegExReplace(sectionNames , "\n", "|")         ; change newline to pipe
    sectionNames := RegExReplace(sectionNames , "section1[\|]?", "")    ; exclude section1
    sectionNames := "|" sectionNames

    ; update drop down to show all preset section names in ini file
    GuiControl, , frmSAVEDPRESET, % sectionNames  ; update the control

Return

;============================================================
; when you click x or close button
;============================================================

GuiClose:

    Gui, Submit, NoHide      ; update control variables

    ;~ ; use script's basename to define ini file panel position and presets.ini
    ;~ RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe

    ;~ ; get window state
    ;~ WinGet, winstate, MinMax, %WINTITLE%
    ;~ ; do not save window position if minimized, winx and winy would be something like -32000
    ;~ if (winstate != -1) {
        ;~ ; save window dimensions, location, and column widths!
        ;~ WinGetPos , x, y, Width, Height, %WINTITLE%
        ;~ IniWrite, %x%, \\192.168.0.1\hdd1\단가변환프로그램\단가변환프로그램.ini, Window Position, winx
        ;~ IniWrite, %y%, \\192.168.0.1\hdd1\단가변환프로그램\단가변환프로그램.ini, Window Position, winy
    ;~ }

ExitApp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;============================================================
; Return window x and y position from ini file.
;============================================================

GetXY(byref winx, byref winy)
{

    RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe

    ;============================================================
    ; position gui based on values from ini file
    ;============================================================

    IniRead, winx, \\192.168.0.1\hdd1\단가변환프로그램\단가변환프로그램.ini, Window Position, winx, 0
    IniRead, winy, \\192.168.0.1\hdd1\단가변환프로그램\단가변환프로그램.ini, Window Position, winy, 0

    ; get the width and height of the entire desktop (even if it spans multiple monitors)
    SysGet, VirtualWidth, 78
    SysGet, VirtualHeight, 79

    ; prevent display of gui off-screen (somehow this was still happening to jess, so I added this logic)
    if (winx < 0) OR (winx > VirtualWidth)
        winx := 0

    if (winy < 0) OR (winy > VirtualHeight)
        winy := 0

    Return

}

;============================================================
; save all gui control values for active gui to ini file
;============================================================

GuiSave(inifile,section,begin="",end="")
{
    SplitPath, inifile, file, path, ext, base, drive     ; splitpath expects paths with \

    if (path = "") {   ; if no path given then use default path
        RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe
        inifile := "\\192.168.0.1\hdd1\단가변환프로그램\단가변환프로그램.ini"
    }

    WinGet, List_controls, ControlList, A    ; get list of all controls active gui

    if (begin = "")
        flag := 0
    else
        flag := 1

    Loop, Parse, List_controls, `n
    {
        ;ControlGet, cid, hWnd,, %A_LoopField%         ; get the id of current control
        GuiControlGet, textvalue,,%A_Loopfield%,Text  ; get associated text
        GuiControlGet, vname, Name, %A_Loopfield%     ; get controls vname

        If (vname = "")   ; only save controls which have a vname
            continue

        if (begin = vname) {
            flag := 0
            continue
        }

        if (flag)
            continue

        if (end = vname)
            break

        GuiControlGet, value ,, %A_Loopfield%         ; get controls value
        value := RegExReplace(value, "`n", "|")       ; convert newlines to pipes (for multiline edit fields, because newlines are not valid for ini file)

        ; todo: truncate edit values to not exceed ini fieldsize limit (1024?)  OR blank (all or nothing)

        IniWrite, % value, %inifile%, %section%, %vname%

    }

   return
}

;============================================================
; Update gui controls with values from ini file.
;============================================================

GuiRestore(inifile,section)
{

    SplitPath, inifile, file, path, ext, base, drive     ; splitpath expects paths with \

    if (path = "") {   ; if no path given then use default path
        RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe
        inifile := "\\192.168.0.1\hdd1\단가변환프로그램\단가변환프로그램.ini"
    }

    ;============================================================
    ; update gui controls with values from ini file
    ;============================================================

    WinGet, List_controls, ControlList, A   ; get list of all controls for active gui

    Loop, Parse, List_controls, `n
    {

        ;ControlGet, cid, hWnd,, %A_LoopField%         ; get the id of current control
        ;GuiControlGet, textvalue,,%A_Loopfield%,Text  ; get controls associated text
        GuiControlGet, vname, Name, %A_Loopfield%     ; get controls vname
        GuiControlGet, value ,, %A_Loopfield%         ; get controls value

        If (vname = "")   ; only process controls which have a vname
            continue

        IniRead, value, %inifile%, %section%, %vname%, ERROR

        if (value != "ERROR") {

            value := RegExReplace(value, "\|", "`n")       ; convert pipes to newlines (for multiline edit fields, because newlines are not valid for ini file)

            RegExMatch( A_Loopfield, "(.*?)\d+", name)   ; extract the control name without numbers
            if (name1 = "ComboBox") {
                GuiControl, ChooseString, %A_Loopfield%, %value%   ; select item in dropdownlist
            } else {
                GuiControl,  ,%A_Loopfield%, %value%    ; update the control
            }
        }

    }

    return

}


start:
{

Gui, submit, nohide

    var1 := 0

        Control, Choose, 3, TRzComboBox9, ahk_exe JedaeroM.exe

        Loop,61
        {


        var1++


        ; 합판1-1


        CONTROL, CHOOSE, %var1%, ComboBox1, 단가변환프로그램,

Sleep, 500




        ControlGetText, 01, edit1, 단가변환프로그램,
        ControlGetText, s1, edit2, 단가변환프로그램,
        ControlGetText, s2, edit3, 단가변환프로그램,
        ControlGetText, 11, edit4, 단가변환프로그램,
        ControlGetText, 12, edit5, 단가변환프로그램,
        ControlGetText, 13, edit6, 단가변환프로그램,
        ControlGetText, 14, edit7, 단가변환프로그램,
        ControlGetText, 15, edit8, 단가변환프로그램,




        Sleep, 200




        Control, Choose, %s1%, TRzComboBox9, ahk_exe JedaeroM.exe
        Sleep, 200
        ControlClick, TDBGridEh2, ahk_exe JedaeroM.exe, , , , x53 y60
        Sleep, 200
        ControlClick, TDBGridEh2, ahk_exe JedaeroM.exe, , , , x53 y%s2%
        Sleep, 200
        ControlClick, TRzGroupButton2, ahk_exe JedaeroM.exe
        Sleep, 200
        Control, Choose, 6,   TRzComboBox2, ahk_exe JedaeroM.exe
        ControlSetText, TRzEdit1, %11%, ahk_exe JedaeroM.exe
        Control, Choose, 4,   TRzComboBox7, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe
        ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
        Sleep, 200
        Control, Choose, 4,   TRzComboBox2, ahk_exe JedaeroM.exe
        ControlSetText, TRzEdit1, %12%, ahk_exe JedaeroM.exe
        Control, Choose, 5,   TRzComboBox7, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe
        ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
        Sleep, 200
        Control, Choose, 4,   TRzComboBox2, ahk_exe JedaeroM.exe
        ControlSetText, TRzEdit1, %13%, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox7, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe
        ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
        Sleep, 200
        Control, Choose, 4,   TRzComboBox2, ahk_exe JedaeroM.exe
        ControlSetText, TRzEdit1, %14%, ahk_exe JedaeroM.exe
        Control, Choose, 1,   TRzComboBox7, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe
        ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
        Sleep, 200
        Control, Choose, 4,   TRzComboBox2, ahk_exe JedaeroM.exe
        ControlSetText, TRzEdit1, %15%, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox7, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe
        ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
        Sleep, 200
        ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe, , , , X137 y16
        SLEEP, 200

        WinWait, 일괄저장,
        IfWinNotActive, 일괄저장, , WinActivate, 일괄저장,
        WinWaitActive, 일괄저장,
        Sleep, 200

        ControlClick, Button1, 일괄저장
        Sleep, 100

        WinWait, 저장 확인,
        IfWinNotActive, 저장 확인, , WinActivate, 저장 확인,
        WinWaitActive, 저장 확인,
        Sleep, 100

        ControlClick, Button1, 저장 확인
        Sleep, 100


        Sleep, 200

        }

}
     return

Startpick:
{
        gui, submit, nohide
        ControlGetText, 01, edit1, 단가변환프로그램,
        ControlGetText, s1, edit2, 단가변환프로그램,
        ControlGetText, s2, edit3, 단가변환프로그램,
        ControlGetText, 11, edit4, 단가변환프로그램,
        ControlGetText, 12, edit5, 단가변환프로그램,
        ControlGetText, 13, edit6, 단가변환프로그램,
        ControlGetText, 14, edit7, 단가변환프로그램,
        ControlGetText, 15, edit8, 단가변환프로그램,




        Sleep, 200




        Control, Choose, %s1%, TRzComboBox9, ahk_exe JedaeroM.exe
        Sleep, 200
        ControlClick, TDBGridEh2, ahk_class TfmMain, , , , x53 y60
        Sleep, 200
        ControlClick, TDBGridEh2, ahk_class TfmMain, , , , x53 y%s2%
        Sleep, 200

        MsgBox, 멈춰`n%s2%



        ControlClick, TRzGroupButton2, ahk_exe JedaeroM.exe
        Sleep, 200
        Control, Choose, 6,   TRzComboBox2, ahk_exe JedaeroM.exe
        ControlSetText, TRzEdit1, %11%, ahk_exe JedaeroM.exe

Control, Choose, 4,   TRzComboBox7, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe
        ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
        Sleep, 200
        Control, Choose, 4,   TRzComboBox2, ahk_exe JedaeroM.exe
        ControlSetText, TRzEdit1, %12%, ahk_exe JedaeroM.exe
        Control, Choose, 5,   TRzComboBox7, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe
        ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
        Sleep, 200
        Control, Choose, 4,   TRzComboBox2, ahk_exe JedaeroM.exe
        ControlSetText, TRzEdit1, %13%, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox7, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe
        ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
        Sleep, 200
        Control, Choose, 4,   TRzComboBox2, ahk_exe JedaeroM.exe
        ControlSetText, TRzEdit1, %14%, ahk_exe JedaeroM.exe
        Control, Choose, 1,   TRzComboBox7, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe
        ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
        Sleep, 200
        Control, Choose, 4,   TRzComboBox2, ahk_exe JedaeroM.exe
        ControlSetText, TRzEdit1, %15%, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox7, ahk_exe JedaeroM.exe
        Control, Choose, 2,   TRzComboBox6, ahk_exe JedaeroM.exe
        Control, Choose, 3,   TRzComboBox3, ahk_exe JedaeroM.exe
        ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
        Sleep, 200
        ControlClick, TAdvToolBar2, ahk_exe JedaeroM.exe, , , , X137 y16
        SLEEP, 200

        WinWait, 일괄저장,
        IfWinNotActive, 일괄저장, , WinActivate, 일괄저장,
        WinWaitActive, 일괄저장,
        Sleep, 200

        ControlClick, Button1, 일괄저장
        Sleep, 100

        WinWait, 저장 확인,
        IfWinNotActive, 저장 확인, , WinActivate, 저장 확인,
        WinWaitActive, 저장 확인,
        Sleep, 100

        ControlClick, Button1, 저장 확인
        Sleep, 100


        Sleep, 200



}
     return




reload:
{
    Reload
}
return
