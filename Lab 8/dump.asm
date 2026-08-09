TITLE DumpRegs Demonstration 
.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.code
main PROC
    mov eax, 1234h
    mov ebx, 5678h
    mov ecx, 9ABCh
    call DumpRegs       ; Display the register values
    
    exit
main ENDP
END main