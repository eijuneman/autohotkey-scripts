장소=천안대로103

ExampleURL := "https://map.kakao.com"
;~ ExampleURL := "https://map.kakao.com/?map_type=TYPE_MAP&itemId=8413606&q=" 장소 "&urlLevel=3&urlX=538132&urlY=905785"



pwb := pwbget() 			; ComObject를 컨트롤 하기 위해서 인터넷 익스플로러 어플리케이션 ComObject를 하나 땡겨옵니다.

pwb.Visible := True 		; 이것의 Visible 속성을 트루로 바꿔줍니다. 즉, 보이게끔 한다는 말이죠.

pwb.Navigate(ExampleURL) ; ExampleURL 사이트로 이동시킵니다.

While(pwb.busy) 			; pwb가 busy 인 속성일 때 동안 Sleep,200 을 해라 라는 의미에요.
	sleep,200




While (! Element:=pwb.document.getElementById("search.keyword.query")) ;Make sure element exists before moving forward
	Sleep, 50

pwb.document.getElementById("search.keyword.query").value := 장소
;~ pwb.document.getElementById("user_pw").value := "48342"

	Sleep, 50
pwb.document.getElementsByClassname("go ico_search btn_search")[0].Click()
	Sleep, 50

While (! Element:=pwb.document.getElementById("daum-maps-shape-0"))
	Sleep, 50

pwb.document.getElementsByClassname("rough")[0].Click()
	Sleep, 50

pwb.document.getElementsByClassname("copyUrl")[0].Click()
	Sleep, 50
pwb.document.getElementsByClassname("img_social ico_sns_kt")[0].Click()
	Sleep, 50
Sleep, 1000

;~ var:=pwb.LocationName ;grab page Title

wb := WBGet() ; sleep
var:=wb.LocationURL
wb := ComObjCreate("InternetExplorer.Application") ;create IE Object
wb.visible:=true  ; Set the IE object to visible

;~ var:=pwb.LocationURL ;grab current url
;~ MsgBox, % var
;~ wb.Navigate(var)
wb.Navigate(var)
;~ var2:=pwb.LocationURL ;grab current url
ToolTip, % var "`ㅜ"
While(wb.busy) 			; pwb가 busy 인 속성일 때 동안 Sleep,200 을 해라 라는 의미에요.
	sleep,200




;~ IELoad(wb)
;~ MsgBox, % wb.LocationURL "`n" var
;~ While (! Element:=wb.document.getElementByClassname("link_tab"))
	;~ Sleep, 50
wb.document.getElementsByClassname("link_tab")[1].Click()
wb.document.getElementsByClassname("link_tab")[1].Click()
;~ wb.document.getElementsByClassname("user_name")[0].Click()
	Sleep, 2000
	ControlSend, Internet Explorer_Server1, {Tab}, 카카오톡 공유 - Internet Explorer
	Sleep, 1000
받는분=신흥목재N100
;~ wb.document.getElementsByClassname("lab_search").value := 받는분
;~ wb.document.getElementsByClassName("inp_search").item[0].Value := "" ;Set Classname and Array value
	Sleep, 100

;~ pwb.document.getElementByID("XXX").Value :="XXX" ;Unique ID-with dashes


wb.document.getElementsByClassName("lab_search").Value :=받는분 ;Set Classname and Array value

MsgBox, 끝
return


IEGet(name="") {
   IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame     ;// Get active window if no parameter
   Name := (Name="New Tab - Windows Internet Explorer")? "about:Tabs":RegExReplace(Name, " - (Windows|Microsoft)? ?Internet Explorer$")
   for wb in ComObjCreate("Shell.Application").Windows()
      if wb.LocationName=Name and InStr(wb.FullName, "iexplore.exe")
         return wb
}

WBGet(WinTitle="ahk_class IEFrame", Svr#=1) {               ;// based on ComObjQuery docs
   static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
        , IID := "{0002DF05-0000-0000-C000-000000000046}"   ;// IID_IWebBrowserApp
;//     , IID := "{332C4427-26CB-11D0-B483-00C04FD90119}"   ;// IID_IHTMLWindow2
   SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%
   if (ErrorLevel != "FAIL") {
      lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
      if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0 {
         DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
         return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
      }
   }
}
;~ IEGet()
;~ {
	;~ try
	;~ {
		;~ ; IE 컴 오브젝트가 간혹가다가 오류가 날 때가 있는데, 이 때를 위해 Try-Catch 구문을 사용했어요. 완벽하게 잡는진 모르겠네요.
		;~ wb := ComObjActive("InternetExplorer.Application") ; create IE
		;~ return wb
	;~ }
	;~ catch e
	;~ {
		;~ wb:=""
		;~ sleep,100
		;~ IEGet()
	;~ }
;~ }

pwbget()
{
	try
	{
		; IE 컴 오브젝트가 간혹가다가 오류가 날 때가 있는데, 이 때를 위해 Try-Catch 구문을 사용했어요. 완벽하게 잡는진 모르겠네요.
		pwb := ComObjCreate("InternetExplorer.Application") ; create IE
		return pwb
	}
	catch e
	{
		pwb:=""
		sleep,100
		pwbget()
	}
}

IELoad(pwb)
{
    If !pwb    ;If wb is not a valid pointer then quit
        Return False
    Loop    ;Otherwise sleep for .1 seconds untill the page starts loading
        Sleep,100
    Until (pwb.busy)
    Loop    ;Once it starts loading wait until completes
        Sleep,100
    Until (!pwb.busy)
    Loop    ;optional check to wait for the page to completely load
        Sleep,100
    Until (pwb.Document.Readystate = "Complete")
Return True
}
