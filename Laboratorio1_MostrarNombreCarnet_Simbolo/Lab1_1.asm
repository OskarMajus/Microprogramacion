.MODEL small
.DATA

nombre DB 'Oskar Majus$'
carnet DB '1034711$'

.STACK
.CODE

Programa:

MOV AX, @Data   
MOV DS, AX

;imprimir cadena nombre
MOV DX, offset nombre   ; asignando a DX la variable cadena
MOV AH, 09H             ; decimos que se imprimira una cadena
INT 21H                 ; EJECTUA LA interrupcion, imprime la cadena

MOV DX, 10
MOV AH, 02H
INT 21H

;imprime cadena carnet
MOV DX, offset carnet
MOV AH, 09H
INT 21H

;Finaliza el programa
MOV AH, 4ch
INT 21H

END Programa
