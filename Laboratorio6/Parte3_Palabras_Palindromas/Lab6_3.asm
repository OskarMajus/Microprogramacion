.MODEL small
.STACK
.DATA
	cadena DB 10,13,7,'El siguiente Programa le indicara si una palabra es Palindromo'
		   DB 10,13,7,'Nota: Una palabra palindromo es aquella que se lee igual de izquierda a derecha.'
		   DB 10,13,7,'Debe Ingresar una palabra y luego presionar la Tecla ENTER$'
	
	Tecla_Enter equ 0Dh    ;guarda el codigo para la tecla ENTER 
	
	cadena1 DB ? 
	cadena2 DB 10,13,7,'Ingrese una palabra y presione ENTER$'
	esPalindromo DB 'La palabra es Palindromo$'
	noesPalindromo DB 'La palabra No es palindromo$'
	
	arreglo  DB 0FFH dup(?)
	
	conta DB ?

.CODE

Programa:
	MOV AX, @DATA
    MOV DS, AX
	
	CALL Limpiar_Pantalla
	
	
	
	MOV SI, 0
	MOV conta, 0
	
	;Leer la cadena
	LEA DX, cadena
	MOV AH, 09h
	INT 21H
	
	;SALTO DE LINEA
	MOV DX, 10       
    MOV AH, 02H
    INT 21H
	
	;SALTO DE LINEA
	MOV DX, 10       
    MOV AH, 02H
    INT 21H
	
	
	;Leer la cadena
	LEA DX, cadena2
	MOV AH, 09h
	INT 21H
	
	;SALTO DE LINEA
	MOV DX, 10       
    MOV AH, 02H
    INT 21H
	
	;SALTO DE LINEA
	MOV DX, 10       
    MOV AH, 02H
    INT 21H
	
	
	XOR SI, SI 		;Limpiar Indice
	LEA SI, cadena1	
	
	Lectura:
		;Lector de una tecla
			XOR AX,AX
			MOV AH, 01H
			INT 21H
			CMP AL, 0DH
			JZ Siguiente
			MOV arreglo[SI], AL
			PUSH AX
			INC SI
			INC conta
			JMP Lectura
			
		Siguiente:
			MOV SI, 0
			MOV CL, conta
		Validar:
			XOR AX,AX
			POP AX
			CMP arreglo[SI], AL
			JNE Diferente
			INC SI
			LOOP Validar
			JMP Iguales
		Diferente:
			MOV DX, OFFSET noesPalindromo
			MOV AH, 09H
			INT 21H
			JMP finalizar
		Iguales:
			MOV DX, OFFSET esPalindromo
			MOV AH, 09H
			INT 21H		
	
	;FINALIZAR
    finalizar:
    MOV AH, 4CH
    INT 21H
	
	;-----------------------------------PROCEDIMIENTOS-----------------------------------------

	Limpiar_Pantalla PROC
		MOV AH, 0
		MOV AL, 3
		INT 10H
		RET
	Limpiar_Pantalla ENDP
	
		
	
END Programa