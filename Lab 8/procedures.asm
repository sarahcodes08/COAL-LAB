TITLE Demonstrating Procedures 
.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.data
.code
main PROC
    mov eax, 9876
    mov ebx, 12
    mov ecx, -5
    call sort3

    call DumpRegs

    exit
main ENDP

; Sorts 3 integers in EAX, EBX, and ECX in ascending order

sort3 PROC
    cmp eax, ebx
    jle L1
    call swapAB
L1: cmp eax, ecx
    jle L2
    call swapAC
L2: cmp ebx, ecx
    jle L3
    call swapBC
L3: ret
sort3 ENDP

; Swaps the values of the EAX and EBX registers
swapAB PROC
    push eax
    push ebx
    pop eax
    pop ebx
    ret
swapAB ENDP

; Swaps the values of the EAX and ECX registers

swapAC PROC
    push eax
    push ecx
    pop eax
    pop ecx
    ret
swapAC ENDP

; Swaps the values of the EBX and ECX registers

swapBC PROC
    push ebx
    push ecx
    pop ebx
    pop ecx
    ret
swapBC ENDP

END main