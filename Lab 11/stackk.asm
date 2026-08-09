TITLE Demonstrating Stack Instructions  (stack.asm)

.686
.MODEL flat, stdcall
.STACK 4096

INCLUDE Irvine32.inc

.data
var1    DWORD   01234567h
var2    DWORD   89ABCDEFh

.code
main PROC
    pushad  ; Save general-purpose registers

    ; PUSH and POP
    push var1
    push var2
    push 6A6A4C4Ch
    pop  eax
    pop  ebx
    pop  cx
    pop  dx
    
    call DumpRegs

    popad   ; restore general-purpose registers

    ; Exchanging 2 variables in memory
    push var1
    push var2
    pop  var1
    pop  var2

    call DumpRegs
    exit
main ENDP
END main