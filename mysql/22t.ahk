#SingleInstance, force

return

FileCopy, C:\Users\shwoodnew\Desktop\WMS\WMS_VER_2024.ahk, \\직원용2\wms2\WMS_VER_2024.ahk, 1
<!a::
{
 FileCopy, C:\Users\shwoodnew\Desktop\WMS\WMS_VER_2024.ahk, \\직원용2\wms2\WMS_VER_2024.ahk, 1


return
}

/*
; 예제 변수 선언
frmSAVEDPRESET := ""
1RFID2 := "2번"
1RFID3 := "3번"
2RFID1 := ""
2RFID2 := "5번"
2RFID3 := "6번"
3RFID1 := ""
3RFID2 := ""
3RFID3 := ""
4RFID1 := ""
4RFID2 := ""
4RFID3 := ""
5RFID1 := ""
5RFID2 := ""
5RFID3 := ""
6RFID1 := ""
6RFID2 := ""
6RFID3 := "7번"
7RFID1 := ""
7RFID2 := ""
7RFID3 := ""
8RFID1 := "8번"
8RFID2 := ""
8RFID3 := ""
9RFID1 := ""
9RFID2 := ""
9RFID3 := ""
비고 := ""
상품명 := ""
규격 := ""
상품코드 := ""

; savelist 배열 구성
savelist := ["frmSAVEDPRESET", "1RFID2", "1RFID3", "2RFID1", "2RFID2", "2RFID3", "3RFID1", "3RFID2", "3RFID3", "4RFID1", "4RFID2", "4RFID3", "5RFID1", "5RFID2", "5RFID3", "6RFID1", "6RFID2", "6RFID3", "7RFID1", "7RFID2", "7RFID3", "8RFID1", "8RFID2", "8RFID3", "9RFID1", "9RFID2", "9RFID3", "비고", "상품명", "규격", "상품코드"]

; 배열 순회하여 값이 비어있으면 "NULL"로 변경
Loop, % savelist.MaxIndex()
{
    varName := savelist[A_Index]
    if (%varName% = ""){
        %varName% := "NULL"
    }else{
        %varName% := "'" . %varName% . "'"
    }
}

; 변경 후 메시지 박스 표시
msg := ""
Loop, % savelist.MaxIndex()
{
    varName := savelist[A_Index]
    msg .= varName . ": " . %varName% . "`n"
}

MsgBox, 업데이트 완료: `n%msg%
MsgBox, % frmSAVEDPRESET "` n" 1RFID2 "` n" 1RFID3 "` n" 2RFID1 "` n" 2RFID2 "` n" 2RFID3 "` n" 3RFID1 "` n" 3RFID2 "` n" 3RFID3 "` n" 4RFID1 "` n" 4RFID2 "` n" 4RFID3 "` n" 5RFID1 "` n" 5RFID2 "` n" 5RFID3 "` n" 6RFID1 "` n" 6RFID2 "` n" 6RFID3 "` n" 7RFID1 "` n" 7RFID2 "` n" 7RFID3 "` n" 8RFID1 "` n" 8RFID2 "` n" 8RFID3 "` n" 9RFID1 "` n" 9RFID2 "` n" 9RFID3 "` n" 비고 "` n" 상품명 "` n" 규격 "` n" 상품코드

return




/*


savelist:=["frmSAVEDPRESET", "1RFID2", "1RFID3", "2RFID1", "2RFID2", "2RFID3", "3RFID1", "3RFID2", "3RFID3", "4RFID1", "4RFID2", "4RFID3", "5RFID1", "5RFID2", "5RFID3", "6RFID1", "6RFID2", "6RFID3", "7RFID1", "7RFID2", "7RFID3", "8RFID1", "8RFID2", "8RFID3", "9RFID1", "9RFID2", "9RFID3", "비고", "상품명", "규격", "상품코드"]
Loop, % savelist.length()
{
    큰제목 := savelist[A_Index]
    큰제목2 := % 큰제목

MsgBox, % savelist[A_Index] "`n" 큰제목2
}


MsgBox, % frmSAVEDPRESET "` n" 1RFID2 "` n" 1RFID3 "` n" 2RFID1 "` n" 2RFID2 "` n" 2RFID3 "` n" 3RFID1 "` n" 3RFID2 "` n" 3RFID3 "` n" 4RFID1 "` n" 4RFID2 "` n" 4RFID3 "` n" 5RFID1 "` n" 5RFID2 "` n" 5RFID3 "` n" 6RFID1 "` n" 6RFID2 "` n" 6RFID3 "` n" 7RFID1 "` n" 7RFID2 "` n" 7RFID3 "` n" 8RFID1 "` n" 8RFID2 "` n" 8RFID3 "` n" 9RFID1 "` n" 9RFID2 "` n" 9RFID3 "` n" 비고 "` n" 상품명 "` n" 규격 "` n" 상품코드

return

esc::
ExitApp