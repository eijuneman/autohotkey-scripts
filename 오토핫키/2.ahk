

Loop
{
	   wingetpos, wx, wy, , , ahk_class TfmChitSale
	
		{	IfWinExist, ahk_class TfmChitSale
			{		
					if (wx = -2 && wy = 0)
						{
							{
								IfWinNotActive, ahk_exe JedaeroM.exe
								{	
									WinActivate, 슬라이드 쇼
									WinHide, 확대화면5
									WinHide, 확대화면1
									WinHide, 확대화면3
									WinHide, 확대화면2
									
									
								}
								return		
								
								IfWinActive, ahk_exe JedaeroM.exe
								{
									WinShow, 확대화면2
									WinShow, 확대화면3
									WinShow, 확대화면1
									WinShow, 확대화면5	
								}
								return		
							}
												
						}
						
						
						
					else
						{
							WinActivate, 슬라이드 쇼
							WinHide, 확대화면5
							WinHide, 확대화면1
							WinHide, 확대화면3
							WinHide, 확대화면2
						}
						
					
					return
			}					
			else
			{	
				WinActivate, 슬라이드 쇼
				WinHide, 확대화면5
				WinHide, 확대화면1
				WinHide, 확대화면3
				WinHide, 확대화면2
				
			}
			
		}
		
	






}
return