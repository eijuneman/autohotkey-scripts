
	ControlGetText, 배송날짜1, 	Edit5,  배송문자 시스템  -by shwood-
	ControlGetText, 거래처명1, 	Edit3,  배송문자 시스템  -by shwood-
	ControlGetText, 출발시각1, 	Edit6,  배송문자 시스템  -by shwood-
	ControlGetText, 배송지1, 	Edit7,  배송문자 시스템  -by shwood-
	ControlGetText, 기타메모1, 	Edit8,  배송문자 시스템  -by shwood-
	ControlGetText, 내용1, 	Edit9,  배송문자 시스템  -by shwood-
	ControlGetText, 인트로멘트1, 	Edit10, 배송문자 시스템  -by shwood-
	ControlGetText, 추출1, 	Edit1, 배송문자 시스템  -by shwood-
run, https://cal.new, 

		WinWait, Google Calendar - 일정 세부정보 - Whale,
		IfWinNotActive, Google Calendar - 일정 세부정보 - Whale, , WinActivate, Google Calendar - 일정 세부정보 - Whale, 
		WinWaitActive, Google Calendar - 일정 세부정보 - Whale, 

WinMove, Google Calendar - 일정 세부정보 - Whale, , 3, 3,
WinMaximize, Google Calendar - 일정 세부정보 - Whale

		Sleep, 3000


ControlSend, , %배송지1%{space}|{space}%거래처명1%, Google Calendar - 일정 세부정보 - Whale 
Sleep, 200
ControlSend, , {Tab 2}, Google Calendar - 일정 세부정보 - Whale 
Sleep, 500


ControlSend, Edit5, {CtrlDown}ac{CtrlUp}, 배송문자 시스템  -by shwood-
ControlSend, , {CtrlDown}v{CtrlUp}, Google Calendar - 일정 세부정보 - Whale 

ControlSend, , %배송날짜1%, Google Calendar - 일정 세부정보 - Whale 
Sleep, 200
ControlSend, , {Tab}, Google Calendar - 일정 세부정보 - Whale 
Sleep, 500

ControlSend, Edit6, {CtrlDown}ac{CtrlUp}, 배송문자 시스템  -by shwood-
ControlSend, , {CtrlDown}v{CtrlUp}, Google Calendar - 일정 세부정보 - Whale 
Sleep, 200
ControlSend, , {Tab 13}, Google Calendar - 일정 세부정보 - Whale 
Sleep, 1000
ControlSend, , %배송지1%, Google Calendar - 일정 세부정보 - Whale 
Sleep, 200
ControlSend, , {Tab 17}, Google Calendar - 일정 세부정보 - Whale 
ControlSend, Edit1, {CtrlDown}ac{CtrlUp}, 배송문자 시스템  -by shwood-

ControlSend, , {CtrlDown}v{CtrlUp}, Google Calendar - 일정 세부정보 - Whale 
Sleep, 1000
ControlSend, , {tab 11}{enter}






return
