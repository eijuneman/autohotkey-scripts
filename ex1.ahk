Colors := "red,green,blue"
Loop, parse, Colors, `,
{
    MsgBox, Color number %A_Index% is %A_LoopField%.
}


Loop, parse, FileContents, `n, `r  ; `n을 먼저 `r을 다음에 지정해야 Windows와 Unix 파일을 모두 해석할 수 있습니다.
{
    MsgBox, 4, , Line number %A_Index% is %A_LoopField%.`n`nContinue?
    IfMsgBox, No, break
}