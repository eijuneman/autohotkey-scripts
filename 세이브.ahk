;====================================================================
; 
; Demo of GuiSave and GuiRestore functions
;
; Programmer: Alan Lilly 
; AutoHotkey: v1.1.03.00 (autohotkey_L ANSI version)
;
;====================================================================

VERSION := 1.0

RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe
WINTITLE := basename1 " " VERSION


;============================================================
; 1. When this ahk program is compiled into an exe, fileinstall indicates which files should be embedded inside the exe.
; 2. When the program is run, fileinstall extracts the embedded file to the specified folder.
;============================================================

RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath 

if Not InStr(FileExist(A_AppData "\" basename1), "D")    ; create appdata folder if doesnt exist
    FileCreateDir , % A_AppData "\" basename1
    
;============================================================
; Build gui:
;============================================================ 

Gui, Add, Text, xm section, [중-소]분류
Gui, Add, ComboBox, x+5 vfrmSAVEDPRESET gPresetChange
    
Gui, Add, Button, x+5 h21 w60 gSavePreset, Save    
Gui, Add, Button, x+5 h21 w60 gDeletePreset vDELETEBUTTON, Delete 
Gui, Add, Text, xm, 
Gui, Add, Text, xm section, 분류
Gui, Add, Edit, ys w60 v중분류,
Gui, Add, Edit, ys w90 v소분류y값, 
Gui, Add, Text, xm, 
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;x 69
;y 40 / 60 / 80 / 100 / 120 / 140 / 160 / 180 / 160
Gui, Add, Text, xm, 

Gui, Add, Text, xm section,타이틀

Gui, Add, Text, xm w33 ,      
Gui, Add, Text,  ys w30 , 첫단가의
Gui, Add, Text,  ys w30 , 퍼센트를
Gui, Add, Text,  ys w30 , 투단가의
Gui, Add, Text,  ys w30 , 백의자리
Gui, Add, Text,  ys w30 , 올림
Gui, Add, Text, xm section , M->C
Gui, Add, Edit, ys w30 v첫단가C, 
Gui, Add, Edit, ys w30 v퍼센트를C, 
Gui, Add, Edit, ys w30 v투단가에C, 
Gui, Add, Edit, ys w30 v백자리C, 
Gui, Add, Edit, ys w30 v올림C, 
Gui, Add, Text, xm,
Gui, Add, Text, xm section , C->S
Gui, Add, Edit, ys w30 v첫단가S, 
Gui, Add, Edit, ys w30 v퍼센트를S, 
Gui, Add, Edit, ys w30 v투단가에S, 
Gui, Add, Edit, ys w30 v백자리S, 
Gui, Add, Edit, ys w30 v올림S, 
Gui, Add, Text, xm,
Gui, Add, Text, xm section , C->B
Gui, Add, Edit, ys w30 v첫단가B, 
Gui, Add, Edit, ys w30 v퍼센트를B, 
Gui, Add, Edit, ys w30 v투단가에B, 
Gui, Add, Edit, ys w30 v백자리B, 
Gui, Add, Edit, ys w30 v올림B, 
Gui, Add, Text, xm,
Gui, Add, Text, xm section , C->P
Gui, Add, Edit, ys w30 v첫단가p, 
Gui, Add, Edit, ys w30 v퍼센트를p, 
Gui, Add, Edit, ys w30 v투단가에p, 
Gui, Add, Edit, ys w30 v백자리p, 
Gui, Add, Edit, ys w30 v올림p, 
Gui, Add, Text, xm,
Gui, Add, Text, xm section , C->A
Gui, Add, Edit, ys w30 v첫단가A, 
Gui, Add, Edit, ys w30 v퍼센트를A, 
Gui, Add, Edit, ys w30 v투단가에A, 
Gui, Add, Edit, ys w30 v백자리A, 
Gui, Add, Edit, ys w30 v올림A, 



Gui, Add, Text, xm,
Gui, Add, Text, xm,

Gui, Add, Button, x+5 h21 w60 gStart, Start    
Gui, Add, Button, x+5 h21 w60 greload , RELOAD



Gui, Add, StatusBar

GetXY(winx, winy)
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
    
    guisave("presets.ini", frmSAVEDPRESET, "DELETEBUTTON")
    
    GoSub, UpdatePresetList  ; update drop down to show all preset section names in ini file
    
    GuiControl, Text, frmSAVEDPRESET, % frmSAVEDPRESET  ; update the control
    
    SB_SetText(frmSAVEDPRESET " preset saved") 
    
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
    IniDelete, %A_AppData%\%basename1%\presets.ini, %frmSAVEDPRESET%

    SB_SetText(frmSAVEDPRESET " preset deleted" ) 
    
    GoSub, UpdatePresetList  ; update drop down to show all preset section names in ini file
    
Return

;============================================================
; update drop down to show all preset section names in ini file, except section1
;============================================================

UpdatePresetList:

    gui, submit, nohide
    
    RegExMatch(A_ScriptName, "^(.*?)\.", basename) 
    
    ; get all section names in ini file
    IniRead, sectionNames, %A_AppData%\%basename1%\presets.ini 
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
    
    ; use script's basename to define ini file panel position and presets.ini
    RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe

    ; get window state
    WinGet, winstate, MinMax, %WINTITLE%
    ; do not save window position if minimized, winx and winy would be something like -32000
    if (winstate != -1) {      
        ; save window dimensions, location, and column widths!    
        WinGetPos , x, y, Width, Height, %WINTITLE%
        IniWrite, %x%, %A_AppData%\%basename1%\%basename1%.ini, Window Position, winx
        IniWrite, %y%, %A_AppData%\%basename1%\%basename1%.ini, Window Position, winy
    }
        
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
    
    IniRead, winx, %A_AppData%\%basename1%\%basename1%.ini, Window Position, winx, 0
    IniRead, winy, %A_AppData%\%basename1%\%basename1%.ini, Window Position, winy, 0
    
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
        inifile := A_AppData "\" basename1 "\" inifile
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
        inifile := A_AppData "\" basename1 "\" inifile
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
 {
  
  
   ControlGetText, 01, edit1, 세이브 1.0
   ControlGetText, 02, edit2, 세이브 1.0
   ControlGetText, 03, edit3, 세이브 1.0
   ControlGetText, 11, edit4, 세이브 1.0
   ControlGetText, 12, edit5, 세이브 1.0
   ControlGetText, 13, edit6, 세이브 1.0
   ControlGetText, 14, edit7, 세이브 1.0
   ControlGetText, 15, edit8, 세이브 1.0
   ControlGetText, 21, edit9, 세이브 1.0
   ControlGetText, 22, edit10, 세이브 1.0
   ControlGetText, 23, edit11, 세이브 1.0
   ControlGetText, 24, edit12, 세이브 1.0
   ControlGetText, 25, edit13, 세이브 1.0
   ControlGetText, 31, edit14, 세이브 1.0
   ControlGetText, 32, edit15, 세이브 1.0
   ControlGetText, 33, edit16, 세이브 1.0
   ControlGetText, 34, edit17, 세이브 1.0
   ControlGetText, 35, edit18, 세이브 1.0
   ControlGetText, 41, edit19, 세이브 1.0
   ControlGetText, 42, edit20, 세이브 1.0
   ControlGetText, 43, edit21, 세이브 1.0
   ControlGetText, 44, edit22, 세이브 1.0
   ControlGetText, 45, edit23, 세이브 1.0
   ControlGetText, 51, edit24, 세이브 1.0
   ControlGetText, 52, edit25, 세이브 1.0
   ControlGetText, 53, edit26, 세이브 1.0
   ControlGetText, 54, edit27, 세이브 1.0
   ControlGetText, 55, edit28, 세이브 1.0

   
   
   
 	 ; 합판1-1
	Control, Choose, %02%, TRzComboBox9, ahk_exe JedaeroM.exe
	ControlClick, TDBGridEh2, 제대로판매재고M ver7.56 - [상품변경(단가)], , , , x53 y%03%
    Sleep, 500
	ControlClick, TRzGroupButton2, 제대로판매재고M ver7.56 - [상품변경(단가)]
	Control, Choose, %11%, TRzComboBox2, a제대로판매재고M ver7.56 - [상품변경(단가)]
	ControlSetText, TRzEdit1, %12%, 제대로판매재고M ver7.56 - [상품변경(단가)]
	Control, Choose, %13%, TRzComboBox7, 제대로판매재고M ver7.56 - [상품변경(단가)]
	Control, Choose, %14%, TRzComboBox6, 제대로판매재고M ver7.56 - [상품변경(단가)]
	Control, Choose, %15%, TRzComboBox3, 제대로판매재고M ver7.56 - [상품변경(단가)]
	ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
	Sleep, 500

	
    return
 }
}

reload:
{
}
return
