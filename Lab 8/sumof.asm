TITLE Demonstrating Stack Parameters
.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc
.data
.code
main PROC
    push 80000h
    push 60000h
    push 40000h
    call SumOf
    
    call DumpRegs
    
    exit
main ENDP

SumOf PROC
    mov eax, [esp+4]
    add eax, [esp+8]
    add eax, [esp+12]
    ret 12
SumOf ENDP
END main