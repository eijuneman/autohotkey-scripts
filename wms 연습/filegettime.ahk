FileGetTime, OutputVar, \\192.168.0.1\hdd2\WMS\상품정보\상품정보.CSV
StringTrimLeft, OutputVar, OutputVar, 6
StringTrimRight, OutputVar, OutputVar, 2
MsgBox, % OutputVar
return