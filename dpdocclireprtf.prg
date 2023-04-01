// Programa   : DPDOCCLIREPRTF         
// Fecha/Hora : 01/04/2023 00:54:25
// Propósito  : Generar una Sola Tabla para Generar formato con Texto RTF
// Creado Por : Juan Navas
// Llamado por: DPDOCCLIREP
// Aplicación :
// Tabla      :

#INCLUDE "DPXBASE.CH"

PROCE MAIN(cCodSuc,cTipDoc,cNumero,cFileDbf)
  LOCAL cSql,cWhere,oTable

  DEFAULT cCodSuc :=oDp:cSucursal,;
          cTipDoc :="PRE",;
          cNumero :=SQLGETMAX("DPDOCCLI","DOC_NUMERO","DOC_TIPDOC"+GetWhere("=",cTipDoc)),;
          cFileDbf:="CRYSTAL\DPDOCCLITORTF"

  cWhere:="DOC_CODSUC"+GetWhere("=",cCodSuc)+" AND "+;
          "DOC_TIPDOC"+GetWhere("=",cTipDoc)+" AND "+;
          "DOC_NUMERO"+GetWhere("=",cNumero)+" AND "+;
          "DOC_TIPTRA"+GetWhere("=","D")

  cSql  :=" SELECT * FROM DPDOCCLI "+;
          " INNER JOIN DPMOVINV ON MOV_CODSUC=DOC_CODSUC AND DOC_TIPDOC=MOV_TIPDOC AND DOC_NUMERO=MOV_DOCUME AND MOV_INVACT=1 "+;
          " INNER JOIN DPMEMO   ON MOV_NUMMEM=MEM_NUMERO "+;
          " LEFT  JOIN DPINV    ON MOV_CODIGO=INV_CODIGO 	"+;
          " LEFT  JOIN DPGRU    ON INV_GRUPO=GRU_CODIGO "+;
          " WHERE "+cWhere

  FERASE(cFileDbf)

  oTable:=OpenTable(cSql)  
  oTable:CTODBF(cFileDbf)
  oTable:End()

RETURN .T.
// EOF

