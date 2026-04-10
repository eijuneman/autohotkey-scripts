
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, force
#Warn  ; Enable warnings to assist with detecting common errors.
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



host := "59.27.187.25"
user := "root"
pw := "tlsgmdahrwo12#"
database := "mydatabase"

sql_start()
global myDB := dbConnect(host, user, pw, database)
if(myDB = "error"){
	MsgBox, % myDB
}
dbQuery(myDB, "set character set euckr")

	;~ loca=A1-1
	LML=Z3-2-2
로카값1=090023D9A4

a=1

gui, Add, button, w1000 g확인4, 확인4
gui, Add, button, w1000 g확인1, 확인1
gui, Add, button, w1000 g확인2, 확인2
gui, Add, button, w1000 g확인3, 확인3
gui, Add, listview, w1000 h1000, r20, 1|2|3|4
gui, show



return

;~ myQuery := "UPDATE mydatabase.WMS SET loca_1 = '" LML "' WHERE rfid_1 = '" 로카값1 "';"

		;~ result := dbQuery(myDB, myQuery)

			;~ mystr := "rfid_1 : " . arr[1] . ", prodcut_id : " . arr[2]
			;~ MsgBox, % myStr
확인4:
{
	arr := []  ; 빈 배열로 초기화

			;~ MsgBox, % 로카값1
			1myQuery =
			(
			SELECT rfid_1, loca_1, stock_1, rfid_2, loca_2, stock_2, rfid_3, loca_3, stock_3, rfid_4, loca_4, stock_4, rfid_5, loca_5, stock_5, rfid_6, loca_6, stock_6, rfid_7, loca_7, stock_7, rfid_8, loca_8, stock_8, rfid_9, loca_9, stock_9, product_note, product_name, product_spec, product_id
			FROM mydatabase.WMS
			WHERE rfid_1 = '0A00235B62'
			OR rfid_2 = '0A00235B62'
			OR rfid_3 = '0A00235B62'
			OR rfid_4 = '0A00235B62'
			OR rfid_5 = '0A00235B62'
			OR rfid_6 = '0A00235B62'
			OR rfid_7 = '0A00235B62'
			OR rfid_8 = '0A00235B62'
			OR rfid_9 = '0A00235B62';
			)
       		result := dbQuery(myDB, 1myQuery)
			for index1, arr in result
			{


			}

			mystr := "arr[1] : " . arr[1] . ", result : " . result
						MsgBox, % mystr
return
}

확인1:
{
			;~ MsgBox, % 로카값1
			;~ myQuery := "SELECT product_name, product_spec, product_id FROM mydatabase.wms WHERE rfid_1 = '4F001FD748'"
			myQuery := "SELECT rfid_1, loca_1, stock_1, product_name, product_spec, product_id FROM mydatabase.wms WHERE rfid_1 = '090023D9A4'"
;                             1     2      3            4           5            6
       		result := dbQuery(myDB, myQuery)
			for index1, arr in result
			{
			mystr := "product_name : " . arr[4] . ", product_spec : " . arr[5] . ", prodcut_id : " . arr[6] "`n" arr[1] "`n" arr[2] "`n" arr[3]
			MsgBox, % myStr
			}
return
}


확인2:
{
	a++
sql =
(

UPDATE mydatabase.WMS
SET loca_1 = 'Z2-2-%a%'
WHERE rfid_1 = '090023D9A4';
;




)
	result := dbQuery(myDB, sql)
        if(errorCheck(result))
        {
            MsgBox, % "ErrorCode: " result[2] ", Error : " result[3]
        }
        else
        {
        }

return
}


확인3:
{

	LV_Delete()
	로케이션:=["loca_1", "loca_2", "loca_3", "loca_4", "loca_5", "loca_6", "loca_7", "loca_8", "loca_9"]
	Loop, % 로케이션.Length()
	{

		;~ ToolTip, % time "`n" OutputVar1
		time := 로케이션[a_index]
		MsgBox, % "로카값1 : " 로카값1 "`ntime : " time


		;~ myQuery := "SELECT * FROM accounts"
		;~ myQuery := "SELECT * FROM mydatabase.wms"
		;~ myQuery := "SELECT product_name, product_spec, product_id FROM mydatabase.wms WHERE rfid_1 = '4F001FD748'"

		;~ myQuery := "SELECT * FROM mydatabase.wms WHERE loca_1 LIKE '%" 로케이션 "%' OR loca_2 LIKE '%" 로케이션 "%' OR loca_3 LIKE '%" 로케이션 "%'"
		myQuery := "SELECT * FROM mydatabase.wms WHERE " time " LIKE '%" 로카값1 "%'"
		result := dbQuery(myDB, myQuery)
		for index1, arr in result
		{
			;~ mystr := "rfid_1 : " . arr[1] . ", prodcut_id : " . arr[2]
			LV_Add("", time . arr[1], arr[29], arr[30], arr[31])
			;~ MsgBox, % myStr
		}
	}
}
return



guiclose:
{
	dbDisconnect(myDB)
	exit_sql()
	ExitApp
}



;====================================================================
; MySQL Library Usage Examples
;
; Programmer: Alan Lilly (panofish@gmail.com)
; AutoHotkey: v1.1.04.00 (autohotkey_L ANSI version)
;====================================================================

#SingleInstance force
outputdebug DBGVIEWCLEAR

#include mysql.ahk     ; reference local directory copy
;#include <mysql>      ; reference lib copy

;============================================================
; make database connection to mysql
;============================================================

mysql := new mysql     ; instantiates mysql object

db := mysql.connect("host","userid","password","database")           ; host,user,password,database

if mysql.error
    exitapp

;============================================================
; single column select example
;============================================================

fullname := mysql.query(db, "SELECT username FROM user WHERE userid='" A_UserName "'")

;============================================================
; disable error handling in mysql function and handle error locally
;============================================================

sql := "xELECT username FROM user WHERE userid='alilly'"

fullname := mysql.query(db, sql, 0)

if mysql.error
    outputdebug % "MySQL Error = " mysql.error "`nMySQL Error String =" mysql.errstr

;============================================================
; multi column select example (columns divided by pipe)
;============================================================

id := "alilly"

sql =
(
     select username,
            userid
       from user
      WHERE userid = "%id%"
)

rec := mysql.query(db, sql)

StringSplit, array, rec, |

username     := array1
userid       := array2

;============================================================
; update example with escape string
;============================================================

username := "Alan Lilly"
username := mysql.escape_string(username)

sql =
(
    UPDATE user
       SET username = "%username%"
     WHERE userid = "%id%"
)

result := mysql.query(db, sql)

;============================================================
; multi-row / multi-column select example (rows divided by newline)
; and display results in a gui listview
;============================================================

sql =
(
     select username,
            userid
       from user
)

result := mysql.query(db, sql)

Loop, Parse, result, `n     ; parse rows
{
    StringSplit, array, A_LoopField, |      ; parse columns

    username     := array1
    userid       := array2

}

;============================================================
; Fill Listview with sql output example
;============================================================

Gui, Add, ListView, section r15 w300 vLIST1

Gui, Show,,MySQL Lib Example

sql =
(
     select username as "Full Name",
            userid
       from user
)

result := mysql.query(db, sql)

mysql.lvfill(sql, result, "LIST1")

return