A= 나의 생일
varA= A
MsgBox varA = %varA%
varA= % A
MsgBox varA = %varA%		;요거와
varA= %A%
MsgBox varA = %varA%		;요게 같은 결과죠.

B:= "나의 생일"
varA:= B
MsgBox varA = %varA%
varA:= % B
MsgBox varA = %varA%
varA:= %B%
MsgBox varA = %varA%		;에러 메세지가 나올겁니다. 틀린표현이죠.
ExitApp