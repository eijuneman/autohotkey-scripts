Sleep, 2000


LButton::
{
MouseGetPos, 1x, 1y
Sleep, 500
MouseClick, l, %1x%, %1y%, 2
Send, {Ctrl Down}c{ctrl Up}
Sleep,100
send, {left 3}{Space}g
Sleep, 100
Send, {Ctrl Down}v{ctrl Up}{Esc}
}
return

F1::
ExitApp