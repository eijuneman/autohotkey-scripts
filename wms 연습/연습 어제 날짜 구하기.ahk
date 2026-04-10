; 예시 사용
result := CeilHundreds(15554.67)
MsgBox, % result  ; 출력: 400

; 백의 자리 올림 함수
CeilHundreds(x) {
    return Ceil(x / 100) * 100
}