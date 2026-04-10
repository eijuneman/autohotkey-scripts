varsize=10
varcolor=Black

f1::
checkcount=0
loop{
checkcount++
IniRead, usercheck, C:\Users\taeju\Desktop\settings.ini, approvedusers, user%checkcount%
If usercheck =
 {
 Msgbox, User Not Approved
 Return
 }
If a_username contains %usercheck% 
{
break
}
}

IniRead, varcolor, C:\Users\taeju\Desktop\settings.ini, settings, color
IniRead, varsize, C:\Users\taeju\Desktop\settings.ini, settings, size

Gui, Destroy
Gui, Add, Text, x22 y19 w100 h20 , Color
Gui, Add, DropDownList, x22 y39 w100 h150 vnewcolor, Red|Black|Green
Gui, Add, Text, x142 y19 w100 h20 , Font Size
Gui, Add, DropDownList, x142 y39 w100 h150 vnewsize, 2|5|10|15
Gui, Add, Button, x82 y239 w100 h30 gsavesettings, Save
Gui, Font, S%varsize% c%varcolor% 
Gui, Add, Text, x22 y79 w220 h150 , welcome approved user. Your settings have been uploaded. Hope your having a good day %a_username%
Gui, Show, x831 y395 h297 w266, INI settings test
Return

savesettings:
Gui, Submit
IniWrite, %newcolor%, C:\Users\taeju\Desktop\settings.ini, settings, color
IniWrite, %newsize%, C:\Users\taeju\Desktop\settings.ini, settings
return