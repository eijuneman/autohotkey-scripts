;################### Serial_Port_Console_ReadFile.ahk ###################
; 8/11/09
; Assembled, tested (on WinXP), and debugged by aobrien with help from
;   other AHK forum members (especially Lexikos) and threads.
;
; This script is based upon dll structures that are built into the
; Microsoft Windows environment. This script is ugly (not very readable),
; because, it was written for demonstration purposes and I didn't want
; to complicate things by using #Include files.
;
; The most useful subroutines are listed below. Take them and write your
; application around them.
;     PORT_FileHandle:= PORT_Initialize(PORT_Settings) -- Get the filehandle
;     PORT_Close(PORT_FileHandle)
;     PORT_Read(PORT_FileHandle,"0xFF",PORT_Bytes_Received) -- 0xFF Size of receive buffer. This returns ASCII
;                                representation of the received HEX data.
;     Example: Read_Data := PORT_Read(PORT_FileHandle,"0xFF",PORT_Bytes_Received) ;if the RX buffer contained
;              0x11, 0x22, 0x00, 0x33, 0x44 then Read_Data will contain 1122003344
;     PORT_Write(PORT_FileHandle,Hex_Data) -- Comma delimited hex data. If I wanted to
;                               send "Hello World" I would do the following:
;     ;ASCII DATA=  H    e    l    l    o   SP    W    o    r    l    d
;     Hex_Data = 0x48,0x65,0x6C,0x6C,0x6F,0x20,0x57,0x6F,0x72,0x6C,0x64
;     PORT_Write(PORT_FileHandle,Hex_Data)
;
; Instructions:
; 1) Modify the COM port settings (under the User Variables heading)
;    to your needs and save the file.
;
; 2) Launch this script to connect to the COM Port.
;
; 3) CTRL-F1 to close the COM port and exit the receive loop.

;########################################################################
PORT_Initialize(PORT_Settings)
{
  ;###### Extract/Format the COM Port Number ######
  ;7/23/08 Thanks krisky68 for finding/solving the bug in which COM Ports greater than 9 didn't work.
  ;8/10/09 Moved this section to the beginning of the sub routine as part of trenton_xavier's fix.
  StringSplit, PORT_COM_Temp, PORT_Settings, `:
  PORT_COM_Temp1_Len := StrLen(PORT_COM_Temp1)  ;For COM Ports > 9 \\.\ needs to prepended to the COM Port name.
  If (PORT_COM_Temp1_Len > 4)                   ;So the valid names are
    PORT_COM = \\.\%PORT_COM_Temp1%             ; ... COM8  COM9   \\.\COM10  \\.\COM11  \\.\COM12 and so on...
  Else                                          ;
    PORT_COM = %PORT_COM_Temp1%

  ;8/10/09 A BIG Thanks to trenton_xavier for figuring out how to make COM Ports greater than 9 work for USB-Serial Dongles.
  StringTrimLeft, PORT_Settings, PORT_Settings, PORT_COM_Temp1_Len+1 ;Remove the COM number (+1 for the semicolon) for BuildCommDCB.
  ;MsgBox, PORT_COM=%PORT_COM% `nPORT_Settings=%PORT_Settings%

  ;###### Build COM DCB ######
  ;Creates the structure that contains the COM Port number, baud rate,...
  VarSetCapacity(DCB, 28)
  BCD_Result := DllCall("BuildCommDCB"
       ,"str" , PORT_Settings ;lpDef
       ,"UInt", &DCB)        ;lpDCB
  If (BCD_Result <> 1)
  {
    MsgBox, There is a problem with Serial Port communication. `nFailed Dll BuildCommDCB, BCD_Result=%BCD_Result% `nThe Script Will Now Exit.
    Exit
  }

  ;###### Create COM File ######
  ;Creates the COM Port File Handle
  ;StringLeft, PORT_COM, PORT_Settings, 4  ; 7/23/08 This line is replaced by the "Extract/Format the COM Port Number" section above.
  PORT_FileHandle := DllCall("CreateFile"
       ,"Str" , PORT_COM     ;File Name         
       ,"UInt", 0xC0000000   ;Desired Access
       ,"UInt", 3            ;Safe Mode
       ,"UInt", 0            ;Security Attributes
       ,"UInt", 3            ;Creation Disposition
       ,"UInt", 0            ;Flags And Attributes
       ,"UInt", 0            ;Template File
       ,"Cdecl Int")
  
  If (PORT_FileHandle < 1)
  {
    MsgBox, There is a problem with Serial Port communication. `nFailed Dll CreateFile, PORT_FileHandle=%PORT_FileHandle% `nThe Script Will Now Exit.
    Exit
  }
  ;msgbox, PORT_COM=%PORT_COM%`nPORT_FileHandle=%PORT_FileHandle%
  ;###### Set COM State ######
  ;Sets the COM Port number, baud rate,...
  SCS_Result := DllCall("SetCommState"
       ,"UInt", PORT_FileHandle ;File Handle
       ,"UInt", &DCB)          ;Pointer to DCB structure
  If (SCS_Result <> 1)
  {
    MsgBox, There is a problem with Serial Port communication. `nFailed Dll SetCommState, SCS_Result=%SCS_Result% `nThe Script Will Now Exit.
    PORT_Close(PORT_FileHandle)
    Exit
  }

  ;###### Create the SetCommTimeouts Structure ######
  ReadIntervalTimeout        = 0xffffffff
  ReadTotalTimeoutMultiplier = 0x00000000
  ReadTotalTimeoutConstant   = 0x00000000
  WriteTotalTimeoutMultiplier= 0x00000000
  WriteTotalTimeoutConstant  = 0x00000000

  VarSetCapacity(Data, 20, 0) ; 5 * sizeof(DWORD)
  NumPut(ReadIntervalTimeout,         Data,  0, "UInt")
  NumPut(ReadTotalTimeoutMultiplier,  Data,  4, "UInt")
  NumPut(ReadTotalTimeoutConstant,    Data,  8, "UInt")
  NumPut(WriteTotalTimeoutMultiplier, Data, 12, "UInt")
  NumPut(WriteTotalTimeoutConstant,   Data, 16, "UInt")

  ;###### Set the COM Timeouts ######
  SCT_result := DllCall("SetCommTimeouts"
     ,"UInt", PORT_FileHandle ;File Handle
     ,"UInt", &Data)         ;Pointer to the data structure
  If (SCT_result <> 1)
  {
    MsgBox, There is a problem with Serial Port communication. `nFailed Dll SetCommState, SCT_result=%SCT_result% `nThe Script Will Now Exit.
    PORT_Close(PORT_FileHandle)
    Exit
  }
  ;msgbox, PORT_FileHandle=%PORT_FileHandle%
  Return %PORT_FileHandle%
}


;########################################################################
;###### Close COM Subroutine ############################################
;########################################################################  
PORT_Close(PORT_FileHandle)
{
  ;###### Close the COM File ######
  CH_result := DllCall("CloseHandle", "UInt", PORT_FileHandle)
  If (CH_result <> 1)
    MsgBox, Failed Dll CloseHandle CH_result=%CH_result%

  Return
}

;########################################################################
;###### Write to COM Subroutines ########################################
;########################################################################
PORT_Write(PORT_FileHandle,Message)
{
  SetFormat, Integer, DEC

  ;Parse the Message. Byte0 is the number of bytes in the array.
  StringSplit, Byte, Message, `,
  Data_Length := Byte0
  ;msgbox, Data_Length=%Data_Length% b1=%Byte1% b2=%Byte2% b3=%Byte3% b4=%Byte4%

  ;Set the Data buffer size, prefill with 0xFF.
  VarSetCapacity(Data, Byte0, 0xFF)

  ;Write the Message into the Data buffer
  i=1
  Loop %Byte0%
  {
    NumPut(Byte%i%, Data, (i-1) , "UChar")
    ;msgbox, %i%
    i++
  }
  ;msgbox, Data string=%Data%

  ;###### Write the data to the COM Port ######
  WF_Result := DllCall("WriteFile"
       ,"UInt" , PORT_FileHandle ;File Handle
       ,"UInt" , &Data          ;Pointer to string to send
       ,"UInt" , Data_Length    ;Data Length
       ,"UInt*", Bytes_Sent     ;Returns pointer to num bytes sent
       ,"Int"  , "NULL")
  If (WF_Result <> 1 or Bytes_Sent <> Data_Length)
    MsgBox, Failed Dll WriteFile to COM, result=%WF_Result% `nData Length=%Data_Length% `nBytes_Sent=%Bytes_Sent%
}

;########################################################################
;###### Read from COM Subroutines #######################################
;########################################################################
PORT_Read(PORT_FileHandle,Num_Bytes,ByRef PORT_Bytes_Received)
{
  SetFormat, Integer, HEX

  ;Set the Data buffer size, prefill with 0x55 = ASCII character "U"
  ;VarSetCapacity won't assign anything less than 3 bytes. Meaning: If you
  ;  tell it you want 1 or 2 byte size variable it will give you 3.
  Data_Length  := VarSetCapacity(Data, Num_Bytes, 0x55)
  ;msgbox, Data_Length=%Data_Length%

  ;###### Read the data from the COM Port ######
  ;msgbox, PORT_FileHandle=%PORT_FileHandle% `nNum_Bytes=%Num_Bytes%
  Read_Result := DllCall("ReadFile"
       ,"UInt" , PORT_FileHandle   ; hFile
       ,"Str"  , Data             ; lpBuffer
       ,"Int"  , Num_Bytes        ; nNumberOfBytesToRead
       ,"UInt*", PORT_Bytes_Received   ; lpNumberOfBytesReceived
       ,"Int"  , 0)               ; lpOverlapped
  ;MsgBox, PORT_FileHandle=%PORT_FileHandle% `nRead_Result=%Read_Result% `nBR=%PORT_Bytes_Received% ,`nData=%Data%
  If (Read_Result <> 1)
  {
    MsgBox, There is a problem with Serial Port communication. `nFailed Dll ReadFile on COM, result=%Read_Result% - The Script Will Now Exit.
    PORT_Close(PORT_FileHandle)
    Exit
  }

;;;;;;;; 7/23/08 This section is replaced by the code below ;;;;;;;;;;;;;
;  SetFormat, Integer, DEC
;
;  ;###### Format the received data ######
;  ;Return only the bytes that were received.
;  If (PORT_Bytes_Received = 0)
;    Return ""
;  Else
;    ;StringTrimRight, Data, Data, %PORT_Bytes_Received% ;5/22/08 This line is essentially useless and could potentially show up as a bug.
;    StringLeft, Data, Data, PORT_Bytes_Received ;5/22/08 This is what the above line should have been
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;###### Format the received data ######
  ;This loop is necessary because AHK doesn't handle NULL (0x00) characters very nicely.
  ;Quote from AHK documentation under DllCall:
  ;     "Any binary zero stored in a variable by a function will hide all data to the right
  ;     of the zero; that is, such data cannot be accessed or changed by most commands and
  ;     functions. However, such data can be manipulated by the address and dereference operators
  ;     (& and *), as well as DllCall itself."
  i = 0
  Data_HEX =
  Loop %PORT_Bytes_Received%
  {
    ;First byte into the Rx FIFO ends up at position 0

    Data_HEX_Temp := NumGet(Data, i, "UChar") ;Convert to HEX byte-by-byte
    StringTrimLeft, Data_HEX_Temp, Data_HEX_Temp, 2 ;Remove the 0x (added by the above line) from the front

    ;If there is only 1 character then add the leading "0'
    Length := StrLen(Data_HEX_Temp)
    If (Length =1)
      Data_HEX_Temp = 0%Data_HEX_Temp%

    i++

    ;Put it all together
    Data_HEX := Data_HEX . Data_HEX_Temp
  }
  ;MsgBox, Read_Result=%Read_Result% `nBR=%PORT_Bytes_Received% ,`nData_HEX=%Data_HEX%

  SetFormat, Integer, DEC
  Data := Data_HEX

  Return Data
}

 

example.ahk 

; Instructions:
; 1) Modify the COM port settings (under the User Variables heading)
;    to your needs and save the file.
;
; 2) Launch this script to connect to the COM Port.
;
; 3) CTRL-F1 to close the COM port and exit the receive loop.
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
;      "COM1_Console.txt - Notepad" appear as the window
;      title, because the script will want to change to the window with
;      that name when it receives a character on the COM port.
;
;########################################################################
MsgBox, Begin COM Test

#SingleInstance Force
SetTitleMatchMode, 2

;########################################################################
;###### User Variables ##################################################
;########################################################################
COM_Port     = COM4
COM_Baud     = 115200
COM_Parity   = N
COM_Data     = 8
COM_Stop     = 1
Console_Path =


;########################################################################
;###### Script Variables ################################################
;########################################################################
COM_Settings = %COM_Port%:baud=%COM_Baud% parity=%COM_Parity% data=%COM_Data% stop=%COM_Stop% dtr=Off
Console_File_Name= %COM_Port%_Console.txt
Console_Title    = %Console_File_Name% - notepad


;########################################################################
;###### Notepad Console Check ###########################################
;########################################################################
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

;########################################################################
;###### Hotkey Assignments - Used for Serial Port Transmit ##############
;########################################################################
;If the Console window is the focus then typing any character on the
;  keyboard will cause the script to send the character out the COM port.
Hotkey, IfWinActive, %Console_Title%,

;###### Direct Key Presses for a-z ######
Loop, 26
  HotKey, % "$" chr(96+A_Index), HotkeySub

;###### Direct Key Presses for 0-9 ######
Loop, 10
  HotKey, % "$" chr(47+A_Index), HotkeySub

;###### Direct Key Presses for Other Keys ######
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

;###### Shift Modified Character Key Presses for a-z. ######
Loop, 26
  HotKey, % "$+" chr(96+A_Index), HotkeySub_Char_Shift

;###### Shift Modified Character Key Presses for 0-9 ######
Loop, 10
  HotKey, % "$+" chr(47+A_Index), HotkeySub_Other_Shift

;###### Shift Modified Character Key Presses for Other Keys ######
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

;########################################################################
;###### Serial Port Receive #############################################
;########################################################################
;Quit_var is used to exit the COM port receive loop
;  0=Don't Exit; 1=Exit; CTRL-F1 to set to 1 and exit script.
Quit_var = 0
PORT_FileHandle:=PORT_Initialize(COM_Settings)

;COM port receive loop
Loop
{
  Read_Data := PORT_Read(PORT_FileHandle,"0xFF",PORT_Bytes_Received)
  ;msgbox,PORT_FileHandle=%PORT_FileHandle% `n PORT_Bytes_Received=%PORT_Bytes_Received% `n Read_Data=%Read_Data% ; Variable that is set by PORT_Read()

  ;0xFF in the above line basically sets the size of the read buffer.
  ;  Use StringLeft to collect only the data received by the COM port.
  ;  Bytes_Received is a global variable that is set during the PORT_Read() routine.
  ;StringLeft, Read_Data, Read_Data, Bytes_Received ;5/22/08 This line was moved to PORT_Read() subroutine.

  ;Process the data, if there is any.
  If (PORT_Bytes_Received > 0)
  {
    msgbox, Read_Data=%Read_Data%

    ;Prevent interruption during execution of this loop.
    Critical, On

    ;If care is taken, you can comment out these WinActive lines for performance gains.
    IfWinNotActive, %Console_Title%, , WinActivate, %Console_Title%,
      WinWaitActive, %Console_Title%,   

    ;7/23/08 Modified this IF statement because PORT_Read() now returns data instead of ASCII
    ;Set to 0 if you want to see the hex data as received by the serial port.
    IF (1)
    {
      ;Begin Data to ASCII conversion
      ASCII =
      Read_Data_Num_Bytes := StrLen(Read_Data) / 2 ;PORT_Read() returns 2 characters for each byte

      Loop %Read_Data_Num_Bytes%
      {
        StringLeft, Byte, Read_Data, 2
        StringTrimLeft, Read_Data, Read_Data, 2
        Byte = 0x%Byte%
        Byte := Byte + 0 ;Convert to Decimal       
        ASCII_Chr := Chr(Byte)
        ASCII = %ASCII%%ASCII_Chr%
      }
      Send, ^{END}%ASCII%
      ;End Data to ASCII conversion
    }
    Else ;Send the data that was received by the COM port-ASCII format
      Send, ^{END}%Read_Data%

    Critical, Off
  }

  ;CTRL-F1 sets Quit_var=1
  if Quit_var = 1
    Break
}
PORT_Close(PORT_FileHandle)

MsgBox, AHK is now disconnected from %COM_Port%
;ExitApp ;Exit Script
Return

;########################################################################
;###### Serial Port Transmit ############################################
;########################################################################

;###### Normal Key Presses ######
HotkeySub:
var := Asc(SubStr(A_ThisHotkey,0)) ;Get the key that was pressed and convert it to its ASCII code
If A_ThisHotkey = Space
  var=0x20
If A_ThisHotkey = BS
  var=0x08
If A_ThisHotkey = ENTER
    var=0x0D,0x0A ;New Line, Carriage Return ; 7/23/08 Changed 0x0A,0x0D to 0x0D,0x0A

PORT_Write(PORT_FileHandle,var) ;Send it out the COM port
return

;###### Shift Key Presses ######
HotkeySub_Char_Shift:
var := SubStr(A_ThisHotkey,0) ;Get the key that was pressed.
StringUpper, var, var         ;Convert it to uppercase
var := Asc(var)               ;Get the ASCII equivalent
PORT_Write(PORT_FileHandle,var)             ;Send it out the COM port
return

;###### Other Shift Key Presses ######
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

var := Asc(var)   ;Get the ASCII equivalent
PORT_Write(PORT_FileHandle,var) ;Send it out the COM port
return

;########################################################################
;###### Exit Console Receive Loop #######################################
;########################################################################
^F1::
Quit_var = 1
return
