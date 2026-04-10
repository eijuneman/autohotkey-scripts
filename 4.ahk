#NoEnv
#Persistent
#WinActivateForce

SetKeyDelay, -1


Loop
{
	   wingetpos, wx, wy, , , 일정표
	
		{	IfWinExist, 일정표
			{		
					if (wx = 1918 && wy = 0)
						{
							{
								IfWinNotActive, 일정표
								{	
									WinHide, 확대화면7

								}
								else
								{
									WinShow, 확대화면7
								}
							}	
						}
					else
						{
							WinHide, 확대화면7
						}
						
					
			}		
								
			else
			{	
				WinHide, 확대화면7				
			}
			
		}
		
	




}