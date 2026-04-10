#NoEnv
SetBatchLines -1
#Include Class_ImageButton.ahk ; http ahkscript.org /boards/viewtopic.php?f=6&t=1103  Broken Link for safety

Gui, Color, White
Gui, Margin, 50, 50
Gui, Font, s16

AddImageTab("", "page1|page2|page3|page4")
	Gui, Tab, 1, 1
		Gui, Add, Text, xm Section Border w296 h200 0x201, page1
	Gui, Tab, 2
		Gui, Add, Button, xp w200, page2
	Gui, Tab, 3
		Gui, Add, Edit, xp w200 h200, page3
	Gui, Tab, 4
		Gui, Add, Radio, xp w200 h200, page4
	Gui, Tab

AddImageTab("xm y+0", "page1|page2|page3|page4", 1)
	Gui, Add, Text, x+10 yp-116 w210 h155 Border,
	Loop, 4
	{
		Gui, Tab, %A_Index%
		Gui, Add, Text, xp+2 yp+2 wp-4 hp-4 0x201 cBlue, % "Page " A_Index
	}
Gui, Show
Return

GuiClose:
ExitApp

AddImageTab(Options, Pages, Vertical = False) {
	static HwndList := {}

	Opt1 := [3, 0xEEF1F4, 0xE4E9EF, "Black", 0,, 0xA5AFBF, 1]
	Opt2 := [3, 0xCDD6DF, 0xCDD6DF, "Black", 0,, 0xA5AFBF, 1]
	Opt3 := [3, 0xBEC7D6, 0xBEC7D6, "Black", 0,, 0xA5AFBF, 1]
	Opt4 := [3, 0xBEC7D6, 0xBEC7D6, "Black", 0,, 0xA5AFBF, 1]

	Gui, Add, Tab2, w0 h0 AltSubmit HwndHTab, % Pages ; Add an invisible Tab control
	Gui, Tab

	Loop, Parse, Pages, |
	{
		_Options := (A_Index = 1) ? Options " Disabled xp" : (Vertical ? "y+0" : "x+0")
		Gui, Add, Button, %_Options% HwndHBT g___AddImageTab_ChangeTab, % A_LoopField
			ImageButton.Create(HBT, Opt1, Opt2, Opt3, Opt4)

		HwndList[HBT]                   := {TabIndex: A_Index, TabHwnd: HTab}
		HwndList["HTab", HTab, A_Index] := HBT
	}

	Return

	___AddImageTab_ChangeTab:
		GuiControlGet, focused_control, Focus
		GuiControlGet, focused_controlHwnd, Hwnd, %focused_control%
		TabIndex := HwndList[focused_controlHwnd+0]["TabIndex"]
		TabHwnd  := HwndList[focused_controlHwnd+0]["TabHwnd"]

		GuiControl, Choose, %TabHwnd%, |%TabIndex%

		For i, hwnd in HwndList["HTab"][TabHwnd]
			GuiControl, % (i = TabIndex) ? "Disable" : "Enable", %hwnd%
	Return
}