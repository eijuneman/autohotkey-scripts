;=================== Serial_Port_Console.ahk ===========================
; 2/15/08
; Assembled, tested (on WinXP), and debugged by aobrien with help from  
;   other AHK forum members and threads.
;
; Instructions:
; 1) Copy port.dll from the link below and put into windows 
;    system32 directory
;    http://www.the-starbearer.de/Praxis/ElektronikamPC/RS232/portdll.htm 
;
; 2) Modify the COM port settings (under the User Variables heading) 
;    to your needs and save the file.
; 
; 3) Launch this script to connect to the COM Port
;
; 4) CTRL-F1 to close the COM port and exit the receive loop
;
; Script Behavior/Notes:
; * The script is designed to use a text editor (Notepad) to place the
;     received COM port characters.
; * When you attempt to type into the designated text editor the script
;     will capture the character and send it out the COM port. This is
;     accomplished with the Hotkey Assignments section.
; * Currently the script is written to only send/receive ASCII characters,
;     however, it would be REALLY EASY to modify the script so that it
;     will output/input data - something that HyperTerminal can't do.
; * When you first launch the script it will open Notepad and save it
;     using the Console_Path variable and a predetermined file name.
;
; !!!The Notepad text file MUST be saved so that the words
;      "COM1_Console_(timestamp).txt - Notepad" appear as the window 
;      title, because the script will want to change to the window with 
;      that name when it receives a character on the COM port.
;
;========================================================================

#SingleInstance Force
SetTitleMatchMode, 2

;========================================================================
;====== User Variables ==================================================
;========================================================================
COM_Port     = COM3
COM_Baud     = 9600 
COM_Parity   = N
COM_Data     = 8
COM_Stop     = 1
Console_Path = C:\aobrien\_AutoHotKey_Scripts\COM_Port

;========================================================================
;====== Script Variables ================================================
;========================================================================
COM_Settings     = %COM_Port%:%COM_Baud%,%COM_Parity%,%COM_Data%,%COM_Stop%
Console_File_Name= %COM_Port%_Console.txt
Console_Title    = %Console_File_Name% - Notepad

;========================================================================
;====== Notepad Console Check ===========================================
;========================================================================
;Check for console, if there isn't already one, then open it.
IfWinNotExist, %Console_Title%
{
  Run, Notepad
  WinWait, Untitled - Notepad
  Send, !fa  ;file save as
  WinWait, Save As
  Clipboard = %Console_Path%\%Console_File_Name%
  Send, ^v{ENTER}
}

;========================================================================
;====== Hotkey Assignments - Used for Serial Port Transmit ==============
;========================================================================
;If the Console window is the focus then typing any character on the 
;  keyboard will cause the script to send the character out the COM port.
Hotkey, IfWinActive, %Console_Title%,

;Direct Key Presses for a-z
Loop, 26
  HotKey, % "$" chr(96+A_Index), HotkeySub

;Direct Key Presses for 0-9
Loop, 10
  HotKey, % "$" chr(47+A_Index), HotkeySub

;Direct Key Presses for Other Keys
HotKey, -, HotkeySub
HotKey, =, HotkeySub
HotKey, [, HotkeySub
HotKey, ], HotkeySub
HotKey, `;, HotkeySub
HotKey, `', HotkeySub
HotKey, `,, HotkeySub
HotKey, `., HotkeySub
HotKey, `/, HotkeySub
HotKey, `\, HotkeySub
Hotkey, Space, HotkeySub
Hotkey, ENTER, HotkeySub
Hotkey, BS, HotkeySub

;Shift Modified Character Key Presses for a-z.
Loop, 26
  HotKey, % "$+" chr(96+A_Index), HotkeySub_Char_Shift

;Shift Modified Character Key Presses for 0-9
Loop, 10
  HotKey, % "$+" chr(47+A_Index), HotkeySub_Other_Shift

;Shift Modified Character Key Presses for Other Keys
HotKey, +-, HotkeySub_Other_Shift
HotKey, +=, HotkeySub_Other_Shift
HotKey, +[, HotkeySub_Other_Shift
HotKey, +], HotkeySub_Other_Shift
HotKey, +`;, HotkeySub_Other_Shift
HotKey, +`', HotkeySub_Other_Shift
HotKey, +`,, HotkeySub_Other_Shift
HotKey, +`., HotkeySub_Other_Shift
HotKey, +`/, HotkeySub_Other_Shift
HotKey, +`\, HotkeySub_Other_Shift

;========================================================================
;====== Serial Port Receive =============================================
;========================================================================

;Quit_var is used to exit the COM port receive loop
Quit_var = 0

hModule := DllCall("LoadLibrary", "str", "Port.dll")
result := DllCall("Port.dll\OPENCOM", "str", COM_Settings)
if result = 0
{
  MsgBox, AHK could not open %COM_Port%
  return
}

MsgBox, AHK is now connected to %COM_Port%

SetFormat, integer, data

;COM port receive loop
data = 0
Loop 
{
  data := DllCall("Port.dll\READBYTE")

  ;This will send every byte that is received on 
  ;  the COM port to the Notepad Console
  If data <> -1
  {
    Critical, On
    WinWait, %Console_Title%, 
    IfWinNotActive, %Console_Title%, , WinActivate, %Console_Title%, 
    WinWaitActive, %Console_Title%,    
    
    ;If you want to see the decimal data (as received by the serial port,
    ;  then uncomment the line below.
    ;Send, ^{END}data=%data%{ENTER}
    ASCII := chr(data)
    Send, ^{END}%ASCII%
    Critical, Off
  }

  if Quit_var = 1
    Break

}

result := DllCall("c:\temp\Port.dll\CLOSECOM")
DllCall("FreeLibrary", "UInt", hModule) 
MsgBox, AHK is now disconnected from %COM_Port%

return

;========================================================================
;====== Serial Port Transmit ============================================
;========================================================================
HotkeySub:
var := Asc(SubStr(A_ThisHotkey,0)) ;Get the key that was pressed and convert it to its ASCII code
If A_ThisHotkey = Space
  var=32
If A_ThisHotkey = BS
  var=8
If A_ThisHotkey = ENTER
  {
    var=10 ;New Line
    d := DllCall("Port\SENDBYTE", "UInt", var)
    var=13 ;Carriage Return
  }
d := DllCall("Port\SENDBYTE", "UInt", var)
return

HotkeySub_Char_Shift:
var := SubStr(A_ThisHotkey,0) ;Get the key that was pressed.
StringUpper, var, var         ;Convert it to uppercase
var := Asc(var)               ;Get the ASCII equivalent
d := DllCall("Port\SENDBYTE", "UInt", var) ;Send it out the COM port
return

HotkeySub_Other_Shift:
var := SubStr(A_ThisHotkey,0) ; Get the key that was pressed.
;Convert it to the shift version
;  StringUpper won't work on the following.
If var = 1
  var = !
If var = 2
  var = @
If var = 3
  var = #
If var = 4
  var = $
If var = 5
  var = `%
If var = 6
  var = ^
If var = 7
  var = &
If var = 8
  var = *
If var = 9
  var = (
If var = 0
  var = )
If var = -
  var = _
If var = =
  var = +
If var = [
  var = {
If var = ]
  var = }
If var = \
  var = |
If var = `;
  var = :
If var = `'
  var = "
If var = `,
  var = <
If var = `.
  var = >
If var = `/
  var = ?

var := Asc(var)  ;Get the ASCII equivalent
d := DllCall("Port\SENDBYTE", "UInt", var) ;Send it out the COM port
return

;========================================================================
;====== Save & Reload and Minimize AHK Script ===========================
;========================================================================
^!w::
Send, ^s
Sleep, 200

Reload
Sleep, 1000

return

;========================================================================
;====== Exit Console Receive Loop =======================================
;========================================================================
^F1::
Quit_var = 1
return