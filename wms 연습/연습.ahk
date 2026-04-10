
SendMode Input
#SingleInstance force
applicationname=BatteryStatus
SendMode Input
Gosub,READINI

VarSetCapacity(powerStatus, 1+1+1+1+4+4)
acLineStatus=FirstRun
BatteryLifePercent=FirstRun
GoSub GETSYSTEMPOWERSTATUS
SetTimer,GETSYSTEMPOWERSTATUS, %pollingms%
Return

GETSYSTEMPOWERSTATUS:
success:=DllCall("GetSystemPowerStatus", "UInt", &powerStatus)
If (ErrorLevel != 0 Or success = 0)
{
MsgBox,0,%applicationname%,Can't get the power state. Error=%A_LastError%
ExitApp
}
oldacLineStatus := acLineStatus
acLineStatus := GetInteger(powerStatus, 0, false, 1)
oldBatteryLifePercent := BatteryLifePercent
BatteryLifePercent := GetInteger(powerStatus, 2, false, 1)
If BatteryLifePercent = 255
{
BatteryLifePercent = ---

}
Menu,Tray,Tip,Battery %BatteryLifePercent%`%

Do_Alert := FALSE
loop,%NumAlerts%
{
i := NumAlerts - a_index + 1
alertpct := alert%i%pct
If (oldBatteryLifePercent > alertpct And BatteryLifePercent <= alertpct)
{
alertms := alert%i%ms
alertimg := alert%i%img
alertcmd := alert%i%cmd
Msgcenter = %BatteryLifePercent%`%
Do_Alert := TRUE
break
}
}

If (oldBatteryLifePercent < 100 And BatteryLifePercent == 100)
{
alertms := FULLms
alertimg := FULLimg
alertcmd := FULLcmd
Msgcenter = Battery fully charged.`n`nBattery`n%BatteryLifePercent%`%
Do_Alert := TRUE
}


If (acLineStatus<>oldacLineStatus)
{
If acLineStatus = 1
{
alertms := PLUGINms
alertimg := PLUGINimg
alertcmd := PLUGINcmd
Msgcenter = Plugged In`n`nBattery`n%BatteryLifePercent%`%
Do_Alert := TRUE
}
Else If acLineStatus = 0
{
alertms := UNPLUGms
alertimg := UNPLUGimg
alertcmd := UNPLUGcmd
Msgcenter = Unplugged`n`nBattery`n%BatteryLifePercent%`%
Do_Alert := TRUE
}
}
If ( Do_Alert )
{
GoSub DOALERT
}
Return

DOALERT:
If (alertcmd != "")
{
SplitPath,alertcmd,name,dir,ext,name_no_ext,drive
If ext In wav
{
SoundPlay,%alertcmd%
}
Else
{
Run,%alertcmd%,,UseErrorLevel
}
}
If (alertms > 0)
{
MsgBelow := "Battery Status"
popupmfk(Msgcenter, MsgBelow, alertms, alertimg, 1)
}
Return

GetInteger(ByRef @source, _offset = 0, _bIsSigned = false, _size = 4)
{
Local result
Loop %_size%
{
result += *(&@source + _offset + A_Index-1) << 8*(A_Index-1)
}
If (!_bIsSigned OR _size > 4 OR result < 0x80000000)
Return result
Return -(0xFFFFFFFF - result + 1)
}



popupmfk(popTitle=0, popMsg=0, popTime=3000, icoPath=0, hasGoAway=0)
{
kInstanceGuiFcnPopupmfk = instance_gui_fcn_popupmfk_1
kTitleTypeFace = Tahoma
kTitleStyle = s8 w700 c000000
kMessageTypeFace = Tahoma
kMessageStyle = s8 w400 c000000

DetectHiddenText, On

IfWinExist, ahk_class AutoHotkeyGUI, %kInstanceGuiFcnPopupmfk%
{
gosub lbl_fcn_popupmfk_DONE
WinKill, ahk_class AutoHotkeyGUI, %kInstanceGuiFcnPopupmfk%
}
if popMsg
{
Gui, +AlwaysOnTop +toolwindow -resize -caption +border
Gui, Add, Text, hidden, %kInstanceGuiFcnPopupmfk%
if popTitle
{
if icoPath
{
Gui, Add, Picture, xm ym section glbl_fcn_popupmfk_DONE ,%icoPath%
Gui, font, %kTitleStyle%, %kTitleTypeFace%
Gui, Add, Text, ys glbl_fcn_popupmfk_DONE , %popTitle%
}
else
{
Gui, font, %kTitleStyle%, %kTitleTypeFace%
Gui, Add, Text, xm ym section glbl_fcn_popupmfk_DONE , %popTitle%
}
Gui, font, s8 %kMessageStyle%, %kMessageTypeFace%
Gui, Add, Text, xm glbl_fcn_popupmfk_DONE , %popMsg%
}
else
{
Gui, font, %kMessageStyle%, %kMessageTypeFace%
if icoPath
{
Gui, Add, Picture, xm ym section glbl_fcn_popupmfk_DONE ,%icoPath%
Gui, Add, Text, ys glbl_fcn_popupmfk_DONE, %popMsg%
}
else
Gui, Add, Text, xm ym glbl_fcn_popupmfk_DONE, %popMsg%
}
if hasGoAway
{


}
Gui, +alwaysontop
Gui, font
Gui, Color, ffffdd
SysGet, popup_monWorkArea, MonitorWorkArea
Gui, Show, x500 y200, NoActivate
WinWait , ahk_class AutoHotkeyGUI, %kInstanceGuiFcnPopupmfk%
WinGetPos ,,, GuiWidth, GuiHeight, ahk_class AutoHotkeyGUI, %kInstanceGuiFcnPopupmfk%
popup_x := popup_monWorkAreacenter-GuiWidth
popup_y := popup_monWorkAreaCenter-GuiHeight
Gui, Show, x500 y300 NoActivate
WinWait , ahk_class AutoHotkeyGUI, %kInstanceGuiFcnPopupmfk%
SetTimer, lbl_fcn_popupmfk_DONE, %popTime%
}
return
lbl_fcn_popupmfk_DONE:
SetTimer, lbl_fcn_popupmfk_DONE, Off
Gui, Destroy
return
}

DeRefDeley(v)
{
loop,20
{
Transform, w, deref, %v%
if (w = v)
{
Return (w)
}
v := w
}
Return ("DeRefDeley looped 20 times and gave up")
}


SETTINGS:
Gosub,READINI
Run,BatteryStatus.ini
Return

RELOAD:
Reload

READINI:
IfNotExist,BatteryStatus.ini
{
ini=;BatteryStatus.ini
ini=%ini%`n
ini=%ini%`n[Settings]
ini=%ini%`nalert1pct=50
ini=%ini%`nalert2pct=25
ini=%ini%`nalert3pct=12
ini=%ini%`nalert1ms=8000
ini=%ini%`nalert2ms=8000
ini=%ini%`nalert3ms=800000
ini=%ini%`nImgPath=`%A_ScriptDir`%
ini=%ini%`nalert1img=`%ImgPath`%\ClipartConnection_3700840.thm.jpg
ini=%ini%`nalert2img=`%ImgPath`%\ClipartConnection_3775471_thm.jpg
ini=%ini%`nalert3img=`%ImgPath`%\ClipartConnection_3775475_thm.jpg
ini=%ini%`nalert1cmd=`%windir`%\media\notify.wav
ini=%ini%`nalert2cmd=`%windir`%\media\notify.wav
ini=%ini%`nalert3cmd=`%windir`%\media\notify.wav
ini=%ini%`nUNPLUGms=7000
ini=%ini%`nUNPLUGimg=`%ImgPath`%\ClipartConnection_3890038_thm.jpg
ini=%ini%`nUNPLUGcmd=`%windir`%\media\notify.wav
ini=%ini%`nPLUGINms=7000
ini=%ini%`nPLUGINimg=`%ImgPath`%\ClipartConnection_3861328_thm.jpg
ini=%ini%`nPLUGINcmd=`%windir`%\media\notify.wav
ini=%ini%`nFULLms=7000
ini=%ini%`nFULLimg=`%ImgPath`%\ClipartConnection_3775464_thm.jpg
ini=%ini%`nFULLcmd=`%windir`%\media\notify.wav
ini=%ini%`npollingms=8000
ini=%ini%`n
FileAppend,%ini%,BatteryStatus.ini
ini=
}
IniRead,ImgPath,BatteryStatus.ini,Settings,ImgPath
loop
{
IniRead, alert%A_Index%pct, BatteryStatus.ini, Settings, alert%A_Index%pct
if (alert%A_Index%pct = "ERROR")
{
NumAlerts := A_Index - 1
break
}
IniRead, alert%A_Index%ms, BatteryStatus.ini, Settings, alert%A_Index%ms
IniRead, alert%A_Index%img, BatteryStatus.ini, Settings, alert%A_Index%img
alert%A_Index%img := DeRefDeley(alert%A_Index%img)
IniRead, alert%A_Index%cmd, BatteryStatus.ini, Settings, alert%A_Index%cmd
alert%A_Index%cmd := DeRefDeley(alert%A_Index%cmd)
}
IniRead, UNPLUGms, BatteryStatus.ini, Settings, UNPLUGms
IniRead, UNPLUGimg, BatteryStatus.ini, Settings, UNPLUGimg
UNPLUGimg := DeRefDeley(UNPLUGimg)
IniRead, UNPLUGcmd, BatteryStatus.ini, Settings, UNPLUGcmd
UNPLUGcmd := DeRefDeley(UNPLUGcmd)
IniRead, PLUGINms, BatteryStatus.ini, Settings, PLUGINms
IniRead, PLUGINimg, BatteryStatus.ini, Settings, PLUGINimg
PLUGINimg := DeRefDeley(PLUGINimg)
IniRead, PLUGINcmd, BatteryStatus.ini, Settings, PLUGINcmd
PLUGINcmd := DeRefDeley(PLUGINcmd)
IniRead, FULLms, BatteryStatus.ini, Settings, FULLms
IniRead, FULLimg, BatteryStatus.ini, Settings, FULLimg
FULLimg := DeRefDeley(FULLimg)
IniRead, FULLcmd, BatteryStatus.ini, Settings, FULLcmd
FULLcmd := DeRefDeley(FULLcmd)
IniRead, pollingms, BatteryStatus.ini, Settings, pollingms




Return

about:
Gui,99:Destroy
Gui,99:Margin,20,20
Gui,99:Add,Picture,xm Icon1,%applicationname%.exe
Gui,99:Font,Bold
Gui,99:Add,Text,x+10 yp+10,%applicationname%
Gui,99:Font

Gui,99:Add,Button,GABOUTOK Default w75,&OK
Gui,99:Show,,%applicationname% About
hCurs:=DllCall("LoadCursor","UInt",NULL,"Int",32649,"UInt")
OnMessage(0x200,"WM_MOUSEMOVE")
Return


ABOUTOK:
Gui,99:Destroy
OnMessage(0x200,"")
DllCall("DestroyCursor","Uint",hCur)
Return
WM_MOUSEMOVE(wParam,lParam)
{
Global hCurs
MouseGetPos,,,,ctrl
If ctrl in Static7,Static9,Static10,Static13,Static14,Static17,Static18,Static21
DllCall("SetCursor","UInt",hCurs)
Return
}
Return

EXIT:
ExitApp