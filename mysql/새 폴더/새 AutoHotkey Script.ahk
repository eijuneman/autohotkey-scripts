#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include MySQL.ahk

gui, Add, button, w200 g확인, 확인
gui, show

host := "127.0.0.1"
user := "root"
pw := "tlsgmdahrwo12#"
database := "mydatabase.businesses"
;~ database := "use sakila"

sql_start()

global myDB := dbconnect(host, user, pw, database)
if(myDB = "error"){
	MsgBox, % myDB
}
;~ dbQuery(myDB, "set character set euckr")

return


확인:
{
	myQuery := "SELECT * FROM accounts"
	result := dbQuery(myDB, myQuery)
	for index1, arr in result
	{
		mystr := "menu_id" . arr[1] . ", price : " . arr[5]
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