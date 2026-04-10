a := 0

Loop, 9
{
	
	a++
	
WinActivate, 돋보기%a%
Sleep, 500
WinActivate, 확대화면%a%
Sleep, 500
winset, Exstyle, -0x80, 돋보기%a%

Sleep, 500
winset, Exstyle, -0x80, 확대화면%a%
Sleep, 500

}
return