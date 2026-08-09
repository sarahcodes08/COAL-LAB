TITLE Demonstrating Procedures  

.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.data

.code
main PROC
    mov  eax, 8ffffh
    mov  ebx, 12
    mov  ecx, 5
    call sort3
    exit
main ENDP

; Sorts 3 integers in EAX, EBX, and ECX
sort3 PROC
    cmp  eax, ebx
    jle  L1
    call swapAB
L1: cmp  eax, ecx
    jle  L2
    call swapAC
L2: cmp  ebx, ecx
    jle  L3
    call swapBC
L3: ret
sort3 ENDP

; Swaps the values of the EAX and EBX registers
swapAB PROC
    Push eax
    Push ebx
    Pop  eax
    Pop  ebx
    ret
swapAB ENDP

; Swaps the values of the EAX and ECX registers
swapAC PROC
    Push eax
    Push ecx
    Pop  eax
    Pop  ecx
    ret
swapAC ENDP

; Swaps the values of the EBX and ECX registers
swapBC PROC
    Push ebx
    Push ecx
    Pop  ebx
    Pop  ecx
    ret
swapBC ENDP
END main

