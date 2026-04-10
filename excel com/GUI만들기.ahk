#SingleInstance, force

gui, destroy
gui, Default
;~ Gui, +alwaysontop
;~ Background0xFF00FF
Gui, Font, S13 CDefault w700, Malgun Gothic
Gui, Add, Tab3, x0 y0 w1281 h731 vtabname, 상품검색`  |▼평면[내부]`  |▼평면[철물]`  |▼평면[외부]`  |▽[K1~K6]`  |▽[K7~K12]`  |▽[G14~G9]`  |▽[G8~7  J4~2]`  |`      EDSM`       |

Gui, Font, S11 CDefault W700 c0xFF2211, Malgun Gothic
Gui, Add, Listview, x40 y60 w800 h240 vLV2 gLV2 hwndHLV2  SortDesc,  로케이션|RFID CODE|상품명|규격|수량|PRODUCT CODE


Gui, ListView, lv2
LV_ModifyCol(1, 80)  ;
LV_ModifyCol(2, 0) ;
LV_ModifyCol(3, 170)  ;
LV_ModifyCol(4, 140)  ;
LV_ModifyCol(5, "50 Integer" "Integer Right")  ;
LV_ModifyCol(6, 0)  ;

Gui, Font, S12 CDefault W400, Malgun Gothic


Gui, Add, Button, x40 y+10 w80 h110  vL3_3 gL3_3, L3_3
Gui, Add, Button, x+4 w80 h110  vL3_2  gL3_2, L3_2
Gui, Add, Button, x+4 w80 h110  vL3_1 gL3_1, L3_1


Gui, Add, Button, x40 y+4 w80 h110  vL2_3 gL2_3, L2_3
Gui, Add, Button, x+4 w80 h110  vL2_2 gL2_2, L2_2
Gui, Add, Button, x+4 w80 h110  vL2_1 gL2_1, L2_1

Gui, Add, Button, x40 y+18 w80 h110  vL1_3 gL1_3, L1_3
Gui, Add, Button, x+4 w80 h110  vL1_2 gL1_2, L1_2
Gui, Add, Button, x+4 w80 h110  vL1_1 gL1_1, L1_1


Gui, Add, Button, x+8 y310 w150 h353 vM1_1 gM1_1, M1_1






k0열=520

Gui, Add, Button, x%k0열% y314 w103 h41 vJ2_3 gJ2_3, J2_3
Gui, Add, Button, x+8  w103 h41 vJ2_2 gJ2_2, J2_2
Gui, Add, Button, x+4  w103 h41 vJ2_1 gJ2_1, J2_1

Gui, Add, Button, x%k0열%  y+4 w103 h41 vJ1_3 gJ1_3, J1_3
Gui, Add, Button, x+8  w103 h41 vJ1_2 gJ1_2, J1_2
Gui, Add, Button, x+4  w103 h41 vJ1_1 gJ1_1, J1_1

k1열=520

Gui, Add, Button, x%k1열% y441 w60 h41 vK14_5 gK14_5, K14_5
Gui, Add, Button, x+8  w60 h41 vK14_4 gK14_4, K14_4
Gui, Add, Button, x+4  w60 h41 vK14_3 gK14_3, K14_3
Gui, Add, Button, x+4  w60 h41 vK14_2 gK14_2, K14_2
Gui, Add, Button, x+4  w60 h41 vK14_1 gK14_1, K14_1

Gui, Add, Button, x%k1열% y+4 w60 h41 vK13_5 gK13_5, K13_5
Gui, Add, Button, x+8  w60 h41 vK13_4 gK13_4, K13_4
Gui, Add, Button, x+4  w60 h41 vK13_3 gK13_3, K13_3
Gui, Add, Button, x+4  w60 h41 vK13_2 gK13_2, K13_2
Gui, Add, Button, x+4  w60 h41 vK13_1 gK13_1, K13_1

Gui, Add, Button, x%k1열% y+41 w60 h41 vK12_5 gK12_5, K12_5
Gui, Add, Button, x+8  w60 h41 vK12_4 gK12_4, K12_4
Gui, Add, Button, x+4  w60 h41 vK12_3 gK12_3, K12_3
Gui, Add, Button, x+4  w60 h41 vK12_2 gK12_2, K12_2
Gui, Add, Button, x+4  w60 h41 vK12_1 gK12_1, K12_1

Gui, Add, Button, x%k1열% y+4 w60 h41 vK11_5 gK11_5, K11_5
Gui, Add, Button, x+8  w60 h41 vK11_4 gK11_4, K11_4
Gui, Add, Button, x+4  w60 h41 vK11_3 gK11_3, K11_3
Gui, Add, Button, x+4  w60 h41 vK11_2 gK11_2, K11_2
Gui, Add, Button, x+4  w60 h41 vK11_1 gK11_1, K11_1


k2열=880
Gui, Add, Button, x%k2열% y60 w60 h41 vK10_5 gK10_5, K10_5
Gui, Add, Button, x+8  w60 h41 vK10_4 gK10_4, K10_4
Gui, Add, Button, x+4  w60 h41 vK10_3 gK10_3, K10_3
Gui, Add, Button, x+4  w60 h41 vK10_2 gK10_2, K10_2
Gui, Add, Button, x+4  w60 h41 vK10_1 gK10_1, K10_1

Gui, Add, Button, x%k2열% y+4 w60 h41 , K9_5
Gui, Add, Button, x+8  w60 h41 vK9_4 gK9_4, K9_4
Gui, Add, Button, x+4  w60 h41 vK9_3 gK9_3, K9_3
Gui, Add, Button, x+4  w60 h41 vK9_2 gK9_2, K9_2
Gui, Add, Button, x+4  w60 h41 vK9_1 gK9_1, K9_1

Gui, Add, Button, x+4 y+0 w60 h41 vI5_1 gI5_1, I5_1 ;;◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ 창문 쪽


Gui, Add, Button, x%k2열% y+0 w60 h41 vK8_5 gK8_5, K8_5
Gui, Add, Button, x+8  w60 h41 vK8_4 gK8_4, K8_4
Gui, Add, Button, x+4  w60 h41 vK8_3 gK8_3, K8_3
Gui, Add, Button, x+4  w60 h41 vK8_2 gK8_2, K8_2
Gui, Add, Button, x+4  w60 h41 vK8_1 gK8_1, K8_1

Gui, Add, Button, x%k2열% y+4 w60 h41 vK7_5 gK7_5, K7_5
Gui, Add, Button, x+8  w60 h41 vK7_4 gK7_4, K7_4
Gui, Add, Button, x+4  w60 h41 vK7_3 gK7_3, K7_3
Gui, Add, Button, x+4  w60 h41 vK7_2 gK7_2, K7_2
Gui, Add, Button, x+4  w60 h41 vK7_1 gK7_1, K7_1

Gui, Add, Button, x+4 y+0 w60 h41 vI4_1 gI4_1, I4_1 ;;◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ 창문 쪽

Gui, Add, Button, x%k2열% y+0 w60 h41 vK6_5 gK6_5, K6_5
Gui, Add, Button, x+8  w60 h41 vK6_4 gK6_4, K6_4
Gui, Add, Button, x+4  w60 h41 vK6_3 gK6_3, K6_3
Gui, Add, Button, x+4  w60 h41 vK6_2 gK6_2, K6_2
Gui, Add, Button, x+4  w60 h41 vK6_1 gK6_1, K6_1

Gui, Add, Button, x%k2열% y+4 w60 h41 vK5_5 gK5_5, K5_5
Gui, Add, Button, x+8  w60 h41 vK5_4 gK5_4, K5_4
Gui, Add, Button, x+4  w60 h41 vK5_3 gK5_3, K5_3
Gui, Add, Button, x+4  w60 h41 vK5_2 gK5_2, K5_2
Gui, Add, Button, x+4  w60 h41 vK5_1 gK5_1, K5_1

Gui, Add, Button, x+4 y+0 w60 h41 vI3_1 gI3_1, I3_1 ;;◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ 창문 쪽

Gui, Add, Button, x%k2열% y+0 w60 h41 vK4_5 gK4_5, K4_5
Gui, Add, Button, x+8  w60 h41 vK4_4 gK4_4, K4_4
Gui, Add, Button, x+4  w60 h41 vK4_3 gK4_3, K4_3
Gui, Add, Button, x+4  w60 h41 vK4_2 gK4_2 , K4_2
Gui, Add, Button, x+4  w60 h41 vK4_1 gK4_1 , K4_1

Gui, Add, Button, x%k2열% y+4 w60 h41 vK3_5 gK3_5, K3_5
Gui, Add, Button, x+8  w60 h41 vK3_4 gK3_4, K3_4
Gui, Add, Button, x+4  w60 h41 vK3_3 gK3_3, K3_3
Gui, Add, Button, x+4  w60 h41 vK3_2 gK3_2, K3_2
Gui, Add, Button, x+4  w60 h41 vK3_1 gK3_1, K3_1

Gui, Add, Button, x+4 y+0 w60 h41 vI2_1 gI2_1, I2_1 ;;◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ 창문 쪽

Gui, Add, Button, x%k2열% y+0 w60 h41 vK2_5 gK2_5, K2_5
Gui, Add, Button, x+8  w60 h41 vK2_4 gK2_4, K2_4
Gui, Add, Button, x+4  w60 h41 vK2_3 gK2_3, K2_3
Gui, Add, Button, x+4  w60 h41 vK2_2 gK2_2, K2_2
Gui, Add, Button, x+4  w60 h41 vK2_1 gK2_1, K2_1

Gui, Add, Button, x%k2열% y+4 w60 h41 vK1_5 gK1_5, K1_5
Gui, Add, Button, x+8  w60 h41 vK1_4 gK1_4, K1_4
Gui, Add, Button, x+4  w60 h41 vK1_3 gK1_3, K1_3
Gui, Add, Button, x+4  w60 h41 vK1_2 gK1_2, K1_2
Gui, Add, Button, x+4  w60 h41 vK1_1 gK1_1, K1_1

Gui, Add, Button, x+4 y+0 w60 h41 vI1_1 gI1_1, I1_1 ;;◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ ◀ ◁ 창문 쪽



;~ Gui, Add, Button, x+4  w30 h185 vK6_2 gK6_2, K6_2
;~ Gui, Add, Button, x+4  w30 h185 vK6_3 gK6_3, K6_3
;~ Gui, Add, Button, x+4  w30 h185 vK6_4 gK6_4, K6_4

;~ Gui, Add, Button, x+4  w30 h185 vK6_5 gK6_5, K6_5
;~ Gui, Add, Button, x+8  w30 h185 vK5_5 gK5_5, K5_5

;~ Gui, Add, Button, x+4 y60 w30 h185 vK5_4 gK5_4, K5_4
;~ Gui, Add, Button, x+4 w30 h185 vK5_3 gK5_3, K5_3
;~ Gui, Add, Button, x+4 w30 h185 vK5_2 gK5_2, K5_2
;~ Gui, Add, Button, x+4 w30 h185 vK5_1 gK5_1, K5_1

;~ Gui, Add, Button, x+20 y60 w30 h185 vK4_1 gK4_1, K4_1
;~ Gui, Add, Button, x+4 w30 h185 vK4_2 gK4_2, K4_2
;~ Gui, Add, Button, x+4 w30 h185 vK4_3 gK4_3, K4_3
;~ Gui, Add, Button, x+4 w30 h185 vK4_4 gK4_4, K4_4

;~ Gui, Add, Button, x+4 w30 h185 vK4_5 gK4_5, K4_5
;~ Gui, Add, Button, x+8 w30 h185 vK3_5 gK3_5, K3_5

;~ Gui, Add, Button, x+4 y60 w30 h185 vK3_4 gK3_4, K3_4
;~ Gui, Add, Button, x+4 w30 h185 vK3_3 gK3_3, K3_3
;~ Gui, Add, Button, x+4 w30 h185 vK3_2 gK3_2, K3_2
;~ Gui, Add, Button, x+4 w30 h185 vK3_1 gK3_1, K3_1

;~ Gui, Add, Button, x+20 y60 w30 h185 vK2_1 gK2_1, K2_1
;~ Gui, Add, Button, x+4 w30 h185 vK2_2 gK2_2, K2_2
;~ Gui, Add, Button, x+4 w30 h185 vK2_3 gK2_3, K2_3
;~ Gui, Add, Button, x+4 w30 h185 vK2_4 gK2_4, K2_4

;~ Gui, Add, Button, x+4 w232 w30 h185 vK2_5 gK2_5, K2_5
;~ Gui, Add, Button, x+8 w232 w30 h185 vK1_5 gK1_5, K1_5

;~ Gui, Add, Button, x+4 y60 w30 h185 vK1_4 gK1_4, K1_4
;~ Gui, Add, Button, x+4  w30 h185 vK1_3 gK1_3, K1_3
;~ Gui, Add, Button, x+4   w30 h185 vK1_2 gK1_2, K1_2
;~ Gui, Add, Button, x+4   w30 h185 vK1_1 gK1_1, K1_1



;~ Gui, Add, Button, x144 y250 w340 h25 vK6_0 gK6_0, K6_0
;~ Gui, Add, Button, x504 y254 w340 h25 vK4_0 gK4_0, K4_0
;~ Gui, Add, Button, x864 y254 w340 h25 vK2_0 gK2_0, K2_0






;~ 472, 392
Gui, Font, S28 CDefault W400 cred, Malgun Gothic
Gui, Add, text, x50 y200 W400 h55 vload2 backgroundtrans, Reading DataBase
Gui, Add, text, x872 y465 W0 h0 vshowlocation

Gui, Show, x-1200 y0 w1280 h730, %WINTITLE%

return

lv2:
return

LVlocation:
return

A8_3:
GuiControl, , showlocation, A8_3
gosub, LVlocation
return
A8_2:
GuiControl, , showlocation, A8_2
gosub, LVlocation
return
A8_1:
GuiControl, , showlocation, A8_1
gosub, LVlocation
return

A7_3:
GuiControl, , showlocation, A7_3
gosub, LVlocation
return
A7_2:
GuiControl, , showlocation, A7_2
gosub, LVlocation
return
A7_1:
GuiControl, , showlocation, A7_1
gosub, LVlocation
return
A7_0:
GuiControl, , showlocation, A7_0
gosub, LVlocation
return

A6_3:
GuiControl, , showlocation, A6_3
gosub, LVlocation
return
A6_2:
GuiControl, , showlocation, A6_2
gosub, LVlocation
return
A6_1:
GuiControl, , showlocation, A6_1
gosub, LVlocation
return
A6_0:
GuiControl, , showlocation, A6_0
gosub, LVlocation
return

A5_3:
GuiControl, , showlocation, A5_3
gosub, LVlocation
return
A5_2:
GuiControl, , showlocation, A5_2
gosub, LVlocation
return
A5_1:
GuiControl, , showlocation, A5_1
gosub, LVlocation
return

A4_3:
GuiControl, , showlocation, A4_3
gosub, LVlocation
return
A4_2:
GuiControl, , showlocation, A4_2
gosub, LVlocation
return
A4_1:
GuiControl, , showlocation, A4_1
gosub, LVlocation
return

A3_3:
GuiControl, , showlocation, A3_3
gosub, LVlocation
return
A3_2:
GuiControl, , showlocation, A3_2
gosub, LVlocation
return
A3_1:
GuiControl, , showlocation, A3_1
gosub, LVlocation
return

A2_3:
GuiControl, , showlocation, A2_3
gosub, LVlocation
return
A2_2:
GuiControl, , showlocation, A2_2
gosub, LVlocation
return
A2_1:
GuiControl, , showlocation, A2_1
gosub, LVlocation
return

A1_3:
GuiControl, , showlocation, A1_3
gosub, LVlocation
return
A1_2:
GuiControl, , showlocation, A1_2
gosub, LVlocation
return
A1_1:
GuiControl, , showlocation, A1_1
gosub, LVlocation
return







E2_3:
GuiControl, , showlocation, E2_3
gosub, LVlocation
return
E2_2:
GuiControl, , showlocation, E2_2
gosub, LVlocation
return
E2_1:
GuiControl, , showlocation, E2_1
gosub, LVlocation
return
E1_3:
GuiControl, , showlocation, E1_3
gosub, LVlocation
return

E1_2:
GuiControl, , showlocation, E1_2
gosub, LVlocation
return
E1_1:
GuiControl, , showlocation, E1_1
gosub, LVlocation
return
D1_1:
GuiControl, , showlocation, D1_1
gosub, LVlocation
return
D2_1:
GuiControl, , showlocation, D2_1
gosub, LVlocation
return

D3_1:
GuiControl, , showlocation, D3_1
gosub, LVlocation
return
C4_2:
GuiControl, , showlocation, C4_2
gosub, LVlocation
return
C3_2:
GuiControl, , showlocation, C3_2
gosub, LVlocation
return
C2_2:
GuiControl, , showlocation, C2_2
gosub, LVlocation
return


C6_2:
GuiControl, , showlocation, C6_2
gosub, LVlocation
return
C5_2:
GuiControl, , showlocation, C5_2
gosub, LVlocation
return
C1_2:
GuiControl, , showlocation, C1_2
gosub, LVlocation
return


C9_1:
GuiControl, , showlocation, C9_1
gosub, LVlocation
return
C8_1:
GuiControl, , showlocation, C8_1
gosub, LVlocation
return
C7_1:
GuiControl, , showlocation, C7_1
gosub, LVlocation
return
C9_2:
GuiControl, , showlocation, C9_2
gosub, LVlocation
return
C8_2:
GuiControl, , showlocation, C8_2
gosub, LVlocation
return
C7_2:
GuiControl, , showlocation, C7_2
gosub, LVlocation
return
C6_1:
GuiControl, , showlocation, C6_1
gosub, LVlocation
return

C5_1:
GuiControl, , showlocation, C5_1
gosub, LVlocation
return
C4_1:
GuiControl, , showlocation, C4_1
gosub, LVlocation
return
C3_1:
GuiControl, , showlocation, C3_1
gosub, LVlocation
return
C2_1:
GuiControl, , showlocation, C2_1
gosub, LVlocation
return

C1_1:
GuiControl, , showlocation, C1_1
gosub, LVlocation
return
F4_3:
GuiControl, , showlocation, F4_3
gosub, LVlocation
return
F4_2:
GuiControl, , showlocation, F4_2
gosub, LVlocation
return
F4_1:
GuiControl, , showlocation, F4_1
gosub, LVlocation
return
F4_0:
GuiControl, , showlocation, F4_1
gosub, LVlocation
return

F3_3:
GuiControl, , showlocation, F3_3
gosub, LVlocation
return
F3_2:
GuiControl, , showlocation, F3_2
gosub, LVlocation
return
F3_1:
GuiControl, , showlocation, F3_1
gosub, LVlocation
return
F3_0:
GuiControl, , showlocation, F3_1
gosub, LVlocation
return
F2_3:
GuiControl, , showlocation, F2_3
gosub, LVlocation
return

F2_2:
GuiControl, , showlocation, F2_2
gosub, LVlocation
return
F2_1:
GuiControl, , showlocation, F2_1
gosub, LVlocation
return
F2_0:
GuiControl, , showlocation, F2_1
gosub, LVlocation
return
F1_3:
GuiControl, , showlocation, F1_3
gosub, LVlocation
return
F1_2:
GuiControl, , showlocation, F1_2
gosub, LVlocation
return

F1_1:
GuiControl, , showlocation, F1_1
gosub, LVlocation
return
F1_0:
GuiControl, , showlocation, F1_1
gosub, LVlocation
return





I3_1:
GuiControl, , showlocation, I3_1
gosub, LVlocation
return

I3_2:
GuiControl, , showlocation, I3_2
gosub, LVlocation
return

I3_3:
GuiControl, , showlocation, I3_3
gosub, LVlocation
return

I2_1:
GuiControl, , showlocation, I2_1
gosub, LVlocation
return
I2_2:
GuiControl, , showlocation, I2_2
gosub, LVlocation
return
I2_3:
GuiControl, , showlocation, I2_3
gosub, LVlocation
return

I1_1:
GuiControl, , showlocation, I1_1
gosub, LVlocation
return
I1_2:
GuiControl, , showlocation, I1_2
gosub, LVlocation
return
I1_3:
GuiControl, , showlocation, I1_3
gosub, LVlocation
return






K1_1:
GuiControl, , showlocation, K1_1
gosub, LVlocation
return
K1_2:
GuiControl, , showlocation, K1_2
gosub, LVlocation
return
K1_3:
GuiControl, , showlocation, K1_3
gosub, LVlocation
return
K1_4:
GuiControl, , showlocation, K1_4
gosub, LVlocation
return
K2_0:
GuiControl, , showlocation, K2_0
gosub, LVlocation
return
K2_1:
GuiControl, , showlocation, K2_1
gosub, LVlocation
return
K2_2:
GuiControl, , showlocation, K2_2
gosub, LVlocation
return
K2_3:
GuiControl, , showlocation, K2_3
gosub, LVlocation
return
K2_4:
GuiControl, , showlocation, K2_4
gosub, LVlocation
return
K2_5:
GuiControl, , showlocation, K2_5
gosub, LVlocation
return
K1_5:
GuiControl, , showlocation, K2_5
gosub, LVlocation
return


K3_1:
GuiControl, , showlocation, K3_1
gosub, LVlocation
return
K3_2:
GuiControl, , showlocation, K3_2
gosub, LVlocation
return
K3_3:
GuiControl, , showlocation, K3_3
gosub, LVlocation
return
K3_4:
GuiControl, , showlocation, K3_4
gosub, LVlocation
return

K4_0:
GuiControl, , showlocation, K4_0
gosub, LVlocation
return
K4_1:
GuiControl, , showlocation, K4_1
gosub, LVlocation
return
K4_2:
GuiControl, , showlocation, K4_2
gosub, LVlocation
return
K4_3:
GuiControl, , showlocation, K4_3
gosub, LVlocation
return
K4_4:
GuiControl, , showlocation, K4_4
gosub, LVlocation
return
K4_5:
GuiControl, , showlocation, K4_5
gosub, LVlocation
return
K3_5:
GuiControl, , showlocation, K3_5
gosub, LVlocation
return

K5_1:
GuiControl, , showlocation, K5_1
gosub, LVlocation
return
K5_2:
GuiControl, , showlocation, K5_2
gosub, LVlocation
return
K5_3:
GuiControl, , showlocation, K5_3
gosub, LVlocation
return
K5_4:
GuiControl, , showlocation, K5_4
gosub, LVlocation
return

K6_0:
GuiControl, , showlocation, K6_0
gosub, LVlocation
return
K6_1:
GuiControl, , showlocation, K6_1
gosub, LVlocation
return
K6_2:
GuiControl, , showlocation, K6_2
gosub, LVlocation
return
K6_3:
GuiControl, , showlocation, K6_3
gosub, LVlocation
return
K6_4:
GuiControl, , showlocation, K6_4
gosub, LVlocation
return
K6_5:
GuiControl, , showlocation, K6_5
gosub, LVlocation
return

K5_5:
GuiControl, , showlocation, K5_5
gosub, LVlocation
return

K7_1:
GuiControl, , showlocation, K7_1
gosub, LVlocation
return
K7_2:
GuiControl, , showlocation, K7_2
gosub, LVlocation
return
;~ K8_1:
;~ GuiControl, , showlocation, K8_1
;~ gosub, LVlocation
;~ return
;~ K8_2:
;~ GuiControl, , showlocation, K8_2
;~ gosub, LVlocation
;~ return

L5_1:
GuiControl, , showlocation, L5_1
gosub, LVlocation
return
L4_1:
GuiControl, , showlocation, L4_1
gosub, LVlocation
return
L3_2:
GuiControl, , showlocation, L3_2
gosub, LVlocation
return
L2_2:
GuiControl, , showlocation, L2_2
gosub, LVlocation
return



L1_2:
GuiControl, , showlocation, L1_2
gosub, LVlocation
return
L1_1:
GuiControl, , showlocation, L1_1
gosub, LVlocation
return
L2_1:
GuiControl, , showlocation, L2_1
gosub, LVlocation
return
L3_1:
GuiControl, , showlocation, L3_1
gosub, LVlocation
return


F0_1:
GuiControl, , showlocation, F0_1
gosub, LVlocation
return
L3_3:
GuiControl, , showlocation, L3_3
gosub, LVlocation
return
L2_3:
GuiControl, , showlocation, L2_3
gosub, LVlocation
return
L1_3:
GuiControl, , showlocation, L1_3
gosub, LVlocation
return




M1_1:
GuiControl, , showlocation, M1_1
gosub, LVlocation
return

J1_1:
GuiControl, , showlocation, J1_1
gosub, LVlocation
return
return

J2_1:
GuiControl, , showlocation, J2_1
gosub, LVlocation
return
J2_2:
GuiControl, , showlocation, J2_2
gosub, LVlocation
return
J2_3:
GuiControl, , showlocation, J2_3
gosub, LVlocation
return

J4_1:
GuiControl, , showlocation, J4_1
gosub, LVlocation
return
J4_2:
GuiControl, , showlocation, J4_2
gosub, LVlocation
return
J4_3:
GuiControl, , showlocation, J4_3
gosub, LVlocation
return



J3_1:
GuiControl, , showlocation, J3_1
gosub, LVlocation
return
J3_2:
GuiControl, , showlocation, J3_2
gosub, LVlocation
return
J3_3:
GuiControl, , showlocation, J3_3
gosub, LVlocation
return
J3_4:
GuiControl, , showlocation, J3_4
gosub, LVlocation
return
J3_5:
GuiControl, , showlocation, J3_5
gosub, LVlocation
return
J3_6:
GuiControl, , showlocation, J3_6
gosub, LVlocation
return
H13_2:
GuiControl, , showlocation, H13_2
gosub, LVlocation
return
H14_1:
GuiControl, , showlocation, H14_1
gosub, LVlocation
return
G14_3:
GuiControl, , showlocation, G14_3
gosub, LVlocation
return





H12_2:
GuiControl, , showlocation, H12_2
gosub, LVlocation
return
H11_2:
GuiControl, , showlocation, H11_2
gosub, LVlocation
return
H10_2:
GuiControl, , showlocation, H10_2
gosub, LVlocation
return
G14_2:
GuiControl, , showlocation, G14_2
gosub, LVlocation
return

G14_1:
GuiControl, , showlocation, G14_1
gosub, LVlocation
return
H13_1:
GuiControl, , showlocation, H13_1
gosub, LVlocation
return
G13_3:
GuiControl, , showlocation, G13_3
gosub, LVlocation
return
H14_2:
GuiControl, , showlocation, H14_2
gosub, LVlocation
return



H14_3:
GuiControl, , showlocation, H14_3
gosub, LVlocation
return
H13_3:
GuiControl, , showlocation, H13_3
gosub, LVlocation
return
G13_2:
GuiControl, , showlocation, G13_2
gosub, LVlocation
return
G13_1:
GuiControl, , showlocation, G13_1
gosub, LVlocation
return


H12_3:
GuiControl, , showlocation, H12_3
gosub, LVlocation
return
H12_1:
GuiControl, , showlocation, H12_1
gosub, LVlocation
return
G12_3:
GuiControl, , showlocation, G12_3
gosub, LVlocation
return
G12_2:
GuiControl, , showlocation, G12_2
gosub, LVlocation
return


G12_1:
GuiControl, , showlocation, G12_1
gosub, LVlocation
return
H11_3:
GuiControl, , showlocation, H11_3
gosub, LVlocation
return
H11_1:
GuiControl, , showlocation, H11_1
gosub, LVlocation
return
G11_3:
GuiControl, , showlocation, G11_3
gosub, LVlocation
return


G11_2:
GuiControl, , showlocation, G11_2
gosub, LVlocation
return
G11_1:
GuiControl, , showlocation, G11_1
gosub, LVlocation
return
H10_3:
GuiControl, , showlocation, H10_3
gosub, LVlocation
return
H10_1:
GuiControl, , showlocation, H10_1
gosub, LVlocation
return




G10_3:
GuiControl, , showlocation, G10_3
gosub, LVlocation
return
G10_2:
GuiControl, , showlocation, G10_2
gosub, LVlocation
return
G10_1:
GuiControl, , showlocation, G10_1
gosub, LVlocation
return
H9_2:
GuiControl, , showlocation, H9_2
gosub, LVlocation
return



H8_2:
GuiControl, , showlocation, H8_2
gosub, LVlocation
return
H7_2:
GuiControl, , showlocation, H7_2
gosub, LVlocation
return
H5_2:
GuiControl, , showlocation, H5_2
gosub, LVlocation
return
H4_2:
GuiControl, , showlocation, H4_2
gosub, LVlocation
return




H3_2:
GuiControl, , showlocation, H3_2
gosub, LVlocation
return
H2_2:
GuiControl, , showlocation, H2_2
gosub, LVlocation
return
H1_2:
GuiControl, , showlocation, H1_2
gosub, LVlocation
return
H9_3:
GuiControl, , showlocation, H9_3
gosub, LVlocation
return




H9_1:
GuiControl, , showlocation, H9_1
gosub, LVlocation
return
G9_3:
GuiControl, , showlocation, G9_3
gosub, LVlocation
return
G9_2:
GuiControl, , showlocation, G9_2
gosub, LVlocation
return
G9_1:
GuiControl, , showlocation, G9_1
gosub, LVlocation
return



H8_3:
GuiControl, , showlocation, H8_3
gosub, LVlocation
return
H8_1:
GuiControl, , showlocation, H8_1
gosub, LVlocation
return
G8_3:
GuiControl, , showlocation, G8_3
gosub, LVlocation
return
G8_2:
GuiControl, , showlocation, G8_2
gosub, LVlocation
return


G8_1:
GuiControl, , showlocation, G8_1
gosub, LVlocation
return
H7_3:
GuiControl, , showlocation, H7_3
gosub, LVlocation
return
H7_1:
GuiControl, , showlocation, H7_1
gosub, LVlocation
return
G7_3:
GuiControl, , showlocation, G7_3
gosub, LVlocation
return

G7_2:
GuiControl, , showlocation, G7_2
gosub, LVlocation
return
G7_1:
GuiControl, , showlocation, G7_1
gosub, LVlocation
return
H6_3:
GuiControl, , showlocation, H6_3
gosub, LVlocation
return
H6_2:
GuiControl, , showlocation, H6_2
gosub, LVlocation
return



H6_1:
GuiControl, , showlocation, H6_1
gosub, LVlocation
return
G6_3:
GuiControl, , showlocation, G6_3
gosub, LVlocation
return
G6_2:
GuiControl, , showlocation, G6_2
gosub, LVlocation
return
G6_1:
GuiControl, , showlocation, G6_1
gosub, LVlocation
return




H5_3:
GuiControl, , showlocation, H5_3
gosub, LVlocation
return
H5_1:
GuiControl, , showlocation, H5_1
gosub, LVlocation
return
G5_3:
GuiControl, , showlocation, G5_3
gosub, LVlocation
return
G5_2:
GuiControl, , showlocation, G5_2
gosub, LVlocation
return




G5_1:
GuiControl, , showlocation, G5_1
gosub, LVlocation
return
H4_3:
GuiControl, , showlocation, H4_3
gosub, LVlocation
return
H4_1:
GuiControl, , showlocation, H4_1
gosub, LVlocation
return
H3_3:
GuiControl, , showlocation, H3_3
gosub, LVlocation
return

H3_1:
GuiControl, , showlocation, H3_1
gosub, LVlocation
return
G4_3:
GuiControl, , showlocation, G4_3
gosub, LVlocation
return
G4_2:
GuiControl, , showlocation, G4_2
gosub, LVlocation
return
G4_1:
GuiControl, , showlocation, G4_1
gosub, LVlocation
return

G3_3:
GuiControl, , showlocation, G3_3
gosub, LVlocation
return
G3_2:
GuiControl, , showlocation, G3_2
gosub, LVlocation
return
G3_1:
GuiControl, , showlocation, G3_1
gosub, LVlocation
return
H2_3:
GuiControl, , showlocation, H2_3
gosub, LVlocation
return




H2_1:
GuiControl, , showlocation, H2_1
gosub, LVlocation
return
G2_3:
GuiControl, , showlocation, G2_3
gosub, LVlocation
return
G2_2:
GuiControl, , showlocation, G2_2
gosub, LVlocation
return
G2_1:
GuiControl, , showlocation, G2_1
gosub, LVlocation
return



H1_3:
GuiControl, , showlocation, H1_3
gosub, LVlocation
return
H1_1:
GuiControl, , showlocation, H1_1
gosub, LVlocation
return
G1_3:
GuiControl, , showlocation, G1_3
gosub, LVlocation
return
G1_2:
GuiControl, , showlocation, G1_2
gosub, LVlocation
return
G1_1:
GuiControl, , showlocation, G1_1
gosub, LVlocation
return



G14_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G14_3_1
gosub, LVlocation
return
G14_3_2:
GuiControl, , showlocation, G14_3_2
gosub, LVlocation
return
G14_3_3:
GuiControl, , showlocation, G14_3_3
gosub, LVlocation
return
G14_3_4:
GuiControl, , showlocation, G14_3_4
gosub, LVlocation
return
G14_3_5:
GuiControl, , showlocation, G14_3_5
gosub, LVlocation
return
G14_3_6:
GuiControl, , showlocation, G14_3_6
gosub, LVlocation
return
G14_3_7:
GuiControl, , showlocation, G14_3_7
gosub, LVlocation
return
G14_3_8:
GuiControl, , showlocation, G14_3_8
gosub, LVlocation
return
G14_3_9:
GuiControl, , showlocation, G14_3_9
gosub, LVlocation
return
G14_3_10:
GuiControl, , showlocation, G14_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G13_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G13_3_1
gosub, LVlocation
return
G13_3_2:
GuiControl, , showlocation, G13_3_2
gosub, LVlocation
return
G13_3_3:
GuiControl, , showlocation, G13_3_3
gosub, LVlocation
return
G13_3_4:
GuiControl, , showlocation, G13_3_4
gosub, LVlocation
return
G13_3_5:
GuiControl, , showlocation, G13_3_5
gosub, LVlocation
return
G13_3_6:
GuiControl, , showlocation, G13_3_6
gosub, LVlocation
return
G13_3_7:
GuiControl, , showlocation, G13_3_7
gosub, LVlocation
return
G13_3_8:
GuiControl, , showlocation, G13_3_8
gosub, LVlocation
return
G13_3_9:
GuiControl, , showlocation, G13_3_9
gosub, LVlocation
return
G13_3_10:
GuiControl, , showlocation, G13_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


G12_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G12_3_1
gosub, LVlocation
return
G12_3_2:
GuiControl, , showlocation, G12_3_2
gosub, LVlocation
return
G12_3_3:
GuiControl, , showlocation, G12_3_3
gosub, LVlocation
return
G12_3_4:
GuiControl, , showlocation, G12_3_4
gosub, LVlocation
return
G12_3_5:
GuiControl, , showlocation, G12_3_5
gosub, LVlocation
return
G12_3_6:
GuiControl, , showlocation, G12_3_6
gosub, LVlocation
return
G12_3_7:
GuiControl, , showlocation, G12_3_7
gosub, LVlocation
return
G12_3_8:
GuiControl, , showlocation, G12_3_8
gosub, LVlocation
return
G12_3_9:
GuiControl, , showlocation, G12_3_9
gosub, LVlocation
return
G12_3_10:
GuiControl, , showlocation, G12_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G11_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G11_3_1
gosub, LVlocation
return
G11_3_2:
GuiControl, , showlocation, G11_3_2
gosub, LVlocation
return
G11_3_3:
GuiControl, , showlocation, G11_3_3
gosub, LVlocation
return
G11_3_4:
GuiControl, , showlocation, G11_3_4
gosub, LVlocation
return
G11_3_5:
GuiControl, , showlocation, G11_3_5
gosub, LVlocation
return
G11_3_6:
GuiControl, , showlocation, G11_3_6
gosub, LVlocation
return
G11_3_7:
GuiControl, , showlocation, G11_3_7
gosub, LVlocation
return
G11_3_8:
GuiControl, , showlocation, G11_3_8
gosub, LVlocation
return
G11_3_9:
GuiControl, , showlocation, G11_3_9
gosub, LVlocation
return
G11_3_10:
GuiControl, , showlocation, G11_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





G14_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G14_2_1
gosub, LVlocation
return
G14_2_2:
GuiControl, , showlocation, G14_2_2
gosub, LVlocation
return
G14_2_3:
GuiControl, , showlocation, G14_2_3
gosub, LVlocation
return
G14_2_4:
GuiControl, , showlocation, G14_2_4
gosub, LVlocation
return
G14_2_5:
GuiControl, , showlocation, G14_2_5
gosub, LVlocation
return
G14_2_6:
GuiControl, , showlocation, G14_2_6
gosub, LVlocation
return
G14_2_7:
GuiControl, , showlocation, G14_2_7
gosub, LVlocation
return
G14_2_8:
GuiControl, , showlocation, G14_2_8
gosub, LVlocation
return
G14_2_9:
GuiControl, , showlocation, G14_2_9
gosub, LVlocation
return
G14_2_10:
GuiControl, , showlocation, G14_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G13_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G13_2_1
gosub, LVlocation
return
G13_2_2:
GuiControl, , showlocation, G13_2_2
gosub, LVlocation
return
G13_2_3:
GuiControl, , showlocation, G13_2_3
gosub, LVlocation
return
G13_2_4:
GuiControl, , showlocation, G13_2_4
gosub, LVlocation
return
G13_2_5:
GuiControl, , showlocation, G13_2_5
gosub, LVlocation
return
G13_2_6:
GuiControl, , showlocation, G13_2_6
gosub, LVlocation
return
G13_2_7:
GuiControl, , showlocation, G13_2_7
gosub, LVlocation
return
G13_2_8:
GuiControl, , showlocation, G13_2_8
gosub, LVlocation
return
G13_2_9:
GuiControl, , showlocation, G13_2_9
gosub, LVlocation
return
G13_2_10:
GuiControl, , showlocation, G13_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


G12_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G12_2_1
gosub, LVlocation
return
G12_2_2:
GuiControl, , showlocation, G12_2_2
gosub, LVlocation
return
G12_2_3:
GuiControl, , showlocation, G12_2_3
gosub, LVlocation
return
G12_2_4:
GuiControl, , showlocation, G12_2_4
gosub, LVlocation
return
G12_2_5:
GuiControl, , showlocation, G12_2_5
gosub, LVlocation
return
G12_2_6:
GuiControl, , showlocation, G12_2_6
gosub, LVlocation
return
G12_2_7:
GuiControl, , showlocation, G12_2_7
gosub, LVlocation
return
G12_2_8:
GuiControl, , showlocation, G12_2_8
gosub, LVlocation
return
G12_2_9:
GuiControl, , showlocation, G12_2_9
gosub, LVlocation
return
G12_2_10:
GuiControl, , showlocation, G12_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G11_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G11_2_1
gosub, LVlocation
return
G11_2_2:
GuiControl, , showlocation, G11_2_2
gosub, LVlocation
return
G11_2_3:
GuiControl, , showlocation, G11_2_3
gosub, LVlocation
return
G11_2_4:
GuiControl, , showlocation, G11_2_4
gosub, LVlocation
return
G11_2_5:
GuiControl, , showlocation, G11_2_5
gosub, LVlocation
return
G11_2_6:
GuiControl, , showlocation, G11_2_6
gosub, LVlocation
return
G11_2_7:
GuiControl, , showlocation, G11_2_7
gosub, LVlocation
return
G11_2_8:
GuiControl, , showlocation, G11_2_8
gosub, LVlocation
return
G11_2_9:
GuiControl, , showlocation, G11_2_9
gosub, LVlocation
return
G11_2_10:
GuiControl, , showlocation, G11_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~






G14_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G14_1_1
gosub, LVlocation
return
G14_1_2:
GuiControl, , showlocation, G14_1_2
gosub, LVlocation
return
G14_1_3:
GuiControl, , showlocation, G14_1_3
gosub, LVlocation
return
G14_1_4:
GuiControl, , showlocation, G14_1_4
gosub, LVlocation
return
G14_1_5:
GuiControl, , showlocation, G14_1_5
gosub, LVlocation
return
G14_1_6:
GuiControl, , showlocation, G14_1_6
gosub, LVlocation
return
G14_1_7:
GuiControl, , showlocation, G14_1_7
gosub, LVlocation
return
G14_1_8:
GuiControl, , showlocation, G14_1_8
gosub, LVlocation
return
G14_1_9:
GuiControl, , showlocation, G14_1_9
gosub, LVlocation
return
G14_1_10:
GuiControl, , showlocation, G14_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G13_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G13_1_1
gosub, LVlocation
return
G13_1_2:
GuiControl, , showlocation, G13_1_2
gosub, LVlocation
return
G13_1_3:
GuiControl, , showlocation, G13_1_3
gosub, LVlocation
return
G13_1_4:
GuiControl, , showlocation, G13_1_4
gosub, LVlocation
return
G13_1_5:
GuiControl, , showlocation, G13_1_5
gosub, LVlocation
return
G13_1_6:
GuiControl, , showlocation, G13_1_6
gosub, LVlocation
return
G13_1_7:
GuiControl, , showlocation, G13_1_7
gosub, LVlocation
return
G13_1_8:
GuiControl, , showlocation, G13_1_8
gosub, LVlocation
return
G13_1_9:
GuiControl, , showlocation, G13_1_9
gosub, LVlocation
return
G13_1_10:
GuiControl, , showlocation, G13_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


G12_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G12_1_1
gosub, LVlocation
return
G12_1_2:
GuiControl, , showlocation, G12_1_2
gosub, LVlocation
return
G12_1_3:
GuiControl, , showlocation, G12_1_3
gosub, LVlocation
return
G12_1_4:
GuiControl, , showlocation, G12_1_4
gosub, LVlocation
return
G12_1_5:
GuiControl, , showlocation, G12_1_5
gosub, LVlocation
return
G12_1_6:
GuiControl, , showlocation, G12_1_6
gosub, LVlocation
return
G12_1_7:
GuiControl, , showlocation, G12_1_7
gosub, LVlocation
return
G12_1_8:
GuiControl, , showlocation, G12_1_8
gosub, LVlocation
return
G12_1_9:
GuiControl, , showlocation, G12_1_9
gosub, LVlocation
return
G12_1_10:
GuiControl, , showlocation, G12_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G11_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G11_1_1
gosub, LVlocation
return
G11_1_2:
GuiControl, , showlocation, G11_1_2
gosub, LVlocation
return
G11_1_3:
GuiControl, , showlocation, G11_1_3
gosub, LVlocation
return
G11_1_4:
GuiControl, , showlocation, G11_1_4
gosub, LVlocation
return
G11_1_5:
GuiControl, , showlocation, G11_1_5
gosub, LVlocation
return
G11_1_6:
GuiControl, , showlocation, G11_1_6
gosub, LVlocation
return
G11_1_7:
GuiControl, , showlocation, G11_1_7
gosub, LVlocation
return
G11_1_8:
GuiControl, , showlocation, G11_1_8
gosub, LVlocation
return
G11_1_9:
GuiControl, , showlocation, G11_1_9
gosub, LVlocation
return
G11_1_10:
GuiControl, , showlocation, G11_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







G10_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G10_3_1
gosub, LVlocation
return
G10_3_2:
GuiControl, , showlocation, G10_3_2
gosub, LVlocation
return
G10_3_3:
GuiControl, , showlocation, G10_3_3
gosub, LVlocation
return
G10_3_4:
GuiControl, , showlocation, G10_3_4
gosub, LVlocation
return
G10_3_5:
GuiControl, , showlocation, G10_3_5
gosub, LVlocation
return
G10_3_6:
GuiControl, , showlocation, G10_3_6
gosub, LVlocation
return
G10_3_7:
GuiControl, , showlocation, G10_3_7
gosub, LVlocation
return
G10_3_8:
GuiControl, , showlocation, G10_3_8
gosub, LVlocation
return
G10_3_9:
GuiControl, , showlocation, G10_3_9
gosub, LVlocation
return
G10_3_10:
GuiControl, , showlocation, G10_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G9_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G9_3_1
gosub, LVlocation
return
G9_3_2:
GuiControl, , showlocation, G9_3_2
gosub, LVlocation
return
G9_3_3:
GuiControl, , showlocation, G9_3_3
gosub, LVlocation
return
G9_3_4:
GuiControl, , showlocation, G9_3_4
gosub, LVlocation
return
G9_3_5:
GuiControl, , showlocation, G9_3_5
gosub, LVlocation
return
G9_3_6:
GuiControl, , showlocation, G9_3_6
gosub, LVlocation
return
G9_3_7:
GuiControl, , showlocation, G9_3_7
gosub, LVlocation
return
G9_3_8:
GuiControl, , showlocation, G9_3_8
gosub, LVlocation
return
G9_3_9:
GuiControl, , showlocation, G9_3_9
gosub, LVlocation
return
G9_3_10:
GuiControl, , showlocation, G9_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







G10_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G10_2_1
gosub, LVlocation
return
G10_2_2:
GuiControl, , showlocation, G10_2_2
gosub, LVlocation
return
G10_2_3:
GuiControl, , showlocation, G10_2_3
gosub, LVlocation
return
G10_2_4:
GuiControl, , showlocation, G10_2_4
gosub, LVlocation
return
G10_2_5:
GuiControl, , showlocation, G10_2_5
gosub, LVlocation
return
G10_2_6:
GuiControl, , showlocation, G10_2_6
gosub, LVlocation
return
G10_2_7:
GuiControl, , showlocation, G10_2_7
gosub, LVlocation
return
G10_2_8:
GuiControl, , showlocation, G10_2_8
gosub, LVlocation
return
G10_2_9:
GuiControl, , showlocation, G10_2_9
gosub, LVlocation
return
G10_2_10:
GuiControl, , showlocation, G10_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G9_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G9_2_1
gosub, LVlocation
return
G9_2_2:
GuiControl, , showlocation, G9_2_2
gosub, LVlocation
return
G9_2_3:
GuiControl, , showlocation, G9_2_3
gosub, LVlocation
return
G9_2_4:
GuiControl, , showlocation, G9_2_4
gosub, LVlocation
return
G9_2_5:
GuiControl, , showlocation, G9_2_5
gosub, LVlocation
return
G9_2_6:
GuiControl, , showlocation, G9_2_6
gosub, LVlocation
return
G9_2_7:
GuiControl, , showlocation, G9_2_7
gosub, LVlocation
return
G9_2_8:
GuiControl, , showlocation, G9_2_8
gosub, LVlocation
return
G9_2_9:
GuiControl, , showlocation, G9_2_9
gosub, LVlocation
return
G9_2_10:
GuiControl, , showlocation, G9_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~








G10_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G10_1_1
gosub, LVlocation
return
G10_1_2:
GuiControl, , showlocation, G10_1_2
gosub, LVlocation
return
G10_1_3:
GuiControl, , showlocation, G10_1_3
gosub, LVlocation
return
G10_1_4:
GuiControl, , showlocation, G10_1_4
gosub, LVlocation
return
G10_1_5:
GuiControl, , showlocation, G10_1_5
gosub, LVlocation
return
G10_1_6:
GuiControl, , showlocation, G10_1_6
gosub, LVlocation
return
G10_1_7:
GuiControl, , showlocation, G10_1_7
gosub, LVlocation
return
G10_1_8:
GuiControl, , showlocation, G10_1_8
gosub, LVlocation
return
G10_1_9:
GuiControl, , showlocation, G10_1_9
gosub, LVlocation
return
G10_1_10:
GuiControl, , showlocation, G10_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G9_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G9_1_1
gosub, LVlocation
return
G9_1_2:
GuiControl, , showlocation, G9_1_2
gosub, LVlocation
return
G9_1_3:
GuiControl, , showlocation, G9_1_3
gosub, LVlocation
return
G9_1_4:
GuiControl, , showlocation, G9_1_4
gosub, LVlocation
return
G9_1_5:
GuiControl, , showlocation, G9_1_5
gosub, LVlocation
return
G9_1_6:
GuiControl, , showlocation, G9_1_6
gosub, LVlocation
return
G9_1_7:
GuiControl, , showlocation, G9_1_7
gosub, LVlocation
return
G9_1_8:
GuiControl, , showlocation, G9_1_8
gosub, LVlocation
return
G9_1_9:
GuiControl, , showlocation, G9_1_9
gosub, LVlocation
return
G9_1_10:
GuiControl, , showlocation, G9_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







G8_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G8_3_1
gosub, LVlocation
return
G8_3_2:
GuiControl, , showlocation, G8_3_2
gosub, LVlocation
return
G8_3_3:
GuiControl, , showlocation, G8_3_3
gosub, LVlocation
return
G8_3_4:
GuiControl, , showlocation, G8_3_4
gosub, LVlocation
return
G8_3_5:
GuiControl, , showlocation, G8_3_5
gosub, LVlocation
return
G8_3_6:
GuiControl, , showlocation, G8_3_6
gosub, LVlocation
return
G8_3_7:
GuiControl, , showlocation, G8_3_7
gosub, LVlocation
return
G8_3_8:
GuiControl, , showlocation, G8_3_8
gosub, LVlocation
return
G8_3_9:
GuiControl, , showlocation, G8_3_9
gosub, LVlocation
return
G8_3_10:
GuiControl, , showlocation, G8_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G7_3_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G7_3_1
gosub, LVlocation
return
G7_3_2:
GuiControl, , showlocation, G7_3_2
gosub, LVlocation
return
G7_3_3:
GuiControl, , showlocation, G7_3_3
gosub, LVlocation
return
G7_3_4:
GuiControl, , showlocation, G7_3_4
gosub, LVlocation
return
G7_3_5:
GuiControl, , showlocation, G7_3_5
gosub, LVlocation
return
G7_3_6:
GuiControl, , showlocation, G7_3_6
gosub, LVlocation
return
G7_3_7:
GuiControl, , showlocation, G7_3_7
gosub, LVlocation
return
G7_3_8:
GuiControl, , showlocation, G7_3_8
gosub, LVlocation
return
G7_3_9:
GuiControl, , showlocation, G7_3_9
gosub, LVlocation
return
G7_3_10:
GuiControl, , showlocation, G7_3_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







G8_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G8_2_1
gosub, LVlocation
return
G8_2_2:
GuiControl, , showlocation, G8_2_2
gosub, LVlocation
return
G8_2_3:
GuiControl, , showlocation, G8_2_3
gosub, LVlocation
return
G8_2_4:
GuiControl, , showlocation, G8_2_4
gosub, LVlocation
return
G8_2_5:
GuiControl, , showlocation, G8_2_5
gosub, LVlocation
return
G8_2_6:
GuiControl, , showlocation, G8_2_6
gosub, LVlocation
return
G8_2_7:
GuiControl, , showlocation, G8_2_7
gosub, LVlocation
return
G8_2_8:
GuiControl, , showlocation, G8_2_8
gosub, LVlocation
return
G8_2_9:
GuiControl, , showlocation, G8_2_9
gosub, LVlocation
return
G8_2_10:
GuiControl, , showlocation, G8_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G7_2_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G7_2_1
gosub, LVlocation
return
G7_2_2:
GuiControl, , showlocation, G7_2_2
gosub, LVlocation
return
G7_2_3:
GuiControl, , showlocation, G7_2_3
gosub, LVlocation
return
G7_2_4:
GuiControl, , showlocation, G7_2_4
gosub, LVlocation
return
G7_2_5:
GuiControl, , showlocation, G7_2_5
gosub, LVlocation
return
G7_2_6:
GuiControl, , showlocation, G7_2_6
gosub, LVlocation
return
G7_2_7:
GuiControl, , showlocation, G7_2_7
gosub, LVlocation
return
G7_2_8:
GuiControl, , showlocation, G7_2_8
gosub, LVlocation
return
G7_2_9:
GuiControl, , showlocation, G7_2_9
gosub, LVlocation
return
G7_2_10:
GuiControl, , showlocation, G7_2_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~








G8_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G8_1_1
gosub, LVlocation
return
G8_1_2:
GuiControl, , showlocation, G8_1_2
gosub, LVlocation
return
G8_1_3:
GuiControl, , showlocation, G8_1_3
gosub, LVlocation
return
G8_1_4:
GuiControl, , showlocation, G8_1_4
gosub, LVlocation
return
G8_1_5:
GuiControl, , showlocation, G8_1_5
gosub, LVlocation
return
G8_1_6:
GuiControl, , showlocation, G8_1_6
gosub, LVlocation
return
G8_1_7:
GuiControl, , showlocation, G8_1_7
gosub, LVlocation
return
G8_1_8:
GuiControl, , showlocation, G8_1_8
gosub, LVlocation
return
G8_1_9:
GuiControl, , showlocation, G8_1_9
gosub, LVlocation
return
G8_1_10:
GuiControl, , showlocation, G8_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

G7_1_1: ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GuiControl, , showlocation, G7_1_1
gosub, LVlocation
return
G7_1_2:
GuiControl, , showlocation, G7_1_2
gosub, LVlocation
return
G7_1_3:
GuiControl, , showlocation, G7_1_3
gosub, LVlocation
return
G7_1_4:
GuiControl, , showlocation, G7_1_4
gosub, LVlocation
return
G7_1_5:
GuiControl, , showlocation, G7_1_5
gosub, LVlocation
return
G7_1_6:
GuiControl, , showlocation, G7_1_6
gosub, LVlocation
return
G7_1_7:
GuiControl, , showlocation, G7_1_7
gosub, LVlocation
return
G7_1_8:
GuiControl, , showlocation, G7_1_8
gosub, LVlocation
return
G7_1_9:
GuiControl, , showlocation, G7_1_9
gosub, LVlocation
return
G7_1_10:
GuiControl, , showlocation, G7_1_10
gosub, LVlocation
return ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


J4_4_1:
GuiControl, , showlocation, J4_4_1
gosub, LVlocation
return

J4_3_1:
GuiControl, , showlocation, J4_3_1
gosub, LVlocation
return
J4_3_2:
GuiControl, , showlocation, J4_3_2
gosub, LVlocation
return
J4_3_3:
GuiControl, , showlocation, J4_3_3
gosub, LVlocation
return
J4_3_4:
GuiControl, , showlocation, J4_3_4
gosub, LVlocation
return
J4_3_5:
GuiControl, , showlocation, J4_3_5
gosub, LVlocation
return

J4_2_1:
GuiControl, , showlocation, J4_2_1
gosub, LVlocation
return
J4_2_2:
GuiControl, , showlocation, J4_2_2
gosub, LVlocation
return
J4_2_3:
GuiControl, , showlocation, J4_2_3
gosub, LVlocation
return
J4_2_4:
GuiControl, , showlocation, J4_2_4
gosub, LVlocation
return
J4_2_5:
GuiControl, , showlocation, J4_2_5
gosub, LVlocation
return

J4_1_1:
GuiControl, , showlocation, J4_1_1
gosub, LVlocation
return
J4_1_2:
GuiControl, , showlocation, J4_1_2
gosub, LVlocation
return
J4_1_3:
GuiControl, , showlocation, J4_1_3
gosub, LVlocation
return
J4_1_4:
GuiControl, , showlocation, J4_1_4
gosub, LVlocation
return
J4_1_5:
GuiControl, , showlocation, J4_1_5
gosub, LVlocation
return




; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


J2_4_1:
GuiControl, , showlocation, J2_4_1
gosub, LVlocation
return

J2_3_1:
GuiControl, , showlocation, J2_3_1
gosub, LVlocation
return
J2_3_2:
GuiControl, , showlocation, J2_3_2
gosub, LVlocation
return
J2_3_3:
GuiControl, , showlocation, J2_3_3
gosub, LVlocation
return
J2_3_4:
GuiControl, , showlocation, J2_3_4
gosub, LVlocation
return
J2_3_5:
GuiControl, , showlocation, J2_3_5
gosub, LVlocation
return

J2_2_1:
GuiControl, , showlocation, J2_2_1
gosub, LVlocation
return
J2_2_2:
GuiControl, , showlocation, J2_2_2
gosub, LVlocation
return
J2_2_3:
GuiControl, , showlocation, J2_2_3
gosub, LVlocation
return
J2_2_4:
GuiControl, , showlocation, J2_2_4
gosub, LVlocation
return
J2_2_5:
GuiControl, , showlocation, J2_2_5
gosub, LVlocation
return

J2_1_1:
GuiControl, , showlocation, J2_1_1
gosub, LVlocation
return
J2_1_2:
GuiControl, , showlocation, J2_1_2
gosub, LVlocation
return
J2_1_3:
GuiControl, , showlocation, J2_1_3
gosub, LVlocation
return
J2_1_4:
GuiControl, , showlocation, J2_1_4
gosub, LVlocation
return
J2_1_5:
GuiControl, , showlocation, J2_1_5
gosub, LVlocation
return




; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


J3_5_1:
GuiControl, , showlocation, J3_5_1
gosub, LVlocation
return
J3_5_2:
GuiControl, , showlocation, J3_5_2
gosub, LVlocation
return
J3_5_3:
GuiControl, , showlocation, J3_5_3
gosub, LVlocation

J3_4_1:
GuiControl, , showlocation, J3_4_1
gosub, LVlocation
return
J3_4_2:
GuiControl, , showlocation, J3_4_2
gosub, LVlocation
return
J3_4_3:
GuiControl, , showlocation, J3_4_3
gosub, LVlocation

J3_3_1:
GuiControl, , showlocation, J3_3_1
gosub, LVlocation
return
J3_3_2:
GuiControl, , showlocation, J3_3_2
gosub, LVlocation
return
J3_3_3:
GuiControl, , showlocation, J3_3_3
gosub, LVlocation

J3_2_1:
GuiControl, , showlocation, J3_2_1
gosub, LVlocation
return
J3_2_2:
GuiControl, , showlocation, J3_2_2
gosub, LVlocation
return
J3_2_3:
GuiControl, , showlocation, J3_2_3
gosub, LVlocation
return

J3_1_1:
GuiControl, , showlocation, J3_1_1
gosub, LVlocation
return
J3_1_2:
GuiControl, , showlocation, J3_1_2
gosub, LVlocation
return
J3_1_3:
GuiControl, , showlocation, J3_1_3
gosub, LVlocation
return

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


I3_4_3:
GuiControl, , showlocation, I3_4_3
gosub, LVlocation
return
I2_4_2:
GuiControl, , showlocation, I2_4_2
gosub, LVlocation
return
I1_4_1:
GuiControl, , showlocation, I1_4_1
gosub, LVlocation

I3_3_3:
GuiControl, , showlocation, I3_3_3
gosub, LVlocation
return
I2_3_2:
GuiControl, , showlocation, I2_3_2
gosub, LVlocation
return
I1_3_1:
GuiControl, , showlocation, I1_3_1
gosub, LVlocation

I3_2_3:
GuiControl, , showlocation, I3_2_3
gosub, LVlocation
return
I2_2_2:
GuiControl, , showlocation, I2_2_2
gosub, LVlocation
return
I1_2_1:
GuiControl, , showlocation, I1_2_1
gosub, LVlocation
return

I3_1_3:
GuiControl, , showlocation, I3_1_3
gosub, LVlocation
return
I2_1_2:
GuiControl, , showlocation, I2_1_2
gosub, LVlocation
return
I1_1_1:
GuiControl, , showlocation,  I1_1_1
gosub, LVlocation
return

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




N5_1:
GuiControl, , showlocation, N5_1
gosub, LVlocation
return

N4_1:
GuiControl, , showlocation, N4_1
gosub, LVlocation
return

N3_1:
GuiControl, , showlocation, N3_1
gosub, LVlocation
return

N2_1:
GuiControl, , showlocation, N2_1
gosub, LVlocation
return

N1_1:
GuiControl, , showlocation, N1_1
gosub, LVlocation
return


O4_1:
GuiControl, , showlocation, O4_1
gosub, LVlocation
return

O3_1:
GuiControl, , showlocation, O3_1
gosub, LVlocation
return

O2_1:
GuiControl, , showlocation, O2_1
gosub, LVlocation
return

O1_1:
GuiControl, , showlocation, O1_1
gosub, LVlocation
return

P6_1:
GuiControl, , showlocation, P6_1
gosub, LVlocation
return
P5_1:
GuiControl, , showlocation, P5_1
gosub, LVlocation
return
P4_1:
GuiControl, , showlocation, P4_1
gosub, LVlocation
return
P3_1:
GuiControl, , showlocation, P3_1
gosub, LVlocation
return
P2_1:
GuiControl, , showlocation, P2_1
gosub, LVlocation
return
P1_1:
GuiControl, , showlocation, P1_1
gosub, LVlocation
return

Q3_1:
GuiControl, , showlocation, Q3_1
gosub, LVlocation
return
Q2_1:
GuiControl, , showlocation, Q2_1
gosub, LVlocation
return
Q1_1:
GuiControl, , showlocation, Q1_1
gosub, LVlocation
return



R3_1:
GuiControl, , showlocation, R3_1
gosub, LVlocation
return
R2_1:
GuiControl, , showlocation, R2_1
gosub, LVlocation
return
R1_1:
GuiControl, , showlocation, R1_1
gosub, LVlocation
return



 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;



K1_1_1:
GuiControl, , showlocation, K1_1_1
gosub, LVlocation
return
K1_1_2:
GuiControl, , showlocation, K1_1_2
gosub, LVlocation
return
K1_1_3:
GuiControl, , showlocation, K1_1_3
gosub, LVlocation
return
K1_1_4:
GuiControl, , showlocation, K1_1_4
gosub, LVlocation
return
K1_2_1:
GuiControl, , showlocation, K1_2_1
gosub, LVlocation
return
K1_2_2:
GuiControl, , showlocation, K1_2_2
gosub, LVlocation
return
K1_2_3:
GuiControl, , showlocation, K1_2_3
gosub, LVlocation
return
K1_2_4:
GuiControl, , showlocation, K1_2_4
gosub, LVlocation
return
K1_3_1:
GuiControl, , showlocation, K1_3_1
gosub, LVlocation
return
K1_3_2:
GuiControl, , showlocation, K1_3_2
gosub, LVlocation
return
K1_3_3:
GuiControl, , showlocation, K1_3_3
gosub, LVlocation
return
K1_3_4:
GuiControl, , showlocation, K1_3_4
gosub, LVlocation
return
K1_4_1:
GuiControl, , showlocation, K1_4_1
gosub, LVlocation
return
K1_4_2:
GuiControl, , showlocation, K1_4_2
gosub, LVlocation
return
K1_4_3:
GuiControl, , showlocation, K1_4_3
gosub, LVlocation
return
K1_4_4:
GuiControl, , showlocation, K1_4_4
gosub, LVlocation
return
K1_5_1:
GuiControl, , showlocation, K1_5_1
gosub, LVlocation
return


K2_1_1:
GuiControl, , showlocation, K2_1_1
gosub, LVlocation
return
K2_1_2:
GuiControl, , showlocation, K2_1_2
gosub, LVlocation
return
K2_1_3:
GuiControl, , showlocation, K2_1_3
gosub, LVlocation
return
K2_1_4:
GuiControl, , showlocation, K2_1_4
gosub, LVlocation
return
K2_2_1:
GuiControl, , showlocation, K2_2_1
gosub, LVlocation
return
K2_2_2:
GuiControl, , showlocation, K2_2_2
gosub, LVlocation
return
K2_2_3:
GuiControl, , showlocation, K2_2_3
gosub, LVlocation
return
K2_2_4:
GuiControl, , showlocation, K2_2_4
gosub, LVlocation
return
K2_3_1:
GuiControl, , showlocation, K2_3_1
gosub, LVlocation
return
K2_3_2:
GuiControl, , showlocation, K2_3_2
gosub, LVlocation
return
K2_3_3:
GuiControl, , showlocation, K2_3_3
gosub, LVlocation
return
K2_3_4:
GuiControl, , showlocation, K2_3_4
gosub, LVlocation
return
K2_4_1:
GuiControl, , showlocation, K2_4_1
gosub, LVlocation
return
K2_4_2:
GuiControl, , showlocation, K2_4_2
gosub, LVlocation
return
K2_4_3:
GuiControl, , showlocation, K2_4_3
gosub, LVlocation
return
K2_4_4:
GuiControl, , showlocation, K2_4_4
gosub, LVlocation
return
K2_5_1:
GuiControl, , showlocation, K2_5_1
gosub, LVlocation
return



K3_1_1:
GuiControl, , showlocation, K3_1_1
gosub, LVlocation
return
K3_1_2:
GuiControl, , showlocation, K3_1_2
gosub, LVlocation
return
K3_1_3:
GuiControl, , showlocation, K3_1_3
gosub, LVlocation
return
K3_1_4:
GuiControl, , showlocation, K3_1_4
gosub, LVlocation
return
K3_2_1:
GuiControl, , showlocation, K3_2_1
gosub, LVlocation
return
K3_2_2:
GuiControl, , showlocation, K3_2_2
gosub, LVlocation
return
K3_2_3:
GuiControl, , showlocation, K3_2_3
gosub, LVlocation
return
K3_2_4:
GuiControl, , showlocation, K3_2_4
gosub, LVlocation
return
K3_3_1:
GuiControl, , showlocation, K3_3_1
gosub, LVlocation
return
K3_3_2:
GuiControl, , showlocation, K3_3_2
gosub, LVlocation
return
K3_3_3:
GuiControl, , showlocation, K3_3_3
gosub, LVlocation
return
K3_3_4:
GuiControl, , showlocation, K3_3_4
gosub, LVlocation
return
K3_4_1:
GuiControl, , showlocation, K3_4_1
gosub, LVlocation
return
K3_4_2:
GuiControl, , showlocation, K3_4_2
gosub, LVlocation
return
K3_4_3:
GuiControl, , showlocation, K3_4_3
gosub, LVlocation
return
K3_4_4:
GuiControl, , showlocation, K3_4_4
gosub, LVlocation
return
K3_5_1:
GuiControl, , showlocation, K3_5_1
gosub, LVlocation
return


K4_1_1:
GuiControl, , showlocation, K4_1_1
gosub, LVlocation
return
K4_1_2:
GuiControl, , showlocation, K4_1_2
gosub, LVlocation
return
K4_1_3:
GuiControl, , showlocation, K4_1_3
gosub, LVlocation
return
K4_1_4:
GuiControl, , showlocation, K4_1_4
gosub, LVlocation
return
K4_2_1:
GuiControl, , showlocation, K4_2_1
gosub, LVlocation
return
K4_2_2:
GuiControl, , showlocation, K4_2_2
gosub, LVlocation
return
K4_2_3:
GuiControl, , showlocation, K4_2_3
gosub, LVlocation
return
K4_2_4:
GuiControl, , showlocation, K4_2_4
gosub, LVlocation
return
K4_3_1:
GuiControl, , showlocation, K4_3_1
gosub, LVlocation
return
K4_3_2:
GuiControl, , showlocation, K4_3_2
gosub, LVlocation
return
K4_3_3:
GuiControl, , showlocation, K4_3_3
gosub, LVlocation
return
K4_3_4:
GuiControl, , showlocation, K4_3_4
gosub, LVlocation
return
K4_4_1:
GuiControl, , showlocation, K4_4_1
gosub, LVlocation
return
K4_4_2:
GuiControl, , showlocation, K4_4_2
gosub, LVlocation
return
K4_4_3:
GuiControl, , showlocation, K4_4_3
gosub, LVlocation
return
K4_4_4:
GuiControl, , showlocation, K4_4_4
gosub, LVlocation
return
K4_5_1:
GuiControl, , showlocation, K4_5_1
gosub, LVlocation
return



K5_1_1:
GuiControl, , showlocation, K5_1_1
gosub, LVlocation
return
K5_1_2:
GuiControl, , showlocation, K5_1_2
gosub, LVlocation
return
K5_1_3:
GuiControl, , showlocation, K5_1_3
gosub, LVlocation
return
K5_1_4:
GuiControl, , showlocation, K5_1_4
gosub, LVlocation
return
K5_2_1:
GuiControl, , showlocation, K5_2_1
gosub, LVlocation
return
K5_2_2:
GuiControl, , showlocation, K5_2_2
gosub, LVlocation
return
K5_2_3:
GuiControl, , showlocation, K5_2_3
gosub, LVlocation
return
K5_2_4:
GuiControl, , showlocation, K5_2_4
gosub, LVlocation
return
K5_3_1:
GuiControl, , showlocation, K5_3_1
gosub, LVlocation
return
K5_3_2:
GuiControl, , showlocation, K5_3_2
gosub, LVlocation
return
K5_3_3:
GuiControl, , showlocation, K5_3_3
gosub, LVlocation
return
K5_3_4:
GuiControl, , showlocation, K5_3_4
gosub, LVlocation
return
K5_4_1:
GuiControl, , showlocation, K5_4_1
gosub, LVlocation
return
K5_4_2:
GuiControl, , showlocation, K5_4_2
gosub, LVlocation
return
K5_4_3:
GuiControl, , showlocation, K5_4_3
gosub, LVlocation
return
K5_4_4:
GuiControl, , showlocation, K5_4_4
gosub, LVlocation
return
K5_5_1:
GuiControl, , showlocation, K5_5_1
gosub, LVlocation
return


K6_1_1:
GuiControl, , showlocation, K6_1_1
gosub, LVlocation
return
K6_1_2:
GuiControl, , showlocation, K6_1_2
gosub, LVlocation
return
K6_1_3:
GuiControl, , showlocation, K6_1_3
gosub, LVlocation
return
K6_1_4:
GuiControl, , showlocation, K6_1_4
gosub, LVlocation
return
K6_2_1:
GuiControl, , showlocation, K6_2_1
gosub, LVlocation
return
K6_2_2:
GuiControl, , showlocation, K6_2_2
gosub, LVlocation
return
K6_2_3:
GuiControl, , showlocation, K6_2_3
gosub, LVlocation
return
K6_2_4:
GuiControl, , showlocation, K6_2_4
gosub, LVlocation
return
K6_3_1:
GuiControl, , showlocation, K6_3_1
gosub, LVlocation
return
K6_3_2:
GuiControl, , showlocation, K6_3_2
gosub, LVlocation
return
K6_3_3:
GuiControl, , showlocation, K6_3_3
gosub, LVlocation
return
K6_3_4:
GuiControl, , showlocation, K6_3_4
gosub, LVlocation
return
K6_4_1:
GuiControl, , showlocation, K6_4_1
gosub, LVlocation
return
K6_4_2:
GuiControl, , showlocation, K6_4_2
gosub, LVlocation
return
K6_4_3:
GuiControl, , showlocation, K6_4_3
gosub, LVlocation
return
K6_4_4:
GuiControl, , showlocation, K6_4_4
gosub, LVlocation
return
K6_5_1:
GuiControl, , showlocation, K6_5_1
gosub, LVlocation
return



 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
 ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

K7_1_1:
GuiControl, , showlocation, K7_1_1
gosub, LVlocation
return
K7_1_2:
GuiControl, , showlocation, K7_1_2
gosub, LVlocation
return
K7_1_3:
GuiControl, , showlocation, K7_1_3
gosub, LVlocation
return
K7_1_4:
GuiControl, , showlocation, K7_1_4
gosub, LVlocation
return
K7_2_1:
GuiControl, , showlocation, K7_2_1
gosub, LVlocation
return
K7_2_2:
GuiControl, , showlocation, K7_2_2
gosub, LVlocation
return
K7_2_3:
GuiControl, , showlocation, K7_2_3
gosub, LVlocation
return
K7_2_4:
GuiControl, , showlocation, K7_2_4
gosub, LVlocation
return
K7_3_1:
GuiControl, , showlocation, K7_3_1
gosub, LVlocation
return
K7_3_2:
GuiControl, , showlocation, K7_3_2
gosub, LVlocation
return
K7_3_3:
GuiControl, , showlocation, K7_3_3
gosub, LVlocation
return
K7_3_4:
GuiControl, , showlocation, K7_3_4
gosub, LVlocation
return
K7_4_1:
GuiControl, , showlocation, K7_4_1
gosub, LVlocation
return
K7_4_2:
GuiControl, , showlocation, K7_4_2
gosub, LVlocation
return
K7_4_3:
GuiControl, , showlocation, K7_4_3
gosub, LVlocation
return
K7_4_4:
GuiControl, , showlocation, K7_4_4
gosub, LVlocation
return
K7_5_1:
GuiControl, , showlocation, K7_5_1
gosub, LVlocation
return


K8_1_1:
GuiControl, , showlocation, K8_1_1
gosub, LVlocation
return
K8_1_2:
GuiControl, , showlocation, K8_1_2
gosub, LVlocation
return
K8_1_3:
GuiControl, , showlocation, K8_1_3
gosub, LVlocation
return
K8_1_4:
GuiControl, , showlocation, K8_1_4
gosub, LVlocation
return
K8_2_1:
GuiControl, , showlocation, K8_2_1
gosub, LVlocation
return
K8_2_2:
GuiControl, , showlocation, K8_2_2
gosub, LVlocation
return
K8_2_3:
GuiControl, , showlocation, K8_2_3
gosub, LVlocation
return
K8_2_4:
GuiControl, , showlocation, K8_2_4
gosub, LVlocation
return
K8_3_1:
GuiControl, , showlocation, K8_3_1
gosub, LVlocation
return
K8_3_2:
GuiControl, , showlocation, K8_3_2
gosub, LVlocation
return
K8_3_3:
GuiControl, , showlocation, K8_3_3
gosub, LVlocation
return
K8_3_4:
GuiControl, , showlocation, K8_3_4
gosub, LVlocation
return
K8_4_1:
GuiControl, , showlocation, K8_4_1
gosub, LVlocation
return
K8_4_2:
GuiControl, , showlocation, K8_4_2
gosub, LVlocation
return
K8_4_3:
GuiControl, , showlocation, K8_4_3
gosub, LVlocation
return
K8_4_4:
GuiControl, , showlocation, K8_4_4
gosub, LVlocation
return
K8_5_1:
GuiControl, , showlocation, K8_5_1
gosub, LVlocation
return



K9_1_1:
GuiControl, , showlocation, K9_1_1
gosub, LVlocation
return
K9_1_2:
GuiControl, , showlocation, K9_1_2
gosub, LVlocation
return
K9_1_3:
GuiControl, , showlocation, K9_1_3
gosub, LVlocation
return
K9_1_4:
GuiControl, , showlocation, K9_1_4
gosub, LVlocation
return
K9_2_1:
GuiControl, , showlocation, K9_2_1
gosub, LVlocation
return
K9_2_2:
GuiControl, , showlocation, K9_2_2
gosub, LVlocation
return
K9_2_3:
GuiControl, , showlocation, K9_2_3
gosub, LVlocation
return
K9_2_4:
GuiControl, , showlocation, K9_2_4
gosub, LVlocation
return
K9_3_1:
GuiControl, , showlocation, K9_3_1
gosub, LVlocation
return
K9_3_2:
GuiControl, , showlocation, K9_3_2
gosub, LVlocation
return
K9_3_3:
GuiControl, , showlocation, K9_3_3
gosub, LVlocation
return
K9_3_4:
GuiControl, , showlocation, K9_3_4
gosub, LVlocation
return
K9_4_1:
GuiControl, , showlocation, K9_4_1
gosub, LVlocation
return
K9_4_2:
GuiControl, , showlocation, K9_4_2
gosub, LVlocation
return
K9_4_3:
GuiControl, , showlocation, K9_4_3
gosub, LVlocation
return
K9_4_4:
GuiControl, , showlocation, K9_4_4
gosub, LVlocation
return
K9_5_1:
GuiControl, , showlocation, K9_5_1
gosub, LVlocation
return


K10_1_1:
GuiControl, , showlocation, K10_1_1
gosub, LVlocation
return
K10_1_2:
GuiControl, , showlocation, K10_1_2
gosub, LVlocation
return
K10_1_3:
GuiControl, , showlocation, K10_1_3
gosub, LVlocation
return
K10_1_4:
GuiControl, , showlocation, K10_1_4
gosub, LVlocation
return
K10_2_1:
GuiControl, , showlocation, K10_2_1
gosub, LVlocation
return
K10_2_2:
GuiControl, , showlocation, K10_2_2
gosub, LVlocation
return
K10_2_3:
GuiControl, , showlocation, K10_2_3
gosub, LVlocation
return
K10_2_4:
GuiControl, , showlocation, K10_2_4
gosub, LVlocation
return
K10_3_1:
GuiControl, , showlocation, K10_3_1
gosub, LVlocation
return
K10_3_2:
GuiControl, , showlocation, K10_3_2
gosub, LVlocation
return
K10_3_3:
GuiControl, , showlocation, K10_3_3
gosub, LVlocation
return
K10_3_4:
GuiControl, , showlocation, K10_3_4
gosub, LVlocation
return
K10_4_1:
GuiControl, , showlocation, K10_4_1
gosub, LVlocation
return
K10_4_2:
GuiControl, , showlocation, K10_4_2
gosub, LVlocation
return
K10_4_3:
GuiControl, , showlocation, K10_4_3
gosub, LVlocation
return
K10_4_4:
GuiControl, , showlocation, K10_4_4
gosub, LVlocation
return
K10_5_1:
GuiControl, , showlocation, K10_5_1
gosub, LVlocation
return



K11_1_1:
GuiControl, , showlocation, K11_1_1
gosub, LVlocation
return
K11_1_2:
GuiControl, , showlocation, K11_1_2
gosub, LVlocation
return
K11_1_3:
GuiControl, , showlocation, K11_1_3
gosub, LVlocation
return
K11_1_4:
GuiControl, , showlocation, K11_1_4
gosub, LVlocation
return
K11_2_1:
GuiControl, , showlocation, K11_2_1
gosub, LVlocation
return
K11_2_2:
GuiControl, , showlocation, K11_2_2
gosub, LVlocation
return
K11_2_3:
GuiControl, , showlocation, K11_2_3
gosub, LVlocation
return
K11_2_4:
GuiControl, , showlocation, K11_2_4
gosub, LVlocation
return
K11_3_1:
GuiControl, , showlocation, K11_3_1
gosub, LVlocation
return
K11_3_2:
GuiControl, , showlocation, K11_3_2
gosub, LVlocation
return
K11_3_3:
GuiControl, , showlocation, K11_3_3
gosub, LVlocation
return
K11_3_4:
GuiControl, , showlocation, K11_3_4
gosub, LVlocation
return
K11_4_1:
GuiControl, , showlocation, K11_4_1
gosub, LVlocation
return
K11_4_2:
GuiControl, , showlocation, K11_4_2
gosub, LVlocation
return
K11_4_3:
GuiControl, , showlocation, K11_4_3
gosub, LVlocation
return
K11_4_4:
GuiControl, , showlocation, K11_4_4
gosub, LVlocation
return
K11_5_1:
GuiControl, , showlocation, K11_5_1
gosub, LVlocation
return


K12_1_1:
GuiControl, , showlocation, K12_1_1
gosub, LVlocation
return
K12_1_2:
GuiControl, , showlocation, K12_1_2
gosub, LVlocation
return
K12_1_3:
GuiControl, , showlocation, K12_1_3
gosub, LVlocation
return
K12_1_4:
GuiControl, , showlocation, K12_1_4
gosub, LVlocation
return
K12_2_1:
GuiControl, , showlocation, K12_2_1
gosub, LVlocation
return
K12_2_2:
GuiControl, , showlocation, K12_2_2
gosub, LVlocation
return
K12_2_3:
GuiControl, , showlocation, K12_2_3
gosub, LVlocation
return
K12_2_4:
GuiControl, , showlocation, K12_2_4
gosub, LVlocation
return
K12_3_1:
GuiControl, , showlocation, K12_3_1
gosub, LVlocation
return
K12_3_2:
GuiControl, , showlocation, K12_3_2
gosub, LVlocation
return
K12_3_3:
GuiControl, , showlocation, K12_3_3
gosub, LVlocation
return
K12_3_4:
GuiControl, , showlocation, K12_3_4
gosub, LVlocation
return
K12_4_1:
GuiControl, , showlocation, K12_4_1
gosub, LVlocation
return
K12_4_2:
GuiControl, , showlocation, K12_4_2
gosub, LVlocation
return
K12_4_3:
GuiControl, , showlocation, K12_4_3
gosub, LVlocation
return
K12_4_4:
GuiControl, , showlocation, K12_4_4
gosub, LVlocation
return
K12_5_1:
GuiControl, , showlocation, K12_5_1
gosub, LVlocation
return
