
	ControlGetText, ¤­·i¼a1, 	Edit5,  ¤­·¢…¸a ¯¡¯aÉQ  -by shwood-
	ControlGetText, ˆáœÀá¡w1, 	Edit3,  ¤­·¢…¸a ¯¡¯aÉQ  -by shwood-
	ControlGetText, ¤­·i¼a1, 	Edit5,  ¤­·¢…¸a ¯¡¯aÉQ  -by shwood-
	ControlGetText, Â‰¤i¯¡ˆb1, 	Edit6,  ¤­·¢…¸a ¯¡¯aÉQ  -by shwood-
	ControlGetText, ¤­·»¡1, 	Edit7,  ¤­·¢…¸a ¯¡¯aÉQ  -by shwood-
	ControlGetText, ‹¡Èa¡A¡¡1, 	Edit8,  ¤­·¢…¸a ¯¡¯aÉQ  -by shwood-
	ControlGetText, ¶w1, 	Edit9,  ¤­·¢…¸a ¯¡¯aÉQ  -by shwood-
	ControlGetText, ·¥Ëa¡¡EËa1, 	Edit10, ¤­·¢…¸a ¯¡¯aÉQ  -by shwood-
	ControlGetText, ÂÂ‰1, 	Edit1, ¤­·¢…¸a ¯¡¯aÉQ  -by shwood-
run, https://cal.new, 
WinMove, ahk_exe whale.exe, , 3, 3,
WinMaximize, ahk_exe whale.exe


		WinWait, Google Calendar - ·©¸÷ ­A¦¸÷¥¡ - Whale,
		IfWinNotActive, Google Calendar - ·©¸÷ ­A¦¸÷¥¡ - Whale, , WinActivate, Google Calendar - ·©¸÷ ­A¦¸÷¥¡ - Whale, 
		WinWaitActive, Google Calendar - ·©¸÷ ­A¦¸÷¥¡ - Whale, 
		Sleep, 1000




send, %ˆáœÀá¡w1%
Sleep, 200
send, {Tab 2}
Sleep, 500
send, %¤­·i¼a1%
Sleep, 200
send, {Tab}
Sleep, 500
send, %Â‰¤i¯¡ˆb1%
Sleep, 200
send, {Tab 13}
Sleep, 1000
send, %¤­·»¡1%
Sleep, 200
send, {Tab 7}{Space}
Sleep, 3000
send, {Tab 5}{Right}
Sleep, 200
send, {Tab}{Enter}
Sleep, 1000
send, {Tab 5}
Sleep, 300
send, {Enter}
Sleep, 2000
ImageSearch, ax, ay, 0, 0, 950, 500, C:\Users\taeju\Documents\IMAGESEARCH\26.bmp
Sleep, 300
MouseClick, l, %ax%, %ay%
Sleep, 500
send, {Enter}
Sleep, 1000
Send, {AltDown}d{AltUp}
Sleep, 200
Send, C:\Users\taeju\Desktop\¸åÎa¸a•·¸á¸w
Sleep, 200
send, {Enter}
Sleep, 200
Send, {AltDown}n{AltUp}
Sleep, 200
send, 1.png
Sleep, 300
send, {Enter}
Sleep, 300
Send, {Tab 3}
Sleep, 300
Send, {Enter}
Sleep, 5000
Send, {Tab 3}
Sleep, 1000
SendRaw, %ÂÂ‰1%
Sleep, 3000
Send, {CtrlDown}S{CtrlUp}





return
