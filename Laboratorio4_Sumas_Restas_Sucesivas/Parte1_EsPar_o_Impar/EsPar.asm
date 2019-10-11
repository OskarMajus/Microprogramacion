.MODEL small
.STACK
.DATA
	numero DB ?
    espar DB 'El numero es par $'
    noespar DB 'El numero es impar $'
    residuo DB ?
	cadena DB 'El siguiente Programa verifica si un numero ingresado es par o impar $'
	cadena1 DB 'Ingrese un numero entre (0-9)$'

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
	
	
	;LEER num
    XOR AX, AX
    MOV AH, 01H
    INT 21H	
    MOV numero, AL
    SUB numero, 30H
	
	;SALTO DE LINEA
    MOV DX, 10 
    MOV AH, 02H
    INT 21H
	
	;Dividir entre 2 para saber si es par 
    XOR AX, AX
    MOV AL, numero
    MOV CL, 2
    DIV CL
	
	;Residuo en AH
    MOV residuo, AH
	
	;Comparar
    CMP residuo, 0
    JZ Imprimirespar
	
	Imprimiresimpar:
    MOV DX, offset noespar
    MOV AH, 09H
    INT 21H
    JMP finalizar
	
	Imprimirespar:
    MOV DX, offset espar
    MOV AH, 09H
    INT 21H
    JMP finalizar
	
    
	



   ;FINALIZAR
    finalizar:
    MOV AH, 4CH
    INT 21H

END Programa