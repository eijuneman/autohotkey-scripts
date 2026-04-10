#NoEnv

Gui, Font, S20 CDefault, 나눔바른고딕
Gui, Add, Text, x16 y2 w600 h50, 오늘 출고 리스트

Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x16 y35 w130 h30, 거래처명
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x146 y35 w130 h30, 날짜
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x266 y35 w130 h30, 시간
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x356 y35 w130 h30, 출고장소
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x506 y35 w130 h30, 특이사항

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;1번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y53 w130 h42 -VScroll ,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y53 w120 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y53 w90 h21 -VScroll,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y53 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y53 w330 h21 -VScroll,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y74 w690 h21 -VScroll, 
 
 
GUi, add, Button, x839 y52 w50 h21 cFF2211 gb1, Copy 
Gui, Add, Button, x839 y73 w50 h22  +BackgroundFF0000 gb2, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;2번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y95 w130 h42 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y95 w120 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y95 w90 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y95 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y95 w330 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y116 w690 h21 -VScroll, 
Gui, Add, Button, x839 y95 w50 h21 gb3, Copy 
Gui, Add, Button, x839 y116 w50 h22 gb4, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;3번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y137 w130 h42 -VScroll,  
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y137 w120 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y137 w90 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y137 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y137 w330 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y158 w690 h21 -VScroll, 
Gui, Add, Button, x839 y137 w50 h21 gb5, Copy 
Gui, Add, Button, x839 y158 w50 h22 gb6, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;4번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y179 w130 h42 -VScroll,  
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y179 w120 h21 -VScroll,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y179 w90 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y179 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y179 w330 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y200 w690 h21 -VScroll, 
Gui, Add, Button, x839 y179 w50 h21 gb7, Copy 
Gui, Add, Button, x839 y200 w50 h22 gb8, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;5번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y221 w130 h42 -VScroll,  
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y221 w120 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y221 w90 h21 -VScroll,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y221 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y221 w330 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y242 w690 h21 -VScroll, 
Gui, Add, Button, x839 y221 w50 h21 gb9, Copy 
Gui, Add, Button, x839 y242 w50 h22 gb10, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;6번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y263 w130 h42 -VScroll,  
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y263 w120 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y263 w90 h21 -VScroll,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y263 w150 h21 -VScroll,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y263 w330 h21 -VScroll,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y284 w690 h21 -VScroll,
Gui, Add, Button, x839 y263 w50 h21 gb11, Copy 
Gui, Add, Button, x839 y284 w50 h22 gb12, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





Gui, Font, S20 CDefault, 나눔바른고딕
Gui, Add, Text, x16 y316 w319 h50, 오늘 배송 리스트    ; 오늘 배송 

Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x16 y349 w130 h30, 거래처명
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x146 y349 w130 h30, 날짜
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x266 y349 w130 h30, 시간
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x356 y349 w130 h30, 출고장소
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x506 y349 w130 h30, 특이사항



;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;1번째 줄
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x16 y367 w130 h42 -VScroll,  
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y367 w120 h21 -VScroll ,
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x266 y367 w90 h21 -VScroll,
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x356 y367 w150 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x506 y367 w330 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y388 w690 h21 -VScroll, 
Gui, Add, Button, x839 y367 w50 h21 gb13, Copy 
Gui, Add, Button, x839 y388 w50 h22 gb14, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;2번째 줄
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x16 y409 w130 h42 -VScroll,  
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y409 w120 h21 -VScroll , 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x266 y409 w90 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x356 y409 w150 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x506 y409 w330 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y430 w690 h21 -VScroll, 
Gui, Add, Button, x839 y409 w50 h21 gb15, Copy 
Gui, Add, Button, x839 y430 w50 h22 gb16, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;3번째 줄
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x16 y451 w130 h42 -VScroll,  
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y451 w120 h21 -VScroll , 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x266 y451 w90 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x356 y451 w150 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x506 y451 w330 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y472 w690 h21 -VScroll, 
Gui, Add, Button, x839 y451 w50 h21 gb17, Copy
Gui, Add, Button, x839 y472 w50 h22 gb18, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;4번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y493 w130 h42 -VScroll,  
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y493 w120 h21 -VScroll , 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y493 w90 h21 -VScroll,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y493 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y493 w330 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y514 w690 h21 -VScroll, 
Gui, Add, Button, x839 y493 w50 h21 gb19, Copy
Gui, Add, Button, x839 y514 w50 h22 gb20, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;5번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y535 w130 h42 -VScroll,  
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y535 w120 h21 -VScroll , 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y535 w90 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y535 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y535 w330 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y556 w690 h21 -VScroll, 
Gui, Add, Button, x839 y535 w50 h21 gb21, Copy
Gui, Add, Button, x839 y556 w50 h22 gb22, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




Gui, Font, S20 CDefault, 나눔바른고딕
Gui, Add, Text, x16 y595 w319 h50, 내일 ~ 매장출고 리스트    ; 내일출고 

Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x16 y625 w130 h30, 거래처명
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x146 y625 w130 h30, 날짜
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x266 y625 w130 h30, 시간
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x356 y625 w130 h30, 출고장소
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x506 y625 w130 h30, 특이사항



;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;1번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y643 w130 h42 -VScroll,  
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y643 w120 h21 -VScroll , 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y643 w90 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y643 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y643 w330 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y664 w690 h21 -VScroll, 
Gui, Add, Button, x839 y643 w50 h21 gb23, Copy
Gui, Add, Button, x839 y664 w50 h22 gb24, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;2번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y685 w130 h42 -VScroll,  
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y685 w120 h21 -VScroll , 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y685 w90 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y685 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y685 w330 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y706 w690 h21 -VScroll, 
Gui, Add, Button, x839 y685 w50 h21 gb25, Copy
Gui, Add, Button, x839 y706 w50 h22 gb26, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;3번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y727 w130 h42 -VScroll,  
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y727 w120 h21 -VScroll , 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y727 w90 h21 -VScroll,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y727 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y727 w330 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y748 w690 h21 -VScroll, 
Gui, Add, Button, x839 y727 w50 h21 gb27, Copy
Gui, Add, Button, x839 y748 w50 h22 gb28, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;4번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y769 w130 h42 -VScroll,  
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y769 w120 h21 -VScroll ,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y769 w90 h21 -VScroll,
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y769 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y769 w330 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y790 w690 h21 -VScroll, 
Gui, Add, Button, x839 y769 w50 h21 gb29, Copy
Gui, Add, Button, x839 y790 w50 h22 gb30, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;5번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y811 w130 h42 -VScroll,  
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y811 w120 h21 -VScroll , 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y811 w90 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y811 w150 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y811 w330 h21 -VScroll, 
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y832 w690 h21 -VScroll, 
Gui, Add, Button, x839 y811 w50 h21 gb31, Copy
Gui, Add, Button, x839 y832 w50 h22 gb32, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~










Gui, Font, S20 CDefault, 나눔바른고딕
Gui, Add, Text, x16 y871 w319 h50, 내일 ~ 배송 리스트    ; 내일출고 

Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x16 y901 w130 h30, 거래처명
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x146 y901 w130 h30, 날짜
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x266 y901 w130 h30, 시간
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x356 y901 w130 h30, 출고장소
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x506 y901 w130 h30, 특이사항



;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;1번째 줄
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x16 y919 w130 h42 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y919 w120 h21 -VScroll , 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x266 y919 w90 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x356 y919 w150 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x506 y919 w330 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y940 w690 h21 -VScroll, 
Gui, Add, Button, x839 y919 w50 h21 gb33, Copy
Gui, Add, Button, x839 y940 w50 h22 gb34, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;2번째 줄
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x16 y961 w130 h42 -VScroll,  
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y961 w120 h21 -VScroll , 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x266 y961 w90 h21 -VScroll,
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x356 y961 w150 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x506 y961 w330 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y982 w690 h21 -VScroll, 
Gui, Add, Button, x839 y961 w50 h21 gb35, Copy
Gui, Add, Button, x839 y982 w50 h22 gb36, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;3번째 줄
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x16 y1003 w130 h42 -VScroll,  
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y1003 w120 h21 -VScroll ,
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x266 y1003 w90 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x356 y1003 w150 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x506 y1003 w330 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y1024 w690 h21 -VScroll, 
Gui, Add, Button, x839 y1003 w50 h21 gb37, Copy
Gui, Add, Button, x839 y1024 w50 h22 gb38, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;4번째 줄
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x16 y1045 w130 h42 -VScroll,  
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y1045 w120 h21 -VScroll ,
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x266 y1045 w90 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x356 y1045 w150 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x506 y1045 w330 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y1066 w690 h21 -VScroll, 
Gui, Add, Button, x839 y1045 w50 h21 gb39, Copy
Gui, Add, Button, x839 y1066 w50 h22 gb40, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;5번째 줄
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x16 y1087 w130 h42 -VScroll,  
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y1087 w120 h21 -VScroll ,
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x266 y1087 w90 h21 -VScroll,
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x356 y1087 w150 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x506 y1087 w330 h21 -VScroll, 
Gui, Font, S11 Cred, 나눔바른고딕
Gui, Add, Edit, x146 y1108 w690 h21 -VScroll, 
Gui, Add, Button, x839 y1087 w50 h21 gb41, Copy
Gui, Add, Button, x839 y1108 w50 h22 gb42, 붙이기
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~






Gui, Font, S20 CDefault, 나눔바른고딕
Gui, Add, Text, x16 y1142 w319 h50, 주문 + 발주 해야 할 것    ; 내일출고 

Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x16 y1177 w130 h30, 거래처명
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x191 y1177 w130 h30, 날짜
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x280 y1177 w130 h30, 시간
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x455 y1177 w130 h30, 출고장소
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x544 y1177 w130 h30, 특이사항
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x719 y1177 w130 h30, 특이사항
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Text, x808 y1177 w130 h30, 특이사항





;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ;1번째 줄
Gui, Font, S11 CDefault, 나눔바른고딕 ; 
Gui, Add, Edit, x16 y1177 w175 h30, 품  목
Gui, Font, S11 CDefault, 나눔바른고딕; 
Gui, Add, Edit, x191 y1177 w89 h30, 수 량
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x280 y1177 w175 h30, 품  목
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x455 y1177 w89 h30, 수 량
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x544 y1177 w175 h30, 품  목
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x719 y1177 w89 h30, 수 량
Gui, Add, Button, x809 y1177 w80 h30 gb200, 삭제
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 2번쨰줄
Gui, Font, S11 CDefault, 나눔바른고딕 ;
Gui, Add, Edit, x16 y1207 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x191 y1207 w89 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x280 y1207 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x455 y1207 w89 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x544 y1207 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x719 y1207 w89 h30, 
Gui, Add, Button, x809 y1207 w80 h30 gb201, 삭제
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 3번쨰줄
Gui, Font, S11 CDefault, 나눔바른고딕 ;
Gui, Add, Edit, x16 y1237 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x191 y1237 w89 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x280 y1237 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x455 y1237 w89 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x544 y1237 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x719 y1237 w89 h30, 
Gui, Add, Button, x809 y1237 w80 h30 gb202, 삭제
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 4번쨰줄
Gui, Font, S11 CDefault, 나눔바른고딕 ;
Gui, Add, Edit, x16 y1267 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x191 y1267 w89 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x280 y1267 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x455 y1267 w89 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x544 y1267 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x719 y1267 w89 h30, 
Gui, Add, Button, x809 y1267 w80 h30 gb203, 삭제
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 5번쨰줄
Gui, Font, S11 CDefault, 나눔바른고딕 ;
Gui, Add, Edit, x16 y1297 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x191 y1297 w89 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x280 y1297 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x455 y1297 w89 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x544 y1297 w175 h30, 
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x719 y1297 w89 h30, 
Gui, Add, Button, x809 y1297 w80 h30 gb204, 삭제
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 비고란
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x16 y1500 w130 h42 -VScroll, 거래처
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y1500 w120 h21 -VScroll , 날짜
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x266 y1500 w90 h21 -VScroll, 시간
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x356 y1500 w150 h21 -VScroll, 출고장소
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x506 y1500 w330 h21 -VScroll, 전표메모
Gui, Font, S11 CDefault, 나눔바른고딕
Gui, Add, Edit, x146 y1521 w690 h21 -VScroll, 내용

Gui, Font, S20 CDefault, 나눔바른고딕
Gui, Add, Text, x16 y1347 w319 h50, 특이사항    ; 내일출고
Gui, Font, S11 CDefault, 나눔바른고딕;
Gui, Add, Edit, x16 y1387 w870 h100 -VScroll, 특이사항

Gui, Add, Button, x809 y6 w80 h30 gb100, 추출

; Generated using SmartGUI Creator for SciTE
Gui, Show, x-900 y0 w902 h1555, 신흥목재 직원전용 캘린더
return











b1:
controlgettext, x1, edit1, 신흥목재 직원전용 캘린더
controlgettext, x2, edit2, 신흥목재 직원전용 캘린더
controlgettext, x3, edit3, 신흥목재 직원전용 캘린더
controlgettext, x4, edit4, 신흥목재 직원전용 캘린더
controlgettext, x5, edit5, 신흥목재 직원전용 캘린더
controlgettext, x6, edit6, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit1,  , 신흥목재 직원전용 캘린더
ControlSetText, edit2,  , 신흥목재 직원전용 캘린더
ControlSetText, edit3,  , 신흥목재 직원전용 캘린더
ControlSetText, edit4,  , 신흥목재 직원전용 캘린더
ControlSetText, edit5,  , 신흥목재 직원전용 캘린더
ControlSetText, edit6,  , 신흥목재 직원전용 캘린더



return



b2:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit1,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit2,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit3,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit4,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit5,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit6,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더

return





b3:
controlgettext, x1, edit7, 신흥목재 직원전용 캘린더
controlgettext, x2, edit8, 신흥목재 직원전용 캘린더
controlgettext, x3, edit9, 신흥목재 직원전용 캘린더
controlgettext, x4, edit10, 신흥목재 직원전용 캘린더
controlgettext, x5, edit11, 신흥목재 직원전용 캘린더
controlgettext, x6, edit12, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit7,  , 신흥목재 직원전용 캘린더
ControlSetText, edit8,  , 신흥목재 직원전용 캘린더
ControlSetText, edit9,  , 신흥목재 직원전용 캘린더
ControlSetText, edit10,  , 신흥목재 직원전용 캘린더
ControlSetText, edit11,  , 신흥목재 직원전용 캘린더
ControlSetText, edit12,  , 신흥목재 직원전용 캘린더
return


b4:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit7,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit8,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit9,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit10,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit11,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit12,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


b5:
controlgettext, x1, edit13, 신흥목재 직원전용 캘린더
controlgettext, x2, edit14, 신흥목재 직원전용 캘린더
controlgettext, x3, edit15, 신흥목재 직원전용 캘린더
controlgettext, x4, edit16, 신흥목재 직원전용 캘린더
controlgettext, x5, edit17, 신흥목재 직원전용 캘린더
controlgettext, x6, edit18, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit13,  , 신흥목재 직원전용 캘린더
ControlSetText, edit14,  , 신흥목재 직원전용 캘린더
ControlSetText, edit15,  , 신흥목재 직원전용 캘린더
ControlSetText, edit16,  , 신흥목재 직원전용 캘린더
ControlSetText, edit17,  , 신흥목재 직원전용 캘린더
ControlSetText, edit18,  , 신흥목재 직원전용 캘린더
return



b6:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit13,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit14,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit15,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit16,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit17,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit18,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return





;--------------------------------------------------------

b7:
controlgettext, x1, edit19, 신흥목재 직원전용 캘린더
controlgettext, x2, edi20t, 신흥목재 직원전용 캘린더
controlgettext, x3, edi21t, 신흥목재 직원전용 캘린더
controlgettext, x4, edi22t, 신흥목재 직원전용 캘린더
controlgettext, x5, edi23t, 신흥목재 직원전용 캘린더
controlgettext, x6, edi24t, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit19,  , 신흥목재 직원전용 캘린더
ControlSetText, edit20,  , 신흥목재 직원전용 캘린더
ControlSetText, edit21,  , 신흥목재 직원전용 캘린더
ControlSetText, edit22,  , 신흥목재 직원전용 캘린더
ControlSetText, edit23,  , 신흥목재 직원전용 캘린더
ControlSetText, edit24,  , 신흥목재 직원전용 캘린더
return

b8:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit19,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit20,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit21,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit22,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit23,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit24,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------




b9:
controlgettext, x1, edit25, 신흥목재 직원전용 캘린더
controlgettext, x2, edit26, 신흥목재 직원전용 캘린더
controlgettext, x3, edit27, 신흥목재 직원전용 캘린더
controlgettext, x4, edit28, 신흥목재 직원전용 캘린더
controlgettext, x5, edit29, 신흥목재 직원전용 캘린더
controlgettext, x6, edit30, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit25,  , 신흥목재 직원전용 캘린더
ControlSetText, edit26,  , 신흥목재 직원전용 캘린더
ControlSetText, edit27,  , 신흥목재 직원전용 캘린더
ControlSetText, edit28,  , 신흥목재 직원전용 캘린더
ControlSetText, edit29,  , 신흥목재 직원전용 캘린더
ControlSetText, edit30,  , 신흥목재 직원전용 캘린더
return

b10:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit25,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit26,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit27,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit28,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit29,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit30,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return




;--------------------------------------------------------


b11:
controlgettext, x1, edit31, 신흥목재 직원전용 캘린더
controlgettext, x2, edit32, 신흥목재 직원전용 캘린더
controlgettext, x3, edit33, 신흥목재 직원전용 캘린더
controlgettext, x4, edit34, 신흥목재 직원전용 캘린더
controlgettext, x5, edit35, 신흥목재 직원전용 캘린더
controlgettext, x6, edit36, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit31,  , 신흥목재 직원전용 캘린더
ControlSetText, edit32,  , 신흥목재 직원전용 캘린더
ControlSetText, edit33,  , 신흥목재 직원전용 캘린더
ControlSetText, edit34,  , 신흥목재 직원전용 캘린더
ControlSetText, edit35,  , 신흥목재 직원전용 캘린더
ControlSetText, edit36,  , 신흥목재 직원전용 캘린더
return

b12:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit31,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit32,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit33,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit34,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit35,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit36,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b13:
controlgettext, x1, edit37, 신흥목재 직원전용 캘린더
controlgettext, x2, edit38, 신흥목재 직원전용 캘린더
controlgettext, x3, edit39, 신흥목재 직원전용 캘린더
controlgettext, x4, edit40, 신흥목재 직원전용 캘린더
controlgettext, x5, edit41, 신흥목재 직원전용 캘린더
controlgettext, x6, edit42, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit37,  , 신흥목재 직원전용 캘린더
ControlSetText, edit38,  , 신흥목재 직원전용 캘린더
ControlSetText, edit39,  , 신흥목재 직원전용 캘린더
ControlSetText, edit40,  , 신흥목재 직원전용 캘린더
ControlSetText, edit41,  , 신흥목재 직원전용 캘린더
ControlSetText, edit42,  , 신흥목재 직원전용 캘린더
return

b14:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit37,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit38,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit39,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit40,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit41,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit42,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b15:
controlgettext, x1, edit43, 신흥목재 직원전용 캘린더
controlgettext, x2, edit44, 신흥목재 직원전용 캘린더
controlgettext, x3, edit45, 신흥목재 직원전용 캘린더
controlgettext, x4, edit46, 신흥목재 직원전용 캘린더
controlgettext, x5, edit47, 신흥목재 직원전용 캘린더
controlgettext, x6, edit48, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit43,  , 신흥목재 직원전용 캘린더
ControlSetText, edit44,  , 신흥목재 직원전용 캘린더
ControlSetText, edit45,  , 신흥목재 직원전용 캘린더
ControlSetText, edit46,  , 신흥목재 직원전용 캘린더
ControlSetText, edit47,  , 신흥목재 직원전용 캘린더
ControlSetText, edit48,  , 신흥목재 직원전용 캘린더
return

b16:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit43,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit44,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit45,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit46,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit47,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit48,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b17:
controlgettext, x1, edit49, 신흥목재 직원전용 캘린더
controlgettext, x2, edit50, 신흥목재 직원전용 캘린더
controlgettext, x3, edit51, 신흥목재 직원전용 캘린더
controlgettext, x4, edit52, 신흥목재 직원전용 캘린더
controlgettext, x5, edit53, 신흥목재 직원전용 캘린더
controlgettext, x6, edit54, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit49,  , 신흥목재 직원전용 캘린더
ControlSetText, edit50,  , 신흥목재 직원전용 캘린더
ControlSetText, edit51,  , 신흥목재 직원전용 캘린더
ControlSetText, edit52,  , 신흥목재 직원전용 캘린더
ControlSetText, edit53,  , 신흥목재 직원전용 캘린더
ControlSetText, edit54,  , 신흥목재 직원전용 캘린더
return

b18:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit49,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit50,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit51,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit52,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit53,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit54,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b19:
controlgettext, x1, edit55, 신흥목재 직원전용 캘린더
controlgettext, x2, edit56, 신흥목재 직원전용 캘린더
controlgettext, x3, edit57, 신흥목재 직원전용 캘린더
controlgettext, x4, edit58, 신흥목재 직원전용 캘린더
controlgettext, x5, edit59, 신흥목재 직원전용 캘린더
controlgettext, x6, edit60, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit55,  , 신흥목재 직원전용 캘린더
ControlSetText, edit56,  , 신흥목재 직원전용 캘린더
ControlSetText, edit57,  , 신흥목재 직원전용 캘린더
ControlSetText, edit58,  , 신흥목재 직원전용 캘린더
ControlSetText, edit59,  , 신흥목재 직원전용 캘린더
ControlSetText, edit60,  , 신흥목재 직원전용 캘린더
return

b20:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit55,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit56,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit57,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit58,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit59,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit60,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b21:
controlgettext, x1, edit61, 신흥목재 직원전용 캘린더
controlgettext, x2, edit62, 신흥목재 직원전용 캘린더
controlgettext, x3, edit63, 신흥목재 직원전용 캘린더
controlgettext, x4, edit64, 신흥목재 직원전용 캘린더
controlgettext, x5, edit65, 신흥목재 직원전용 캘린더
controlgettext, x6, edit66, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit61,  , 신흥목재 직원전용 캘린더
ControlSetText, edit62,  , 신흥목재 직원전용 캘린더
ControlSetText, edit63,  , 신흥목재 직원전용 캘린더
ControlSetText, edit64,  , 신흥목재 직원전용 캘린더
ControlSetText, edit65,  , 신흥목재 직원전용 캘린더
ControlSetText, edit66,  , 신흥목재 직원전용 캘린더
return

b22:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit61,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit62,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit63,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit64,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit65,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit66,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b23:
controlgettext, x1, edit67, 신흥목재 직원전용 캘린더
controlgettext, x2, edit68, 신흥목재 직원전용 캘린더
controlgettext, x3, edit69, 신흥목재 직원전용 캘린더
controlgettext, x4, edit70, 신흥목재 직원전용 캘린더
controlgettext, x5, edit71, 신흥목재 직원전용 캘린더
controlgettext, x6, edit72, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit67,  , 신흥목재 직원전용 캘린더
ControlSetText, edit68,  , 신흥목재 직원전용 캘린더
ControlSetText, edit69,  , 신흥목재 직원전용 캘린더
ControlSetText, edit70,  , 신흥목재 직원전용 캘린더
ControlSetText, edit71,  , 신흥목재 직원전용 캘린더
ControlSetText, edit72,  , 신흥목재 직원전용 캘린더
return

b24:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit67,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit68,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit69,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit70,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit71,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit72,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b25:
controlgettext, x1, edit73, 신흥목재 직원전용 캘린더
controlgettext, x2, edit74, 신흥목재 직원전용 캘린더
controlgettext, x3, edit75, 신흥목재 직원전용 캘린더
controlgettext, x4, edit76, 신흥목재 직원전용 캘린더
controlgettext, x5, edit77, 신흥목재 직원전용 캘린더
controlgettext, x6, edit78, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit73,  , 신흥목재 직원전용 캘린더
ControlSetText, edit74,  , 신흥목재 직원전용 캘린더
ControlSetText, edit75,  , 신흥목재 직원전용 캘린더
ControlSetText, edit76,  , 신흥목재 직원전용 캘린더
ControlSetText, edit77,  , 신흥목재 직원전용 캘린더
ControlSetText, edit78,  , 신흥목재 직원전용 캘린더
return

b26:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit73,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit74,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit75,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit76,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit77,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit78,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b27:
controlgettext, x1, edit79, 신흥목재 직원전용 캘린더
controlgettext, x2, edit80, 신흥목재 직원전용 캘린더
controlgettext, x3, edit81, 신흥목재 직원전용 캘린더
controlgettext, x4, edit82, 신흥목재 직원전용 캘린더
controlgettext, x5, edit83, 신흥목재 직원전용 캘린더
controlgettext, x6, edit84, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit79,  , 신흥목재 직원전용 캘린더
ControlSetText, edit80,  , 신흥목재 직원전용 캘린더
ControlSetText, edit81,  , 신흥목재 직원전용 캘린더
ControlSetText, edit82,  , 신흥목재 직원전용 캘린더
ControlSetText, edit83,  , 신흥목재 직원전용 캘린더
ControlSetText, edit84,  , 신흥목재 직원전용 캘린더
return

b28:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit79,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit80,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit81,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit82,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit83,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit84,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b29:
controlgettext, x1, edit85, 신흥목재 직원전용 캘린더
controlgettext, x2, edit86, 신흥목재 직원전용 캘린더
controlgettext, x3, edit87, 신흥목재 직원전용 캘린더
controlgettext, x4, edit88, 신흥목재 직원전용 캘린더
controlgettext, x5, edit89, 신흥목재 직원전용 캘린더
controlgettext, x6, edit90, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit85,  , 신흥목재 직원전용 캘린더
ControlSetText, edit86,  , 신흥목재 직원전용 캘린더
ControlSetText, edit87,  , 신흥목재 직원전용 캘린더
ControlSetText, edit88,  , 신흥목재 직원전용 캘린더
ControlSetText, edit89,  , 신흥목재 직원전용 캘린더
ControlSetText, edit90,  , 신흥목재 직원전용 캘린더
return

b30:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit85,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit86,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit87,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit88,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit89,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit90,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b31:
controlgettext, x1, edit91, 신흥목재 직원전용 캘린더
controlgettext, x2, edit92, 신흥목재 직원전용 캘린더
controlgettext, x3, edit93, 신흥목재 직원전용 캘린더
controlgettext, x4, edit94, 신흥목재 직원전용 캘린더
controlgettext, x5, edit95, 신흥목재 직원전용 캘린더
controlgettext, x6, edit96, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit91,  , 신흥목재 직원전용 캘린더
ControlSetText, edit92,  , 신흥목재 직원전용 캘린더
ControlSetText, edit93,  , 신흥목재 직원전용 캘린더
ControlSetText, edit94,  , 신흥목재 직원전용 캘린더
ControlSetText, edit95,  , 신흥목재 직원전용 캘린더
ControlSetText, edit96,  , 신흥목재 직원전용 캘린더
return

b32:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit91,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit92,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit93,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit94,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit95,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit96,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b33:
controlgettext, x1, edit97, 신흥목재 직원전용 캘린더
controlgettext, x2, edit98, 신흥목재 직원전용 캘린더
controlgettext, x3, edit99, 신흥목재 직원전용 캘린더
controlgettext, x4, edit100, 신흥목재 직원전용 캘린더
controlgettext, x5, edit101, 신흥목재 직원전용 캘린더
controlgettext, x6, edit102, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit97,  , 신흥목재 직원전용 캘린더
ControlSetText, edit98,  , 신흥목재 직원전용 캘린더
ControlSetText, edit99,  , 신흥목재 직원전용 캘린더
ControlSetText, edit100,  , 신흥목재 직원전용 캘린더
ControlSetText, edit101,  , 신흥목재 직원전용 캘린더
ControlSetText, edit102,  , 신흥목재 직원전용 캘린더
return

b34:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit97,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit98,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit99,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit100,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit101,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit102,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b35:
controlgettext, x1, edit103, 신흥목재 직원전용 캘린더
controlgettext, x2, edit104, 신흥목재 직원전용 캘린더
controlgettext, x3, edit105, 신흥목재 직원전용 캘린더
controlgettext, x4, edit106, 신흥목재 직원전용 캘린더
controlgettext, x5, edit107, 신흥목재 직원전용 캘린더
controlgettext, x6, edit108, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit103,  , 신흥목재 직원전용 캘린더
ControlSetText, edit104,  , 신흥목재 직원전용 캘린더
ControlSetText, edit105,  , 신흥목재 직원전용 캘린더
ControlSetText, edit106,  , 신흥목재 직원전용 캘린더
ControlSetText, edit107,  , 신흥목재 직원전용 캘린더
ControlSetText, edit108,  , 신흥목재 직원전용 캘린더
return

b36:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit103,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit104,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit105,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit106,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit107,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit108,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b37:
controlgettext, x1, edit109, 신흥목재 직원전용 캘린더
controlgettext, x2, edit110, 신흥목재 직원전용 캘린더
controlgettext, x3, edit111, 신흥목재 직원전용 캘린더
controlgettext, x4, edit112, 신흥목재 직원전용 캘린더
controlgettext, x5, edit113, 신흥목재 직원전용 캘린더
controlgettext, x6, edit114, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit109,  , 신흥목재 직원전용 캘린더
ControlSetText, edit110,  , 신흥목재 직원전용 캘린더
ControlSetText, edit111,  , 신흥목재 직원전용 캘린더
ControlSetText, edit112,  , 신흥목재 직원전용 캘린더
ControlSetText, edit113,  , 신흥목재 직원전용 캘린더
ControlSetText, edit114,  , 신흥목재 직원전용 캘린더
return

b38:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit109,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit110,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit111,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit112,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit113,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit114,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b39:
controlgettext, x1, edit115, 신흥목재 직원전용 캘린더
controlgettext, x2, edit116, 신흥목재 직원전용 캘린더
controlgettext, x3, edit117, 신흥목재 직원전용 캘린더
controlgettext, x4, edit118, 신흥목재 직원전용 캘린더
controlgettext, x5, edit119, 신흥목재 직원전용 캘린더
controlgettext, x6, edit120, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit115,  , 신흥목재 직원전용 캘린더
ControlSetText, edit116,  , 신흥목재 직원전용 캘린더
ControlSetText, edit117,  , 신흥목재 직원전용 캘린더
ControlSetText, edit118,  , 신흥목재 직원전용 캘린더
ControlSetText, edit119,  , 신흥목재 직원전용 캘린더
ControlSetText, edit120,  , 신흥목재 직원전용 캘린더
return

b40:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit115,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit116,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit117,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit118,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit119,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit120,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b41:
controlgettext, x1, edit115, 신흥목재 직원전용 캘린더
controlgettext, x2, edit116, 신흥목재 직원전용 캘린더
controlgettext, x3, edit117, 신흥목재 직원전용 캘린더
controlgettext, x4, edit118, 신흥목재 직원전용 캘린더
controlgettext, x5, edit119, 신흥목재 직원전용 캘린더
controlgettext, x6, edit120, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit115,  , 신흥목재 직원전용 캘린더
ControlSetText, edit116,  , 신흥목재 직원전용 캘린더
ControlSetText, edit117,  , 신흥목재 직원전용 캘린더
ControlSetText, edit118,  , 신흥목재 직원전용 캘린더
ControlSetText, edit119,  , 신흥목재 직원전용 캘린더
ControlSetText, edit120,  , 신흥목재 직원전용 캘린더
return

b42:
controlgettext, x1, edit157, 신흥목재 직원전용 캘린더
controlgettext, x2, edit158, 신흥목재 직원전용 캘린더
controlgettext, x3, edit159, 신흥목재 직원전용 캘린더
controlgettext, x4, edit160, 신흥목재 직원전용 캘린더
controlgettext, x5, edit161, 신흥목재 직원전용 캘린더
controlgettext, x6, edit162, 신흥목재 직원전용 캘린더

ControlSetText, edit115,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit116,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit117,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit118,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit119,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit120,  %x6%, 신흥목재 직원전용 캘린더

ControlSetText, edit157,  , 신흥목재 직원전용 캘린더
ControlSetText, edit158,  , 신흥목재 직원전용 캘린더
ControlSetText, edit159,  , 신흥목재 직원전용 캘린더
ControlSetText, edit160,  , 신흥목재 직원전용 캘린더
ControlSetText, edit161,  , 신흥목재 직원전용 캘린더
ControlSetText, edit162,  , 신흥목재 직원전용 캘린더
return


;--------------------------------------------------------

b100:

    ControlGetText, x1, TRzEdit8, ahk_exe JedaeroM.exe
	ControlGetText, x2, TRzDBDateTimeEdit1, ahk_exe JedaeroM.exe
	ControlGetText, x3, TRzDBEdit12, ahk_exe JedaeroM.exe
	ControlGetText, x4, TRzDBEdit13, ahk_exe JedaeroM.exe
	ControlGetText, x5, TRzDBEdit11, ahk_exe JedaeroM.exe	
	ControlGetText, x6, TDBGridInplaceEdit1, ahk_exe JedaeroM.exe







ControlSetText, edit157,  %x1%, 신흥목재 직원전용 캘린더
ControlSetText, edit158,  %x2%, 신흥목재 직원전용 캘린더
ControlSetText, edit159,  %x3%, 신흥목재 직원전용 캘린더
ControlSetText, edit160,  %x4%, 신흥목재 직원전용 캘린더
ControlSetText, edit161,  %x5%, 신흥목재 직원전용 캘린더
ControlSetText, edit162,  %x6%, 신흥목재 직원전용 캘린더
return



;---------------------------------------------------------------------



b201:
 controlsettext, edit133,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit134,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit135,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit136,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit137,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit138,  , 신흥목재 직원전용 캘린더 

return


b202:
 controlsettext, edit139,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit140,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit141,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit142,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit143,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit144,  , 신흥목재 직원전용 캘린더 

return

b203:
 controlsettext, edit145,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit146,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit147,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit148,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit149,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit150,  , 신흥목재 직원전용 캘린더 

return

b204:
 controlsettext, edit151,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit152,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit153,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit154,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit155,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit156,  , 신흥목재 직원전용 캘린더 

return

b200:
 controlsettext, edit127,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit128,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit129,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit130,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit131,  , 신흥목재 직원전용 캘린더 
 controlsettext, edit132,  , 신흥목재 직원전용 캘린더 

return













Pause::
Reload




GuiClose:
ExitApp
