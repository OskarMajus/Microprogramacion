.386
.model flat, stdcall
option casemap:none

; Includes
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc 

; Librerias
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

; Segmento de Datos
.DATA  
mensaje1 DB "El total de la suma de 7 + 1 = ",0
mensaje2 DB 0ah,0dh,"El total de la resta de 7 - 1 = ",0
mensaje3 DB 0ah,0dh,"Los numeros son iguales",0
mensaje4 DB 0ah,0dh,"El primero numero es mayor",0
mensaje5 DB 0ah,0dh,"El segundo numero es mayor",0
suma dword 0
resta dword 0
numero1 dword 2                                           
numero2 dword 1

.DATA?

; Codigo
.CODE 
 
Programa:
main PROC

	MOV EAX,numero1
	ADD EAX,numero2
	MOV suma,EAX

	MOV EAX,numero1
	SUB EAX,numero2
	MOV resta,EAX

	ADD suma,30h
	ADD resta,30h


	INVOKE StdOut, addr mensaje1
	INVOKE StdOut, addr suma

	INVOKE StdOut, addr mensaje2
	INVOKE StdOut, addr resta

	MOV EAX,numero1
	CMP EAX,numero2

	JZ SonIguales
	JC MayorB
	JNZ MayorA

	SonIguales:
    INVOKE StdOut, addr mensaje3
	JMP fin

	MayorA:
	INVOKE StdOut, addr mensaje4
	JMP fin

	MayorB:
	INVOKE StdOut, addr mensaje5
	JMP fin

	; Finalizar
	fin:
	INVOKE ExitProcess,0

main ENDP
END Programa