// Reporte Creado Automáticamente por Datapro 
// Fecha      : 16/06/2005 Hora: 15:06:29  HEY
// Aplicación : 01
// Tabla      : NMTRABAJADOR        

#include "dpxBase.CH"
#include "DpxReport.ch"

PROCE MAIN()
     LOCAL cSql,oCursor,cMsg:="",oFont1,oFont2,nContar:=0

     PRIVATE oReport,nLineas:=0

     CursorWait()

     oCursor:GoTop()

     DEFINE FONT oFont1 NAME "ARIAL" SIZE 0,-10
     DEFINE FONT oFont2 NAME "ARIAL" SIZE 0,-10 BOLD

     REPORT oReport TITLE  "Trabajadores",;
            "Fecha: "+dtoc(Date())+" Hora: "+TIME();
            CAPTION "Prueba" ;
            FOOTER "Página: "+str(oReport:nPage,3)+" Registros: "+alltrim(str(nLineas,5)) CENTER ;
            FONT oFont1,oFont2;
            PREVIEW



     COLUMN TITLE "Contar";
            DATA nContar;
            PICTURE "999,999,999.99";
            TOTAL ;
            FONT 2 ;
            SIZE 14;
            RIGHT  

     
     END REPORT

     oReport:bSkip:={||nContar++}

     ACTIVATE REPORT oReport ;
              WHILE nContar<10;
              ON STARTGROUP oReport:NewLine();
              ON STARTPAGE  RepBitmap();
              ON CHANGE ONCHANGE()

     oGenRep:OutPut(.F.) // Verifica el Dispositivo de Salida Final

     oFont1:End()
     oFont2:End()

RETURN NIL

/*
// En Cada Registro se puede Aplicar Fórmulas
// Es llamado por Skip()
*/
FUNCTION ONCHANGE()

   nLineas:=nLineas+1 // Es Posible Aplicar Fórmulas

/*
// Si Desea Imprimir lineas Adicionales que no esten vacias
  
*/
   
 // PrintMemo(CAMPOMEMO,1,.F.,1) // Imprimir Campo Memo


RETURN .T.


/*
// Inicio en Cada Página
*/
STATIC FUNCTION RepBitMap()

  DEFAULT oDp:cLogoBmp:="BITMAPS\LOGO.BMP"

  oReport:SayBitmap(.3,.3, oDp:cLogoBmp,.5,.5)

RETURN NIL
/*
oRun : objeto de Ejecución
*/

// EOF 

