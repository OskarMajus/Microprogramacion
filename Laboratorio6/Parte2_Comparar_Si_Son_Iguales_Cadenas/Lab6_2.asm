.MODEL small
.STACK
.DATA
	MENSAJE DB 10 DUP('$')
	MENSAJE2 DB 10 DUP('$')
	cadena DB 13,10,'Ingrese la primera cadena:$'
	cadena1 DB 13,10,'Ingrese la segunda cadena:$'
	soniguales DB 13,10,'Las cadenas son iguales!!!$'
	noSonIguales DB 13,10,'Las cadenas no son iguales!!!$'

.CODE
Programa:

		CALL Limpiar_Pantalla

         MOV AX,@DATA
         MOV DS,AX
		 
		 

         LEA DX,cadena
         MOV AH,09
         INT 21H
         
         MOV DX,10
         MOV AH,02
         INT 21H
         
         Call Leer                       ;Procedimiento para leer una cadena
         
         LEA DX,cadena1
         MOV AH,09
         INT 21H
         
         MOV DX,10
         MOV AH,02
         INT 21H  

         Call Leer2                      ;Procedimiento para leer una cadena
         Call Comparar                   ;Procedimiento para comparar las cadenas

         MOV AH,4CH
         INT 21H
		 
;-------------------------------PROCEDIMIENTOS------------------------------------------------

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

        Leer2 Proc Near

            LEA SI,MENSAJE2
            MOV AH,01

            Lectura2:
                INT 21H
                CMP AL,0DH                ;Se compara si el dato enviado es ENTER 
                JE Fin2
                MOV [SI],AL
                INC SI
                JMP Lectura2
            Fin2:
                RET 
                Leer2 ENDP
                
         Comparar Proc Near
         
                LEA DI,MENSAJE  

                LeerC:
                    CMP AH,24H
                    JE Salir2
                    MOV AH, MENSAJE[DI]
                    MOV BH, MENSAJE2[DI]
                    INC DI
                    CMP AH,BH
                    JE LeerC
                    JMP Salir1
                Salir1:

                    LEA DX,noSonIguales
                    MOV AH,09
                    INT 21H
                    JMP Salir
                Salir2:
                
                    LEA DX,soniguales
                    MOV AH,09
                    INT 21H
                    JMP Salir

                Salir:
                       RET 
        Comparar ENDP                


END Programa