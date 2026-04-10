
	Loop
	{
		Sleep, 100
		if FileExist(A_MyDocuments "\7_2번째 전표.xml"){
			FileCopy, %A_MyDocuments%\7_2번째 전표.xml, %A_MyDocuments%\7_2번째 전표_복사.xml
			Sleep, 1000

				Loop
				{
					Sleep, 100
					if FileExist(A_MyDocuments "\7_2번째 전표_복사.xml"){


						; ;;;;;;; 파이썬 FCM 실행
						EnvSet, PATH, %A_EnvPath%;C:\Users\shwoodnew\AppData\Local\Programs\Python\Python313\;C:\Users\shwoodnew\AppData\Local\Programs\Python\Python313\Scripts\
						Run, python "C:\Users\shwoodnew\tms_new\send_custom_fcm.py"
						; ;;;;;;; 파이썬 FCM 실행

						break
					}else{
					}

					Sleep, 200
				}


			Sleep, 200
			break
		}else{
		}
	}
Sleep, 200
