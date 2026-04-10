#NoEnv
#SingleInstance, force


gui, b:destroy
gui, b:Default
gui, b:+alwaysontop
Gui, Font, S70 CDefault w700, Malgun Gothic


Gui, b:Add, Edit, -WantReturn +Center -VScroll -HScroll w800 h150 vbluetooth Backgroundtrans gbluetooth Uppercase, RFID CARD TAG
Gui, b:show, , BLUETOOTH
return



bluetooth:

return
