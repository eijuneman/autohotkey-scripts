#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines, -1
#SingleInstance Off

LOG := A_ScriptDir . "\debug_eb.log"
FileDelete, %LOG%

KscHex(str) {
    if (str = "")
        return "''"
    nBytes := DllCall("WideCharToMultiByte", "UInt", 949, "UInt", 0, "WStr", str, "Int", -1, "Ptr", 0, "Int", 0, "Ptr", 0, "Ptr", 0, "Int") - 1
    if (nBytes <= 0)
        return "''"
    VarSetCapacity(buf, nBytes + 2, 0)
    DllCall("WideCharToMultiByte", "UInt", 949, "UInt", 0, "WStr", str, "Int", -1, "Ptr", &buf, "Int", nBytes + 1, "Ptr", 0, "Ptr", 0)
    hexChars := "0123456789ABCDEF"
    hex := ""
    Loop, %nBytes%
    {
        byte := NumGet(buf, A_Index - 1, "UChar")
        hi := SubStr(hexChars, (byte >> 4) + 1, 1)
        lo := SubStr(hexChars, Mod(byte, 16) + 1, 1)
        hex .= hi . lo
    }
    return "_KSC_5601 X'" . hex . "'"
}

Log(msg) {
    global LOG
    FormatTime, ts, , HH:mm:ss
    line := "[" . ts . "] " . msg . "`r`n"
    FileAppend, %line%, %LOG%, UTF-8
}

Log("=== 디버그 시작 (AHK 빌드: " . (A_IsUnicode ? "Unicode" : "ANSI") . " " . A_PtrSize*8 . "bit) ===")

fbConn := ComObjCreate("ADODB.Connection")
connStr := "Driver={Firebird/InterBase(r) driver};DBNAME=192.168.0.7/3050:jedaero_server;UID=SYSDBA;PWD=masterkey;CHARSET=UTF8;"
try {
    fbConn.Open(connStr)
    Log("Firebird 연결 OK")
} catch e {
    Log("Firebird 연결 실패: " . e.Message)
    ExitApp
}

; KscHex 검증
testStr := "(주)재현인텍스/광주"
hexLit := KscHex(testStr)
Log("KscHex(" . testStr . ") = " . hexLit)
expected := "_KSC_5601 X'28C1D629C0E7C7F6C0CEC5D8BDBA2FB1A4C1D6'"
if (hexLit = expected) {
    Log("KscHex 결과 정확 ✓")
} else {
    Log("KscHex 결과 불일치 ✗  기대=" . expected)
}

; CT_PK 조회 (KscHex 통한 LIKE)
sqlCt =
(LTrim Join`s
SELECT FIRST 1 CT_PK FROM CHITTOP
WHERE CAST(G_NAME AS VARCHAR(80) CHARACTER SET KSC_5601) LIKE %hexLit% || '%'
AND CT_DATE = '2026-05-27'
AND CAST(CT_GUBUN AS VARCHAR(10) CHARACTER SET KSC_5601) = _KSC_5601 X'B8C5C0D4'
ORDER BY CT_PK DESC
)
Log("[1] sqlCt 실행")
try {
    rs := fbConn.Execute(sqlCt)
    if (rs.EOF) {
        Log("  결과 없음")
        rs.Close()
        ExitApp
    }
    ct_pk := rs.Fields("CT_PK").Value
    Log("  CT_PK = " . ct_pk)
    rs.Close()
} catch e {
    Log("  실패: " . e.Message)
    ExitApp
}

; sqlChit EB
sqlChit =
(LTrim Join`s
EXECUTE BLOCK RETURNS (
  C_PK INTEGER,
  J_PK INTEGER,
  J_NAME_K VARCHAR(40) CHARACTER SET KSC_5601,
  J_STANDARD_K VARCHAR(40) CHARACTER SET KSC_5601,
  C_QTY NUMERIC(18,2),
  J_GITA_K VARCHAR(20) CHARACTER SET KSC_5601,
  C_NO INTEGER
) AS
DECLARE V_NAME VARCHAR(200);
DECLARE V_STD VARCHAR(200);
DECLARE V_GITA VARCHAR(200);
BEGIN
  FOR SELECT C_PK, J_PK, J_NAME, J_STANDARD, C_QTY, J_GITA, C_NO
      FROM CHIT WHERE CT_PK = %ct_pk% ORDER BY C_NO
      INTO :C_PK, :J_PK, :V_NAME, :V_STD, :C_QTY, :V_GITA, :C_NO
  DO BEGIN
    BEGIN J_NAME_K = CAST(:V_NAME AS VARCHAR(40) CHARACTER SET KSC_5601);
    WHEN ANY DO J_NAME_K = NULL; END
    BEGIN J_STANDARD_K = CAST(:V_STD AS VARCHAR(40) CHARACTER SET KSC_5601);
    WHEN ANY DO J_STANDARD_K = NULL; END
    BEGIN J_GITA_K = CAST(:V_GITA AS VARCHAR(20) CHARACTER SET KSC_5601);
    WHEN ANY DO J_GITA_K = NULL; END
    SUSPEND;
  END
END
)

Log("[2] sqlChit EXECUTE BLOCK 실행")
try {
    rs := fbConn.Execute(sqlChit)
    Log("  Execute OK")
    rowCount := 0
    while !rs.EOF {
        rowCount += 1
        c_no := rs.Fields("C_NO").Value
        c_qty := rs.Fields("C_QTY").Value
        j_name := rs.Fields("J_NAME_K").Value
        j_std := rs.Fields("J_STANDARD_K").Value
        j_gita := rs.Fields("J_GITA_K").Value
        Log("  Row" . rowCount . " C_NO=" . c_no . " QTY=" . c_qty)
        Log("    J_NAME    =" . j_name)
        Log("    J_STANDARD=" . j_std)
        Log("    J_GITA    =" . (j_gita = "" ? "(empty/null)" : j_gita))
        rs.MoveNext()
    }
    Log("  총 " . rowCount . "행")
    rs.Close()
} catch e {
    Log("  실패: " . e.Message)
}

fbConn.Close()
Log("=== 끝 ===")
ExitApp
