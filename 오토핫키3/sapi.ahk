
; Uses WinHttpRequest:
; https://git.io/JnMcX

F1:
    backup := ClipboardAll
    Clipboard := ""
    Send ^c
    ClipWait 0
    if (ErrorLevel) {
        Clipboard := backup
        MsgBox 0x40010, Error, Couldn't retrieve text.
        return
    }
    txt := Clipboard
    Clipboard := backup
    FileSelectFile filePath, S, % A_Desktop, Save As..., Audio (*.mp3; *.wav)
    if (!filePath)
        return
    SplitPath filePath,, dir, ext, filename
    if ext not in mp3,wav
        ext := "mp3"
    CoordMode ToolTip, Screen
    parts := Ceil(StrLen(txt) / 4000)
    loop % parts {
        part := SubStr(txt, 1 + (A_Index * 4000) - 4000, 4000)
        if (parts > 1) {
            partName := filename " Pt. " A_Index
            ToolTip % "Converting part " A_Index "/" parts, % A_ScreenWidth / 2, 0
        } else {
            partName := filename
            ToolTip Converting..., % A_ScreenWidth / 2, 0
        }
        text2speech(part, dir, partName, ext)
    }
    ToolTip Conversion finished!, % A_ScreenWidth / 2, 0
    Sleep 3000
    ToolTip
return

/*
    * Voices:
    slt                            - Female US
    rms                            - Male US
    awb                            - Male US (Scottish Accent)
    kal                            - Male US (small size, low quality)
    file-cmu_indic_axb.flitevox    - Female Hindi
    file-cmu_indic_aup_mr.flitevox - Male Marathi

    * Speeds:
    0.7  - Faster
    0.85 - Fast
    1    - Normal
    1.25 - Slow
    1.5  - Slower
*/
text2speech(Text, Dir, Filename, Ext := "mp3", VoiceId := "slt", Speed := 1)
{
    ua := "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:97.0.1) Gecko/20100101 Firefox/97.0.1"
    http := WinHttpRequest({"UA": ua})
    url := "https://www.text2speech.org/"
    body := { "text": Text
        , "voice": VoiceId
        , "speed": Speed
        , "outname": Filename
        , "user_screen_width": 980 }
    response := http.POST(url, body, "", {"multipart":1})
    RegExMatch(response, "FW\/[^=]+=(?<Key>[^']+)", fw)
    loop {
        Sleep 3000
        response := http.GET(url fw "&tscachebusttamp=" A_Now)
    } until response != "__wait__123"
    target := Dir "\" Filename "." Ext
    while FileExist(target)
        target := Dir "\" Filename "-" Format("{:02}", A_Index) "." Ext
    Filename := StrReplace(Filename, " ", "_") "." Ext
    UrlDownloadToFile % url "FW/getfile.php?file=" fwKey "%2F" Filename
        , % target
}