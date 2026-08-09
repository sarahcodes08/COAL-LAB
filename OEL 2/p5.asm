.386
.model flat, stdcall
.stack 4096
INCLUDE Irvine32.inc

.code
main PROC
    MOV AX, 1234h
    MOV BX, 0ABCh
    MOV ECX, 00234567h
    PUSH ECX
    PUSH AX
    POP EDX                 
    MOV AX, 0ACBDh
    PUSH AX
    POP EAX

    call DumpRegs    ; display values of all registers
    exit
main ENDP
END main