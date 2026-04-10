Serialsend("AM1024.768") 
return 

Serialsend(order) 
{
Runwait, %comspec% /c c:\serialsend.exe /9600 %order%
return 
}

AMouse(Sx,Sy)
{
str=AM%Sx%,%Sy%
Runwait, %comspec% /k c:\serialsend.exe /9600 %order%
return
}