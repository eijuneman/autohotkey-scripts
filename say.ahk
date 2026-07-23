#NoEnv
#SingleInstance Off
SetBatchLines, -1
; say.ahk - play notice chime (F1.mp3) then speak Korean text via Papago TTS (kyuri), SAPI fallback.
; Reuses readerspeaker.ahk TTS core. arg1 = path to a UTF-8 text file. arg2 (optional) = chime mp3 path.
; Pure-ASCII source (encoding-agnostic); spoken text comes from the UTF-8 file at runtime.

file := A_Args.Length() >= 1 ? A_Args[1] : ""
if (file = "" || !FileExist(file))
    ExitApp

FileRead, content, *P65001 %file%   ; read mant file as UTF-8 -> native (UTF-16 on U64)
FileDelete, %file%                  ; consume the temp file
if (content = "")
    ExitApp

; ===== notice chime first; mant starts after it finishes =====
; default = F1.mp3 next to this script (오토핫키2). arg2 overrides. SoundPlay wait blocks until done.
chime := A_ScriptDir "\F1.mp3"
if (A_Args.Length() >= 2 && A_Args[2] != "")
    chime := A_Args[2]
if FileExist(chime)
    SoundPlay, %chime%, wait

; ===== Papago TTS API (from readerspeaker.ahk:145-176) =====
ttsText := UrlEncodeUtf8(content)
ttsId := ""
http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("POST", "https://papago.naver.com/api/tts/makeID", false)
http.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
http.SetRequestHeader("Referer", "https://papago.naver.com/")
try http.Send("alpha=0&pitch=0&speaker=kyuri&speed=1&text=" ttsText)
resp := http.ResponseText
if RegExMatch(resp, "i)""id""\s*:\s*""([^""]+)""", m)
    ttsId := m1
if (ttsId = "") {
    ; no internet / API fail -> Windows built-in voice
    try ComObjCreate("SAPI.SpVoice").Speak(content)
    ExitApp
}
mp3Path := A_Temp "\papago_tts_say_" A_TickCount ".mp3"
http2 := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http2.Open("GET", "https://papago.naver.com/api/tts/" ttsId, false)
http2.SetRequestHeader("Referer", "https://papago.naver.com/")
try http2.Send()
ado := ComObjCreate("ADODB.Stream")
ado.Type := 1
ado.Open()
ado.Write(http2.ResponseBody)
ado.SaveToFile(mp3Path, 2)
ado.Close()
SoundPlay, %mp3Path%, wait
FileDelete, %mp3Path%
ExitApp

; ===== native (UTF-16) -> UTF-8 percent-encoding (Papago text param) =====
UrlEncodeUtf8(str) {
    nU := DllCall("WideCharToMultiByte", "UInt", 65001, "UInt", 0, "WStr", str, "Int", -1, "Ptr", 0, "Int", 0, "Ptr", 0, "Ptr", 0)
    VarSetCapacity(u8, nU, 0)
    DllCall("WideCharToMultiByte", "UInt", 65001, "UInt", 0, "WStr", str, "Int", -1, "Ptr", &u8, "Int", nU, "Ptr", 0, "Ptr", 0)
    hexChars := "0123456789ABCDEF"
    out := ""
    Loop, % nU-1 {
        b := NumGet(u8, A_Index-1, "UChar")
        if ((b>=0x30 && b<=0x39) || (b>=0x41 && b<=0x5A) || (b>=0x61 && b<=0x7A) || b=0x2D || b=0x5F || b=0x2E || b=0x7E)
            out .= Chr(b)
        else {
            hi := (b >> 4) & 0xF
            lo := b & 0xF
            out .= "%" SubStr(hexChars, hi+1, 1) SubStr(hexChars, lo+1, 1)
        }
    }
    return out
}
