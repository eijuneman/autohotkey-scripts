#NoEnv
#SingleInstance, force

Voice := ComObjCreate("SAPI.SpVoice")
try=1

Array1:=["토마토", "호박", "마늘", "양배추", "브로콜리", "후추", "피망", "옥수수", "완두콩", "양파", "버섯", "감자", "오이", "콩", "당근", "가지", "시금치", "고추", "고구마", "생강", "무", "부추", "파", "대파", "양상추", "상추", "꺳잎", "배추", "팥", "콩나물", "애호박", "연근"]
Array2:=["지게차", "굴착기", "불도저", "덤프트럭", "롤러", "레미콘", "크레인", "승용차", "크레인", "비행기", "제트기", "여객선"]
Array3:=["어린이", "바이올린", "카멜레온", "오토바이", "파인애플", "탱크로리", "은행", "홈페이지", "신흥목재", "제재소", "사과", "배", "핸드폰", "비누", "샴푸", "전기차", "주사", "김치"]
Array4:=["거짓말이 외삼촌보다 낫다", "침묵은 금이다", "입은 삐뚫어져도 말은 바로해라", "입이 열 개라도 할 말이 없다", "말 한마디에 천 냥 빚도 갚는다", "낮말은 새가 듣고 밤말은 쥐가 듣는다", "말 안하면 귀신도 모른다", "부모 말을 들으면 자다가도 떡이 생긴다", "발 없는 말이 천리 간다", "황소 제 이불 뜯어 먹기", "말이 씨가 된다", "말이란 아해 다르고 어해 다르다", "남 말하기는 식은 죽 먹기", "가는 말이 고와야 오는 말이 곱다", "담벼락하고 말하는 셈이다", "세 살먹은 아이말도 귀담아 들으랬다", "혀 밑에 죽을 말 있다", "김민회씨 사랑합니다", "김민회씨 화이팅", "이부근은 김민회를 사랑한다", "김민회는 이부근을 사랑한다", "백문이 불여일견"]
Array5:=["김치", "나비", "냉장고", "달력", "바나나", "세탁기", "시계", "연필", "의자", "자전거", "지게차", "청소기", "포도", "핸드폰", "가방", "소나무", "비닐하우스", "아파트"]


Random, ran1, 1, % Array1.Length()
Random, ran2, 1, % Array2.Length()
Random, ran3, 1, % Array3.Length()
Random, ran4, 1, % Array4.Length()
Random, ran5, 1, % Array5.Length()

Random, ran101, 90, 150
Random, ran102, 4, 9



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
Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore vbe1,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn1,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v1, 숫자만 쓰시오   ; 설명
Gui, Add, text, x930 y730 W800 H100 vshow1,    ; 설명
FormatTime, 1ans , YYYYMMDDHH24MISS, yyyy

		GuiControl, hide, n1
		GuiControl, hide, be1
;~ x: 930	y: 600

Gui, Tab, 2,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문2) 오늘은 몇 월(月) 입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va2,
Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn2,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v2, 숫자만 쓰시오   ; 설명
Gui, Add, text, x930 y730 W800 H100 vshow2,    ; 설명
FormatTime, 2ans , YYYYMMDDHH24MISS, MM
		GuiControl, hide, n2

Gui, Tab, 3,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문3) 오늘은 몇 일(日) 입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va3,
Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn3,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v3, 숫자만 쓰시오   ; 설명
Gui, Add, text, x930 y730 W800 H100 vshow3,    ; 설명
FormatTime, 3ans , YYYYMMDDHH24MISS, dd
		GuiControl, hide, n3


Gui, Tab, 4,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문4) 오늘은 무슨 요일 입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va4,
Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn4,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v4, 월, 화, 등... 앞글자만 쓰시오  ; 설명
Gui, Add, text, x930 y730 W800 H100 vshow4,    ; 설명
FormatTime, 4ans , YYYYMMDDHH24MISS, ddd
		GuiControl, hide, n4


Gui, Tab, 5,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문5) 오늘 계절은 무엇입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va5,
Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn5,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x930 y730 W800 H100 vshow5,    ; 설명
Gui, Add, text, x100 y+0 H80 v5,   ; 설명
		GuiControl, hide, n5
5ans=봄

Gui, Tab, 6,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문6) 당신이 있는 나라는 어디입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va6,
Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn6,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v6, 예) 코트디부아르  ; 설명
Gui, Add, text, x930 y730 W800 H100 vshow6,    ; 설명
		GuiControl, hide, n6
6ans=대한민국

Gui, Tab, 7,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문7) 당신이 있는 도 랑, 시 는 어디입니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va7,
Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn7,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v7, 예) 전라남도 진주시  ; 설명
Gui, Add, text, x930 y730 W800 H100 vshow7,    ; 설명
		GuiControl, hide, n7
7ans=충청남도천안시

Gui, Tab, 8,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문8) 당신이 사는 주소는 어떻게 됩니까?    ; 질문
Gui, Add, Edit, x100 y600 w800 H130 va8,
Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn8,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x100 y+0 H80 v8, 예) 목천읍 삼성리 145-7  ; 설명
Gui, Add, text, x930 y730 W800 H100 vshow8,    ; 설명
		GuiControl, hide, n8
8ans=불당25로8


Gui, Tab, 9,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문9) 다음 단어를 기억하세요    ; 질문
Gui, Add, Edit, x100 y300 w800 H130 va91,
Gui, Add, Edit, y+10 w800 H130 va92,
Gui, Add, Edit, y+10 w800 H130 va93,
;~ Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn9,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x930 y730 W800 H100 vshow9,    ; 설명
		;~ GuiControl, hide, n9
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
Gui, Add, text, x+100 W1000 H200 vshow10,    ; 설명
Gui, Add, text, x100 y+10  H130, -
Gui, Add, Edit, readonly +right x+10 w400 H130 vq2,
Gui, Add, text, x100 y+10  H130, --------------

;~ Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x1200 y600 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn10,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
;~ Gui, Add, text, x100 y+0 H80 v10, 예) 숫자만 쓰시오 ; 설명
		GuiControl, hide, n10

GuiControl, ,q1, %ran101%
GuiControl, ,q2, %ran102%

	10ans=1



Gui, Tab, 11,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y60 H80, 질문11) 아까 알려드린 3가지를 기억해서 순서`n          대로 쓰시오    ; 질문
Gui, Add, Edit, x100 y300 w800 H130 va111,
Gui, Add, text, x+50 w200 H130 vr111,

Gui, Add, Edit, x100 y+10 w800 H130 va112,
Gui, Add, text, x+50 w200 H130 vr112,

Gui, Add, Edit, x100 y+10 w800 H130 va113,
Gui, Add, text, x+50 w200 H130 vr113,

Gui, Add, BUTTON,x100 y+10 w800 H130 ganswer2,결과 확인

;~ Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn11,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
;~ Gui, Add, text, x930 y730 W800 H100 vshow11,    ; 설명
		GuiControl, hide, n11
11ans=3


Gui, Tab, 12,,Exact
no5 := % Array5[ran5]
;~ MsgBox, % no5
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y50 H80, 질문12) 이것은 무엇입니까?    ; 질문

Gui, Add, Picture, x100 y+0 vpic, %A_ScriptDir%\사진\%no5%.jpg
Gui, Add, Edit, x100 y700 w800 H130 va12,
Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn12,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, BUTTON, x+100 W280 H130 ganswer,결과
Gui, Add, text, x930 y730 W800 H100 vshow12,    ; 설명
		GuiControl, hide, n12
12ans:=no5




Gui, Tab, 13,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문13) 다음 명령을 시행하세요    ; 질문

Gui, Font, S60 CCCCCCC w400, Malgun Gothic


Gui, Add, text, x100 y+10 w800 H130 vo1, - 종이를 뒤집어
Gui, Add, text, x100 y+10 w800 H130 vo2, - 반으로 접은 다음
Gui, Add, text, x100 y+10 w800 H130 vo3, - 저에게 주세요
;~ Gui, Add, Edit, x100 y600 w800 H130 va13,
Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, text, x930 y730 W800 H100 vshow13,    ; 설명
;~ Gui, Add, BUTTON, x+100 W280 H130 ganswer,결과
		GuiControl, hide, n13





Gui, Tab, 14,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 vq15 w1700 r2, 질문14) 다음 따라 읽고 쓰세요    ; 질문
Gui, Add, BUTTON, y+0 W400 H130 greplay,다시듣기


Gui, Add, Edit, x100 y470 w800 H260 va14,
Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn14,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
;~ Gui, Add, BUTTON, x+100 W280 H130 ganswer,결과
Gui, Add, text, x930 y730 W800 H100 vshow14,    ; 설명
		GuiControl, hide, n14


;~ GuiControl, , q15, % Array4[ran4]

14ans:=Array4[ran4]

Gui, Tab, 15,,Exact
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y100 H80, 질문15) 다음 그리세요    ; 질문
Gui, Add, Picture, x100 y+100 va15, %A_ScriptDir%\1.png
;~ Gui, Add, BUTTON, x930 y600 W240 H130 grst,정답
Gui, Add, BUTTON, x+30 W240 H130 gbefore,<이전
Gui, Add, BUTTON, x+30 W240 H130 gafter vn15,다음>
Gui, Font, S60 CCCCCCC w400, Malgun Gothic
Gui, Add, BUTTON, x+100 W280 H130 ganswer,결과

Gui, Add, text, x930 y730 W800 H100 vshow15,    ; 설명
		;~ GuiControl, hide, n15








Gui, Tab, 16,,Exact
Gui, Font, S30 CDefault w400, Malgun Gothic
Gui, Add, button, x1000 y30 w700 vreload greload, 새로운문제풀기    ; 질문
Gui, Font, S60 CDefault w400, Malgun Gothic
Gui, Add, text, x100 y20 , 결과    ; 질문
;~ Gui, Add, Picture, x100 y600 w800 H130 va17

Gui, Font, S20 CDefault w400, Malgun Gothic

Gui, Add, ListView, x100 y+0 w1600 H700 R15 +GRID, 문항|정답|최종답|정답여부|` |문항|정답|최종답|정답여부|    ; 질문

LV_ModifyCol(1, 120) ;
LV_ModifyCol(2, "270 Integer" "Integer LEFT")  ;
LV_ModifyCol(3, "270 Integer" "Integer LEFT")  ;
LV_ModifyCol(4, "120 Integer" "Integer CENTER")  ;
LV_ModifyCol(5, 30)  ;
LV_ModifyCol(6, 120)  ;
LV_ModifyCol(7, "270 Integer" "Integer LEFT")  ;
LV_ModifyCol(8, "270 Integer" "Integer LEFT")  ;
LV_ModifyCol(9, "120 Integer" "Integer CENTER")  ;



;~ Gui, Add, text, x100 y+0 w100 H80, 1번 :    ; 질문
;~ Gui, Add, text, x+20 w200 H80, %1ans%    ; 질문
;~ Gui, Add, text, x+20 w200 H80, %a1%    ; 질문

Gui, Add, BUTTON, x+100 W280 H130 gbefore,<이전
;~ Gui, Add, BUTTON, x+100 W280 H130 gafter,다음>
;~ Gui, Font, S60 CCCCCCC w400, Malgun Gothic
;~ Gui, Add, BUTTON, x+100 W280 H130 ganswer,결과
Gui, SHOW, W1800 H900, %WINTITLE%
gosub, Lwin
Sleep, 500

	Voice.Speak("올해는 몇년도 입니까?")
;~ MsgBox, %1ans%`n%2ans%`n%3ans%`n%4ans%`n%5ans%`n%6ans%`n%7ans%`n%8ans%`n%9ans%`n%10ans%`n%11ans%`n%12ans%`n
return

replay:
	Sleep, 500
	말하기:=% Array4[ran4]
	Voice.Speak(말하기)
return


reload:
Reload


tabname:
Gui, submit, nohide
if(tabname="16")
{
최종점수=0
Sleep, 500
	Voice.Speak("결과입니다")
	if(1ans=a1){
		result1=O
		최종점수++
	}
	else
	{
		result1=X
	}

	if(2ans=a2){
		result2=O
		최종점수++
	}
	else
	{
		result2=X
	}

	if(3ans=a3){
		result3=O
		최종점수++
	}
	else
	{
		result3=X
	}

	if(4ans=a4){
		result4=O
		최종점수++
	}
	else
	{
		result4=X
	}

	if(5ans=a5){
		result5=O
		최종점수++
	}
	else
	{
		result5=X
	}

	if(6ans=a6){
		result6=O
		최종점수++
	}
	else
	{
		result6=X
	}

		7ans1 := StrReplace(7ans, A_Space , "")
		a71 := StrReplace(a7, A_Space , "")
	if(7ans1=a71){
		result7=O
		최종점수++
	}
	else
	{
		result7=X
	}

	if(8ans=a8){
		result8=O
		최종점수++
	}
	else
	{
		result8=X
	}

	if(10ans=10번){
		result10=O
		최종점수++
	}
	else
	{
		result10=X
	}

	if(11ans=11번){
		result11=O
		최종점수++
	}
	else
	{
		result11=X
	}

	if(12ans=a12){
		result12=O
		최종점수++
	}
	else
	{
		result12=X
	}

		14ans1 := StrReplace(14ans, A_Space , "")
		a141 := StrReplace(a14, A_Space , "")
	if(14ans1=a141){
		result14=O
		최종점수++
	}
	else
	{
		result14=X
	}

		최종점수++
		최종점수++
LV_Delete()
LV_Add(, "1번", 1ans, a1, result1, , "8번", 8ans, a8, result8)
LV_Add(, "2번", 2ans, a2, result2, ,"10번", "암산계산", , result10)
LV_Add(, "3번", 3ans, a3, result3, ,"11번", a91 "/" a92 "/" a93, a111 "/" a112 "/" a113, result11)
LV_Add(, "4번", 4ans, a4, result4, ,"12번", 12ans, a12, result12)
LV_Add(, "5번", 5ans, a5, result5, ,"13번", "명령시행", result13, "O")
LV_Add(, "6번", 6ans, a6, result6, ,"14번", 14ans1, a141, result14)
LV_Add(, "7번", 7ans1, a71, result7, ,"15번", "도형그리기", result15, "O")
LV_Add(, "", "", "", "", ,"", "", "", "")
LV_Add(, "", "", "", "", ,"", "", "", "")
LV_Add(, "", "", "", "", ,"", "", "", "")
LV_Add(, "", "", "", "", ,"", "", "", "")




틀린점수 := 15 - 최종점수


LV_Add(,       ,"총 15 문제", " 중",,,, "맞힌문제는 ", 최종점수 "개 입니다")
LV_Add(,       ,,,,,, "틀린문제는 ", 틀린점수 "개 입니다")
	;~ if(2ans=a2){
		;~ result2=1
	;~ }
	;~ else
	;~ {
		;~ result2=0
	;~ }

	;~ if(2ans=a2){
		;~ result2=1
	;~ }
	;~ else
	;~ {
		;~ result2=0
	;~ }

	;~ if(2ans=a2){
		;~ result2=1
	;~ }
	;~ else
	;~ {
		;~ result2=0
	;~ }

	;~ if(2ans=a2){
		;~ result2=1
	;~ }
	;~ else
	;~ {
		;~ result2=0
	;~ }

	;~ if(2ans=a2){
		;~ result2=1
	;~ }
	;~ else
	;~ {
		;~ result2=0
	;~ }







}

else if(tabname="1")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("올해는 몇년도 입니까?")
}
else if(tabname="2")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("오늘은 몇 월 입니까?")
}
else if(tabname="3")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("오늘은 몇 일 입니까?")
}
else if(tabname="4")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("오늘은 무슨 요일 입니까?")
}
else if(tabname="5")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("오늘 계절은 무엇입니까? ")
}
else if(tabname="6")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("당신이 있는 나라는 어디입니까?")
}
else if(tabname="7")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("당신이 있는 도 랑, 시 는 어디입니까?")
}
else if(tabname="8")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("당신이 사는 신주소는 어떻게 됩니까?")
}
else if(tabname="9")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("다음 단어를 기억하세요")
}
else if(tabname="10")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("다음을 암산으로 다섯번 계산하시오")
}
else if(tabname="11")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("아까 알려드린 세가지 단어를 기억해서 순서대로 쓰시오")
}
else if(tabname="12")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("화면에 보이는 이것은 무엇입니까?")
}
else if(tabname="13")
{
	;~ Gui, submit, nohide
	Sleep, 500

	Voice.Speak("다음 명령을 시행하세요")

		Gui, Font, S60 CRED w400, Malgun Gothic
		GuiControl, Font, o1
		Gui, Font, S60 CCCCCCC w400, Malgun Gothic
		GuiControl, Font, o2
		Gui, Font, S60 CCCCCCC w400, Malgun Gothic
		GuiControl, Font, o3

	Sleep, 2000
	Voice.Speak("종이를 뒤집어")

		Gui, Font, S60 CCCCCCC w400, Malgun Gothic
		GuiControl, Font, o1
		Gui, Font, S60 CRED w400, Malgun Gothic
		GuiControl, Font, o2
		Gui, Font, S60 CCCCCCC w400, Malgun Gothic
		GuiControl, Font, o3

	Sleep, 2000
	Voice.Speak("반으로 접은 다음")

		Gui, Font, S60 CCCCCCC w400, Malgun Gothic
		GuiControl, Font, o1
		Gui, Font, S60 CCCCCCC w400, Malgun Gothic
		GuiControl, Font, o2
		Gui, Font, S60 CRED w400, Malgun Gothic
		GuiControl, Font, o3

	Sleep, 2000
	Voice.Speak("저에게 주세요")
}
else if(tabname="14")
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("다음 따라 읽고 쓰세요")
	말하기:=% Array4[ran4]
	Voice.Speak(말하기)
}
else
{
	;~ Gui, submit, nohide
	Sleep, 500
	Voice.Speak("다음 그림을 종이에 그리세요 ")
}
return


















rst:

gui,submit,nohide
Loop, 16
{
	if(tabname=A_Index)
	{




		작성1 := % A_Index "ans"
		작성 := StrReplace(%작성1%, A_Space , "")

		정답1 := % "a" A_Index
		정답 := StrReplace(%정답1%, A_Space , "")
		정답표기 := % "show" A_Index
		다음표기 := % "n" A_Index
		if(작성 = 정답)
		{
			;~ MsgBox, % "맞음 `n" 작성 "`n" 정답
		Gui, Font, S60 CBLUE w400, Malgun Gothic
		GuiControl, Font, %정답표기%
		GuiControl, , %정답표기%, 정답입니다
		GuiControl, show, %다음표기%
		}
		else
		{
			;~ MsgBox, % "틀림 `n" 작성 "`n" 정답
		Gui, Font, S60 CFF0000 w400, Malgun Gothic
		GuiControl, Font, %정답표기%
		GuiControl, , %정답표기%, 오답입니다
		GuiControl, show, %다음표기%
		}
	}
	else
	{

	}

}
return



cal:
gui, submit, nohide
;~ MsgBox, 262192, ,%q1%`n%q2%`n%a10%
	10번=0
if(try = "5")
{
	;~ MsgBox, 262192, ,

		Gui, Font, S60 CBLUE w400, Malgun Gothic
		GuiControl, Font, show10
		GuiControl, , show10, 5번의 계산이 끝났습니다.`n다음> 을 누르세요
	GuiControl, hide, cal
	GuiControl, show, n10

	10번=1
	return
}
else
{
}
	q3 := q1 - q2
	if (q3 = a10)
	{

		num := 5 - try
		;~ MsgBox, 262192, ,정답 입니다`n%num% 회 계산을 더 해주세요
		try++
		GuiControl, , q1, %q3%
		GuiControl, , a10,
		GuiControl, focus, a10
		Gui, Font, S60 CBLUE w400, Malgun Gothic
		GuiControl, Font, show10
		GuiControl, , show10, 정답 입니다`n%num% 회 계산을 더 해주세요
		;~ GuiControl, , q2, q3
		cal =
	}
	else
	{
		;~ MsgBox, 262192, ,틀렸습니다. 다시 계산해주세요 `n%q3%
		Gui, Font, S60 CFF0000 w400, Malgun Gothic
		GuiControl, Font, show10
		GuiControl, , show10, 오답 입니다`n 다시 계산해주세요
	}



return




answer2:
gui, submit, nohide
11번=0
;~ MsgBox, %a111%\%a91%\
if(a111 = a91)
{
	GuiControl, , r111, 정답(0)
	11번 ++
}
else
{
	GuiControl, , r111, 틀림(X)
}



if(a112 = a92)
{
	GuiControl, , r112, 정답(0)
	11번 ++
}
else
{
	GuiControl, , r112, 틀림(X)
}



if(a113 = a93)
{
	GuiControl, , r113, 정답(0)
	11번 ++
}
else
{
	GuiControl, , r113, 틀림(X)
}


GuiControl, show, n11


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


IME_CHECK(WinTitle)
{
    WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}



Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON

     SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
    if (DetectSave <> A_DetectHiddenWindows)
        DetectHiddenWindows,%DetectSave%
    return ErrorLevel
}



ImmGetDefaultIMEWnd(hWnd)
{
    return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}


Lwin:

    ret := IME_CHECK("A")
    if %ret% = 0                 ; 0 영어
    {
        Send, {vk15sc138}
    }
return



AppsKey::
    ret := IME_CHECK("A")
    if %ret% <> 0               ; 1 한글
    {
        Send, {vk15sc138}
     }
return