#include ScreenCapture.ahk
CaptureScreen("1926, 39, 2811, 621", False, "C:\Users\userpc\Desktop\자동전표저장\재현하늘창.png")
Sleep, 3000


printerA:="EPSON L6190 Series"
  runwait,%comspec% /c rundll32 printui.dll`,PrintUIEntry /y /n "%printerA%",,hide    ;- make printer-A default
run,shell:PrintersFolder
run,control printers

Run, mspaint.exe /p  C:\Users\userpc\Desktop\자동전표저장\재현하늘창.png


;~ printerA:="EPSON274D2A (L6190 Series)"
  ;~ runwait,%comspec% /c rundll32 printui.dll`,PrintUIEntry /y /n "%printerA%",,hide    ;- make printer-A default
;~ run,shell:PrintersFolder
;~ run,control printers
WinWait, 제어판\하드웨어 및 소리\장치 및 프린터
winwait, 모든 제어판 항목\프린터

Sleep, 1000


winkill, 제어판\하드웨어 및 소리\장치 및 프린터
winkill, 모든 제어판 항목\프린터


return