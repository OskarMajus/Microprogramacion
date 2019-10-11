.MODEL small
.STACK
.DATA
	numero1 DB ?
	numero2 DB ?
	esmayor DB 'El primer numero ingresado es Mayor$'
	esmayor2 Db 'El segundo numero ingresado es Mayor$'
	soniguales DB 'Los numeros ingresados son IGUALES$'
	cadena DB 'El siguiente programa Compara dos numeros y muestra el mayor o si son iguales$'
	cadena1 DB 'Ingrese el primer numero entre (0-9)$'
	cadena2 DB 'Ingrese el segundo numero entre (0-9)$'
	
	

.CODE

Programa:
	MOV AX, @DATA
    MOV DS, AX
	
	;SALTO DE LINEA
    MOV DX, 10 
    MOV AH, 02H
    INT 21H
	
	MOV DX, offset cadena
	MOV AH, 09H
	INT 21H
	
	;SALTO DE LINEA
    MOV DX, 10 
    MOV AH, 02H
    INT 21H
	
	
	MOV DX, offset cadena1
	MOV AH, 09H
	INT 21H
	
	;SALTO DE LINEA
    MOV DX, 10 
    MOV AH, 02H
    INT 21H
	
	;LEER numero1
    XOR AX, AX
    MOV AH, 01H
    INT 21H	
    MOV numero1, AL
    SUB numero1, 30H
	
	;SALTO DE LINEA
    MOV DX, 10 
    MOV AH, 02H
    INT 21H
	
	MOV DX, offset cadena2
	MOV AH, 09H
	INT 21H
	
	;SALTO DE LINEA
    MOV DX, 10 
    MOV AH, 02H
    INT 21H
	
	;LEER numero2
    XOR AX, AX
    MOV AH, 01H
    INT 21H	
    MOV numero2, AL
    SUB numero2, 30H
	
	;SALTO DE LINEA
    MOV DX, 10 
    MOV AH, 02H
    INT 21H
	
	
	
	
	MOV AL, numero1		  ; Se  mueve a registro AL, el valor del numero1
	CMP AL, numero2  	  ; SE Compara numero1 con numero2
	
	
	JC NumMayor2   		  ;JC salto cuando el destino menor que el origen, o cuando existe un acarreo
	JZ Iguales			  ;JZ salto cuando el destino y origen son iguales 
	JNZ NumMayor1		  ;JNZ salto cuando el destino es mayor que el origen (numero1>numero2)
	
	
	Iguales:
	MOV DX, Offset soniguales
	MOV AH, 09H
	INT 21H
	JMP finalizar
	
	
	NumMayor1:
	MOV DX, Offset esmayor
	MOV AH, 09H
	INT 21H
	JMP finalizar
	
	NumMayor2:
	MOV DX, Offset esmayor2 
	MOV AH, 09H
	INT 21H
	JMP finalizar
	
	

	;FINALIZAR
    finalizar:
    MOV AH, 4CH
    INT 21H

END Programa