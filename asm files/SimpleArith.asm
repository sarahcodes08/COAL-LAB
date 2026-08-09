TITLE  Simple Arithmetic        

.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

.data
; No data

.code
main PROC
	; ADD
	mov eax, 91ab0748h
	mov ebx, 3f54f8f2h
	add eax, ebx

	; SUB
	mov eax, 91ab0748h
	sub eax, ebx

	; NEG
	mov eax, 91ab0748h
	neg eax

	; INC
	clc	; clear carry flag to show that it is not affected
	mov eax,7fffffffh
	inc eax

	; DEC
	mov eax,0
	dec eax

	exit
main ENDP
END main
