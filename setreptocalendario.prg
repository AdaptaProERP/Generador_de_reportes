// Programa   : SETREPTOCALENDARIO
// Fecha/Hora : 09/12/2016 20:08:03
// Propósito  : Presentar Funcionalidad Calendario
/*
// PROGRAMA REPRGOFECHA , puede llamar a REPCALENDARIO()
*/
// Creado Por : Juan Navas
// Llamado por:
// Aplicación :
// Tabla      :

#INCLUDE "DPXBASE.CH"

PROCE MAIN()
   LOCAL oTable :=OpenTable("SELECT CAM_TABLE,CAM_NAME FROM DPCAMPOS WHERE CAM_TYPE"+GetWhere("=","D"))
   LOCAL cSintax:="",cMemo,cWhere
   LOCAL aData  :={},cCodigo:=""

   WHILE !oTable:Eof()

       cSintax:=[BDLIST("]+ALLTRIM(oTable:CAM_TABLE)+[",{"]+ALLTRIM(ALLTRIM(oTable:CAM_NAME))+["})]
       cWhere :="REP_PARAM LIKE "+GetWhere("","%"+cSintax+"%")
       cMemo   :=SQLGET("DPREPORTES","REP_PARAM,REP_CODIGO",cWhere)
       cCodigo:=DPSQLROW(2,"")

       IF !Empty(cMemo)
          AADD(aData,{cCodigo,cSintax})
       ENDIF

       cSintax:=[EJECUTAR("REPBDLIST","]+ALLTRIM(oTable:CAM_TABLE)+[","]+ALLTRIM(ALLTRIM(oTable:CAM_NAME))+[")]
       cWhere :="REP_PARAM LIKE "+GetWhere("","%"+cSintax+"%")
       cMemo   :=SQLGET("DPREPORTES","REP_PARAM,REP_CODIGO",cWhere)
       cCodigo:=DPSQLROW(2,"")

       IF !Empty(cMemo)
          AADD(aData,{cCodigo,cSintax})
       ENDIF

       oTable:DbSkip()

   ENDDO

ViewArray(aData)
   oTable:End()

RETURN NIL
// EOF
