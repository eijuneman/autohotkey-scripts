2r1 = 1
2r2 = 0
2r3 = 0
2r4 = 0
2r5 = 0
2r6 = 0
2r7 = 0
2r8 = 0
2r9 = 0

	akk=1

	Loop, 8
	{
		akk++
		2neo = % 2r akk
		if (2r = ""){
		2neo := 0
		MsgBox, % 2neo
		}
		else
		{
			MsgBox, % 2neo
		}
	}