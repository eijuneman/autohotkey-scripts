A = 0

Loop,9
{
	
	A++
	
	WinActivate, 돋보기%A%
	Sleep, 500
	WinActivate, 확대화면%A%
	Sleep, 500

	winset, Exstyle, +0x80, 돋보기%A%
	winset, Exstyle, +0x80, 확대화면%A%
	
}

return