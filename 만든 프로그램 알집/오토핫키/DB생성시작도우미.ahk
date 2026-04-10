#NoEnv
#SingleInstance, FORCE
#Include, screencapture.ahk

Loop
{
	FormatTime, OutputVar , YYYYMMDDHHmm, mm
	if (OutputVar = "04"){

	RUN, % A_WorkingDir "\DB생성.ahk"
	Sleep, 60000
	}



	FormatTime, OutputVar , YYYYMMDDHHmm, mm
	if (OutputVar = "40") {
	RUN, % A_WorkingDir "\홈페이지단가변환.ahk"
	Sleep, 60000
	}


	FormatTime, OutputVar1 , YYYYMMDDHHmm, HHmm
	if (OutputVar1 = "0000") {
	RUN, % A_WorkingDir "\사무루틴복사.ahk"
	Sleep, 60000
	}


	FormatTime, OutputVar1 , YYYYMMDDHHmm, HHmm
	if (OutputVar1 = "0630") {
	RUN, % A_WorkingDir "\EDSM일일재고관리.ahk"
	Sleep, 60000
	}


	FormatTime, OutputVar1 , YYYYMMDDHHmm, HHmm
	if (OutputVar1 = "0150") {
	RUN, % A_WorkingDir "\부족재고관리.ahk"
	Sleep, 60000
	}



	;~ FormatTime, OutputVar , YYYYMMDDHHmm, mm
	;~ if (OutputVar = "00")  {
	;~ RUN, % A_WorkingDir "\날씨api.ahk"
	;~ Sleep, 60000ㅃ
	;~ }


	FormatTime, OutputVar1 , YYYYMMDDHHmm, HHmm

	if(OutputVar1 = "1702") ; 회장님들께 일계표 보내기
	{
	RUN, % A_WorkingDir "\회장님꼐보내기.ahk"
	sleep, 60000
	}



}







; 백의 자리마다 콤마를 추가하는 함수
AddCommas(Number) {
	global
    if Number < 0
        return

    ; 숫자를 문자열로 변환
    StrNumber := Number

    ; 소수점 체크
    Decimal := ""
    Pos := InStr(StrNumber, ".")
    if (Pos > 0) {
        Decimal := SubStr(StrNumber, Pos)
        StrNumber := SubStr(StrNumber, 1, Pos - 1)
    }

    ; 백의 자리마다 콤마 추가
    Result := ""
    Len := StrLen(StrNumber)
    Loop % Len {
        Result .= SubStr(StrNumber, A_Index, 1)
        if (Mod(Len - A_Index, 3) = 0 && A_Index < Len)
            Result .= ","
    }

    return Result . Decimal
}