#NoEnv
SetWorkingDir %A_ScriptDir%
FileDelete, ahk_minimal_test.txt
FileAppend, hello from AHK`r`n, ahk_minimal_test.txt
FileAppend, A_IsUnicode=%A_IsUnicode%`r`n, ahk_minimal_test.txt
FileAppend, A_PtrSize=%A_PtrSize%`r`n, ahk_minimal_test.txt
FileAppend, time=%A_Now%`r`n, ahk_minimal_test.txt
ExitApp
