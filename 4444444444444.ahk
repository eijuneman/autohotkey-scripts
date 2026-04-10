^q::SelectPrinter("EPSON L6190 Series (FAX)")    ; <<--- put the printer name you want to print with here

SelectPrinter(Printer)
{
    static wintitle := "Print ahk_class #32770"
    WinWait, % wintitle,, 10
    if (ErrorLevel)
        return false
    ControlGet, LV, List,, SysListView321, % wintitle
    Loop, Parse, LV, `n, `r
    {
        currPrinter := SubStr(A_LoopField, 1, InStr(A_LoopField, A_Tab) - 1)
        if (currPrinter = Printer) {
            ControlGet, HLV, Hwnd,, SysListView321, % wintitle
            return LV_DoubleClickRow(HLV, A_Index)
        }
    }
    return false
}

LV_DoubleClickRow(HLV, Row)    ; You can thank Justme for this function
{   ; HLV : ListView's HWND, Row : 1-based row number
    HPROC := 0
    MyPID := DllCall("GetCurrentProcessId", "UInt")
    WinGet, LVPID, PID, ahk_id %HLV%
    If !(LVPID)
    Return False
    VarSetCapacity(RECT, 16, 0)
    If (LVPID <> MyPID) {
        If !(HPROC := DllCall("OpenProcess", "UInt", 0x0438, "Int", False, "UInt", LVPID, "Ptr"))
            Return False
        If !(Addr := DllCall("VirtualAllocEx", "Ptr", HPROC, "Ptr", 0, "UPtr", 16, "UInt", 0x1000, "UInt", 4, "UPtr"))
            Return (DllCall("CloseHandle", "Ptr", HPROC) & 0) ; False
    }
    Else
        Addr := &RECT
    SendMessage, 0x1013, % (Row - 1), 1, , ahk_id %HLV% ; LVM_ENSUREVISIBLE
    SendMessage, 0x100E, % (Row - 1), %Addr%, , ahk_id %HLV% ; LVM_GETITEMRECT
    If (HPROC) {
        DllCall("ReadProcessMemory", "Ptr", HPROC, "Ptr", Addr, "Ptr", &RECT, "UPtr", 16, "Ptr", 0)
        DllCall("VirtualFreeEx", "Ptr", HPROC, "Ptr", Addr, "UPtr", 0, "UInt", 0x8000)
        DllCall("CloseHandle", "Ptr", HPROC)
    }
    POINT := NumGet(RECT, 0, "Short") | (NumGet(RECT, 4, "Short") << 16)
    PostMessage, 0x0201, 0, POINT, , ahk_id %HLV% ; WM_LBUTTONDOWN
    PostMessage, 0x0202, 0, POINT, , ahk_id %HLV% ; WM_LBUTTONUP
    PostMessage, 0x0203, 0, POINT, , ahk_id %HLV% ; WM_LBUTTONDBLCLK
    PostMessage, 0x0202, 0, POINT, , ahk_id %HLV% ; WM_LBUTTONUP
    Return True
}