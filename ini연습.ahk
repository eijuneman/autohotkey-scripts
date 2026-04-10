#Include IniMulti.ahk

; Default value for Edit control.
; This will declare the value for .ini key "Description".
DefaultValue =
(
This monkey is overweight.
He tends to complain for no reason.
He prefers C# to Python.
He does not comment his code.
He is currently unemployed.

Recommendation:
Reduce  banana ration for one week
to see if mood and weight improve.
)

Gui, Add, Edit, w400 h200 +multi vDescription, %DefaultValue%

Gui, Add, Button, x5 y+5,Submit
gui, Show, , RoboMonkey Hire Information

return
; End of autoexecute.

ButtonSubmit:
Gui, Submit, NoHide

; Declare value for key "Size"
Size:= "Extremely large for a simian in this age group. Very concerning."

; Write some initial values, declared above and via the Edit control.
IniMultiWrite(Description, "chango.ini", "RoboMonkeys", "General characteristics of monkey")
IniMultiWrite(Size, "chango.ini", "RoboMonkeys", "Result of treatment")

; Read some key values and display.
Msgbox % IniMultiRead("chango.ini", "RoboMonkeys", "General characteristics of monkey")
Msgbox % IniMultiRead("chango.ini", "RoboMonkeys", "Result of treatment")

; Another read and display for debug purposes.
barfoo := IniMultiRead("chango.ini", "RoboMonkeys", "General characteristics of monkey")
msgbox % "SANITY CHECK:`r`n`r`n" . barfoo . "`r`n`r`nCheck the file to ensure correct write/read."

; Another write, this time to key "Result of treatment".
IniMultiWrite("Weight marginally diminished. Candidate remains intransigent.", "chango.ini", "RoboMonkeys", "Result of treatment")

; Check
Msgbox % IniMultiRead("chango.ini", "RoboMonkeys", "Result of treatment")

; Write a new section (RIF) with a value for the new key "Observations".
IniMultiWrite("Do not hire for any reason.", "chango.ini", "RIF", "Observations") 


ExitApp

