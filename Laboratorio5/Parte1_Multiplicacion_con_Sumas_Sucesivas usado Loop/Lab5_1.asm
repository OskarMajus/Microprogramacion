.MODEL small
.STACK
.DATA
	Num1 DB ?
    Num2 DB ?
	
	;10,13,7 sirven para que cada cadena se escriba en una linea nueva (salto de linea)
	cadena DB 10,13,7,'El siguiente programa calcula la Multiplicacion y Division de dos numeros con sumas y restas sucesivas$'
	ingreso DB 10,13,7,'Ingrese el primer numero entre (0-9) $'
	ingreso2 DB 10,13,7,'Ingrese el segundo numero entre (0-9) $'
	
	cadMul DB 10,13,7,'PRODUCTO: $'
	
	
	decenas DB ?
    unidades DB ?	
	resultado DB 0

.CODE
Programa:

	Mov AX, @DATA
    MOV DS, AX
	
	;Limpiar Pantalla
	MOV AH, 0h
	MOV AL, 3h
	INT 10H
	
	MOV DX, Offset cadena
	MOV AH, 09h
	INT 21H	 
	
	;SALTO DE LINEA
	MOV DX, 10       
    MOV AH, 02H
    INT 21H
	
	MOV DX, Offset ingreso
	MOV AH, 09h
	INT 21H	
	
	;LEER numero1
    MOV AH, 01H
    INT 21H	
    MOV Num1, AL
    SUB Num1, 30H
	
	MOV DX, Offset ingreso2
	MOV AH, 09h
	INT 21H	
	    	
	;LEER numero2
    MOV AH, 01H
    INT 21H	
    MOV Num2, AL
    SUB Num2, 30H
    
	;SALTO DE LINEA
	MOV DX, 10       
    MOV AH, 02H
    INT 21H
    	
 ;---------------------- MULTIPLICACION CON SUMAS SUCESIVAS -------------------------------------------------------   
    ;Preparar valores para el ciclo
    MOV CL, Num2
    
    CicloSumas:
		ADD BL, Num1
    LOOP CicloSumas
	
    
	MOV resultado, BL
	
	LEA DX, CadMul
	MOV AH, 09h
	INT 21H
	
	
	MOV AL, resultado
	AAM				;Corrige  el  resultado  en  AX  del  producto  de  dos  números  decimales  desempaquetados,convirtiéndolo en un valor decimal desempaquetado. La lógica que emplea es la siguiente:AH := AL / 10 AL := AL mod 10
	MOV BX, AX
	
	;Mostrando primer digitio
	MOV AH, 02h
	MOV DL, BH
	ADD DL, 30h
	INT 21H
	;Mostrando segundo digito
	MOV AH, 02h
	MOV DL, BL
	ADD DL, 30h
	INT 21H
	

	
		
	;FINALIZAR
    finalizar:
    MOV AH, 4CH
    INT 21H

END Programa