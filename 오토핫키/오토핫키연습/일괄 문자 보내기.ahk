#F11::
Loop, 318
{
	CoordMode, MOUSE, SCREEN ; 전표켜기
    MouseClick,L,-589,-30,,0
	Send, {Down}
    Send, {LControl Down}
    Send, c
	Send, {LControl Up}
    sleep,1000
	

    MouseClick,L,838,1062,,0
    sleep,1000
    MouseClick,L,909,267,,0
    sleep,1000	
    MouseClick,L,1324,159,,0
    sleep,1000		

    Send, {LControl Down}
    Send, v
	Send, {LControl Up}	
	Send, {Enter}
	sleep,1000


    MouseClick,L,-218,93,,0
    Send, {LControl Down}
	Send, a
    Send, c
	Send, {LControl Up}
    sleep,1000	
	
    MouseClick,L,1320,882,,0
    sleep,1000
    Send, {LControl Down}
    Send, v
	Send, {LControl Up}	
	sleep,1000
	Send, {Enter}
	sleep,1000

}
return
;	MouseClick,L,-756,-261,,0