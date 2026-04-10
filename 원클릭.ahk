#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;~ SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FormatTime, newdate , YYYYMMDDHH24MISS, yyyy-MM-dd

copydir1 = \\192.168.0.1\hdd2\일정표 최근\일정표220730\사무루틴\2
copydir2 = \\192.168.0.1\hdd2\일정표 최근\일정표220730\사무루틴


;~ MsgBox, %newdate%
;~ MsgBox, %copydir%\2_P_R1_S사무실 관리_T목재 샘플 관리_U예.CSV

;~ FileCopy, %copydir%\2_P_R1_S사무실 관리_T목재 샘플 관리_U예.CSV, %copydir%\2_P%newdate%_R1_S사무실 관리_T목재 샘플 관리_U예.CSV, 1







FileCopy, %copydir1%\2_P_R1_S사무실 관리_T목재 샘플 관리_U예.CSV, %copydir2%\2_P%newdate%_R1_S사무실 관리_T목재 샘플 관리_U예.CSV
FileCopy, %copydir1%\2_P_R1_S사무실 관리_T사무실청소_U예.CSV, %copydir2%\2_P%newdate%_R1_S사무실 관리_T사무실청소_U예.CSV,
FileCopy, %copydir1%\2_P_R1_S사무실 관리_T책상 관리_U예.CSV, %copydir2%\2_P%newdate%_R1_S사무실 관리_T책상 관리_U예.CSV,
FileCopy, %copydir1%\2_P_R1_S사무실 관리_T카달록  시트지_U예.CSV, %copydir2%\2_P%newdate%_R1_S사무실 관리_T카달록  시트지_U예.CSV,
FileCopy, %copydir1%\2_P_R1_S사무실 관리_T캐쉬박스_U예.CSV, %copydir2%\2_P%newdate%_R1_S사무실 관리_T캐쉬박스_U예.CSV,
FileCopy, %copydir1%\2_P_R1_S사무실 관리_T커피머신 관리_U예.CSV, %copydir2%\2_P%newdate%_R1_S사무실 관리_T커피머신 관리_U예.CSV,
FileCopy, %copydir1%\2_P_R1_S창고관리_T도어 전시장 관리_U예.CSV, %copydir2%\2_P%newdate%_R1_S창고관리_T도어 전시장 관리_U예.CSV,
FileCopy, %copydir1%\2_P_R1_S창고관리_T재고파악_U예.CSV, %copydir2%\2_P%newdate%_R1_S창고관리_T재고파악_U예.CSV,
FileCopy, %copydir1%\2_P_R1_S창고관리_T화장실 청소_U예.CSV, %copydir2%\2_P%newdate%_R1_S창고관리_T화장실 청소_U예.CSV,
FileCopy, %copydir1%\2_P_R1_S컴퓨터 루틴_T매출전표 관리_U예.CSV, %copydir2%\2_P%newdate%_R1_S컴퓨터 루틴_T매출전표 관리_U예.CSV,
FileCopy, %copydir1%\2_P_R1_S컴퓨터 루틴_T세금계산서 발행_U예.CSV, %copydir2%\2_P%newdate%_R1_S컴퓨터 루틴_T세금계산서 발행_U예.CSV,
FileCopy, %copydir1%\2_P_R1_S컴퓨터 루틴_T외상전표 관리_U예.CSV, %copydir2%\2_P%newdate%_R1_S컴퓨터 루틴_T외상전표 관리_U예.CSV,
FileCopy, %copydir1%\2_P_R1_S컴퓨터 루틴_T일일결산표 발송_U예.CSV, %copydir2%\2_P%newdate%_R1_S컴퓨터 루틴_T일일결산표 발송_U예.CSV,


return
