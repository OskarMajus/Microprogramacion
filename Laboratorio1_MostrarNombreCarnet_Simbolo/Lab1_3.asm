.MODEL small
.DATA

cadena DB 'El simbolo escogido es:$'


.STACK
.CODE

Programa:

MOV AX, @Data   
MOV DS, AX

;se imprime cadena 
MOV DX, offset cadena
MOV AH, 09H
INT 21H

;se imprime un espacio entre cadenas
MOV DX, 20h
MOV AH, 02H
INT 21H

;se imprime &
MOV DX, 26h
MOV AH, 02H
INT 21H



;Finaliza el programa
MOV AH, 4ch
INT 21H

END Programa