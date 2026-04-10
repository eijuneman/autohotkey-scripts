;source: https://www.autohotkey.com/boards/viewtopic.php?p=183294#p183294

#NoEnv
#SingleInstance,Force
SetBatchLines, -1
SetWinDelay, -1

Hotkey=F1 ;also use arrow button while F1 is pressed down for adjust settings
Radius := 200
Vertices := 40
Angle := 8*ATan(1)/Vertices
TransparencyTarget:=150
FadeAmount:=10
SysGet, XVirtualScreen, 76
SysGet, YVirtualScreen, 77
SysGet, CXVirtualScreen, 78
SysGet, CYVirtualScreen, 79
CoordMode,Mouse, Screen
Transparency:=0


Fade:
   If (Transparency=0){
      Gui, -Caption +Hwndhwnd +AlwaysOnTop +ToolWindow
      Gui, Color, Black
      Gui, Show, x%XVirtualScreen% y%YVirtualScreen% w%CXVirtualScreen% h%CYVirtualScreen% NA,
      WinSet, Transparent, 0, ahk_id %hwnd%
      Hotkey,%Hotkey%,Hotkey
      Hotkey,%Hotkey% & Up,HotkeyUp,On
      Hotkey,%Hotkey% & Down,HotkeyDown,On
      Hotkey,%Hotkey% & Left,HotkeyLeft,On
      Hotkey,%Hotkey% & Right,HotkeyRight,On
      SetTimer, DrawHole, 10, On
      SetTimer, Fade, 10, On
   }
   
   Transparency+=FadeAmount
   
   If (Transparency<=0){
      Transparency:=0
      SetTimer,Fade,Off
      SetTimer,DrawHole,Off
      Hotkey,%Hotkey% & Up,Off
      Hotkey,%Hotkey% & Down,Off
      Hotkey,%Hotkey% & Left,Off
      Hotkey,%Hotkey% & Right,Off
      Gui,Destroy
   }Else If (Transparency>=TransparencyTarget){
      Transparency:=TransparencyTarget
      SetTimer,Fade,Off
   }
   
   WinSet, Transparent, %Transparency%, ahk_id %hwnd%
Return

DrawHole:
   MouseGetPos, X, Y
   X-=XVirtualScreen
   Y-=YVirtualScreen
   Loop, %Vertices%
      Hole .= Floor(X + Radius * Cos(A_Index * Angle)) "-" Floor(Y + Radius * Sin(A_Index * Angle)) " "
   Hole .= Floor(X + Radius * Cos(Angle)) "-" Floor(Y + Radius * Sin(Angle))
   ;Tooltip %Hole%
   ;Clipboard := Hole
   WinSet, Region, %XVirtualScreen%-%YVirtualScreen% %XVirtualScreen%-%CXVirtualScreen% %CXVirtualScreen%-%CYVirtualScreen% %CXVirtualScreen%-%YVirtualScreen% %XVirtualScreen%-%YVirtualScreen% %Hole%, ahk_id %hwnd%
   Hole =
Return



Hotkey:
   FadeAmount*=-1
   SetTimer,Fade,10
Return

HotkeyUp:
HotkeyDown:
   Direction:=InStr(A_ThisLabel,"Up") ? 1 : -1
   TransparencyTarget+=10*Direction
   If (TransparencyTarget<20)
      TransparencyTarget:=20
   Else If (TransparencyTarget>255)
      TransparencyTarget:=255
   Transparency:=TransparencyTarget
   ;FadeAmount:=TransparencyTarget//10
   WinSet, Transparent, %Transparency%, ahk_id %hwnd%
Return
HotkeyLeft:
HotkeyRight:
   Direction:=InStr(A_ThisLabel,"Right") ? 1 : -1
   Radius+=20*Direction
   If (Radius < 20)
      Radius:=20
Return

Esc::ExitApp