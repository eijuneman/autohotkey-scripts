http://msdn.microsoft.com/en-us/library/microsoft.visualstudio.ole.interop.ioleinplaceactiveobject(VS.80).aspx




IOleInPlaceActiveObject_Interface:="{00000117-0000-0000-C000-000000000046}"
pipa := [color=red]COM_QueryInterface[/color](pwb, IOleInPlaceActiveObject_Interface)
OnMessage(WM_KEYDOWN:=0x0100, "WM_KEYDOWN")
OnMessage(WM_KEYUP:=0x0101, "WM_KEYDOWN")
WM_KEYDOWN(wParam, lParam, nMsg, hWnd)
{
;  Critical 20
;tooltip % wparam
  If  (wParam = 0x09 || wParam = 0x0D || wParam = 0x2E || wParam = 0x26 || wParam = 0x28) ; tab enter delete up down
  ;If  (wParam = 9 || wParam = 13 || wParam = 46 || wParam = 38 || wParam = 40) ; tab enter delete up down
  {
      WinGetClass, Class, ahk_id %hWnd%
      ;tooltip % class
      If  (Class = "Internet Explorer_Server")
          {
            [color=red] Global pipa [/color]
             VarSetCapacity(Msg, 28)
             NumPut(hWnd,Msg), NumPut(nMsg,Msg,4), NumPut(wParam,Msg,8), NumPut(lParam,Msg,12)
             NumPut(A_EventInfo,Msg,16), NumPut([color=blue]A_GuiX[/color],Msg,20), NumPut([color=blue]A_GuiY[/color],Msg,24)
             DllCall(NumGet(NumGet(1*[color=red]pipa[/color])+20), "Uint", [color=red]pipa[/color], "Uint", &Msg)
             Return 0
          }
  }
}