.MODEL small
.DATA

    ;Variables
    numero1 DB ?         
    numero2 DB ?         
    total DB 0000h       ; Se declara variable Total para mostrar el resultado de la suma
    diferencia DB 0000h  ; Variale que mostrara el resultado de la resta
    producto DB 0000h    ; Variable que mostrara el resultado de la multiplicacion
    cociente DB 0000h    ; Variable que mostrara el cociente de la di
    residuo DB 0000h     ; variable que mostrara el residuo de la division
    
    decenas DB ?
    unidades DB ?

    ;declando cadenas
    cadena DB 'Ingrese un numero de un digito $'
    cadena2 DB 'Ingrese un segundo numero de un digito $'
    cadena3 DB 'El resultado de las Operaciones Aritmeticas Basicas son:$'

    suma DB 'El Total es:$'
    resta DB 'La Diferencia es:$'
    multiplicacion DB 'El Producto es: $'
    division DB 'El Cociente es: $'
    resto DB 'El Residuo es: $'


.STACK
.CODE

Programa:            ; etiqueta de inicio de programa 

    ;inicializar programa
    MOV AX, @Data    ; Se obtiene la direcci?n de inicio del segmento de datos
    MOV DS, AX       ; Se asigna al registro data segment la direcci?n de inicio del segmento de datos
    
    XOR AX,AX        ; Limpiamos registro AX

    ;Ingresando Primer Numero
    MOV DX, offset cadena  ; asgnamos a DX la variable cadena
    MOV AH, 09h      ; indicamos que se imprimira una cadena
    INT 21H
    
    MOV DX, 10       ; Se realiza un salto de linea
    MOV AH, 02H
    INT 21H
    
    ;Leer numero1
    MOV AH, 01h
    INT 21H          ; Se ejecuta la interrupcion, dato almacenado en AL
    MOV numero1, AL
    SUB numero1, 30h ; Convertir numero leido en su representacion decimal
    
    MOV DX, 10       ; Se realiza un salto de linea
    MOV AH, 02H
    INT 21H
    
    ;Ingresando segundo numero
    MOV DX, offset cadena2
    MOV AH, 09h
    INT 21H
    
    MOV DX, 10       ; Se realiza un salto de linea
    MOV AH, 02H
    INT 21H
    
    ;Leer numero1
    MOV AH, 01h
    INT 21H          ; Se ejecuta la interrupcion, dato almacenado en AL
    MOV numero2, AL
    SUB numero2, 30h ; Convertir numero leido en su representacion decimal
    
    MOV DX, 10       ;Se realiza un salto de linea
    MOV AH, 02H
    INT 21H
    
    MOV DX, 10       ;Se realiza un salto de linea
    MOV AH, 02H
    INT 21H
    
    ;SUMA
    MOV  DX, offset suma ; Al registo DX se le asigna el valor de cadena suma
    MOV AH, 09H
    INT 21H

    MOV DX, 20h      ;Crea un espacio entre cadenas
    MOV AH, 02H
    INT 21H


    ;Operacion Suma
    XOR AX, AX       ; Se limpia registro AX
    XOR BX, BX       ; Se limpia registro BX
    MOV AL, numero1  ; Se le asigna al registro AL el valor de numero1
    MOV BL, numero2  ; Se asigna al registro BL el valor de numero2
    ADD AL, BL       ; Se le suma a Al, lo que tiene BL (num1+num2)
           
    
    ;IMPRIMIENDO DOS DIGITOS
    ;imprimiendo Decenas
    MOV BL, 10
    DIV BL
    MOV decenas, AL
    MOV unidades, AH
    MOV DL, decenas    
    ADD DL, 30h      ; Se suma 30h para obtener el valor real en decimal
    MOV AH, 02h
    INT 21H
    
    ;imprimiendo unidades
    MOV DL, unidades
    ADD DL, 30h
    MOV AH, 02h
    INT 21H
    
    MOV DX, 10       ;Se realiza un salto de linea
    MOV AH, 02H
    INT 21H
    
    ;RESTA
    MOV  DX, offset resta ; Al registo DX se le asigna el valor de cadena resta
    MOV AH, 09H
    INT 21H

    MOV DX, 20h      ;Crea un espacio entre cadenas
    MOV AH, 02H
    INT 21H
    
    ;Operacion Resta
    XOR AX, AX       ; Se limpia registro AX
    XOR BX, BX       ; Se limpia registro BX
    MOV AL, numero1  ; Se le asigna al registro AL el valor de numero1
    MOV BL, numero2  ; Se asigna al registro BL el valor de numero2
    SUB AL, BL       ; Se le suma a Al, lo que tiene BL (5-1)
    ADD AL, 30h      ; Se suma 30h para obtener el valor exacto en numeros
    MOV DL, AL       ; El resultado se asigna al Registro DL
    MOV diferencia, DL    ; Lo que contiene DL pasa a la variable diferencia
    MOV AH, 02h      ; Se asigna el valor para impresion de caracteres en pantalla
    INT 21H
    
    MOV DX, 10       ;Se realiza un salto de linea
    MOV AH, 02H
    INT 21H
    
    ;MULTIPLICACION ---------------------------------
    MOV  DX, offset multiplicacion ; Al registo DX se le asigna el valor de cadena multiplicacion
    MOV AH, 09H
    INT 21H
    
    ;Operacion Multiplicar
    XOR AX, AX       ; Se limpia registro AX
    XOR BX, BX       ; Se limpia registro BX
    MOV AL, numero1  ; Se le asigna al registro AL el valor de numero1
    MOV BL, numero2  ; Se asigna al registro BL el valor de numero2
    MUL BL           ; Se realiza multiplicacion (5*1)
    
    ;IMPRIMIENDO DOS DIGITOS
    
    ;Dividiendo entre 10 los numeros
    MOV BL, 10
    DIV BL
    MOV decenas, AL
    MOV unidades, AH
    
    ;Imprimir Decenas
    MOV DL, decenas
    ADD DL, 30h
    MOV AH, 02h
    INT 21H
    
    ;imprimiendo Unidades
    MOV DL, unidades
    ADD DL, 30h
    MOV AH, 02h
    INT 21H
    
    MOV DX, 10       ;Se realiza un salto de linea
    MOV AH, 02H
    INT 21H
    
    ;DIVISION --------------------------------------
    MOV  DX, offset division ; Al registo DX se le asigna el valor de cadena division
    MOV AH, 09H
    INT 21H
    
    XOR AX, AX       ; Se limpia registro AX
    XOR BX, BX       ; Se limpia registro BX
    MOV AL, numero1  ; Se le asigna al registro AL el valor de numero1
    MOV BL, numero2  ; Se asigna al registro BL el valor de numero2
    DIV BL           ; Se realiza la division (5/1)
    MOV cociente, AL ; Se Almacena en la variable el contendio de AL, (en AL se guarda cociente)
    MOV residuo, AH  ; Se Almacena en la variable el resultado de AH, (en AH se guarda el residuo)
    ADD cociente, 30h; Se suma 30h al valor del cociente para obtener el valor exacto en numeros decimales
    ADD residuo, 30h ; Se suma 30h al valor del residuo para obtener el valor exacto en decimal
   
    MOV DL, cociente ; Se mueve a DL el valor del cociente para imprimir en pantalla
    MOV AH, 02h      ; Se asigna el valor para impresion de caracteres en pantalla
    INT 21H
    
    MOV DX, 10       ; Se realiza un salto de linea
    MOV AH, 02H
    INT 21H
    
    MOV  DX, offset resto ; Al registo DX se le asigna el valor de cadena division
    MOV AH, 09H           ; Interrupcion de impresion de cadena
    INT 21H
    
    MOV DL, residuo  ; Se mueve a DL el valor del residuo para mostrar en pantalla
    MOV AH, 02h      ; Imprime un caracter en pantalla
    INT 21H

   

    
    MOV AH, 4ch     ;finalizar proceso
    INT 21H         ;ejecuta la interrupcion

END Programa