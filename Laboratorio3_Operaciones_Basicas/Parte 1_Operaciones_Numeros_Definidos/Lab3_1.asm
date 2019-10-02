.MODEL small
.DATA

;Variables
numero1 DB 5         ; El primer numero sera el 5
numero2 DB 1         ; El segundo numero sera el 1
total DB 0000h       ; Se declara variable Total para mostrar el resultado de la suma
diferencia DB 0000h  ; Variale que mostrara el resultado de la resta
producto DB 0000h    ; Variable que mostrara el resultado de la multiplicacion
cociente DB 0000h    ; Variable que mostrara el cociente de la di
residuo DB 0000h     ; variable que mostrara el residuo de la division

;declando cadenas
cadena DB 'Los numeros a utilizar son 5 y 1$'
cadena2 DB 'El resultado de las Operaciones Aritmeticas Basicas son:$' 
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

    ;Mostrando Numeros a utilizar 
    MOV DX, offset cadena  ; asgnamos a DX la variable cadena
    MOV AH, 09h      ;indicamos que se imprimira una cadena
    INT 21H
    
    MOV DX, 10       ;Se realiza un salto de linea
    MOV AH, 02H
    INT 21H
    
    MOV DX, offset cadena2
    MOV AH, 09h
    INT 21H
    
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
    ADD AL, BL       ; Se le suma a Al, lo que tiene BL (5+1)
    ADD AL, 30h      ; Se suma 30h para obtener el valor exacto en numeros
    MOV DL, AL       ; El resultado se asigna al Registro DL
    MOV total, DL    ; Lo que contiene DL pasa a la variable total
    MOV AH, 02h      ; Se asigna el valor para impresion de caracteres en pantalla
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
    
    ;MULTIPLICACION
    MOV  DX, offset multiplicacion ; Al registo DX se le asigna el valor de cadena multiplicacion
    MOV AH, 09H
    INT 21H
    
    ;Operacion Multiplicar
    XOR AX, AX       ; Se limpia registro AX
    XOR BX, BX       ; Se limpia registro BX
    MOV AL, numero1  ; Se le asigna al registro AL el valor de numero1
    MOV BL, numero2  ; Se asigna al registro BL el valor de numero2
    MUL BL           ; Se realiza multiplicacion (5*1)
    ADD AL, 30h      ; Se suma 30h para obtener el valor exacto en numeros
    MOV DL, AL       ; El resultado se asigna al Registro DL
    MOV producto, DL ; Lo que contiene DL pasa a la variable total
    MOV AH, 02h      ; Se asigna el valor para impresion de caracteres en pantalla
    INT 21H
    
    
    MOV DX, 10       ;Se realiza un salto de linea
    MOV AH, 02H
    INT 21H
    
    ;DIVISION
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