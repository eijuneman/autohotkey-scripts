#NoEnv
#MaxThreads 255
SetKeyDelay, 0

^1::

ControlGetText, 거래처, TRzEdit8, ahk_class TfmChitSale
ControlGetText, 날짜, TRzDBDateTimeEdit1, ahk_class TfmChitSale
ControlGetText, 시간,  TRzDBEdit12, ahk_class TfmChitSale
ControlGetText, 장소, TRzDBEdit13, ahk_class TfmChitSale



ControlClick, TRzBitBtn8, ahk_class TfmChitSale


		WinWait,  인쇄하기, 
		IfWinNotActive,  인쇄하기, , WinActivate,  인쇄하기, 
		WinWaitActive,  인쇄하기, 
Sleep, 100
ControlClick, TRzListBox1, 인쇄하기 , , , ,x223 y344
ControlClick, TRzBitBtn6, 인쇄하기
Sleep, 100
		WinWait,  Export to Excel, 
		IfWinNotActive,  Export to Excel, , WinActivate,  Export to Excel, 
		WinWaitActive,  Export to Excel, 
Sleep, 100
ControlClick, TButton2, Export to Excel

		WinWait,  다른 이름으로 저장, 
		IfWinNotActive,  다른 이름으로 저장, , WinActivate,  다른 이름으로 저장, 
		WinWaitActive,  다른 이름으로 저장, 
		
ControlClick, 	Button2, 다른 이름으로 저장
		
		
		WinWait,  7.2번째 전표333.xls - Excel, 
		IfWinNotActive,  7.2번째 전표333.xls - Excel, , WinActivate,  7.2번째 전표333.xls - Excel, 
		WinWaitActive,  7.2번째 전표333.xls - Excel, 
		
	
Xl := ComObjActive("Excel.Application") 

winmove, ahk_class XLMAIN, , 5, 5
WinMaximize, ahk_class XLMAIN


xl.Cells.Replace(What:="ea", Replacement:="개")

xl.Cells.Replace(What:="~*", Replacement:="에 ")



Xl.range("a1:ae60").Select ; 
Xl.Selection.unMerge

xl.range("q:q").select
xl.selection.copy
xl.range("r:r").pastespecial

xl.range("o:o").select
xl.selection.copy
xl.range("q:q").pastespecial

xl.range("r:r").select
xl.selection.copy
xl.range("n:n").pastespecial

xl.range("c:c").select
xl.selection.copy
xl.range("d:d").pastespecial

XL.Range("c11").value := "번째 출고 품목? "
SourceRange := XL.Range("C11")
SourceRange.AutoFill(XL.Range("c11:c46"))


XL.Range("o11").value := "출고수량은?"
SourceRange := XL.Range("o11")
SourceRange.AutoFill(XL.Range("o11:o46"))


xl.Range("P11:P46").Select
xl.Selection.NumberFormat := "#,##0"

셀 := 11
Loop
{
복사 = B%셀%

var := xl.Range(복사).value

if(var = "")
	break
else
	셀 ++
}

 셀 --
 복사 = B11:Q%셀%
 
XL.range(복사).select
xl.selection.copy


ClipWait, 0.5
say := clipboard

winkill, 7.2번째 전표333.xls - Excel
ComObjCreate("SAPI.SpVoice").Speak(거래처) ; announce text
Sleep, 100
ComObjCreate("SAPI.SpVoice").Speak(날짜) ; announce text
Sleep, 100
ComObjCreate("SAPI.SpVoice").Speak(시간) ; announce text
Sleep, 100
ComObjCreate("SAPI.SpVoice").Speak(장소) ; announce text
Sleep, 100

ControlClick, TRzBitBtn1, 인쇄하기
ComObjCreate("SAPI.SpVoice").Speak(say) ; announce text
return



^3::
ExitApp