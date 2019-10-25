.MODEL small
.DATA
;variable que contiene el texto que queremos mostrar
cadena DB 10,13,'Ingrese 2 digitos',10,13,'$' ; $ Significa el final de la cadena
numero1 DB 0

.STACK

.CODE

Programa: ;etiqueta de inicio de probrama

    ;inicializar el programa
    MOV AX, @DATA   ;guardando direccion de inicio segmento de datos
    MOV DS, AX      ;tiene tamaño diferente y lo mueve automaticamente

    ;Imprimir cadena
    MOV DX, OFFSET cadena   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira

    ;Leer num
    XOR AX, AX      ;limpiamos AX
    MOV AH, 01h     ;leer 1 caracter
    INT 21h
    SUB AL, 30h     ;quitar 30h AL caracter
    XOR AH, AH
    MOV BL, 0Ah
    MUL BL
    MOV numero1,AL

    ;Leer num
    XOR AX, AX      ;limpiamos AX
    MOV AH, 01h     ;leer 1 caracter
    INT 21h
    SUB AL, 30h     ;quitar 30h AL caracter
    ADD numero1,AL
    MOV DL, 10d
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    MOV DL, 13d
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira

    XOR CX, CX
    XOR BX, BX
    XOR DX, DX
    MOV BL, 02h
    MOV DL, numero1
Ciclo:
    XOR AX, AX
    MOV AL, DL
    DIV BL
    MOV DL, AL
    INC CX
    ADD AH, 30h
    PUSH AX
    CMP AL, 00h
    JE Imprimir
    JMP Ciclo

Imprimir:
    POP AX
    MOV DL, AH
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    LOOP Imprimir

    ;FINALIZAR PROGRAMA
    MOV AH, 4Ch     ;finalizar el proceso
    INT 21h         ;ejecuta la interrupcion
End Programa