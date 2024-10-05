000100 IDENTIFICATION DIVISION.    
000200     PROGRAM-ID. CALCULADORA-INTERES-COMPUESTO.
000300
000400*    Este programa calcula el interes compuesto.
000500 ENVIRONMENT DIVISION.
000600 DATA DIVISION.
000700 WORKING-STORAGE SECTION.
000800 
000900 01  SI-NO        PIC X.
001000 01  EL-INTERES   PIC 99V9.
001100 01  INTERES-COMO-DECIMAL PIC V999.
001200 01  EL-VALOR-PRINCIPAL         PIC 9(9)V99.
001300 01  EL-NUEVO-VALOR             PIC 9(9)V99.
001400 01  INTERES-GENERADO           PIC 9(9)V99.
001500 01  EL-PERIODO                 PIC 9999.
001600 01  NO-DE-PERIODOS             PIC 999.
001700 
001800 01  CAMPO-DE-ENTRADA           PIC Z(9).ZZ.
001900 01  VALOR-MOSTRADO             PIC ZZZ,ZZZ,ZZ9.99.
002000*RUTINA DE NIVEL 1
002100 PROCEDURE DIVISION.
002200 PROGRAMA-EMPIEZA.
002300
002400     MOVE "S" TO SI-NO.
002500     PERFORM OBTENER-Y-MOSTRAR-RESULTADO
002600     UNTIL SI-NO = "N".
002700 
002800 TERMINA-PROGRAMA.
002900     STOP RUN.
003000*RUTINAS DE NIVEL 2
003100 OBTENER-Y-MOSTRAR-RESULTADO.
003200     PERFORM OBTENER-VALOR-PRINCIPAL.
003300     PERFORM OBTENER-EL-INTERES.
003400     PERFORM OBTENER-LOS-PERIODOS.
003500     PERFORM CALCULAR-EL-RESULTADO.
003600     PERFORM MOSTRAR-EL-RESULTADO.
003700     PERFORM VA-DE-NUEVO.
003800
003900 OBTENER-VALOR-PRINCIPAL.
004000     DISPLAY "Ingresa un valor de .01 A 999999999.99".
004100     ACCEPT CAMPO-DE-ENTRADA.
004200     MOVE CAMPO-DE-ENTRADA TO EL-VALOR-PRINCIPAL.
004300     IF EL-VALOR-PRINCIPAL < .01 OR
004400     EL-VALOR-PRINCIPAL > 999999999.99
004500     DISPLAY "ENTRADA INVALIDA."
004600     GO TO OBTENER-VALOR-PRINCIPAL.
004700
004800 OBTENER-EL-INTERES.
004900     DISPLAY "Con cuanto interes quieres tu valor .1% - 99.9%".
005000     ACCEPT CAMPO-DE-ENTRADA.
005100     MOVE CAMPO-DE-ENTRADA TO EL-INTERES.
005200     IF EL-INTERES < .1 OR
005300     EL-INTERES > 99.9 
005400     DISPLAY "ENTRADA INVALIDA."
005500     GO OBTENER-EL-INTERES
005600     ELSE
005700         COMPUTE INTERES-COMO-DECIMAL  = EL-INTERES /100.
005800 
005900 OBTENER-LOS-PERIODOS.
006000     DISPLAY "Cuanto periodos de interés calculamos(1 - 999)".
006100     ACCEPT CAMPO-DE-ENTRADA.
006200     MOVE CAMPO-DE-ENTRADA TO NO-DE-PERIODOS.
006300     IF NO-DE-PERIODOS < 1 OR
006400     NO-DE-PERIODOS > 999
006500     DISPLAY "ENTRADA INVALIDA."
006600     GO OBTENER-LOS-PERIODOS.
006700*RUTINAS DE NIVEL 3
006800 CALCULAR-EL-RESULTADO.
006900     PERFORM CALCULAR-EL-PERIODO
007000         VARYING EL-PERIODO FROM 1 BY 1
007100             UNTIL EL-PERIODO > NO-DE-PERIODOS.
007200
007300 CALCULAR-EL-PERIODO.
007400     COMPUTE INTERES-GENERADO ROUNDED = 
007500     EL-VALOR-PRINCIPAL * INTERES-COMO-DECIMAL.
007600     COMPUTE EL-NUEVO-VALOR = EL-VALOR-PRINCIPAL +
007700     INTERES-GENERADO.
007800     MOVE EL-NUEVO-VALOR TO EL-VALOR-PRINCIPAL.
007900*TERMINAN RUTINAS DE NIVEL 3
008000 VA-DE-NUEVO.
008100     DISPLAY "VA DE NUEVO?"
008200     ACCEPT SI-NO.
008300     IF SI-NO = "S"
008400         MOVE "S" TO SI-NO
008500     IF SI-NO = "N"
008600         MOVE "N" TO SI-NO. STOP RUN. 
008700*Esta condicional es key sensitive si no se pone en mayus se cierr
008800 MOSTRAR-EL-RESULTADO.
008900     MOVE EL-NUEVO-VALOR TO VALOR-MOSTRADO.
009000     DISPLAY "EL RESULTADO DEL VALOR ES " VALOR-MOSTRADO.
009100
009200
009300
009400
009500
009600
009700
009800
009900
