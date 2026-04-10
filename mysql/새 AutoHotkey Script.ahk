#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/*
#include mysql.ahk

Gui, Show, x400 y150 w380 h100, Login

Gui, Add, Text, x20 y30 w100 h20, ID
Gui, Add, Edit, x20 y50 w100 h20 vuser
Gui, Add, Text, x150 y30 w100 h20, PW
Gui, Add, Edit, x150 y50 w100 h20 vpw +Password*

Gui, Add, Button, Default x280 y47 h25 w80 glogin, Login
return

login:
Gui, Submit, NoHide

if (user=null){
   Msgbox, 아이디를 입력 해주세요!
   return
}else if(pw=null){
   Msgbox, 비밀번호를 입력 해주세요!
   return
}

get_db := dbConnect("127.0.0.1","shwood","tlsgmdahrwo12#","sakila")
dbQuery(get_db,"set character set euckr")

id_chk := dbQuery(get_db,"SELECT id FROM Member where id='" user "';")

if (id_chk = null){
   Msgbox, "존재하지 않는 아이디입니다."
   return
}else{
   pw_chk := dbQuery(get_db,"SELECT pwd FROM Member where id='" user "';")
   if (pw = pw_chk ){
      Msgbox, 로그인 성공!
      return
   }else{
      Msgbox, 비밀번호를 틀림!
      return
   }
}

return
*/


#Include MySQL.ahk

gui, Add, button, w200 g확인, 확인
gui, show

host := "127.0.0.1"
user := "root"
pw := "tlsgmdahrwo12#"
;~ database := "mydatabase.businesses"
database := "mydatabase"

sql_start()

global myDB := dbConnect(host, user, pw, database)
if(myDB = "error"){
	MsgBox, % myDB
}
dbQuery(myDB, "set character set euckr")

return


확인:
{
	;~ myQuery := "SELECT * FROM accounts"
	myQuery := "SELECT * FROM mydatabase.accounts"
	result := dbQuery(myDB, myQuery)
	for index1, arr in result
	{
		mystr := "person_id" . arr[1] . ", person_name : " . arr[2]
		MsgBox, % myStr
	}
}
return



guiclose:
{
	dbDisconnect(myDB)
	exit_sql()
	ExitApp
}