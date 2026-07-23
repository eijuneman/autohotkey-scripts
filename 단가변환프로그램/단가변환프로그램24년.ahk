;====================================================================
;
; Programmer: shwoodkim
; AutoHotkey: v1.1.03.00 (autohotkey_L ANSI version)
;
;====================================================================
#NoEnv
#SingleInstance, force
#Include %A_ScriptDir%\csv.ahk
SetControlDelay 5
FileEncoding, UTF-8

        Winwait, ahk_exe JedaeroM.exe
        IfWinNotActive, ahk_exe JedaeroM.exe,
        WinActivate, ahk_exe JedaeroM.exe

        Sleep, 200
        ControlClick, x21 y39, ahk_exe JedaeroM.exe

        send, {esc 10}{alt}{enter}
        send, {Right 3}{down 4}{enter}

VERSION := 2.0
ProductRows := Object()
ProductDisplayToName := Object()
SearchGuiReady := false
SelectedProductCode := ""
SelectedProductName := ""
SelectedProductSpec := ""
SelectedProductMid := ""
SelectedProductSub := ""
SelectedProductManageCode := ""
SelectedProductBarcode := ""
SelectedProductMode := false
SelectedProductSearchKeyword := ""
SelectedSpecialProductRow := 0
SelectedPriceTableRow := 0
PriceTableBulkChecking := false
DEFAULT_CONFIG_CSV := A_ScriptDir "\단가변환프로그램.csv"
PRODUCT_PRICE_CSV := A_ScriptDir "\특별상품단가.csv"
PRICE_TABLE_CSV := A_ScriptDir "\단가변환표.csv"
PRICE_TABLE_SKIP_CSV := A_ScriptDir "\단가변환표스킵.csv"
PRODUCT_SEARCH_CSV := A_ScriptDir "\상품검색결과.csv"
LOG_DIR := A_ScriptDir "\log"
INI_FILE := DEFAULT_CONFIG_CSV
RightPaneSplitY := 388
RightPaneDragging := false
RightPaneTop := 15
RightPaneBottom := 710
RightPaneSplitterH := 8
RightPaneSplitterGap := 4
RightPaneMinSpecialH := 185
RightPaneMinPriceH := 210

RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe
WINTITLE := basename1 " " VERSION

;outputdebug DBGVIEWCLEAR

;============================================================
; 1. When this ahk program is compiled into an exe, fileinstall indicates which files should be embedded inside the exe.1
; 2. When the program is run, fileinstall extracts the embedded file to the specified folder.
;============================================================

RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath

if Not InStr(FileExist(A_ScriptDir), "D")
    FileCreateDir , %A_ScriptDir%

;============================================================
; Build gui:
;============================================================
Gui, +alwaysontop
Gui, Font, s10, Malgun Gothic
Gui, Add, GroupBox, x20 y15 w505 h140, 단가프리셋 / 상품검색
Gui, Add, GroupBox, x20 y170 w505 h135, 단가 입력
Gui, Add, GroupBox, x20 y320 w505 h130, 실행 / 특별상품단가.csv
Gui, Add, GroupBox, x545 y15 w755 h370 vSpecialProductGroup, 특별상품단가.csv 리스트
Gui, Add, Text, x545 y388 w755 h8 vRightPaneSplitter hwndRightPaneSplitterHwnd 0x100 +Border Center,
Gui, Add, GroupBox, x545 y400 w755 h310 vPriceTableGroup, 단가변환표.csv 편집

Gui, Add, Text, x45 y43 w75 h23, 단가프리셋
Gui, Add, ComboBox, x130 y39 w380 h160 vfrmSAVEDPRESET gPresetChange

Gui, Add, Text, x45 y82 w75 h23, 상품검색어
Gui, Add, Edit, x130 y78 w205 h29 vProductSearch,
Gui, Add, Button, x345 y77 h31 w85 gLoadProductList, DB조회저장
Gui, Add, Button, x440 y77 h31 w75 gFindSelectedProduct, 제대로검색
Gui, Add, ComboBox, x130 y117 w255 h160 vProductSelect gProductSelectChange
Gui, Font, Bold
Gui, Add, Button, x400 y116 h31 w110 gStartSelectedProduct, 선택상품변환
Gui, Font, Norm

Gui, Add, Button, x565 y38 h30 w125 vSpecialProductReloadBtn gLoadSpecialProductList, 특별목록새로고침
Gui, Add, Text, x700 y43 w580 h23 vSpecialProductPathText, %PRODUCT_PRICE_CSV%
Gui, Add, ListView, x565 y75 w715 h300 vSpecialProductLV gSpecialProductLVClick Grid -Multi, 상품코드|상품명|규격|검색중분류|검색소분류|중분류|소분류Y|A|매출|B|소매|C|관리코드|바코드|검색키

Gui, Add, Text, x105 y200 w70 h23 Center, 중분류
Gui, Add, Text, x185 y200 w90 h23 Center, 소분류
Gui, Add, Text, x300 y200 w38 h23 Center, A
Gui, Add, Text, x345 y200 w38 h23 Center, 매출
Gui, Add, Text, x390 y200 w38 h23 Center, B
Gui, Add, Text, x435 y200 w38 h23 Center, 소매
Gui, Add, Text, x480 y200 w38 h23 Center, C

Gui, Add, Text, x45 y229 w50 h27, 분류
Gui, Add, Edit, x105 y225 w70 h30 v중분류,
Gui, Add, Edit, x185 y225 w90 h30 v소분류y값,
Gui, Add, Edit, x300 y225 w38 h30 vA,
Gui, Add, Edit, x345 y225 w38 h30 v매출,
Gui, Add, Edit, x390 y225 w38 h30 vB,
Gui, Add, Edit, x435 y225 w38 h30 v소매,
Gui, Add, Edit, x480 y225 w38 h30 vC,

Gui, Font, Bold
Gui, Add, Button, x50 y353 h42 w110 gStart, 전체변환
Gui, Add, Button, x170 y353 h42 w110 gStartpick, 현재분류변환
Gui, Font, Norm
Gui, Add, Button, x300 y353 h42 w95 grunexcel, 엑셀열기
Gui, Add, Button, x405 y353 h42 w105 greload, 프로그램재시작
Gui, Add, Text, x45 y410 w130 h25, 특별상품단가.csv
Gui, Add, Button, x165 y405 h34 w115 gSaveProductPrice, 특별단가저장
Gui, Add, Button, x290 y405 h34 w135 gLoadProductPrice, 특별단가불러오기
Gui, Add, Button, x435 y405 h34 w75 gOpenSpecialProductFile, 특별CSV

Gui, Add, GroupBox, x20 y470 w505 h240, 작업 로그
Gui, Add, Button, x395 y488 h28 w115 gOpenLogFolder, 로그폴더열기
Gui, Add, Edit, x35 y520 w475 h175 vWorkLogEdit ReadOnly Multi VScroll -Wrap,

Gui, Add, Button, x565 y425 h30 w95 vPriceTableReloadBtn gLoadPriceTableList, 목록새로고침
Gui, Add, Button, x670 y425 h30 w95 vPriceTableOpenBtn gOpenPriceTableFile, 단가표CSV열기
Gui, Add, Text, x775 y430 w505 h23 vPriceTablePathText, %PRICE_TABLE_CSV%
Gui, Add, ListView, x565 y462 w715 h180 vPriceTableLV gPriceTableLVClick Checked Grid -Multi, 프리셋|중분류|소분류|A|매출|B|소매|C

Gui, Add, Text, x565 y648 w220 h20 vPriceCsvNameLabel Center, 프리셋
Gui, Add, Text, x795 y648 w50 h20 vPriceCsvMidLabel Center, 중분류
Gui, Add, Text, x852 y648 w55 h20 vPriceCsvSubLabel Center, 소분류
Gui, Add, Text, x914 y648 w40 h20 vPriceCsvALabel Center, A
Gui, Add, Text, x960 y648 w40 h20 vPriceCsvSalesLabel Center, 매출
Gui, Add, Text, x1006 y648 w40 h20 vPriceCsvBLabel Center, B
Gui, Add, Text, x1052 y648 w40 h20 vPriceCsvRetailLabel Center, 소매
Gui, Add, Text, x1098 y648 w40 h20 vPriceCsvCLabel Center, C
Gui, Add, Edit, x565 y670 w220 h29 vPresetCsvName,
Gui, Add, Edit, x795 y670 w50 h29 vPresetCsvMid,
Gui, Add, Edit, x852 y670 w55 h29 vPresetCsvSub,
Gui, Add, Edit, x914 y670 w40 h29 vPresetCsvA,
Gui, Add, Edit, x960 y670 w40 h29 vPresetCsvSales,
Gui, Add, Edit, x1006 y670 w40 h29 vPresetCsvB,
Gui, Add, Edit, x1052 y670 w40 h29 vPresetCsvRetail,
Gui, Add, Edit, x1098 y670 w40 h29 vPresetCsvC,
Gui, Add, Button, x1160 y667 h32 w120 vSavePriceTableRowBtn gSavePriceTableRow, 단가표저장

Gui, Add, StatusBar

Gui, 1:ListView, SpecialProductLV
LV_ModifyCol(1, 70)
LV_ModifyCol(2, 170)
LV_ModifyCol(3, 110)
LV_ModifyCol(4, 85)
LV_ModifyCol(5, 85)
LV_ModifyCol(6, 55)
LV_ModifyCol(7, 65)
LV_ModifyCol(8, 45)
LV_ModifyCol(9, 45)
LV_ModifyCol(10, 45)
LV_ModifyCol(11, 45)
LV_ModifyCol(12, 45)
LV_ModifyCol(13, 75)
LV_ModifyCol(14, 75)
LV_ModifyCol(15, 75)
Gui, 1:ListView, PriceTableLV
LV_ModifyCol(1, 220)
LV_ModifyCol(2, 58)
LV_ModifyCol(3, 58)
LV_ModifyCol(4, 45)
LV_ModifyCol(5, 45)
LV_ModifyCol(6, 45)
LV_ModifyCol(7, 45)
LV_ModifyCol(8, 45)
RightPaneSplitY := ReadConfigValue(DEFAULT_CONFIG_CSV, "Layout", "RightPaneSplitY", RightPaneSplitY)
SetRightPaneSplit(RightPaneSplitY)
OnMessage(0x201, "RightPane_LButtonDown")

;~ GetXY(winx, winy)
Gui, Show,x330 y250 w1320 h745,%WINTITLE%
EnsureLogDir()
LoadTodayLogToGui()
SetWorkStatus("프로그램 시작")

GoSub, UpdatePresetList
GoSub, LoadSpecialProductList
GoSub, LoadPriceTableList

return

;============================================================
; do a guirestore for newly selected preset
;============================================================



runexcel:
{

	run, %A_ScriptDir%\세이브 INI리스트 (메크로 포함).xlsm

return
}


LoadProductList:
    Gui, 1:Submit, NoHide
    EnsureProductSearchGui()
    LoadProductsFromMysql(ProductSearch)
Return

ProductSelectChange:
    Gui, 1:Submit, NoHide
    if (ProductSelect != "") {
        SetSelectedProductFromDisplay(ProductSelect)
        LoadSelectedProductPrice(false)
        SetWorkStatus("선택: " ProductSelect)
    }
Return

LoadSpecialProductList:
    LoadSpecialProductListRows()
Return

SpecialProductLVClick:
    Gui, 1:ListView, SpecialProductLV
    selectedRow := LV_GetNext()
    if (selectedRow = 0)
        Return

    SelectedSpecialProductRow := selectedRow
    cols := []
    Loop, 15
    {
        LV_GetText(colValue, selectedRow, A_Index)
        cols.Push(colValue)
    }

    SetSpecialProductSelectionFromColumns(cols)
    if (A_GuiEvent = "DoubleClick")
        SearchJedaeroProduct(BuildProductSearchKeyword(cols[1], cols[2], cols[13], cols[14], cols[15]))
Return

ProductLVClick:
    Gui, 2:Default
    Gui, 2:ListView, ProductLV
    selectedRow := LV_GetNext()
    if (selectedRow = 0)
        Return

    LV_GetText(productCode, selectedRow, 1)
    LV_GetText(productName, selectedRow, 2)
    LV_GetText(productSpec, selectedRow, 3)
    LV_GetText(productMid, selectedRow, 4)
    LV_GetText(productSub, selectedRow, 5)
    LV_GetText(productManageCode, selectedRow, 6)
    LV_GetText(productBarcode, selectedRow, 7)
    display := CleanComboText(productName " / " productSpec " / " productMid "-" productSub " [" productCode "]")
    SetSelectedProduct(productCode, productName, productSpec, productMid, productSub, productManageCode, productBarcode)
    Gui, 1:Default
    GuiControl, 1:, ProductSelect, %display%
    GuiControl, 1:, ProductSearch, %productName%
    SetWorkStatus("선택: " display)
    LoadSelectedProductPrice(false)

    if (A_GuiEvent = "DoubleClick")
        SearchJedaeroProduct(BuildSelectedProductSearchKeyword())
Return

FindSelectedProduct:
    Gui, 1:Submit, NoHide
    productName := GetSelectedProductName()
    if (productName = "") {
        if EnsureSelectedProductFromSpecialList() {
            Gui, 1:Submit, NoHide
            productName := GetSelectedProductName()
        }
    }
    if (productName = "") {
        MsgBox, 48, 상품찾기, 상품을 선택하거나 검색어를 입력해주세요.
        Return
    }
    SearchJedaeroProduct(BuildSelectedProductSearchKeyword())
Return

StartSelectedProduct:
    Gui, 1:Submit, NoHide
    productName := GetSelectedProductName()
    if (productName = "") {
        if EnsureSelectedProductFromSpecialList() {
            Gui, 1:Submit, NoHide
            productName := GetSelectedProductName()
        }
    }
    if (productName = "") {
        MsgBox, 48, 선택상품변환, 상품을 선택하거나 검색어를 입력해주세요.
        Return
    }
    SaveSelectedProductPrice(false)
    SelectedProductSearchKeyword := BuildSelectedProductSearchKeyword()
    if (SelectedProductSearchKeyword = "") {
        MsgBox, 48, 선택상품변환, 제대로판매재고M 검색키가 없습니다.
        Return
    }
    SetWorkStatus("선택상품변환 시작: " productName " / 검색키 " SelectedProductSearchKeyword)
    SelectedProductMode := true
    Gosub, Startpick
    SelectedProductMode := false
Return

LoadPriceTableList:
    LoadPriceTableRows()
Return

PriceTableLVClick:
    Gui, 1:Default
    Gui, 1:ListView, PriceTableLV
    if (A_GuiEvent = "ColClick" && A_EventInfo = 1) {
        ToggleAllPriceTableSkips()
        Return
    }
    if (A_GuiEvent = "I" && !PriceTableBulkChecking && (InStr(ErrorLevel, "C", true) || InStr(ErrorLevel, "c", true)))
        SavePriceTableSkipStates()
    selectedRow := LV_GetNext()
    if (selectedRow = 0)
        Return

    SelectedPriceTableRow := selectedRow
    LV_GetText(csvName, selectedRow, 1)
    LV_GetText(csvMid, selectedRow, 2)
    LV_GetText(csvSub, selectedRow, 3)
    LV_GetText(csvA, selectedRow, 4)
    LV_GetText(csvSales, selectedRow, 5)
    LV_GetText(csvB, selectedRow, 6)
    LV_GetText(csvRetail, selectedRow, 7)
    LV_GetText(csvC, selectedRow, 8)
    SetPriceTableEditFields(csvName, csvMid, csvSub, csvA, csvSales, csvB, csvRetail, csvC)
    ApplyPresetValuesToMainFields(csvName, csvMid, csvSub, csvA, csvSales, csvB, csvRetail, csvC)
Return

SavePriceTableRow:
    Gui, 1:Submit, NoHide
    SavePriceTableRowData()
Return

OpenPriceTableFile:
    Run, notepad.exe "%PRICE_TABLE_CSV%"
Return

OpenSpecialProductFile:
    EnsureSpecialProductCsv()
    Run, notepad.exe "%PRODUCT_PRICE_CSV%"
Return

SearchWindowLoadProductList:
    Gui, 2:Submit, NoHide
    GuiControl, 1:, ProductSearch, %SearchWindowProductSearch%
    EnsureProductSearchGui()
    LoadProductsFromMysql(SearchWindowProductSearch)
Return

SearchWindowFindSelectedProduct:
    Gui, 1:Default
    productName := GetSelectedProductName()
    if (productName = "") {
        if EnsureSelectedProductFromSpecialList() {
            Gui, 1:Submit, NoHide
            productName := GetSelectedProductName()
        }
    }
    if (productName = "") {
        MsgBox, 48, 제대로검색, 상품을 먼저 선택해주세요.
        Return
    }
    SearchJedaeroProduct(BuildSelectedProductSearchKeyword())
Return

SearchWindowSaveSpecialPrice:
    Gui, 1:Default
    SaveSelectedProductPrice(true)
Return

OpenProductSearchFile:
    EnsureProductSearchCsv()
    Run, notepad.exe "%PRODUCT_SEARCH_CSV%"
Return

OpenLogFolder:
    EnsureLogDir()
    Run, explorer.exe "%LOG_DIR%"
    SetWorkStatus("로그 폴더 열기")
Return

SaveProductPrice:
    SaveSelectedProductPrice(true)
Return

LoadProductPrice:
    if !LoadSelectedProductPrice(true)
        MsgBox, 48, 특별상품단가, 저장된 특별상품단가가 없습니다.
Return

2GuiClose:
2GuiEscape:
    Gui, 2:Hide
Return



PresetChange:

    gui, submit, nohide



        Loop, % Rows
            {
             founds:=CSV_Search("data1",frmSAVEDPRESET,A_Index)
             if founds=0
                break
             founds:=StrSplit(founds,",")
                r2:=CSV_ReadCell("data1",founds[1],2) ;
                r3:=CSV_ReadCell("data1",founds[1],3) ;
                r4:=CSV_ReadCell("data1",founds[1],4) ;
                r5:=CSV_ReadCell("data1",founds[1],5) ;
                r6:=CSV_ReadCell("data1",founds[1],6) ;
                r7:=CSV_ReadCell("data1",founds[1],7) ;
                r8:=CSV_ReadCell("data1",founds[1],8) ;
                ;~ LV_Add("", r31, r29, r30, r2, r31, r0)

                GuiControl, , 중분류, %r2%
                GuiControl, , 소분류y값, %r3%
                GuiControl, , A, %r4%
                GuiControl, , 매출, %r5%
                GuiControl, , B, %r6%
                GuiControl, , 소매, %r7%
                GuiControl, , C, %r8%

            }
Return

;============================================================
; update drop down to show all preset names in local csv
;============================================================

UpdatePresetList:

        gui, submit, nohide

        csvfile0 = %PRICE_TABLE_CSV%

        ;~ csv_Save(csvfile0,"data1")
        csv_Load(csvfile0,"data1")



    GuiControl, , frmSAVEDPRESET, |  ; delete list

Rows:=CSV_TotalRows("data1")
TR1=
real=0
Loop, %Rows%{
    TR1 .= CSV_ReadCell("data1",A_Index,1) "|"
}

    ;~ MsgBox, % TR1
    ;~ GuiControl, , frmSAVEDPRESET,   ; update the control
    GuiControl, , frmSAVEDPRESET, % "|" TR1  ; update the control

Return



Return

;============================================================
; when you click x or close button
;============================================================

GuiClose:

    Gui, Submit, NoHide      ; update control variables

ExitApp

;============================================================
; Return window x and y position from local csv.
;============================================================



start:
{

Gui, submit, nohide

    var1 := 0
    SavePriceTableSkipStates()
    skipMap := LoadPriceTableSkipMap()
    SetWorkStatus("전체변환 시작")

        if !ClearJedaeroProductSearch() {
            SetWorkStatus("전체변환 취소: 상품찾기 초기화 실패")
            return
        }

        Control, Choose, 3, TRzComboBox9, ahk_exe JedaeroM.exe

        ;~ Loop,61
        Loop, %Rows%
        {


        var1++


        presetName := CSV_ReadCell("data1", var1, 1)
        s1 := CSV_ReadCell("data1", var1, 2)
        s2 := CSV_ReadCell("data1", var1, 3)
        priceA := CSV_ReadCell("data1", var1, 4)
        priceSales := CSV_ReadCell("data1", var1, 5)
        priceB := CSV_ReadCell("data1", var1, 6)
        priceRetail := CSV_ReadCell("data1", var1, 7)
        priceC := CSV_ReadCell("data1", var1, 8)
        if IsPriceTableRowSkipped(skipMap, presetName, s1, s2) {
            SetWorkStatus("전체변환 스킵: " presetName)
            continue
        }

        SetWorkStatus("전체변환 적용 중: " presetName)

        GuiControl, , frmSAVEDPRESET, %presetName%
        GuiControl, , 중분류, %s1%
        GuiControl, , 소분류y값, %s2%
        GuiControl, , A, %priceA%
        GuiControl, , 매출, %priceSales%
        GuiControl, , B, %priceB%
        GuiControl, , 소매, %priceRetail%
        GuiControl, , C, %priceC%

        Sleep, 500




        Sleep, 200




        if !SelectJedaeroCategory(s1, s2) {
            SetWorkStatus("전체변환 취소: 분류 선택 실패 " presetName)
            return
        }


        ;~ MsgBox %s2%


        Sleep, 200
        if !ApplyPriceValues(priceC, priceRetail, priceB, priceSales, priceA) {
            SetWorkStatus("전체변환 취소: 단가 입력 실패 " presetName)
            return
        }
        ControlClick, x887 y159, ahk_class TfmMain
        SLEEP, 200

        WinWait, 일괄저장,, 5
        if ErrorLevel {
            SetWorkStatus("일괄저장 창 대기 실패")
            return
        }
        IfWinNotActive, 일괄저장, , WinActivate, 일괄저장,
        WinWaitActive, 일괄저장,
        Sleep, 200

        ConfirmDialogButton("일괄저장", "!y")
        Sleep, 100

        WinWait, 저장 확인,, 5
        if ErrorLevel {
            SetWorkStatus("저장 확인 창 대기 실패")
            return
        }
        IfWinNotActive, 저장 확인, , WinActivate, 저장 확인,
        WinWaitActive, 저장 확인,
        Sleep, 100

        ConfirmDialogButton("저장 확인", "{Enter}")
        Sleep, 100

        SetWorkStatus("전체변환 저장 완료: " presetName)

        Sleep, 200

        }

    SetWorkStatus("전체변환 완료")
}
     return

Startpick:
{
        gui, submit, nohide
        s1 := 중분류
        s2 := 소분류y값
        priceC := C
        priceRetail := 소매
        priceB := B
        priceSales := 매출
        priceA := A
        if (!SelectedProductMode) {
            if (LoadSelectedPriceTableRow(s1, s2, priceA, priceSales, priceB, priceRetail, priceC, selectedPresetName)) {
                GuiControl, 1:, 중분류, %s1%
                GuiControl, 1:, 소분류y값, %s2%
                GuiControl, 1:, A, %priceA%
                GuiControl, 1:, 매출, %priceSales%
                GuiControl, 1:, B, %priceB%
                GuiControl, 1:, 소매, %priceRetail%
                GuiControl, 1:, C, %priceC%
                SetWorkStatus("단가표 선택행 사용: " selectedPresetName)
            }
        }
        if (Trim(s1) = "" || Trim(s2) = "") {
            MsgBox, 48, 현재분류변환, 단가변환표 행을 선택하거나 중분류/소분류 값을 입력해주세요.
            SetWorkStatus("현재분류변환 취소: 분류 값 없음")
            Return
        }
        if (!HasPriceValues(priceA, priceSales, priceB, priceRetail, priceC)) {
            MsgBox, 48, 현재분류변환, A/매출/B/소매/C 요율을 입력하거나 단가변환표 행을 선택해주세요.
            SetWorkStatus("현재분류변환 취소: 요율 값 없음")
            Return
        }
        if (SelectedProductMode)
            SetWorkStatus("선택상품 단가 적용 시작")
        else
            SetWorkStatus("현재분류변환 시작")
        Sleep, 200

        if (SelectedProductMode) {
            if !SelectJedaeroCategory(s1, s2) {
                SetWorkStatus("선택상품변환 취소: 분류 선택 실패")
                return
            }
            Sleep, 500
            SearchJedaeroProduct(SelectedProductSearchKeyword)
            SetWorkStatus("선택상품 검색 완료: " SelectedProductSearchKeyword)
            Sleep, 700
            ControlClick, TDBGridEh1, ahk_class TfmMain, , , , x53 y60
            Sleep, 400
        } else {
            if !ClearJedaeroProductSearch() {
                SetWorkStatus("현재분류변환 취소: 상품찾기 초기화 실패")
                return
            }
            if !SelectJedaeroCategory(s1, s2) {
                SetWorkStatus("현재분류변환 취소: 분류 선택 실패")
                return
            }
            SetWorkStatus("현재분류 선택: 중분류=" s1 ", 소분류=" s2)
            Sleep, 400
        }



        SetWorkStatus("단가 적용 중: A=" priceA ", 매출=" priceSales ", B=" priceB ", 소매=" priceRetail ", C=" priceC)
        if !ApplyPriceValues(priceC, priceRetail, priceB, priceSales, priceA) {
            SetWorkStatus("변환 취소: 단가 입력 실패")
            return
        }
        ControlClick, x887 y159, ahk_class TfmMain
        SLEEP, 200

        WinWait, 일괄저장,, 5
        if ErrorLevel {
            SetWorkStatus("일괄저장 창 대기 실패")
            return
        }
        IfWinNotActive, 일괄저장, , WinActivate, 일괄저장,
        WinWaitActive, 일괄저장,
        Sleep, 200

        ConfirmDialogButton("일괄저장", "!y")
        Sleep, 100

        WinWait, 저장 확인,, 5
        if ErrorLevel {
            SetWorkStatus("저장 확인 창 대기 실패")
            return
        }
        IfWinNotActive, 저장 확인, , WinActivate, 저장 확인,
        WinWaitActive, 저장 확인,
        Sleep, 100

        ConfirmDialogButton("저장 확인", "{Enter}")
        Sleep, 100

        if (SelectedProductMode)
            SetWorkStatus("선택상품변환 저장 완료")
        else
            SetWorkStatus("현재분류변환 저장 완료")

        Sleep, 200



}
     return













;====================================================================================================================
;====================================================================================================================
;====================================================================================================================
;====================================================================================================================
;====================================================================================================================
;                                                                                                                   \
;                                                  base function                                                    \
;                                                                                                                   \
;====================================================================================================================
;====================================================================================================================
;====================================================================================================================
;====================================================================================================================
;====================================================================================================================






reload:
{
    SetWorkStatus("프로그램 재시작")
    Reload
}
return

DragRightPaneSplitter:
    if (!RightPaneDragging)
        Return

    if !GetKeyState("LButton", "P") {
        RightPaneDragging := false
        SetTimer, DragRightPaneSplitter, Off
        DllCall("ReleaseCapture")
        priceY := RightPaneSplitY + RightPaneSplitterH + RightPaneSplitterGap
        SaveConfigValue(DEFAULT_CONFIG_CSV, "Layout", "RightPaneSplitY", RightPaneSplitY)
        SetWorkStatus("목록 높이 조절 완료: 특별 " (RightPaneSplitY - RightPaneTop) " / 단가표 " (RightPaneBottom - priceY))
        Return
    }

    CoordMode, Mouse, Client
    MouseGetPos, , mouseY
    SetRightPaneSplit(mouseY)
Return

RightPane_LButtonDown(wParam, lParam, msg, hwnd)
{
    global RightPaneSplitterHwnd, RightPaneDragging

    if (hwnd != RightPaneSplitterHwnd)
        return

    RightPaneDragging := true
    DllCall("SetCapture", "Ptr", hwnd)
    SetTimer, DragRightPaneSplitter, 20
    return 0
}

SetRightPaneSplit(splitY)
{
    global RightPaneSplitY, RightPaneTop, RightPaneBottom, RightPaneSplitterH, RightPaneSplitterGap
    global RightPaneMinSpecialH, RightPaneMinPriceH

    minY := RightPaneTop + RightPaneMinSpecialH
    maxY := RightPaneBottom - RightPaneSplitterH - RightPaneSplitterGap - RightPaneMinPriceH
    splitY := Round(splitY)

    if (splitY < minY)
        splitY := minY
    if (splitY > maxY)
        splitY := maxY

    RightPaneSplitY := splitY
    specialGroupH := splitY - RightPaneTop
    specialListH := splitY - 75 - 13
    if (specialListH < 80)
        specialListH := 80

    priceY := splitY + RightPaneSplitterH + RightPaneSplitterGap
    priceGroupH := RightPaneBottom - priceY
    priceButtonY := priceY + 25
    pricePathY := priceY + 30
    priceListY := priceY + 62
    editLabelY := RightPaneBottom - 62
    editY := RightPaneBottom - 40
    editButtonY := RightPaneBottom - 43
    priceListH := editLabelY - priceListY - 6
    if (priceListH < 80)
        priceListH := 80

    GuiControl, Move, SpecialProductGroup, % "x545 y15 w755 h" specialGroupH
    GuiControl, Move, SpecialProductLV, % "x565 y75 w715 h" specialListH
    GuiControl, Move, RightPaneSplitter, % "x545 y" splitY " w755 h" RightPaneSplitterH

    GuiControl, Move, PriceTableGroup, % "x545 y" priceY " w755 h" priceGroupH
    GuiControl, Move, PriceTableReloadBtn, % "x565 y" priceButtonY " h30 w95"
    GuiControl, Move, PriceTableOpenBtn, % "x670 y" priceButtonY " h30 w95"
    GuiControl, Move, PriceTablePathText, % "x775 y" pricePathY " w505 h23"
    GuiControl, Move, PriceTableLV, % "x565 y" priceListY " w715 h" priceListH

    GuiControl, Move, PriceCsvNameLabel, % "x565 y" editLabelY " w220 h20"
    GuiControl, Move, PriceCsvMidLabel, % "x795 y" editLabelY " w50 h20"
    GuiControl, Move, PriceCsvSubLabel, % "x852 y" editLabelY " w55 h20"
    GuiControl, Move, PriceCsvALabel, % "x914 y" editLabelY " w40 h20"
    GuiControl, Move, PriceCsvSalesLabel, % "x960 y" editLabelY " w40 h20"
    GuiControl, Move, PriceCsvBLabel, % "x1006 y" editLabelY " w40 h20"
    GuiControl, Move, PriceCsvRetailLabel, % "x1052 y" editLabelY " w40 h20"
    GuiControl, Move, PriceCsvCLabel, % "x1098 y" editLabelY " w40 h20"

    GuiControl, Move, PresetCsvName, % "x565 y" editY " w220 h29"
    GuiControl, Move, PresetCsvMid, % "x795 y" editY " w50 h29"
    GuiControl, Move, PresetCsvSub, % "x852 y" editY " w55 h29"
    GuiControl, Move, PresetCsvA, % "x914 y" editY " w40 h29"
    GuiControl, Move, PresetCsvSales, % "x960 y" editY " w40 h29"
    GuiControl, Move, PresetCsvB, % "x1006 y" editY " w40 h29"
    GuiControl, Move, PresetCsvRetail, % "x1052 y" editY " w40 h29"
    GuiControl, Move, PresetCsvC, % "x1098 y" editY " w40 h29"
    GuiControl, Move, SavePriceTableRowBtn, % "x1160 y" editButtonY " h32 w120"
}

SetWorkStatus(message)
{
    SB_SetText(message)
    WriteWorkLog(message)
    LoadTodayLogToGui()
}

EnsureLogDir()
{
    global LOG_DIR

    if !InStr(FileExist(LOG_DIR), "D")
        FileCreateDir, %LOG_DIR%
}

GetTodayLogFile()
{
    global LOG_DIR

    FormatTime, logDate, , yyyy-MM-dd
    return LOG_DIR "\" logDate ".txt"
}

WriteWorkLog(message)
{
    logFile := GetTodayLogFile()
    EnsureLogDir()
    FormatTime, logTime, , HH:mm:ss
    FileAppend, % "[" logTime "] " message "`r`n", %logFile%, UTF-8
}

LoadTodayLogToGui()
{
    logFile := GetTodayLogFile()
    logText := ""

    if FileExist(logFile)
        FileRead, logText, *P65001 %logFile%

    GuiControl, 1:, WorkLogEdit, %logText%
    ScrollWorkLogToBottom()
}

ScrollWorkLogToBottom()
{
    GuiControlGet, logHwnd, 1:Hwnd, WorkLogEdit
    if (!logHwnd)
        return

    SendMessage, 0xB1, -1, -1,, ahk_id %logHwnd%
    SendMessage, 0xB7, 0, 0,, ahk_id %logHwnd%
}

SetSelectedProductFromDisplay(display)
{
    global ProductRows, ProductSearch

    if (ProductRows.HasKey(display)) {
        row := ProductRows[display]
        SetSelectedProduct(row["code"], row["name"], row["spec"], row["mid"], row["sub"], row["manageCode"], row["barcode"])
        return
    }

    fallbackName := Trim(display)
    if (fallbackName = "")
        fallbackName := Trim(ProductSearch)
    SetSelectedProduct("", fallbackName)
}

SetSelectedProduct(code, name, spec := "", mid := "", sub := "", manageCode := "", barcode := "", searchKeyword := "")
{
    global SelectedProductCode, SelectedProductName, SelectedProductSpec, SelectedProductMid, SelectedProductSub
    global SelectedProductManageCode, SelectedProductBarcode, SelectedProductSearchKeyword

    SelectedProductCode := code
    SelectedProductName := name
    SelectedProductSpec := spec
    SelectedProductMid := mid
    SelectedProductSub := sub
    SelectedProductManageCode := manageCode
    SelectedProductBarcode := barcode
    SelectedProductSearchKeyword := searchKeyword
}

BuildSelectedProductSearchKeyword()
{
    global SelectedProductCode, SelectedProductName, SelectedProductManageCode, SelectedProductBarcode, SelectedProductSearchKeyword

    return BuildProductSearchKeyword(SelectedProductCode, SelectedProductName, SelectedProductManageCode, SelectedProductBarcode, SelectedProductSearchKeyword)
}

BuildProductSearchKeyword(productCode, productName, manageCode := "", barcode := "", searchKeyword := "")
{
    searchKeyword := Trim(searchKeyword)
    manageCode := Trim(manageCode)
    barcode := Trim(barcode)
    productCode := Trim(productCode)
    productName := Trim(productName)

    if (searchKeyword != "")
        return searchKeyword

    if (manageCode != "")
        return manageCode

    if (barcode != "")
        return barcode

    if (productCode != "")
        return productCode

    return productName
}

GetSelectedProductSection()
{
    global SelectedProductCode, SelectedProductName

    if (SelectedProductCode != "")
        return "상품_" SelectedProductCode

    if (SelectedProductName != "")
        return "상품명_" CleanIniSectionName(SelectedProductName)

    return ""
}

CleanIniSectionName(value)
{
    value := StrReplace(value, "[", "(")
    value := StrReplace(value, "]", ")")
    value := StrReplace(value, "`r", " ")
    value := StrReplace(value, "`n", " ")
    return Trim(value)
}

EnsureProductSearchGui()
{
    global SearchGuiReady, ProductSearch, PRODUCT_SEARCH_CSV
    global SearchWindowProductSearch, ProductSearchPathText, ProductLV

    if (!SearchGuiReady) {
        Gui, 2:+Owner1 +AlwaysOnTop +Resize
        Gui, 2:Font, s10, Malgun Gothic
        Gui, 2:Add, GroupBox, x10 y10 w760 h390, 상품 DB 조회 결과
        Gui, 2:Add, Text, x25 y40 w55 h24, 검색어
        Gui, 2:Add, Edit, x85 y36 w270 h29 vSearchWindowProductSearch,
        Gui, 2:Add, Button, x365 y35 h31 w80 gSearchWindowLoadProductList, 검색창재조회
        Gui, 2:Add, Button, x455 y35 h31 w105 gSearchWindowFindSelectedProduct, 선택제대로검색
        Gui, 2:Add, Button, x570 y35 h31 w115 gSearchWindowSaveSpecialPrice, 선택특별저장
        Gui, 2:Add, Button, x695 y35 h31 w60 gOpenProductSearchFile, CSV열기
        Gui, 2:Add, Text, x25 y70 w725 h20 vProductSearchPathText,
        Gui, 2:Add, ListView, x25 y98 w725 h285 vProductLV gProductLVClick Grid -Multi, 상품코드|상품명|규격|중분류|소분류|관리코드|바코드
        SearchGuiReady := true
    }

    GuiControl, 2:, SearchWindowProductSearch, %ProductSearch%
    GuiControl, 2:, ProductSearchPathText, %PRODUCT_SEARCH_CSV%
    Gui, 2:Show, x380 y210 w790 h420, 상품 DB 조회 결과
    Gui, 1:Default
}

SaveSelectedProductPrice(showMessage := true)
{
    global PRODUCT_PRICE_CSV, SelectedProductCode, SelectedProductName, SelectedProductSpec, SelectedProductMid, SelectedProductSub
    global SelectedProductManageCode, SelectedProductBarcode, SelectedProductSearchKeyword
    global C, 소매, B, 매출, A, 중분류, 소분류y값

    Gui, 1:Submit, NoHide
    Gui, 1:Default
    productName := GetSelectedProductName()
    if (SelectedProductCode = "" && productName = "") {
        if (showMessage)
            MsgBox, 48, 특별상품단가, 상품을 먼저 선택해주세요.
        return false
    }

    if (SelectedProductName = "")
        SelectedProductName := productName

    rows := LoadSpecialProductRows()
    searchKeyword := BuildSelectedProductSearchKeyword()
    newLine := SpecialProductCsvLine(SelectedProductCode, productName, SelectedProductSpec, SelectedProductMid, SelectedProductSub, 중분류, 소분류y값, A, 매출, B, 소매, C, SelectedProductManageCode, SelectedProductBarcode, searchKeyword)
    rowIndex := FindSpecialProductRow(rows, SelectedProductCode, productName)

    if (rowIndex > 0)
        rows[rowIndex] := newLine
    else
        rows.Push(newLine)

    WriteSpecialProductRows(rows)
    LoadSpecialProductListRows()
    SelectSpecialProductListRow(SelectedProductCode, productName)

    SetWorkStatus("특별상품단가.csv 저장: " productName)
    if (showMessage)
        MsgBox, 64, 특별상품단가, 특별상품단가.csv에 저장했습니다.

    return true
}

LoadSelectedProductPrice(showMessage := true)
{
    global PRODUCT_PRICE_CSV, SelectedProductCode, SelectedProductName, SelectedProductSpec, SelectedProductMid, SelectedProductSub
    global SelectedProductManageCode, SelectedProductBarcode, SelectedProductSearchKeyword

    Gui, 1:Default
    productName := GetSelectedProductName()
    if (SelectedProductCode = "" && productName = "")
        return false

    rows := LoadSpecialProductRows()
    rowIndex := FindSpecialProductRow(rows, SelectedProductCode, productName)
    if (rowIndex <= 0)
        return false

    cols := ParseCsvLine(rows[rowIndex])
    while (cols.MaxIndex() < 15)
        cols.Push("")

    if (Trim(cols[8] cols[9] cols[10] cols[11] cols[12]) = "")
        return false

    if (cols[1] != "")
        SelectedProductCode := cols[1]
    if (cols[2] != "")
        SelectedProductName := cols[2]
    if (cols[3] != "")
        SelectedProductSpec := cols[3]
    if (cols[4] != "")
        SelectedProductMid := cols[4]
    if (cols[5] != "")
        SelectedProductSub := cols[5]
    SelectedProductManageCode := cols[13]
    SelectedProductBarcode := cols[14]
    SelectedProductSearchKeyword := cols[15]

    if (cols[6] != "")
        GuiControl, 1:, 중분류, % cols[6]
    if (cols[7] != "")
        GuiControl, 1:, 소분류y값, % cols[7]
    GuiControl, 1:, A, % cols[8]
    GuiControl, 1:, 매출, % cols[9]
    GuiControl, 1:, B, % cols[10]
    GuiControl, 1:, 소매, % cols[11]
    GuiControl, 1:, C, % cols[12]

    loadedName := SelectedProductName
    if (loadedName = "")
        loadedName := productName

    SetWorkStatus("특별상품단가.csv 불러옴: " loadedName)
    return true
}

LoadSpecialProductListRows()
{
    global PRODUCT_PRICE_CSV, SelectedSpecialProductRow

    GuiControl, 1:, SpecialProductPathText, %PRODUCT_PRICE_CSV%
    Gui, 1:ListView, SpecialProductLV
    LV_Delete()
    SelectedSpecialProductRow := 0
    EnsureSpecialProductCsv()

    rows := LoadSpecialProductRows()
    rowCount := 0
    for index, line in rows
    {
        cols := ParseCsvLine(line)
        while (cols.MaxIndex() < 15)
            cols.Push("")

        LV_Add("", cols[1], cols[2], cols[3], cols[4], cols[5], cols[6], cols[7], cols[8], cols[9], cols[10], cols[11], cols[12], cols[13], cols[14], cols[15])
        rowCount++
    }

    ApplySpecialProductColumnWidths()
    SetWorkStatus("특별상품단가.csv " rowCount "개 항목 로드됨")
}

ApplySpecialProductColumnWidths()
{
    Gui, 1:ListView, SpecialProductLV
    LV_ModifyCol(1, 70)
    LV_ModifyCol(2, 170)
    LV_ModifyCol(3, 110)
    LV_ModifyCol(4, 85)
    LV_ModifyCol(5, 85)
    LV_ModifyCol(6, 55)
    LV_ModifyCol(7, 65)
    LV_ModifyCol(8, 45)
    LV_ModifyCol(9, 45)
    LV_ModifyCol(10, 45)
    LV_ModifyCol(11, 45)
    LV_ModifyCol(12, 45)
    LV_ModifyCol(13, 75)
    LV_ModifyCol(14, 75)
    LV_ModifyCol(15, 75)
}

SetSpecialProductSelectionFromColumns(cols)
{
    Gui, 1:Default
    while (cols.MaxIndex() < 15)
        cols.Push("")

    SetSelectedProduct(cols[1], cols[2], cols[3], cols[4], cols[5], cols[13], cols[14], cols[15])
    display := CleanComboText(cols[2] " / " cols[3] " / " cols[4] "-" cols[5] " [" cols[1] "]")
    GuiControl, 1:, ProductSelect, %display%
    GuiControl, 1:, ProductSearch, % cols[2]

    if (cols[6] != "")
        GuiControl, 1:, 중분류, % cols[6]
    if (cols[7] != "")
        GuiControl, 1:, 소분류y값, % cols[7]
    GuiControl, 1:, A, % cols[8]
    GuiControl, 1:, 매출, % cols[9]
    GuiControl, 1:, B, % cols[10]
    GuiControl, 1:, 소매, % cols[11]
    GuiControl, 1:, C, % cols[12]

    SetWorkStatus("특별상품 선택: " cols[2])
}

SelectSpecialProductListRow(productCode, productName)
{
    Gui, 1:ListView, SpecialProductLV
    Loop, % LV_GetCount()
    {
        LV_GetText(rowCode, A_Index, 1)
        LV_GetText(rowName, A_Index, 2)
        if ((productCode != "" && rowCode = productCode) || (productCode = "" && productName != "" && rowName = productName)) {
            LV_Modify(A_Index, "Select Focus Vis")
            return A_Index
        }
    }

    return 0
}

EnsureSelectedProductFromSpecialList()
{
    global SelectedSpecialProductRow

    Gui, 1:Default
    Gui, 1:ListView, SpecialProductLV
    selectedRow := LV_GetNext()
    if (selectedRow = 0 && LV_GetCount() = 1)
        selectedRow := 1

    if (selectedRow = 0)
        return false

    SelectedSpecialProductRow := selectedRow
    cols := []
    Loop, 15
    {
        LV_GetText(colValue, selectedRow, A_Index)
        cols.Push(colValue)
    }

    SetSpecialProductSelectionFromColumns(cols)
    return true
}

EnsureSpecialProductCsv()
{
    global PRODUCT_PRICE_CSV

    SplitPath, PRODUCT_PRICE_CSV, , csvDir
    if (csvDir != "" && !FileExist(csvDir))
        FileCreateDir, %csvDir%

    if !FileExist(PRODUCT_PRICE_CSV) {
        header := SpecialProductHeader() "`r`n"
        FileAppend, %header%, %PRODUCT_PRICE_CSV%, UTF-8
    }
}

LoadSpecialProductRows()
{
    global PRODUCT_PRICE_CSV

    rows := []
    if !FileExist(PRODUCT_PRICE_CSV)
        return rows

    FileRead, csvText, *P65001 %PRODUCT_PRICE_CSV%
    Loop, Parse, csvText, `n, `r
    {
        line := StrReplace(A_LoopField, Chr(0xFEFF), "")
        if (Trim(line) = "" || IsSpecialProductHeader(line))
            continue

        cols := ParseCsvLine(line)
        if (cols.MaxIndex() >= 2)
            rows.Push(line)
    }

    return rows
}

WriteSpecialProductRows(rows)
{
    global PRODUCT_PRICE_CSV

    EnsureSpecialProductCsv()
    output := SpecialProductHeader() "`r`n"
    for index, line in rows
        output .= line "`r`n"

    FileDelete, %PRODUCT_PRICE_CSV%
    FileAppend, %output%, %PRODUCT_PRICE_CSV%, UTF-8
}

FindSpecialProductRow(rows, productCode, productName)
{
    for index, line in rows
    {
        cols := ParseCsvLine(line)
        if (cols.MaxIndex() < 2)
            continue

        if (productCode != "" && cols[1] = productCode)
            return index

        if (productCode = "" && productName != "" && cols[2] = productName)
            return index
    }

    return 0
}

SpecialProductHeader()
{
    return CsvEscape("상품코드") "," CsvEscape("상품명") "," CsvEscape("규격") "," CsvEscape("검색중분류") "," CsvEscape("검색소분류") "," CsvEscape("중분류") "," CsvEscape("소분류y값") "," CsvEscape("A") "," CsvEscape("매출") "," CsvEscape("B") "," CsvEscape("소매") "," CsvEscape("C") "," CsvEscape("관리코드") "," CsvEscape("바코드") "," CsvEscape("검색키")
}

SpecialProductCsvLine(productCode, productName, productSpec, productMid, productSub, categoryIndex, rowY, priceA, priceSales, priceB, priceRetail, priceC, manageCode := "", barcode := "", searchKeyword := "")
{
    return CsvEscape(productCode) "," CsvEscape(productName) "," CsvEscape(productSpec) "," CsvEscape(productMid) "," CsvEscape(productSub) "," CsvEscape(categoryIndex) "," CsvEscape(rowY) "," CsvEscape(priceA) "," CsvEscape(priceSales) "," CsvEscape(priceB) "," CsvEscape(priceRetail) "," CsvEscape(priceC) "," CsvEscape(manageCode) "," CsvEscape(barcode) "," CsvEscape(searchKeyword)
}

IsSpecialProductHeader(line)
{
    cols := ParseCsvLine(line)
    firstCol := StrReplace(cols[1], Chr(0xFEFF), "")
    return (cols.MaxIndex() >= 2 && firstCol = "상품코드" && cols[2] = "상품명")
}

EnsureProductSearchCsv()
{
    global PRODUCT_SEARCH_CSV

    SplitPath, PRODUCT_SEARCH_CSV, , csvDir
    if (csvDir != "" && !FileExist(csvDir))
        FileCreateDir, %csvDir%

    if !FileExist(PRODUCT_SEARCH_CSV) {
        header := ProductSearchHeader() "`r`n"
        FileAppend, %header%, %PRODUCT_SEARCH_CSV%, UTF-8
    }
}

ProductSearchHeader()
{
    return CsvEscape("상품코드") "," CsvEscape("상품명") "," CsvEscape("규격") "," CsvEscape("중분류") "," CsvEscape("소분류") "," CsvEscape("관리코드") "," CsvEscape("바코드")
}

IsProductSearchHeader(line)
{
    cols := ParseCsvLine(line)
    return (cols.MaxIndex() >= 2 && cols[1] = "상품코드" && cols[2] = "상품명")
}

GetSelectedProductName()
{
    global ProductSelect, ProductSearch, ProductDisplayToName, SelectedProductName

    if (SelectedProductName != "")
        return SelectedProductName

    if (ProductSelect != "" && ProductDisplayToName.HasKey(ProductSelect))
        return ProductDisplayToName[ProductSelect]

    if (ProductSelect != "")
        return ProductSelect

    return ProductSearch
}

LoadProductsFromMysql(searchText := "")
{
    global ProductRows, ProductDisplayToName, SelectedProductCode, SelectedProductName, SelectedProductSpec, SelectedProductMid, SelectedProductSub
    global SelectedProductManageCode, SelectedProductBarcode, SelectedProductSearchKeyword
    global PRODUCT_SEARCH_CSV

    EnsureProductSearchGui()
    EnsureProductSearchCsv()
    ProductRows := Object()
    ProductDisplayToName := Object()
    SelectedProductCode := ""
    SelectedProductName := ""
    SelectedProductSpec := ""
    SelectedProductMid := ""
    SelectedProductSub := ""
    SelectedProductManageCode := ""
    SelectedProductBarcode := ""
    SelectedProductSearchKeyword := ""
    cleanSearch := Trim(searchText)
    helper := A_ScriptDir "\product-search.js"
    outFile := PRODUCT_SEARCH_CSV

    if !FileExist(helper) {
        MsgBox, 16, 상품조회 실패, %helper% 파일이 없습니다.
        return
    }

    command := "node """ helper """ """ cleanSearch """ """ outFile """"
    RunWait, %command%, C:\Users\shwoodnew\tms_new, Hide UseErrorLevel

    if (ErrorLevel != 0) {
        MsgBox, 16, MySQL 상품조회 실패, Node 상품조회 실행에 실패했습니다.`nErrorLevel: %ErrorLevel%
        return
    }

    if !FileExist(outFile) {
        MsgBox, 16, MySQL 상품조회 실패, 조회 결과 파일을 만들지 못했습니다.
        return
    }

    GuiControl, 2:, SearchWindowProductSearch, %cleanSearch%
    GuiControl, 2:, ProductSearchPathText, %PRODUCT_SEARCH_CSV%
    FileRead, productText, *P65001 %outFile%
    productList := ""
    rowCount := 0
    firstDisplay := ""
    firstCode := ""
    firstName := ""
    firstSpec := ""
    firstMid := ""
    firstSub := ""
    firstManageCode := ""
    firstBarcode := ""

    Gui, 2:Default
    Gui, 2:ListView, ProductLV
    LV_Delete()

    Loop, Parse, productText, `n, `r
    {
        if (A_LoopField = "" || IsProductSearchHeader(A_LoopField))
            continue

        cols := ParseCsvLine(A_LoopField)
        if (cols.MaxIndex() < 5)
            continue
        while (cols.MaxIndex() < 7)
            cols.Push("")

        code := cols[1]
        name := cols[2]
        spec := cols[3]
        mid := cols[4]
        sub := cols[5]
        manageCode := cols[6]
        barcode := cols[7]

        rowCount++
        display := CleanComboText(name " / " spec " / " mid "-" sub " [" code "]")
        ProductRows[display] := Object("code", code, "name", name, "spec", spec, "mid", mid, "sub", sub, "manageCode", manageCode, "barcode", barcode)
        ProductDisplayToName[display] := name
        productList .= display "|"
        LV_Add("", code, name, spec, mid, sub, manageCode, barcode)
        if (rowCount = 1) {
            firstDisplay := display
            firstCode := code
            firstName := name
            firstSpec := spec
            firstMid := mid
            firstSub := sub
            firstManageCode := manageCode
            firstBarcode := barcode
        }
    }

    LV_ModifyCol(1, 75)
    LV_ModifyCol(2, 230)
    LV_ModifyCol(3, 140)
    LV_ModifyCol(4, 85)
    LV_ModifyCol(5, 80)
    LV_ModifyCol(6, 90)
    LV_ModifyCol(7, 90)

    GuiControl, 1:, ProductSelect, |%productList%
    if (rowCount > 0) {
        GuiControl, 1:Choose, ProductSelect, 1
        Gui, 2:Default
        Gui, 2:ListView, ProductLV
        LV_Modify(1, "Select Focus Vis")
        SetSelectedProduct(firstCode, firstName, firstSpec, firstMid, firstSub, firstManageCode, firstBarcode)
        GuiControl, 1:, ProductSelect, %firstDisplay%
        LoadSelectedProductPrice(false)
        Gui, 1:Default
        SetWorkStatus("상품 " rowCount "개 조회됨")
    } else {
        Gui, 1:Default
        SetWorkStatus("조회된 상품이 없습니다")
    }

    Gui, 1:Default
}

CleanComboText(value)
{
    value := StrReplace(value, "|", " ")
    value := StrReplace(value, "`r", " ")
    value := StrReplace(value, "`n", " ")
    return Trim(value)
}

ClearJedaeroProductSearch()
{
    WinWait, ahk_class TfmMain, , 3
    if ErrorLevel
        return false

    IfWinNotActive, ahk_class TfmMain, , WinActivate, ahk_class TfmMain
    WinWaitActive, ahk_class TfmMain, , 3
    if ErrorLevel
        return false

    ControlFocus, TRzEdit2, ahk_class TfmMain
    Sleep, 80
    ControlSetText, TRzEdit2, , ahk_class TfmMain
    Sleep, 80
    ControlGetText, currentSearchText, TRzEdit2, ahk_class TfmMain
    if (currentSearchText = "")
        return true

    ControlClick, TRzEdit2, ahk_class TfmMain
    Sleep, 80
    SendInput, ^a
    Sleep, 40
    SendInput, {Backspace}
    Sleep, 80
    ControlGetText, currentSearchText, TRzEdit2, ahk_class TfmMain
    return (currentSearchText = "")
}

SearchJedaeroProduct(productName)
{
    Gui, 1:Default
    productName := Trim(productName)
    if (productName = "")
        return

    WinWait, ahk_class TfmMain, , 3
    IfWinNotActive, ahk_class TfmMain, , WinActivate, ahk_class TfmMain
    WinWaitActive, ahk_class TfmMain, , 3

    ControlFocus, TRzEdit2, ahk_class TfmMain
    Sleep, 100
    ControlClick, TRzEdit2, ahk_class TfmMain
    Sleep, 100
    SendInput, ^a
    Sleep, 50
    SendInput, {Backspace}
    Sleep, 100
    ControlSetText, TRzEdit2, %productName%, ahk_class TfmMain
    Sleep, 100
    ControlGetText, currentSearchText, TRzEdit2, ahk_class TfmMain
    if (currentSearchText != productName) {
        backupClipboard := ClipboardAll
        Clipboard := productName
        ClipWait, 1
        ControlClick, TRzEdit2, ahk_class TfmMain
        Sleep, 100
        SendInput, ^a
        Sleep, 50
        SendInput, {Backspace}
        Sleep, 50
        SendInput, ^v
        Sleep, 100
        Clipboard := backupClipboard
    }
    ControlSend, TRzEdit2, {Enter}, ahk_class TfmMain
    SendInput, {Enter}
    Sleep, 700
    SetWorkStatus("제대로 검색: " productName)
}

ConfirmDialogButton(title, hotkey := "{Enter}")
{
    IfWinNotActive, %title%, , WinActivate, %title%,
    WinWaitActive, %title%, , 2
    Sleep, 100

    if (hotkey != "")
        SendInput, %hotkey%

    Sleep, 250
    if WinExist(title) {
        ControlClick, Button1, %title%
        Sleep, 250
    }

    if WinExist(title) {
        SendInput, {Enter}
        Sleep, 250
    }
}

ApplyPriceValues(priceC, priceRetail, priceB, priceSales, priceA)
{
    ControlClick, TRzGroupButton2, ahk_exe JedaeroM.exe
    Sleep, 200
    if !ApplyOnePrice(priceA, 6, 2, "A")
        return false
    if !ApplyOnePrice(priceSales, 6, 1, "매출")
        return false
    if !ApplyOnePrice(priceB, 6, 3, "B")
        return false
    if !ApplyOnePrice(priceRetail, 6, 5, "소매")
        return false
    if !ApplyOnePrice(priceC, 6, 4, "C")
        return false
    return true
}

SelectJedaeroCategory(mid, subY)
{
    mid := Trim(mid)
    subY := Trim(subY)

    if (mid = "" || subY = "")
        return false

    if subY is not number
        return false

    WinGetTitle, jedaeroTitle, ahk_class TfmMain
    if !InStr(jedaeroTitle, "상품변경") {
        SetWorkStatus("분류 선택 실패: 상품변경 화면이 아님 - " jedaeroTitle)
        return false
    }

    Control, Choose, %mid%, TRzComboBox9, ahk_class TfmMain
    Sleep, 600

    if !FindJedaeroSubGrid(gridHwnd, gridClassNN, gridX, gridY, gridW, gridH)
        return false

    clickX := 50
    clickY := Round(subY)

    if (clickY < 5)
        clickY := 5
    if (clickY > gridH - 5)
        clickY := gridH - 5

    ; 중분류 변경 직후 자동 선택된 1번째 소분류는 오른쪽 목록 필터가 안 걸릴 수 있다.
    ; 2번째 소분류를 먼저 눌러 필터 이벤트를 발생시킨 뒤 목표 소분류를 다시 누른다.
    dummySecondY := 60
    if (dummySecondY > gridH - 5)
        dummySecondY := gridH - 5

    ClickJedaeroSubGrid(gridClassNN, clickX, dummySecondY)
    Sleep, 600
    ClickJedaeroSubGrid(gridClassNN, clickX, clickY)
    Sleep, 700
    return true
}

FindJedaeroSubGrid(ByRef gridHwnd, ByRef gridClassNN, ByRef gridX, ByRef gridY, ByRef gridW, ByRef gridH)
{
    Loop, 30
    {
        classNN := "TDBGridEh" A_Index
        ControlGetPos, x, y, w, h, %classNN%, ahk_class TfmMain
        if ErrorLevel
            continue

        if (x <= 20 && y >= 150 && w >= 80 && w <= 160 && h >= 100) {
            ControlGet, hwnd, Hwnd,, %classNN%, ahk_class TfmMain
            if ErrorLevel
                continue

            gridHwnd := hwnd
            gridClassNN := classNN
            gridX := x
            gridY := y
            gridW := w
            gridH := h
            return true
        }
    }

    SetWorkStatus("분류 선택 실패: 소분류 그리드 찾기 실패")
    return false
}

ClickJedaeroSubGrid(gridClassNN, clickX, clickY)
{
    ControlFocus, %gridClassNN%, ahk_class TfmMain
    Sleep, 50
    ControlClick, %gridClassNN%, ahk_class TfmMain, , , , x%clickX% y%clickY%
}

ApplyOnePrice(priceValue, targetType, priceGrade, priceLabel := "")
{
    inputPercent := BuildInputPercent(priceValue)
    Control, Choose, %targetType%, TRzComboBox2, ahk_exe JedaeroM.exe
    Sleep, 100
    if !SetJedaeroPercentInput(inputPercent) {
        if (priceLabel = "")
            priceLabel := priceGrade
        SetWorkStatus("단가 입력 실패: " priceLabel "=" inputPercent)
        return false
    }
    Control, Choose, %priceGrade%, TRzComboBox7, ahk_exe JedaeroM.exe
    Control, Choose, 2, TRzComboBox6, ahk_exe JedaeroM.exe
    Control, Choose, 3, TRzComboBox3, ahk_exe JedaeroM.exe
    ControlClick, TRzBitBtn3, ahk_exe JedaeroM.exe
    Sleep, 200
    return true
}

BuildInputPercent(priceValue)
{
    priceValue := Trim(priceValue)
    if (priceValue = "")
        return ""

    if priceValue is number
    {
        inputPercent := priceValue + 100
        return inputPercent
    }

    return priceValue
}

SetJedaeroPercentInput(inputPercent)
{
    inputPercent := Trim(inputPercent)
    ControlFocus, TRzEdit1, ahk_exe JedaeroM.exe
    Sleep, 50
    ControlClick, TRzEdit1, ahk_exe JedaeroM.exe
    Sleep, 50
    ControlSetText, TRzEdit1, %inputPercent%, ahk_exe JedaeroM.exe
    Sleep, 80
    ControlGetText, currentPercent, TRzEdit1, ahk_exe JedaeroM.exe

    if (currentPercent = inputPercent)
        return true

    backupClipboard := ClipboardAll
    Clipboard := inputPercent
    ClipWait, 1
    ControlClick, TRzEdit1, ahk_exe JedaeroM.exe
    Sleep, 50
    SendInput, ^a
    Sleep, 30
    SendInput, {Backspace}
    Sleep, 30
    SendInput, ^v
    Sleep, 80
    Clipboard := backupClipboard
    ControlGetText, currentPercent, TRzEdit1, ahk_exe JedaeroM.exe
    return (currentPercent = inputPercent)
}

LoadPriceTableRows()
{
    global PRICE_TABLE_CSV, SelectedPriceTableRow

    Gui, 1:Default
    GuiControl, 1:, PriceTablePathText, %PRICE_TABLE_CSV%
    Gui, 1:ListView, PriceTableLV
    LV_Delete()
    SelectedPriceTableRow := 0

    if !FileExist(PRICE_TABLE_CSV) {
        FileAppend, , %PRICE_TABLE_CSV%, UTF-8
        SetWorkStatus("단가변환표.csv 새 파일 생성")
        return
    }

    skipMap := LoadPriceTableSkipMap()
    rowCount := 0
    Loop, Read, %PRICE_TABLE_CSV%
    {
        line := A_LoopReadLine
        if (Trim(line) = "")
            continue

        cols := ParseCsvLine(line)
        if (cols.MaxIndex() < 8)
            continue

        rowOptions := IsPriceTableRowSkipped(skipMap, cols[1], cols[2], cols[3]) ? "Check" : ""
        LV_Add(rowOptions, cols[1], cols[2], cols[3], cols[4], cols[5], cols[6], cols[7], cols[8])
        rowCount++
    }

    ApplyPriceTableColumnWidths()
    SetWorkStatus("단가변환표 " rowCount "개 항목 로드됨")
}

SavePriceTableSkipStates()
{
    global PRICE_TABLE_SKIP_CSV

    Gui, 1:Default
    Gui, 1:ListView, PriceTableLV

    output := CsvEscape("프리셋") "," CsvEscape("중분류") "," CsvEscape("소분류") "," CsvEscape("스킵") "`r`n"
    row := 0
    Loop
    {
        row := LV_GetNext(row, "Checked")
        if (row = 0)
            break

        LV_GetText(presetName, row, 1)
        LV_GetText(mid, row, 2)
        LV_GetText(sub, row, 3)
        if (Trim(presetName) != "")
            output .= CsvEscape(presetName) "," CsvEscape(mid) "," CsvEscape(sub) "," CsvEscape("1") "`r`n"
    }

    FileDelete, %PRICE_TABLE_SKIP_CSV%
    FileAppend, %output%, %PRICE_TABLE_SKIP_CSV%, UTF-8
}

ToggleAllPriceTableSkips()
{
    global PriceTableBulkChecking

    Gui, 1:Default
    Gui, 1:ListView, PriceTableLV

    rowCount := LV_GetCount()
    if (rowCount = 0)
        return

    checkedCount := 0
    row := 0
    Loop
    {
        row := LV_GetNext(row, "Checked")
        if (row = 0)
            break
        checkedCount++
    }

    checkOption := (checkedCount = rowCount) ? "-Check" : "Check"
    PriceTableBulkChecking := true
    Loop, %rowCount%
        LV_Modify(A_Index, checkOption)
    PriceTableBulkChecking := false

    SavePriceTableSkipStates()
    SetWorkStatus((checkOption = "Check") ? "단가변환표 전체 스킵 체크" : "단가변환표 전체 스킵 해제")
}

LoadPriceTableSkipMap()
{
    global PRICE_TABLE_SKIP_CSV

    skipMap := Object()
    if !FileExist(PRICE_TABLE_SKIP_CSV)
        return skipMap

    Loop, Read, %PRICE_TABLE_SKIP_CSV%
    {
        line := A_LoopReadLine
        if (Trim(line) = "")
            continue
        if (A_Index = 1 && InStr(line, "프리셋") && InStr(line, "스킵"))
            continue

        cols := ParseCsvLine(line)
        if (cols.MaxIndex() < 1 || Trim(cols[1]) = "")
            continue

        mid := (cols.MaxIndex() >= 2) ? cols[2] : ""
        sub := (cols.MaxIndex() >= 3) ? cols[3] : ""
        if (Trim(mid) = "" && Trim(sub) = "")
            skipMap[Trim(cols[1])] := true
        else
            skipMap[PriceTableSkipKey(cols[1], mid, sub)] := true
    }

    return skipMap
}

IsPriceTableRowSkipped(skipMap, presetName, mid, sub)
{
    return (skipMap.HasKey(PriceTableSkipKey(presetName, mid, sub)) || skipMap.HasKey(Trim(presetName)))
}

PriceTableSkipKey(presetName, mid, sub)
{
    return Trim(presetName) Chr(31) Trim(mid) Chr(31) Trim(sub)
}

ApplyPriceTableColumnWidths()
{
    Gui, 1:Default
    Gui, 1:ListView, PriceTableLV
    LV_ModifyCol(1, 220)
    LV_ModifyCol(2, 58)
    LV_ModifyCol(3, 58)
    LV_ModifyCol(4, 45)
    LV_ModifyCol(5, 45)
    LV_ModifyCol(6, 45)
    LV_ModifyCol(7, 45)
    LV_ModifyCol(8, 45)
}

SetPriceTableEditFields(name, mid, sub, priceA, priceSales, priceB, priceRetail, priceC)
{
    GuiControl, 1:, PresetCsvName, %name%
    GuiControl, 1:, PresetCsvMid, %mid%
    GuiControl, 1:, PresetCsvSub, %sub%
    GuiControl, 1:, PresetCsvA, %priceA%
    GuiControl, 1:, PresetCsvSales, %priceSales%
    GuiControl, 1:, PresetCsvB, %priceB%
    GuiControl, 1:, PresetCsvRetail, %priceRetail%
    GuiControl, 1:, PresetCsvC, %priceC%
}

HasPriceValues(priceA, priceSales, priceB, priceRetail, priceC)
{
    return (Trim(priceA) != "" && Trim(priceSales) != "" && Trim(priceB) != "" && Trim(priceRetail) != "" && Trim(priceC) != "")
}

LoadSelectedPriceTablePrices(ByRef priceA, ByRef priceSales, ByRef priceB, ByRef priceRetail, ByRef priceC, ByRef presetName)
{
    Gui, 1:Default
    Gui, 1:ListView, PriceTableLV
    selectedRow := LV_GetNext()
    if (selectedRow = 0)
        return false

    LV_GetText(presetName, selectedRow, 1)
    LV_GetText(priceA, selectedRow, 4)
    LV_GetText(priceSales, selectedRow, 5)
    LV_GetText(priceB, selectedRow, 6)
    LV_GetText(priceRetail, selectedRow, 7)
    LV_GetText(priceC, selectedRow, 8)
    return HasPriceValues(priceA, priceSales, priceB, priceRetail, priceC)
}

LoadSelectedPriceTableRow(ByRef mid, ByRef sub, ByRef priceA, ByRef priceSales, ByRef priceB, ByRef priceRetail, ByRef priceC, ByRef presetName)
{
    Gui, 1:Default
    Gui, 1:ListView, PriceTableLV
    selectedRow := LV_GetNext()
    if (selectedRow = 0)
        return false

    LV_GetText(presetName, selectedRow, 1)
    LV_GetText(mid, selectedRow, 2)
    LV_GetText(sub, selectedRow, 3)
    LV_GetText(priceA, selectedRow, 4)
    LV_GetText(priceSales, selectedRow, 5)
    LV_GetText(priceB, selectedRow, 6)
    LV_GetText(priceRetail, selectedRow, 7)
    LV_GetText(priceC, selectedRow, 8)

    return (Trim(mid) != "" && Trim(sub) != "" && HasPriceValues(priceA, priceSales, priceB, priceRetail, priceC))
}

ApplyPresetValuesToMainFields(name, mid, sub, priceA, priceSales, priceB, priceRetail, priceC)
{
    GuiControl, 1:, frmSAVEDPRESET, %name%
    GuiControl, 1:, 중분류, %mid%
    GuiControl, 1:, 소분류y값, %sub%
    GuiControl, 1:, A, %priceA%
    GuiControl, 1:, 매출, %priceSales%
    GuiControl, 1:, B, %priceB%
    GuiControl, 1:, 소매, %priceRetail%
    GuiControl, 1:, C, %priceC%
}

SavePriceTableRowData()
{
    global PRICE_TABLE_CSV, SelectedPriceTableRow
    global PresetCsvName, PresetCsvMid, PresetCsvSub, PresetCsvA, PresetCsvSales, PresetCsvB, PresetCsvRetail, PresetCsvC

    Gui, 1:Submit, NoHide

    if (Trim(PresetCsvName) = "") {
        MsgBox, 48, 단가변환표 저장, 프리셋명을 입력해주세요.
        return
    }

    rows := LoadPriceTableArray()
    newLine := PriceTableCsvLine(PresetCsvName, PresetCsvMid, PresetCsvSub, PresetCsvA, PresetCsvSales, PresetCsvB, PresetCsvRetail, PresetCsvC)

    if (SelectedPriceTableRow > 0 && SelectedPriceTableRow <= rows.MaxIndex()) {
        rows[SelectedPriceTableRow] := newLine
    } else {
        rows.Push(newLine)
        SelectedPriceTableRow := rows.MaxIndex()
    }

    savedRow := SelectedPriceTableRow
    WritePriceTableArray(rows)
    GoSub, UpdatePresetList
    LoadPriceTableRows()
    SelectedPriceTableRow := savedRow
    Gui, 1:Default
    Gui, 1:ListView, PriceTableLV
    LV_Modify(SelectedPriceTableRow, "Select Focus Vis")
    ApplyPresetValuesToMainFields(PresetCsvName, PresetCsvMid, PresetCsvSub, PresetCsvA, PresetCsvSales, PresetCsvB, PresetCsvRetail, PresetCsvC)
    SetWorkStatus("단가변환표 저장: " PresetCsvName)
}

LoadPriceTableArray()
{
    global PRICE_TABLE_CSV

    rows := []
    if !FileExist(PRICE_TABLE_CSV)
        return rows

    Loop, Read, %PRICE_TABLE_CSV%
    {
        line := A_LoopReadLine
        if (Trim(line) != "")
            rows.Push(line)
    }

    return rows
}

WritePriceTableArray(rows)
{
    global PRICE_TABLE_CSV

    output := ""
    for index, line in rows
        output .= line "`r`n"

    FileDelete, %PRICE_TABLE_CSV%
    FileAppend, %output%, %PRICE_TABLE_CSV%, UTF-8
}

PriceTableCsvLine(name, mid, sub, priceA, priceSales, priceB, priceRetail, priceC)
{
    return CsvEscape(name) "," CsvEscape(mid) "," CsvEscape(sub) "," CsvEscape(priceA) "," CsvEscape(priceSales) "," CsvEscape(priceB) "," CsvEscape(priceRetail) "," CsvEscape(priceC) ",,"
}

LoadIniRows()
{
    global INI_FILE

    GuiControl, , IniPathText, %INI_FILE%
    Gui, ListView, IniLV
    LV_Delete()
    EnsureIniFile()

    if !FileExist(INI_FILE) {
        SetWorkStatus("CSV 파일 없음: " INI_FILE)
        return
    }

    rowCount := 0
    Loop, Read, %INI_FILE%
    {
        line := A_LoopReadLine
        trimmed := Trim(line)

        if (trimmed = "")
            continue

        if (A_Index = 1 && IsCsvHeader(trimmed))
            continue

        cols := ParseCsvLine(line)
        if (cols.MaxIndex() >= 3) {
            section := cols[1]
            key := cols[2]
            value := cols[3]
            LV_Add("", section, key, value)
            rowCount++
        }
    }

    LV_ModifyCol(1, 140)
    LV_ModifyCol(2, 160)
    LV_ModifyCol(3, 295)
    SetWorkStatus("CSV " rowCount "개 항목 로드됨")
}

SaveIniValue(section, key, value)
{
    global INI_FILE

    section := Trim(section)
    key := Trim(key)
    if (section = "" || key = "") {
        MsgBox, 48, CSV 저장, 섹션과 키를 입력해주세요.
        return
    }

    SaveConfigValue(INI_FILE, section, key, value)
    LoadIniRows()
    GuiControl, , IniSectionEdit, %section%
    GuiControl, , IniKeyEdit, %key%
    GuiControl, , IniValueEdit, %value%
    SetWorkStatus("CSV 저장: [" section "] " key)
}

DeleteIniValue(section, key)
{
    global INI_FILE

    section := Trim(section)
    key := Trim(key)
    if (section = "" || key = "") {
        MsgBox, 48, CSV 삭제, 삭제할 섹션과 키를 선택해주세요.
        return
    }

    if !FileExist(INI_FILE) {
        MsgBox, 48, CSV 삭제, 파일이 없습니다.
        return
    }

    DeleteConfigValue(INI_FILE, section, key)
    GuiControl, , IniValueEdit,
    LoadIniRows()
    SetWorkStatus("CSV 삭제: [" section "] " key)
}

EnsureIniFile()
{
    global INI_FILE

    EnsureCsvFile(INI_FILE)
}

EnsureCsvFile(filePath)
{
    SplitPath, filePath, , iniDir
    if (iniDir != "" && !FileExist(iniDir))
        FileCreateDir, %iniDir%

    if !FileExist(filePath)
        FileAppend, % CsvLine("섹션", "키", "값") "`r`n", %filePath%, UTF-8
}

SaveConfigValue(filePath, section, key, value)
{
    EnsureCsvFile(filePath)

    FileRead, csvText, *P65001 %filePath%
    output := CsvLine("섹션", "키", "값") "`r`n"
    found := false

    Loop, Parse, csvText, `n, `r
    {
        line := A_LoopField
        trimmed := Trim(line)

        if (trimmed = "" || IsCsvHeader(trimmed))
            continue

        cols := ParseCsvLine(line)
        if (cols.MaxIndex() < 3)
            continue

        if (cols[1] = section && cols[2] = key) {
            output .= CsvLine(section, key, value) "`r`n"
            found := true
        } else {
            output .= CsvLine(cols[1], cols[2], cols[3]) "`r`n"
        }
    }

    if (!found)
        output .= CsvLine(section, key, value) "`r`n"

    FileDelete, %filePath%
    FileAppend, %output%, %filePath%, UTF-8
}

ReadConfigValue(filePath, section, key, defaultValue := "")
{
    if !FileExist(filePath)
        return defaultValue

    FileRead, csvText, *P65001 %filePath%
    Loop, Parse, csvText, `n, `r
    {
        line := A_LoopField
        trimmed := Trim(line)

        if (trimmed = "" || IsCsvHeader(trimmed))
            continue

        cols := ParseCsvLine(line)
        if (cols.MaxIndex() >= 3 && cols[1] = section && cols[2] = key)
            return cols[3]
    }

    return defaultValue
}

DeleteConfigValue(filePath, section, key)
{
    if !FileExist(filePath)
        return

    FileRead, csvText, *P65001 %filePath%
    output := CsvLine("섹션", "키", "값") "`r`n"

    Loop, Parse, csvText, `n, `r
    {
        line := A_LoopField
        trimmed := Trim(line)

        if (trimmed = "" || IsCsvHeader(trimmed))
            continue

        cols := ParseCsvLine(line)
        if (cols.MaxIndex() < 3)
            continue

        if (cols[1] = section && cols[2] = key)
            continue

        output .= CsvLine(cols[1], cols[2], cols[3]) "`r`n"
    }

    FileDelete, %filePath%
    FileAppend, %output%, %filePath%, UTF-8
}

CsvLine(field1, field2, field3)
{
    return CsvEscape(field1) "," CsvEscape(field2) "," CsvEscape(field3)
}

CsvEscape(value)
{
    value := StrReplace(value, """", """""")
    return """" value """"
}

ParseCsvLine(line)
{
    fields := []
    field := ""
    inQuotes := false
    i := 1
    len := StrLen(line)

    while (i <= len) {
        ch := SubStr(line, i, 1)

        if (ch = """") {
            nextCh := SubStr(line, i + 1, 1)
            if (inQuotes && nextCh = """") {
                field .= """"
                i += 2
                continue
            }
            inQuotes := !inQuotes
        } else if (ch = "," && !inQuotes) {
            fields.Push(field)
            field := ""
        } else {
            field .= ch
        }
        i++
    }

    fields.Push(field)
    return fields
}

IsCsvHeader(line)
{
    cols := ParseCsvLine(line)
    return (cols.MaxIndex() >= 3 && cols[1] = "섹션" && cols[2] = "키" && cols[3] = "값")
}


GetXY(byref winx, byref winy)
{
    global DEFAULT_CONFIG_CSV

    RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe

;============================================================
; position gui based on values from local csv
;============================================================

    winx := ReadConfigValue(DEFAULT_CONFIG_CSV, "Window Position", "winx", 0)
    winy := ReadConfigValue(DEFAULT_CONFIG_CSV, "Window Position", "winy", 0)

    ; get the width and height of the entire desktop (even if it spans multiple monitors)
    SysGet, VirtualWidth, 78
    SysGet, VirtualHeight, 79

    ; prevent display of gui off-screen (somehow this was still happening to jess, so I added this logic)
    if (winx < 0) OR (winx > VirtualWidth)
        winx := 0

    if (winy < 0) OR (winy > VirtualHeight)
        winy := 0

    Return

}

;============================================================
; save all gui control values for active gui to local csv
;============================================================

GuiSave(inifile,section,begin="",end="")
{
    global DEFAULT_CONFIG_CSV

    SplitPath, inifile, file, path, ext, base, drive     ; splitpath expects paths with \

    if (path = "") {   ; if no path given then use default path
        RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe
        inifile := DEFAULT_CONFIG_CSV
    }

    WinGet, List_controls, ControlList, A    ; get list of all controls active gui

    if (begin = "")
        flag := 0
    else
        flag := 1

    Loop, Parse, List_controls, `n
    {
        ;ControlGet, cid, hWnd,, %A_LoopField%         ; get the id of current control
        GuiControlGet, textvalue,,%A_Loopfield%,Text  ; get associated text
        GuiControlGet, vname, Name, %A_Loopfield%     ; get controls vname

        If (vname = "")   ; only save controls which have a vname
            continue

        if (begin = vname) {
            flag := 0
            continue
        }

        if (flag)
            continue

        if (end = vname)
            break

        GuiControlGet, value ,, %A_Loopfield%         ; get controls value
        value := RegExReplace(value, "`n", "|")

        ; todo: truncate edit values to not exceed ini fieldsize limit (1024?)  OR blank (all or nothing)

        SaveConfigValue(inifile, section, vname, value)

    }

   return
}

;============================================================
; Update gui controls with values from local csv.
;============================================================

GuiRestore(inifile,section)
{
    global DEFAULT_CONFIG_CSV

    SplitPath, inifile, file, path, ext, base, drive     ; splitpath expects paths with \

    if (path = "") {   ; if no path given then use default path
        RegExMatch(A_ScriptName, "^(.*?)\.", basename)    ; dont use splitpath to get basename because it cant handle DeltaRush.1.3.exe
        inifile := DEFAULT_CONFIG_CSV
    }

    ;============================================================
    ; update gui controls with values from local csv
    ;============================================================

    WinGet, List_controls, ControlList, A   ; get list of all controls for active gui

    Loop, Parse, List_controls, `n
    {

        ;ControlGet, cid, hWnd,, %A_LoopField%         ; get the id of current control
        ;GuiControlGet, textvalue,,%A_Loopfield%,Text  ; get controls associated text
        GuiControlGet, vname, Name, %A_Loopfield%     ; get controls vname
        GuiControlGet, value ,, %A_Loopfield%         ; get controls value

        If (vname = "")   ; only process controls which have a vname
            continue

        value := ReadConfigValue(inifile, section, vname, "ERROR")

        if (value != "ERROR") {

            value := RegExReplace(value, "\|", "`n")

            RegExMatch( A_Loopfield, "(.*?)\d+", name)   ; extract the control name without numbers
            if (name1 = "ComboBox") {
                GuiControl, ChooseString, %A_Loopfield%, %value%   ; select item in dropdownlist
            } else {
                GuiControl,  ,%A_Loopfield%, %value%    ; update the control
            }
        }

    }

    return

}
