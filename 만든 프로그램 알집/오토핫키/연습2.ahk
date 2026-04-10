FormatTime, todaynow1, YYYYMMDDddddhhmmsstt,MM월 dd일 tt hh:mm:
FormatTime, 8second, YYYYMMDDddddhhmmsstt,ss
if ( ss = ""00)
{
;~ GuiControl, text, monday, %todaynow1%
MsgBox, 아뇨
}
else
{
	;~ GuiControl, text, monday, %todaynow1%
MsgBox, 맞아
}
return
