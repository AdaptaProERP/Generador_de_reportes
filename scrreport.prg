// Programa  : SCRREPORT
// Fecha/Hora: 02/01/2003 14:36:28
// Propósito : Lista el Contenido de un Programa Fuente DpXbase
// Creado Por: Juan Navas
#INCLUDE "FIVEWIN.CH"
#INCLUDE "report.ch"

STATIC oReport, nField

FUNCTION DPXBASE(cMemo,cTitle)
     LOCAL aLineas:={"1"}

     DEFAULT cTitle:=" Prueba.SCR "

     IF ValType(cMemo)="C"
        cMemo  :=STRTRAN(cMemo,CHR(13))
        aLineas:=_VECTOR(cMemo,CHR(10))
     ENDIF

     nField:=1

     REPORT oReport TITLE  "PROGRAMA "+cTitle PREVIEW

     COLUMN TITLE "Contenido" DATA aLineas[nField] SIZE 132

     END REPORT

     oReport:bSkip := {|| nField++}

     ACTIVATE REPORT oReport WHILE nField <= len(aLineas)

RETURN NIL
