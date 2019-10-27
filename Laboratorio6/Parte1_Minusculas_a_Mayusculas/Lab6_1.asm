.model small
.data
MENSAJE DB 30 DUP('$')
INTRO DB 13,10,'Ingrese una cadena en minusculas $'
CadMayuscula DB 13,10,'Cadena en mayusculas$'
.code
Programa:

         MOV AX,@DATA
         MOV DS,AX
		 
		 CALL Limpiar_Pantalla

         LEA DX,INTRO
         MOV AH,09
         INT 21H
         
         MOV DX,10
         MOV AH,02
         INT 21H
         
         Call Leer                       ;Procedimiento para leer una cadena
         Call Mayusculas                 ;Procedimiento para convertir a mayusculas

         LEA DX,CadMayuscula
         MOV AH,09
         INT 21H

         MOV DX,10
         MOV AH,02
         INT 21H

         LEA DX,MENSAJE
         MOV AH,09
         INT 21H
		 
		

         MOV AH,4CH
         INT 21H
		 CALL Limpiar_Pantalla
;--------------------------PROCEDIMIENTOS-----------------------------------------------------------		 
	    Limpiar_Pantalla PROC
		MOV AH, 0
		MOV AL, 3
		INT 10H
		RET
		Limpiar_Pantalla ENDP


         Leer Proc Near

            LEA DI,MENSAJE
            MOV AH,01

            Lectura:
            	INT 21H
            	CMP AL,0DH                ;Se compara si el dato enviado es ENTER 
            	JE Fin
            	MOV [DI],AL
            	INC DI
            	JMP Lectura
            Fin:
                RET	
                Leer ENDP
         Mayusculas Proc Near
         
                LEA DI,MENSAJE

                Cambio:
                	MOV AH, MENSAJE[DI]
                	SUB AH,20H
                	MOV MENSAJE[DI],AH
                	INC DI
                	CMP MENSAJE[DI],24H
                	JE Salir
                	JMP Cambio
                Salir:
                       RET 
        Mayusculas ENDP		        

.stack
END Programa