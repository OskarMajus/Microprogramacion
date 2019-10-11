.MODEL small
.STACK
.DATA
	;10,13,7 sirven para que cada cadena se escriba en una linea nueva (salto de linea)
	cadena DB 10,13,7,'El siguiente programa calcula la Multiplicacion y Division de dos numeros con sumas y restas sucesivas$'
	ingreso DB 10,13,7,'Ingrese el primer numero entre (0-9) $'
	ingreso2 DB 10,13,7,'Ingrese el segundo numero entre (0-9) $'
	
	cadMul DB 10,13,7,'PRODUCTO: $'
	cadCociente DB 10,13,7,'COCIENTE: $'
	cadResiduo DB 10,13,7,'RESIDUO: $'
	
	numero1 DB ?
	numero2 DB ?
	
	producto DB ?
	cociente DB ?
	residuo DB ?
	
	decenas DB ?
    unidades DB ?	
	contador DB 0

.CODE
Programa:

	MOV AX, @DATA
    MOV DS, AX

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
	
	;SALTO DE LINEA
    MOV DX, 10 
    MOV AH, 02H
    INT 21H
	
	;LEER numero1
    MOV AH, 01H
    INT 21H	
    MOV numero1, AL
    SUB numero1, 30H
	
	MOV DX, Offset ingreso2
	MOV AH, 09h
	INT 21H
	
	;SALTO DE LINEA
	MOV DX, 10       
    MOV AH, 02H
    INT 21H
    	
	;LEER numero2
    MOV AH, 01H
    INT 21H	
    MOV numero2, AL
    SUB numero2, 30H
	
	XOR AX, AX
	XOR BX, BX
	MOV BL, numero2
	
	
	;simulando ciclo FOR
	ciclo_sumas:
		
		CMP contador, BL						;Se compara que contador llegue al valor de numero 2 almacenado en el registro CL
		JE	ImpresionProducto		    ;Salta cuando el origen sea igual al destino (contador = numero2)
		
		ADD AL, numero1
		
		INC contador					;Incrementa contador en 1
	JMP ciclo_sumas						;JMP salto incondicional que regresara al ciclo para que repita un determinado numero de veces
	
	
	ImpresionProducto:
		
		MOV producto, AL 				;Movemos a la variable producto el resultado de la suma
		
		;SALTO DE LINEA
		MOV DX, 10       
		MOV AH, 02H
		INT 21H
		
		;Impresion Cadena PRODUCTO:		
	    MOV DX, Offset cadMul
		MOV AH, 09h
		INT 21H
				
		XOR AX, AX
		XOR BX, BX
		
		MOV AL, producto		
		
		;IMPRIMIENDO DOS DIGITOS
		;imprimiendo Decenas
		MOV BL, 10
		DIV BL
		MOV decenas, AL
		MOV unidades, AH
		MOV DL, decenas    
		ADD DL, 30h      ; Se suma 30h para obtener el valor real en decimal
		MOV AH, 02h
		INT 21H
		
		;imprimiendo unidades
		MOV DL, unidades
		ADD DL, 30h
		MOV AH, 02h
		INT 21H
		
		
	;---------------------DIVISION CON RESTAS SUCESIVAS -----------------------------------------------
	
	;simulando ciclo FOR
	ciclo_restas:
		
		CMP contador, BL						;Se compara que contador llegue al valor de numero 2 almacenado en el registro CL
		JE	ImpresionDivision		    ;Salta cuando el origen sea igual al destino (contador = numero2)
		
		SUB AL, numero1
		
		INC contador					;Incrementa contador en 


	;SALTO DE LINEA
		MOV DX, 10       
		MOV AH, 02H
		INT 21H
		
	ImpresionDivision:
	
		;Impresion Cadena PRODUCTO:		
		MOV DX, Offset cadCociente
		MOV AH, 09h
		INT 21H

		XOR AX, AX       ; Se limpia registro AX
		XOR BX, BX       ; Se limpia registro BX
		MOV AL, numero1  ; Se le asigna al registro AL el valor de numero1
		MOV BL, numero2  ; Se asigna al registro BL el valor de numero2
		DIV BL           ; Se realiza la division (5/1)
		MOV cociente, AL ; Se Almacena en la variable el contendio de AL, (en AL se guarda cociente)
		MOV residuo, AH  ; Se Almacena en la variable el resultado de AH, (en AH se guarda el residuo)
		ADD cociente, 30h; Se suma 30h al valor del cociente para obtener el valor exacto en numeros decimales
		ADD residuo, 30h ; Se suma 30h al valor del residuo para obtener el valor exacto en decimal
	   
		MOV DL, cociente ; Se mueve a DL el valor del cociente para imprimir en pantalla
		MOV AH, 02h      ; Se asigna el valor para impresion de caracteres en pantalla
		INT 21H
		
		MOV DX, 10       ; Se realiza un salto de linea
		MOV AH, 02H
		INT 21H
		
		MOV  DX, offset cadResiduo ; Al registo DX se le asigna el valor de cadena division
		MOV AH, 09H           ; Interrupcion de impresion de cadena
		INT 21H
		
		MOV DL, residuo  ; Se mueve a DL el valor del residuo para mostrar en pantalla
		MOV AH, 02h      ; Imprime un caracter en pantalla
		INT 21H
		
	;FINALIZAR
    finalizar:
    MOV AH, 4CH
    INT 21H

END Programa