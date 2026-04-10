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

get_db := dbConnect("111.222.111.222","N4MSB","1234","TEST_DB")
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