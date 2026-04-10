; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; -------------- BASIC GUIDE TO HELP UNDERSTAND WHAT TO EDIT IN THIS MACRO ---------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; - This macro is split into 5 SECTIONs, each seperated by a titled header looking like this ---
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; - SECTION 1 is the macro's global effect settings which never need changing ------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; - SECTION 2 -- HOT KEY ACTIVATION ------------------------------------------------------------
; ---- the key pressed to trigger a macro routine is followed by a double colon :: -------------
; ---- the next line is GOSUB then LOGIC CORE name , or it's a single instruction --------------
; ---- avoid setting an activation key to any key you might need for typing in game messages ! -
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; - SECTION 3 -- LOGIC CORE --------------------------------------------------------------------
; ---- there are realy only two things you MIGHT EVER want to change here ----------------------
; --------- both are in the block ( MAIN_USE ) and part of the ( IF ) statements ---------------
; ---- the number of charges used before changing which SCB are powered ( HSused ) -------------
; --------- if your SCB dont have 5 charges change the numbers after the = signs ---------------
; ---- where the if jumps to ( SCB_Set_One/Two ) depending on your SCB piarings ----------------
; --------- most change requirements are in the change powered cell banks section --------------
; ----------------------------------------------------------------------------------------------
; -- NOTE to use a SINGLE SCB to charge shields set SCB_Set_Two as SCB_Set_One -----------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; - SECTION 4 -- CHANGE POWERED CELL BANKS --- ( default is for 2 SCB used simaltainiously ) ---
; ---- this is the sequence of keypresses , so changes here are likely to be needed ------------
; ---- the target name after each GOSUB is a single action (press/click of a button/key) -------
; ---- actions have the same names as in game key bindings (main menu -> options -> controls) --
; ---- for repeted actions LOOP, X repetes the action below X times ----------------------------
; ---- dont change the sleep numbers they allow you HS and SCB enough time to fire in game -----
; ---- befor changing this section write down the exact sequence to manualy change SCB in game -
; ----------------------------------------------------------------------------------------------
; -- NOTE to use a SINGLE SCB to charge shields delete the marked lines and the lines inbetween 
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; - SECTION 5 -- IN GAME KEY BINDS -------------------------------------------------------------
; ---- each block of code is labeled to the right with the in game key bindings name -----------
; ---------- these are also in the same order as the in game key bindings are listed -----------
; ---------- there also the start of each block as it is the name used for GOSUB to find them --
; ---- before editing write down your bindings or add secondary binds in game to match these ---
; ---- each action has 2 referances in this script , press (down) and relese (up) --------------
; ---------- these referances are on the lines imediatly above and below the labels ------------
; ---- sorry but you cannot set these to a hotas action , for this set a secondary binding -----
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ---------- DEFAULT ACTION KEYS SET -----------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ------------- F1 = Charge Shields (and swap SCB if needed ) ----------------------------------
; ------------- F2 = Target Power Plant ( not 100% perfect but CZ friendly ) -------------------
; ------------- F3 = AUTO Chaff (On/Off) --------------------------------------- Fix for duel --
; --------------F4 = Request Docking -----------------------------------------------------------
; ------------- F5 = Reset Charges Used ( for when you re-arm ) --------------------------------
; ------------- F6 = Increase Charges Used -----------------------------------------------------
; ------------- F7 = Decrese charges Used ------------------------------------------------------
; ------------- F8 = Increase SCB Chains Used --------------------------------------------------
; ------------- F9 = Decrese SCB Chains Used ---------------------------------------------------
; -------------F10 = Configue ship loadout ------------------------------------ not connected --
; ------------ F11 = Show Key Guide ( On / Off ) -----------------------------------------------
; ------------ F12 = Show Usage Counts ( On / Off) ---------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ---------- DEFAULT KEYS BINDINGS USED --------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; -------------- O = Deploy Heat Sink {letter o , not the number 0) ----------------------------
; -------------- P = Use Shield Cell -----------------------------------------------------------
; -------------- C = Use Chaff Launcher --------------------------------------------------------
; -------------- Z = Target Panel --------------------------------------------------------------
; -------------- X = Systems Panel -------------------------------------------------------------
; ------------- UP = UI Panel UP ---------------------------------------------------------------
; ----------- DOWN = UI Panel Down -------------------------------------------------------------
; --------- INSERT = UI Panel Select -----------------------------------------------------------
; -------------- L = Next Panel Tab ------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; --------------------------------------------------- AND FINALY -------------------------------
; ----------------------------------------------------------------------------------------------
; ------------------------------------------ FOR THIS TO WORK AS INTENDED ----------------------
; ----------------------------------------------------------------------------------------------
; ---------------------------------------------------- YOU MUST --------------------------------
; ----------------------------------------------------------------------------------------------
; -------------------------------------------- for ALL of the SCB functions --------------------
; ----------------------------- highlight the top scb in the Systems Panel and exit the panel --
; ----------------------------------------------------------------------------------------------
; -------------------------------------------- for the target PP function ----------------------
; ----------------------------- move to the contacts tab in the Target Panel , exit the panel --
; ----------------------------- a target must also be locked when you activate this ------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------
 
 
#maxThreadsPerHotkey, 2
; ------ #IfWinActive, Elite - Dangerous (CLIENT) ------ disabled for testing
#NoEnv
setkeydelay, 30, 30
hsused = 0
SCBused = 0
tChaff:=0
 gosub, autoconfig
 
 
; ---------------------------------------------------------
; ---------------------------------------------------------
; ------------------- HOT KEY ACTIVATION ------------------
; ---------------------------------------------------------
; ---------------------------------------------------------
 
 
 
F1::
 gosub MAIN_USE
return
 
 
 
F2::
 gosub POWER_PLANT
return
 
 
 
F3::
 gosub AUTOCHAFF
return
 
 
F4::
 gosub Target_Panel
 gosub Next_Panel_Tab
 gosub Next_Panel_Tab
 gosub UI_Panel_Select
 gosub UI_Panel_Down
 gosub UI_Panel_Select
return
 
 
 
F5::
 HSused = 0
 SCBused = 0
 gosub Equip_OSD
return
 
 
 
F6::
HSused ++
 gosub Equip_OSD
return
 
 
 
F7::
HSused --
 gosub Equip_OSD
return
 
 
 
F8::
SCBused ++
 gosub Equip_OSD
return
 
 
 
F9::
SCBused --
 gosub Equip_OSD
return
 
 
 
F10::
 gosub autoconfig
return
 
 
F11::
 gosub T_Key
return
 
 
 
F12::
 gosub T_OSD
return
 
 
 
; ---------------------------------------------------------
; ---------------------------------------------------------
; ----------------------- LOGIC CORE ----------------------
; ---------------------------------------------------------
; ---------------------------------------------------------
 
 
 
MAIN_USE:
 gosub Deploy_Heat_Sink
 Sleep, 1500
 gosub Use_Shield_Cell
HSused ++
 gosub Equip_OSD
 sleep, 10
if HSused = 5
 gosub SCB_Set_One
if HSused = 10
 gosub SCB_Set_One
if HSused = 15
 gosub SCB_Set_Two
return
 
 
 
POWER_PLANT:
 gosub Target_Panel
 gosub Next_Panel_Tab
loop, 6
 gosub UI_Panel_Up
 gosub UI_Panel_Select
 gosub Target_Panel
return
 
 
 
AUTOCHAFF:
 tChaff:=!tChaff
While (tChaff=1)
{
 gosub Use_Chaff_Launcher
 sleep, 15
 gosub Equip_OSD
 sleep, 500
 }
gosub Equip_OSD
return
 
 
 
T_Key:
 tKey := !tKey
 tOSD = 0
if tKey, 1
{
SysGet, width, 16
SplashTextOn, 200, 230, Key_Info, F1 = Charge Shields`nF2 = Target Power Plant`nF3 = AUTO Chaff`nF4 = Request Docking`nF5 = Reset Charges Used`nF6 = Increase Charges Used`nF7 = Decrese charges used`nF8 = Increase SCB used`nF9 = Decrease SCB used`nF10 = ship Setup menu`nF11 = This Key Guide`nF12 = Show Usage Counts.
WinMove, Key_Info, , ((width/2)-100), 15
}
else
SplashTextOff
return
 
 
 
T_OSD:
 tOSD := !tOSD
 tKey = 0
 gosub Equip_OSD
return
 
 
 
Equip_OSD:
if tChaff, 1
 AutoChaff = On
Else
 AutoChaff = Off
if tOSD, 1
{
SysGet, width, 16
SplashTextOn, 200, 60, Usage_Info, Shield Cells Used %HSused%`nSCB changes %SCBused%`nAuto Chaff %AutoChaff%`n.
WinMove, Usage_Info, , ((width/2)-100), 15
}
else
SplashTextOff
return
 
 
 
autoconfig:
gosub, Loadini
Dropdownmodules = No More Moduels|Cargo Hatch|Chaff Launcher|Cockpit Canopy|Frame Shift Drive|Heat Sink Launcher|Life Support|Power Distributor|Power Plant|Sensors|Shield Booster|Shield Cell Bank|Shield Generator|Standard Docking Computer|Thrusters|Weapon ANY
DropdownSCBgroup = 0|1|2|3|4|5|6|7|8|9
Gui +AlwaysOnTop -caption
Gui, Add, Text, x52 y19 w90 h20 +Center, MODULES
Gui, Add, Text, x182 y9 w40 h30 +Center, SCB GROUP
Gui, Add, Text, x232 y19 w40 h20 +Center, COLD
posY := 19
Loop, 35
{
	posY += 20
	Gui, Add, DropDownList, x22 y%posY% w150 h21 R16 vDDL%A_Index%, %Dropdownmodules%
	GuiControl, ChooseString, DDL%A_Index%, % DDL%A_Index%
	Gui, Add, DropDownList, x182 y%posY% w40 h21 R10 vDDG%A_Index%, %DropdownSCBgroup%
	GuiControl, ChooseString, DDG%A_Index%, % DDG%A_Index%
	isCheck := DDV%A_Index%
	Gui, Add, CheckBox, x242 y%posY% w20 h20 vDDV%A_Index% Checked%isCheck%,
}
Gui, Add, Text, x2 y809 w270 h190 +Center, MODULES`nSet your modules types in the order they appere in`nin the power management screen`n`nSCB GROUP`nSet the group and order for SCB use.`nThere is a maximum of 2 SCB's per group.`nSCB group 1 is the SCB you initialy have on.`nA zero value or non SCB modules are not automated in SCB group changes.`n`nCOLD`nSet which moduels you want to be powered down for Running Cold.
Gui, Add, Button, x22 y1009 w90 h30 gShipSetupSave, Save Settings
Gui, Add, Button, x162 y1009 w90 h30 gShipSetupDone, When finished click here
; Generated using SmartGUI Creator 4.0
Gui, Show, x190 y2 h1049 w293, New GUI Window
Return
 
 
 
ShipSetupSave:
 Gui, Submit, NoHide
 gosub, Saveini
return
 
 
 
ShipSetupDone:
 Gui, Submit, NoHide
 gosub, Saveini
 Gui, Destroy
return
 
 
 
Loadini:
Loop, 35
{
	IniRead, DDL%A_Index%, game.ini, Settings, DDL%A_Index%
	IniRead, DDG%A_Index%, game.ini, Settings, DDG%A_Index%
	IniRead, DDV%A_Index%, game.ini, Settings, DDV%A_Index%
}
return

Saveini:
Loop, 35
{
	IniWrite, % DDL%A_Index%, game.ini, Settings, DDL%A_Index%
	IniWrite, % DDG%A_Index%, game.ini, Settings, DDG%A_Index%
	IniWrite, % DDV%A_Index%, game.ini, Settings, DDV%A_Index%	
}
return
 
 
; ---------------------------------------------------------
; ---------------------------------------------------------
; ---------------- CHANGE POWERED CELL BANKS --------------
; ---------------------------------------------------------
; ---------------------------------------------------------
 
 
 
SCB_Set_One:
 sleep, 8000
 gosub Systems_Panel
 gosub UI_Panel_Select
 gosub UI_Panel_Select
 gosub UI_Panel_Down
 gosub UI_Panel_Select
 gosub UI_Panel_Select
loop, 5 ; ----------------- for a SINGLE SCB delete FROM THIS LINE (INCLUSIVE)
 gosub UI_Panel_Down
 gosub UI_Panel_Select
 gosub UI_Panel_Select
 gosub UI_Panel_Down
 gosub UI_Panel_Select
 gosub UI_Panel_Select
loop, 6
 gosub UI_Panel_Up ; ------ for a SINGLE SCB delete TO THIS LINE (INCLUSIVE)
 gosub Systems_Panel
SCBused ++
 gosub Equip_OSD
return
 
 
 
SCB_Set_Two:
 sleep, 8000
 gosub Systems_Panel
 gosub UI_Panel_Select
 gosub UI_Panel_Select
 gosub UI_Panel_Down
 gosub UI_Panel_Select
 gosub UI_Panel_Select
 gosub UI_Panel_Down
 gosub UI_Panel_Select
 gosub UI_Panel_Select
loop, 4
 gosub UI_Panel_Down
 gosub UI_Panel_Select
 gosub UI_Panel_Select
loop, 4
 gosub UI_Panel_Up
 gosub Systems_Panel
SCBused ++
 gosub Equip_OSD
return
 
 
 
; ---------------------------------------------------------
; ---------------------------------------------------------
; --------------------- IN GAME KEY BINDS ----------------- 
; ---------------------------------------------------------
; ---------------------------------------------------------
 
 
 
Deploy_Heat_Sink:
Sleep, 10
Send, {O down}
sleep, 15 ; -------------------- Deploy Heat Sink
send, {O up}
Sleep, 10
return
 
 
 
Use_Shield_Cell:
sleep, 10
Send, {P down}
sleep, 15 ; --------------------- Use Shield Cell
send, {P up}
sleep, 10
return
 
 
 
Use_Chaff_Launcher:
Sleep, 10
Send, {C down}
sleep, 15 ; ------------------ Use_Chaff_Launcher
send, {C up}
Sleep, 10
return
 
 
 
Target_Panel:
Sleep, 10
Send, {Z down}
sleep, 15 ; ----------------------- Target Panel
send, {Z up}
Sleep, 600
return
 
 
 
Systems_Panel:
Sleep, 10
Send, {X down}
sleep, 15 ; ----------------------- Systems Panel
send, {X up}
Sleep, 900
return
 
 
 
UI_Panel_Up:
Sleep, 10
Send, {up down}
Sleep, 15 ; ------------------------- UI Panel Up
send, {up up}
Sleep, 10
return
 
 
 
UI_Panel_Down:
Sleep, 10
Send, {Down down}
Sleep, 15 ; ----------------------- UI Panel down
send, {Down up}
Sleep, 10
return
 
 
 
UI_Panel_Select:
Sleep, 10
Send, {Insert down}
Sleep, 15 ; --------------------- UI Panel Select
send, {Insert up}
Sleep, 10
return
 
 
 
Next_Panel_Tab:
Sleep, 10
Send, {L down}
Sleep, 15 ; ---------------------- Next Panel Tab
send, {L up}
Sleep, 10
return
 