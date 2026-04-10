#NoEnv
#SingleInstance, Force
Process, close, JedaeroM.exe
SendMode Input
FileDelete, %A_Desktop%\오토핫키\판매정보.CSV
FileDelete, %A_Desktop%\오토핫키\판매정보.xlsx
FileDelete, %A_Desktop%\오토핫키\오늘이후판매리스트.xlsx
FileDelete, %A_Desktop%\오토핫키\오늘이후판매리스트.CSV
FileDelete, %A_Desktop%\오토핫키\전산상품정보.xlsx
FileDelete, %A_Desktop%\오토핫키\전산상품정보.CSV
FileDelete, %A_Desktop%\오토핫키\어제판매리스트.xlsx
FileDelete, %A_Desktop%\오토핫키\어제판매리스트.CSV


    Loop, 10
    {
    Process, close, EXCEL.EXE
    winkill, ahk_class XLMAIN
    WinKill, ahk_exe EXCEL.EXE
    Process, close, JedaeroM.exe
    }

Sleep, 2000

Process, close, JedaeroM.exe
Sleep, 100
Process, close, JedaeroM.exe
Sleep, 100
run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M, Max
WinWait, ahk_class TfmLogin,
IfWinNotActive, ahk_class TfmLogin, , WinActivate, ahk_class TfmLogin,
WinWaitActive, ahk_class TfmLogin,
Sleep, 100
ControlSetText, TRzEdit2, admin, ahk_class TfmLogin
Sleep, 100
ControlSetText, TRzEdit1, kk0404, ahk_class TfmLogin
Sleep, 100
ControlClick, TRzBitBtn3, ahk_class TfmLogin

    Sleep, 100

    Winwait, ahk_class TfmMain
    IfWinNotActive, ahk_class TfmMain, , WinActivate, ahk_class TfmMain
    WinWaitActive, ahk_class TfmMain

    Sleep, 1000
    ControlClick, x5 y5, ahk_exe JedaeroM.exe
    Sleep, 100

    send, {LAlt}{Enter}{Left 3}{Down 5}{Enter}
    Sleep, 1000




{
    ControlClick, TRzButton4, ahk_class TfmMain
    Sleep, 500
    ControlClick, TRzButton4, ahk_class TfmMain
    Sleep, 500
    Control, choose, 7, TRzComboBox3, ahk_class TfmMain
}
        Sleep, 200
    ControlSend, TRzDateTimeEdit1, {Down 1}, ahk_class TfmMain
        Sleep, 200
    ControlSend, TRzDateTimeEdit2, {Down 1}, ahk_class TfmMain
        Sleep, 200
    ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x39 y25
    Sleep, 3000
    ControlClick, TAdvToolBar3, ahk_class TfmMain,,,,x173 y18
    Sleep, 1000

            WinWait, ahk_exe EXCEL.EXE,
    IfWinNotActive, ahk_exe EXCEL.EXE, , WinActivate, ahk_exe EXCEL.EXE,
    WinWaitActive, ahk_exe EXCEL.EXE,

        Sleep, 500


        WinWait, ahk_exe JedaeroM.exe,
    IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
    WinWaitActive, ahk_exe JedaeroM.exe,


    WinShow, 제대로판매재고M
    ControlClick, TButton1, ahk_class TMessageForm
    Loop
    {
        if (ErrorLevel = 1){
        WinWait, ahk_class TMessageForm,
        IfWinNotActive, ahk_class TMessageForm, , WinActivate, ahk_class TMessageForm,
        WinWaitActive, ahk_class TMessageForm,
        ControlSend, TButton1, {enter}, ahk_class TMessageForm
        Sleep, 100
        }
        else
        {
            break
        }
    }




        Sleep, 4000
    엑셀01 := ComObjActive("Excel.Application")
    엑셀01.Visible:=True
    엑셀01.ActiveWorkbook.Saveas(A_Desktop . "\오토핫키\어제판매리스트.xlsx")
    엑셀01.Quit
        Sleep, 2000
파일경로1 := A_DESKTOP . "\오토핫키\어제판매리스트.xlsx"
XL1 := ComObjCreate("Excel.Application")
XL1.workbooks.open(파일경로1,3,0)
XL1.Visible := 0
XL1.sheets("sheet1").Activate
XL1.cells.Copy
XL1.cells.Select
XL1.selection.PasteSpecial(-4163)
XL1.Application.CutCopyMode := 0
XL1.Activeworkbook.save
XL1.Activeworkbook.saveAs(A_Desktop . "\오토핫키\어제판매리스트" , 62)
XL1.Activeworkbook.Close(1)
XL1.Quit



Sleep, 1000

    Loop, 10
    {
        Process, close, EXCEL.EXE
        winkill, ahk_class XLMAIN
        WinKill, ahk_exe EXCEL.EXE
    }
{
    ControlClick, TRzButton4, ahk_class TfmMain
    Sleep, 500
    ControlClick, TRzButton4, ahk_class TfmMain
    Sleep, 500
    Control, choose, 10, TRzComboBox3, ahk_class TfmMain
        Sleep, 200
}        Sleep, 200
    ;~ ControlSend, TRzDateTimeEdit1, {Up 1}, ahk_class TfmMain
        ;~ Sleep, 200
    ;~ ControlSend, TRzDateTimeEdit2, {Up 1}, ahk_class TfmMain
        Sleep, 200
    ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x39 y25
    Sleep, 3000
    ControlClick, TAdvToolBar3, ahk_class TfmMain,,,,x173 y18
    Sleep, 1000

            WinWait, ahk_exe EXCEL.EXE,
    IfWinNotActive, ahk_exe EXCEL.EXE, , WinActivate, ahk_exe EXCEL.EXE,
    WinWaitActive, ahk_exe EXCEL.EXE,

        Sleep, 500


        WinWait, ahk_exe JedaeroM.exe,
    IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
    WinWaitActive, ahk_exe JedaeroM.exe,



    WinShow, 제대로판매재고M
    ControlClick, TButton1, ahk_class TMessageForm
    Loop
    {
        if (ErrorLevel = 1){
        WinWait, ahk_class TMessageForm,
        IfWinNotActive, ahk_class TMessageForm, , WinActivate, ahk_class TMessageForm,
        WinWaitActive, ahk_class TMessageForm,
        ControlSend, TButton1, {enter}, ahk_class TMessageForm
        Sleep, 100
        }
        else
        {
            break
        }
    }




        Sleep, 4000
    엑셀02 := ComObjActive("Excel.Application")
    엑셀02.Visible:=True
    엑셀02.ActiveWorkbook.Saveas(A_Desktop . "\오토핫키\판매정보.xlsx")
    엑셀02.Quit
        Sleep, 2000
파일경로2 := A_DESKTOP . "\오토핫키\판매정보.xlsx"
XL2 := ComObjCreate("Excel.Application")
XL2.workbooks.open(파일경로2,3,0)
XL2.Visible := 0
XL2.sheets("sheet1").Activate
XL2.cells.Copy
XL2.cells.Select
XL2.selection.PasteSpecial(-4163)
XL2.Application.CutCopyMode := 0
XL2.Activeworkbook.save
XL2.Activeworkbook.saveAs(A_Desktop . "\오토핫키\판매정보" , 62)
XL2.Activeworkbook.Close(1)
XL2.Quit








     Loop, 10
    {
    Process, close, EXCEL.EXE
    winkill, ahk_class XLMAIN
    WinKill, ahk_exe EXCEL.EXE
    }
{
    ControlClick, TRzButton4, ahk_class TfmMain
    Sleep, 500
    ControlClick, TRzButton4, ahk_class TfmMain
    Sleep, 500
    Control, choose, 7, TRzComboBox3, ahk_class TfmMain
        Sleep, 200
    ControlSend, TRzDateTimeEdit1, {up 30}, ahk_class TfmMain
        Sleep, 200
}
    ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x39 y25
    Sleep, 3000
    ControlClick, TAdvToolBar3, ahk_class TfmMain,,,,x173 y18
    Sleep, 1000

            WinWait, ahk_exe EXCEL.EXE,
    IfWinNotActive, ahk_exe EXCEL.EXE, , WinActivate, ahk_exe EXCEL.EXE,
    WinWaitActive, ahk_exe EXCEL.EXE,

        Sleep, 500


        WinWait, ahk_exe JedaeroM.exe,
    IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
    WinWaitActive, ahk_exe JedaeroM.exe,



    WinShow, 제대로판매재고M
    ControlClick, TButton1, ahk_class TMessageForm
    Loop
    {
        if (ErrorLevel = 1){
        WinWait, ahk_class TMessageForm,
        IfWinNotActive, ahk_class TMessageForm, , WinActivate, ahk_class TMessageForm,
        WinWaitActive, ahk_class TMessageForm,
        ControlSend, TButton1, {enter}, ahk_class TMessageForm
        Sleep, 100
        }
        else
        {
            break
        }
    }




                    ;~ FileMove, %A_Desktop%\오토핫키\어제판매리스트.xlsx, %A_Desktop%\오토핫키\복사본\어제판매리스트.xlsx, 1


        Sleep, 4000
    엑셀03 := ComObjActive("Excel.Application")
    엑셀03.Visible:=True
    엑셀03.ActiveWorkbook.Saveas(A_Desktop . "\오토핫키\오늘이후판매리스트.xlsx")
    엑셀03.Quit
        Sleep, 2000
파일경로3 := A_DESKTOP . "\오토핫키\오늘이후판매리스트.xlsx"
XL3 := ComObjCreate("Excel.Application")
XL3.workbooks.open(파일경로3,3,0)
XL3.Visible := 0
XL3.sheets("sheet1").Activate
XL3.cells.Copy
XL3.cells.Select
XL3.selection.PasteSpecial(-4163)
XL3.Application.CutCopyMode := 0
XL3.Activeworkbook.save
XL3.Activeworkbook.saveAs(A_Desktop . "\오토핫키\오늘이후판매리스트" , 62)
XL3.Activeworkbook.Close(1)
XL3.Quit










































;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Sleep, 1000
Process, close, JedaeroM.exe
Sleep, 100
Process, close, JedaeroM.exe
Sleep, 100

Sleep, 2000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


run, JedaeroM.exe, C:\참좋은소프트\제대로판매재고M, Max
    Loop, 10
    {
    Process, close, EXCEL.EXE
    winkill, ahk_class XLMAIN
    WinKill, ahk_exe EXCEL.EXE
    }

WinWait, ahk_class TfmLogin,
IfWinNotActive, ahk_class TfmLogin, , WinActivate, ahk_class TfmLogin,
WinWaitActive, ahk_class TfmLogin,
Sleep, 100
Send, kk0404
Sleep, 100
send, {Enter}
Sleep, 1000
WinActivate, ahk_exe JedaeroM.exe

   Loop, 10
    {
    Process, close, EXCEL.EXE
    winkill, ahk_class XLMAIN
    WinKill, ahk_exe EXCEL.EXE
    }

      WinWait, ahk_exe JedaeroM.exe,
    IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
    WinWaitActive, ahk_exe JedaeroM.exe,
    Sleep, 1000
    send, {LAlt}{Enter}{Right 2}{Enter}
    Sleep, 4000


    ControlClick, TAdvToolBar2, ahk_class TfmMain,,,,x177 y11
    Sleep, 3000


            WinWait, ahk_exe EXCEL.EXE,
    IfWinNotActive, ahk_exe EXCEL.EXE, , WinActivate, ahk_exe EXCEL.EXE,
    WinWaitActive, ahk_exe EXCEL.EXE,

        Sleep, 500

    WinShow, 제대로판매재고M
        WinWait, ahk_exe JedaeroM.exe,
    IfWinNotActive, ahk_exe JedaeroM.exe, , WinActivate, ahk_exe JedaeroM.exe,
    WinWaitActive, ahk_exe JedaeroM.exe,




    ControlClick, TButton1, ahk_class TMessageForm
    Loop
    {
        if (ErrorLevel = 1){
        WinWait, ahk_class TMessageForm,
        IfWinNotActive, ahk_class TMessageForm, , WinActivate, ahk_class TMessageForm,
        WinWaitActive, ahk_class TMessageForm,
        ControlSend, TButton1, {enter}, ahk_class TMessageForm
        Sleep, 100
        }
        else
        {
            break
        }
    }

                    ;~ FileMove, %A_Desktop%\오토핫키\상품정보.xlsx, %A_Desktop%\오토핫키\복사본\상품정보.xlsx, 1

        Sleep, 2000
    엑셀04 := ComObjActive("Excel.Application")
    엑셀04.Visible:=True
    엑셀04.ActiveWorkbook.Saveas(A_Desktop . "\오토핫키\전산상품정보.xlsx")
    엑셀04.Quit
        Sleep, 2000
파일경로4 := A_DESKTOP . "\오토핫키\전산상품정보.xlsx"
XL4 := ComObjCreate("Excel.Application")
XL4.workbooks.open(파일경로4,3,0)
XL4.Visible := 0
XL4.sheets("sheet1").Activate
XL4.cells.Copy
XL4.cells.Select
XL4.selection.PasteSpecial(-4163)
XL4.Application.CutCopyMode := 0
XL4.Activeworkbook.save
XL4.Activeworkbook.saveAs(A_Desktop . "\오토핫키\전산상품정보" , 62)
XL4.Activeworkbook.Close(1)
XL4.Quit



    Loop, 10
    {
        Process, close, EXCEL.EXE
        winkill, ahk_class XLMAIN
        WinKill, ahk_exe EXCEL.EXE
        Process, close, JedaeroM.exe
    }



FileCopy, %A_Desktop%\오토핫키\어제판매리스트.CSV, \\192.168.0.1\hdd2\WMS\상품정보\어제판매리스트.CSV
FileCopy, %A_Desktop%\오토핫키\어제판매리스트.xlsx, \\192.168.0.1\hdd2\WMS\상품정보\어제판매리스트.xlsx

FileCopy, %A_Desktop%\오토핫키\판매정보.CSV, \\192.168.0.1\hdd2\WMS\상품정보\판매정보.CSV
FileCopy, %A_Desktop%\오토핫키\판매정보.xlsx, \\192.168.0.1\hdd2\WMS\상품정보\판매정보.xlsx

FileCopy, %A_Desktop%\오토핫키\오늘이후판매리스트.xlsx, \\192.168.0.1\hdd2\WMS\상품정보\오늘이후판매리스트.xlsx
FileCopy, %A_Desktop%\오토핫키\오늘이후판매리스트.CSV, \\192.168.0.1\hdd2\WMS\상품정보\오늘이후판매리스트.CSV

FileCopy, %A_Desktop%\오토핫키\전산상품정보.xlsx, \\192.168.0.1\hdd2\WMS\상품정보\전산상품정보.xlsx
FileCopy, %A_Desktop%\오토핫키\전산상품정보.CSV, \\192.168.0.1\hdd2\WMS\상품정보\전산상품정보.CSV

Process, close, JedaeroM.exe
Sleep, 100

Process, close, JedaeroM.exe
Sleep, 100


    Loop, 10
    {
    Process, close, EXCEL.EXE
    winkill, ahk_class XLMAIN
    WinKill, ahk_exe EXCEL.EXE
    Process, close, JedaeroM.exe
    }





Sleep, 2000
ExitApp