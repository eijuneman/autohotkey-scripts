; Wi-Fi 정보 가져오기
RunWait, %ComSpec% /c netsh wlan show interfaces > wifi_info.txt,, Hide
FileRead, wifiData, wifi_info.txt

; SSID 추출
if RegExMatch(wifiData, "SSID\s*:\s*(.*)", ssid) {
    MsgBox, 현재 연결된 Wi-Fi SSID: %ssid%
} else {
    MsgBox, Wi-Fi 정보를 찾을 수 없습니다.
}

; 임시 파일 삭제
FileDelete, wifi_info.txt
