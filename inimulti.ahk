; 忙式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式忖
; 弛  After much frustration trying to include multiline values in             弛
; 弛  an .ini file, I came up with this. Much credit to those posts below.     弛
; 弛  This still needs work.                                                   弛
; 弛  In particular, I'm having trouble coming up with a delimiter that        弛
; 弛  won't choke some future input. At first I picked "|n" but decided after  弛
; 弛  some consideration that it was an accident waiting to happen.            弛
; 弛  Thus ? below, whichappears as 'a?／' in my ini files.                                                 弛
; 弛  Probably also an accident waiting to happen. Murphy's Law.               弛
; 弛  Change that if you manage to give your                                   弛
; 弛  script indigestion.                                                      弛
; 戌式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式戎

IniMultiRead(IniFileName, Section:="", Key:="" , Default:="") {
		Iniread, Value, %IniFileName%, %Section%, %Key%
		StringReplace, Value, Value, ?, `n, All
		return Value
}

IniMultiWrite(IniVar, IniFileName, Section:="", Key:="") {
		StringReplace, IniVar, IniVar, `n, ?, All
		IniWrite, %IniVar%, %IniFileName%, %Section%, %Key%
}

/*
https://autohotkey.com/board/topic/91849-how-to-save-multi-line-user-input-to-ini/
https://autohotkey.com/board/topic/33601-solved-multi-line-tooltip-from-ini-file/
休 is alt+995
? is alt+1230
*/