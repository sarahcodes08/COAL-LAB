TITLE Stack Example
.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.code
main PROC
    mov eax, 10
    mov ebx, 20
    pushad ; Save all registers

    mov eax, 100
    mov ebx, 200
    popad ; Restore original registers
    call DumpRegs

    exit
main ENDP
END main