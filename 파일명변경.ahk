;~ 뭐지 = "E00 투명-강화,E00 투명-일반,E02 마스터라인-강화,E02 마스터라인-일반,E04 다이아-강화,E04 다이아-일반,E05 레인-강화,E05 레인-일반,E07 아쿠아-강화,E07 아쿠아-일반,E08 오셔닉-강화,E08 오셔닉-일반,E09 나시지-강화,E09 나시지-일반,E10 고방유리-강화,E10 고방유리-일반,E11 브론즈-강화,E11 브론즈-일반,E12 브론즈샤틴-강화,E12 브론즈샤틴-일반,E15 미스트-강화,E15 미스트-일반,E16 모루-강화,E16 모루-일반,E17 플루트-강화,E17 플루트-일반,E18 그레이-강화,E18 그레이-일반,E19 미스트샤틴-강화,E19 미스트샤틴-일반,E20 나시지 인쇄망입-강화,E20 나시지 인쇄망입-일반,E21 그린-강화,E21 그린-일반,E22 레인도트-강화,E22 레인도트-일반,E23 슬라임라인-강화,E23 슬라임라인-일반,M01 매쉬글라스,M02 매쉬디자인글라스"


	    ;~ Clipboard := RegExReplace(뭐지, ",", "`n")
Loop, Files, C:\Users\shwoodnew\Desktop\DoorOrder\img\재현하늘창\하드웨어\*.*
{
	    FileName := A_LoopFileName

	    FileName := RegExReplace(FileName, ".png", "")
    Clipboard :=  FileName "`n" Clipboard
}
MsgBox, % Clipboard
return





Esc::
ExitApp



;~ Loop, Files, C:\Users\shwoodnew\Desktop\DoorOrder\img\재현하늘창\유리디자인\*.*
;~ {
	    ;~ FileName := A_LoopFileName

	    ;~ FileName := RegExReplace(FileName, ".png", "")
    ;~ Clipboard :=  FileName "`n" Clipboard
;~ }
;~ MsgBox, % Clipboard
;~ return
;~ Esc::
;~ ExitApp



/*
Loop, Files, C:\Users\shwoodnew\Desktop\타공도어\*.png
{
    FilePath := A_LoopFileLongPath
    FileName := A_LoopFileName

    ; 파일명에서 확장자 추출
    ;~ FileExt := SubStr(FileName, -4)

	    ;~ NewFileName := RegExReplace(FileName, A_Space, "")
	    ;~ NewFileName := RegExReplace(NewFileName, A_Space, "")

	    ;~ NewFileName := RegExReplace(NewFileName, ".png", "")
	    ;~ NewFileName := RegExReplace(NewFileName, "png", "")
;~ MsgBox, %NewFileName%
;~ MsgBox, % NewFileName
	RegExMatch(FileName, "(.*)재(.*)", 2date)
	;~ RegExMatch(2date12, "i)-[A-Za-z]+\d+(.*)", 2date2)
        ; 파일 이동
;~ MsgBox, 1:%2date11%`n2:%2date12%`n3:%2date21%`n4:%2date22%
NewFileName = % 2date1 ".png"


;~ MsgBox, % NewFileName
        FileMove, %FilePath%, C:\Users\shwoodnew\Desktop\타공도어\%NewFileName%, 1

}











;~ Loop, Files, C:\Users\shwoodnew\Desktop\DoorOrder (2)\img\재현하늘창\몰딩\마감\*.png
;~ {
    ;~ FilePath := A_LoopFileLongPath
    ;~ FileName := A_LoopFileName


    ;~ ; 파일명에서 " 재현216[T브라운]" 부분 제거
    ;~ NewFileName := RegExReplace(FileName, " 재현216\[T브라운\]", "")




    ;~ 나트라도어 JAN100 천연무늬[월넛]
	;~ RegExMatch(FileName, "(.*)" a_space "(.*)", 2date)
	;~ RegExMatch(FileName, "(.*)" a_space "(.*)" a_space "(.*)", 2date)
	;~ NewFileName = % 2date1 ".png"

    ;~ ; 파일 이동
    ;~ FileMove, %FilePath%, C:\Users\shwoodnew\Desktop\DoorOrder (2)\img\재현하늘창\몰딩\마감\%NewFileName%, 1
;~ }

;~ return

