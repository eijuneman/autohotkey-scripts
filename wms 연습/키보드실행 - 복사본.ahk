Gui, Add, Button, gChangeColor, button1
Gui, Add, Button, gChangeColor2, button2
Gui, Add, ListView, vMyListView BackgroundYellow, Column1
LV_Add("", "Item1")
LV_Add("", "Item2")
Gui, Show
return

ChangeColor:
GuiControl, +BackgroundFFDD00, MyListView
return
ChangeColor2:
GuiControl, +BackgroundYellow, MyListView
return
