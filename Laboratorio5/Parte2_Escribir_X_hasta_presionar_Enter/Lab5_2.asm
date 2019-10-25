.MODEL small
.STACK
.DATA
	cadena DB 10,13,7,'El siguiente Programa escribe la letra "X"'
		   DB 10,13,7,'Se detendra hasta que presione la Tecla "Enter"$'
		   
	menu DB  10,13,7,'Seleccione una opcion:',13,10 
		 DB  10,13,7,'1. Iniciar', 13,10 
		 DB  10,13,7,'2. Salir$',13,10
		 
	Tecla_1 equ 49h   ;guarda el codigo para el numero 1
	Tecla_2 equ 50h   ;guarda el codigo para el numero 2
	Tecla_Enter equ 0Dh    ;guarda el codigo para la tecla ENTER 
	
	Letra DB 'X $'
	


.CODE
Programa:	

	Mov AX, @DATA
    MOV DS, AX
	
	CALL Limpiar_Pantalla
	
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
	
	
;----------------------------------------------MENU--------------------------------------------------
	LEA DX, menu
	MOV AH, 09h
	INT 21H
	
	;Esperando respuesta de teclado
	MOV AH, 07h			;Lee la entrada del teclado
	INT 21H
	
	cmp al , Tecla_1	;compara si el valor ingresado es el del numero 1
    je Imprimir_X	   		;si el numero ingresado es 1 salta a la etiqueta IniciarJuego
	cmp al , Tecla_2	;Compara si el valor ingresado es el numero 2
    je finalizar		;si el valor es "2" saltara a la etiqueta finalizar 
	
	
;----------------------------------IMPRIMIR X----------------------------------	
	
	CALL Limpiar_Pantalla
	
Imprimir_X:
    mov ah , 0Bh    ; comprobar si existe input
    int 21h
    cmp al , 00h    ; comparar si no hay nada de input
    JNE leer
    
    MOV DL, 58h
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    JMP Imprimir_X

Leer:
    MOV AH, 07h    ; leer tecla
    INT 21h
    CMP AL, Tecla_Enter     ;es enter?
    JE finalizar
    JMP Imprimir_X
	
	
	
	
	
	;FINALIZAR
    finalizar:	
	CALL Limpiar_Pantalla	
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