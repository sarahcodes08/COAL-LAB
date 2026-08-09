TITLE Demonstrating the Compare Instruction (cmp.asm)

.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

.data
var1	SDWORD -3056
.code 
main PROC
    mov eax, 0f7893478h
    mov ebx, 1234F678h 
    cmp al, bl
    cmp ax, bx 
    cmp eax, ebx 
    cmp eax, var1 
    exit
main ENDP
END main
