#NoEnv
#SingleInstance, force
CoordMode, Mouse, Screen

loop
{
			ImageSearch, x1, y1, 0, 0, 1000, 1000, *100 C:\Users\eijun\OneDrive\¹®¼­\IMAGESEARCH\1.png

			if (errorlevel = 1)
			{
				sleep, 100
			}

			else if (errorlevel = 2) ; this has no matching if
			{
				msgbox, cant search
			}

			else if (errorlevel = 0) ; this doesnt either
			{
				break
			}
		sleep 1000
MsgBox, %x1%, %y1%
}


	;~ MouseClick, , %x1%, %y1%
return