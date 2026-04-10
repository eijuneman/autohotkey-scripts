#NoEnv
#SingleInstance, force

try=1

Array1:=["토마토", "호박", "마늘", "양배추", "브로콜리", "후추", "피망", "옥수수", "완두콩", "양파", "버섯", "감자", "오이", "콩", "당근", "가지", "시금치", "고추", "고구마", "생강", "무", "부추", "파", "대파", "양상추", "상추", "꺳잎", "배추", "팥", "콩나물", "애호박", "연근"]
Array2:=["지게차", "굴착기", "불도저", "덤프트럭", "롤러", "레미콘", "크레인", "승용차", "크레인", "비행기", "제트기", "여객선"]
Array3:=["어린이", "바이올린", "카멜레온", "오토바이", "파인애플", "탱크로리", "은행", "홈페이지", "신흥목재", "제재소", "사과", "배", "핸드폰", "비누", "샴푸", "전기차", "주사", "김치"]
Array4:=["거짓말이 외삼촌보다 낫다", "침묵은 금이다", "입은 삐뚫어져도 말은 바로해라", "입이 열 개라도 할 말이 없다", "말 한마디에 천 냥 빚도 갚는다", "낮말은 새가 듣고 밤말은 쥐가 듣는다", "말 안하면 귀신도 모른다", "부모 말을 들으면 자다가도 떡이 생긴다", "발 없는 말이 천리 간다", "황소 제 이불 뜯어 먹기", "말이 씨가 된다", "말이란 아해 다르고 어해 다르다", "남 말하기는 식은 죽 먹기", "가는 말이 고와야 오는 말이 곱다", "담벼락하고 말하는 셈이다", "세 살먹은 아이말도 귀담아 들으랬다", "혀 밑에 죽을 말 있다", "김민회씨 사랑합니다", "김민회씨 화이팅", "이부근은 김민회를 사랑한다", "김민회는 이부근을 사랑한다", "백문이 불여일견"]
Array5:=["김치", "나비", "냉장고", "달력", "바나나", "세탁기", "시계", "연필", "의자", "자전거", "지게차", "청소기", "포도", "핸드폰"]


Random, ran1, 1, % Array1.Length()
Random, ran2, 1, % Array2.Length()
Random, ran3, 1, % Array3.Length()
Random, ran4, 1, % Array4.Length()
Random, ran5, 1, % Array5.Length()


WINTITLE := 자동차 면허 갱신해보자
gui, destroy
gui, Default
Gui, +ALWAYSONTOP
;~ Gui, Color, EEAA99
Gui, Add, Tab3, x0 y0 w1800 h870 vtabname gtabname, 1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16 ; |18|19|20


Gui, Tab, 1,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문1) 올해 연도는 몇년도(年) 입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va1,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v1, 숫자만 쓰시오   ; 설명
FormatTime, 1ans , YYYYMMDDHH24MISS, yyyy

Gui, Tab, 2,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문2) 오늘은 몇 월(月) 입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va2,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v2, 숫자만 쓰시오   ; 설명
FormatTime, 2ans , YYYYMMDDHH24MISS, MM

Gui, Tab, 3,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문3) 오늘은 몇 일(日) 입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va3,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v3, 숫자만 쓰시오   ; 설명
FormatTime, 3ans , YYYYMMDDHH24MISS, dd


Gui, Tab, 4,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문4) 오늘은 무슨 요일 입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va4,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v4, 월, 화, 등... 앞글자만 쓰시오  ; 설명
FormatTime, 4ans , YYYYMMDDHH24MISS, ddd


Gui, Tab, 5,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문5) 오늘 계절은 무엇입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va5,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v5,   ; 설명
5ans=봄

Gui, Tab, 6,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문6) 당신이 있는 나라는 어디입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va6,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v6, 예) 코트디부아르  ; 설명
6ans=대한민국

Gui, Tab, 7,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문7) 당신이 있는 도 랑, 시 는 어디입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va7,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v7, 예) 전라남도 진주시  ; 설명
7ans=충청남도천안시

Gui, Tab, 8,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문8) 당신이 사는 주소는 어떻게 됩니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va8,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v8, 예) 목천읍 삼성리 145-7  ; 설명
8ans=불당25로8


Gui, Tab, 9,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문9) 다음 단어를 기억하세요    ; 질문
Gui, Add, Edit, x100 y300 w800 H130 va91,
Gui, Add, Edit, y+10 w800 H130 va92,
Gui, Add, Edit, y+10 w800 H130 va93,
Gui, Add, BUTTON, x1000 y600 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
;~ Gui, Add, text, x100 y+0 H80 ,  ; 설명


GuiControl, , a91, % Array1[ran1]
GuiControl, , a92, % Array2[ran2]
GuiControl, , a93, % Array3[ran3]


Gui, Tab, 10,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문10) 다음을 암산으로 계산하시오    ; 질문

Gui, Add, Edit, x143 y720 +right w400 H130 va10,

Gui, Add, BUTTON, x+100 W280 H130 vcal gcal,계산

Gui, Add, Edit, readonly +right x143 y300 w400 H130 vq1,
Gui, Add, text, x100 y+10  H130, -
Gui, Add, Edit, readonly +right x+10 w400 H130 vq2,
Gui, Add, text, x100 y+10  H130, --------------

Gui, Add, BUTTON, x1000 y600 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
;~ Gui, Add, text, x100 y+0 H80 v10, 예) 숫자만 쓰시오 ; 설명

GuiControl, ,q1, 100
GuiControl, ,q2, 7




Gui, Tab, 11,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y60 H80, 질문11) 아까 알려드린 3가지를 기억해 순서대로 `n           쓰시오    ; 질문
Gui, Add, Edit, x100 y300 w800 H130 va111,
Gui, Add, text, x+50 w200 H130 vr111,

Gui, Add, Edit, x100 y+10 w800 H130 va112,
Gui, Add, text, x+50 w200 H130 vr112,

Gui, Add, Edit, x100 y+10 w800 H130 va113,
Gui, Add, text, x+50 w200 H130 vr113,

Gui, Add, BUTTON,x100 y+10 w800 H130 ganswer2,결과 확인

Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic



Gui, Tab, 12,,Exact
no5 := % Array5[ran5]
MsgBox, % no5
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문12) 이것은 무엇입니까?    ; 질문

Gui, Add, Picture, x100 y+20 vpic, %A_ScriptDir%\%no5%.jpg
Gui, Add, Edit, x100 y600 w800 H130 va12,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, BUTTON, x+100 W280 H130 ganswer,결과





Gui, Tab, 13,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문13) 다음 명령을 시행하세요    ; 질문
Gui, Add, text, x100 y+10 w800 H130, - 종이를 뒤집어
Gui, Add, text, x100 y+10 w800 H130, - 반으로 접은 다음
Gui, Add, text, x100 y+10 w800 H130, - 저에게 주세요
;~ Gui, Add, Edit, x100 y600 w800 H130 va13,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
;~ Gui, Add, BUTTON, x+100 W280 H130 ganswer,결과





Gui, Tab, 14,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 vq15 w1700 r2, 질문15) 다음 따라 읽고 쓰세요    ; 질문
Gui, Add, Edit, x100 y470 w800 H260 va15,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
;~ Gui, Add, BUTTON, x+100 W280 H130 ganswer,결과


GuiControl, , q15, % Array4[ran4]


Gui, Tab, 15,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문16) 다음 그리세요    ; 질문
Gui, Add, Picture, x100 y+100 va16, %A_ScriptDir%\1.png
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, BUTTON, x+100 W280 H130 ganswer,결과









Gui, Tab, 16,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 결과    ; 질문
Gui, Add, Picture, x100 y600 w800 H130 va17,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, BUTTON, x+100 W280 H130 ganswer,결과








Gui, SHOW, W1800 H900, %WINTITLE%

MsgBox, %1ans%`n%2ans%`n%3ans%`n%4ans%`n%5ans%`n%6ans%`n%7ans%`n%8ans%`n%9ans%`n%10ans%`n%11ans%`n%12ans%`n
return



cal:
gui, submit, nohide
;~ MsgBox, 262192, ,%q1%`n%q2%`n%a10%

if(try = "5")
{
	MsgBox, 262192, ,5번의 계산이 끝났습니다.`n다음> 을 누르세요
	GuiControl, hide, cal
	return
}
else
{
}
	q3 := q1 - q2
	if (q3 = a10)
	{

		num := 5 - try
		MsgBox, 262192, ,정답 입니다`n%num% 회 계산을 더 해주세요
		try++
		GuiControl, , q1, %q3%
		GuiControl, , a10,
		GuiControl, focus, a10
		;~ GuiControl, , q2, q3

	}
	else
	{
		MsgBox, 262192, ,틀렸습니다. 다시 계산해주세요 `n%q3%
	}



return






answer2:
gui, submit, nohide

;~ MsgBox, %a111%\%a91%\
if(a111 = a91)
{
	GuiControl, , r111, 정답(0)
}
else
{
	GuiControl, , r111, 틀림(X)
}



if(a112 = a92)
{
	GuiControl, , r112, 정답(0)
}
else
{
	GuiControl, , r112, 틀림(X)
}



if(a113 = a93)
{
	GuiControl, , r113, 정답(0)
}
else
{
	GuiControl, , r113, 틀림(X)
}





return


answer:
gui, submit, nohide












MsgBox, 262192, ,% a1 "`n" a2 "`n" a3 "`n" a4 "`n" a5 "`n" a6 "`n" a7 "`n" a8 "`n" a9 "`n" a10 "`n"


return

before:
Control,  TabLeft, 1, SysTabControl321, %WINTITLE%,
return


after:
Control,  TabRight, 1, SysTabControl321, %WINTITLE%,
return

tabname:
Gui, submit, nohide
return