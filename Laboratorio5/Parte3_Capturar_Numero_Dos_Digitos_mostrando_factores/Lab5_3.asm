.MODEL small
.DATA
cadena1 DB  'Ingrese las decenas $' ;dolar indica que se termino la cadena
cadena2 DB  'Ingrese las unidades $'
num1 DB ?
num2 DB ?
factor DB ?
dividendo DB ?
.code

programa: 
     MOV AX,@DATA    ;Se obtiene direccion dde inicio del segmento de datos
    MOV DS, AX   ;asignamos al registro la direccion de inicio de segmento
        ;leer primer numero
        MOV DX, offset cadena1 ;se le indica al usuario que debe de ingresar las decenas
        MOV AH, 09h
        INT 21h     ;interrupcion de impresion
        XOR AX,AX ;comienza operacion de leectura
        MOV ah,01h
        int 21h
        SUB al,30h ;obtiene el valor real
        MOV num1,al ;se guarda en num1
        ;salto de linea
        MOV DX,10           ;Salto de Linea
        MOV AH,02H          ;Imprimimos salto de linea
        INT 21H
        ;leer segundo numero
        MOV DX, offset cadena2 ;se le indica al usuario que debe de ingresar el segundo numero
        MOV AH, 09h
        INT 21h     ;interrupcion de impresion
        XOR AX,AX   ;comienza operacion de lectura
        MOV ah,01h
        int 21h
        sub al,30h ;obtiene el valor 
        mov num2,al
        ;salto de linea
        MOV DX,10           ;Salto de Linea
        MOV AH,02H          ;Imprimimos salto de linea
        INT 21H
        ;se genera el numero de dos digitos:
        MOV AL,num1 
        MOV BL,10
        MUL BL ;se multiplica por 10 num1 para obtener el numero en decenas ejemplo 5*10=50
        XOR BL,BL ;se limpia bl
        MOV BL,num2
        ADD AL,BL ;se suma num1 + num2 50+8=58
        MOV num1,AL ;se guarda en num1 el valor
        ; se comienza a imprimir factores
        XOR DX,DX
        XOR AX,AX
        MOV ah,02h
        MOV dl, 1 ; se imprime el numero 1 ya que es un factor universal
        ADD dl,30h
        int 21h
        MOV CX,99
        XOR AX,AX
        XOR BX,BX    
        
        MOV dividendo,2
        MOV BL,dividendo ;se le asigna a al divisor el valor que se lleva.
        
        factorizar:
        XOR AX,AX
        MOV AL,num1 ; se mete en AL el valor ingresado
        DIV BL ;se divide entro el valor el resultado se guarda en AL y el residuo en AH
        CMP AH,0 ;se compara si el residuo es igual a 0
        JE Tfactor
        JMP Nfactor
        
        Tfactor:
        XOR AX,AX
        MOV ah,02h
        MOV Dl,BL ; se imprime el numero que este en BL como factor
        ADD dl,30h
        int 21h
        CMP BL,num1
        JE  final
        ADD BL,1
        Loop factorizar
        
        Nfactor:
        XOR AX,AX
        ADD BL,1
        Loop factorizar
    final:
;finalizar el programa
    MOV AH, 4Ch
    INT 21h
.STACK
END programa