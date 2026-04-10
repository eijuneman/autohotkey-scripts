#NoEnv
SendMode Input
SetKeyDelay, -1
SetMouseDelay, -1
SetWinDelay, -1
SetControlDelay, -1
SetBatchLines, -1


path1 = \\192.168.0.1\hdd2\일정표 최근\일정표220730\부족재고관리\부족재고관리.xlsx






X1 := ComObjCreate( "Excel.Application" )
X1.workbooks.open(path1)
X1.Visible:=true

행끝 := X1.sheets("부족재고관리").UsedRange.Rows.Count

X1.Sheets("부족재고관리").Range("A1:J"행끝).Sort(X1.Sheets("부족재고관리").Columns(1), 1) ;A열을 기준으로 올림차순 sort sheet by data in the 'a' column


return
