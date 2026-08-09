TITLE Memory Addressing Examples       (File: addressing.asm)

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
arrayB  BYTE  "COE 205", 0
arrayW  WORD  100h, 200h, 300h, 400h
arrayD  DWORD 01234567h, 89ABCDEFh

.code
main PROC
; Direct Memory Addressing
    mov al, arrayB          ; same as [arrayB]
    mov ah, arrayB[5]       ; same as [arrayB+5]
    mov bx, arrayW[2]       ; same as [arrayW+2]
    mov ecx,[arrayD]        ; same as arrayD
    mov edx,[arrayD+2]      ; same as arrayD[2]

; Register Indirect Addressing
    mov ecx, OFFSET arrayB + 3
    mov edx, OFFSET arrayW + 1
    mov bx, [ecx]           ; address in [ecx]
    mov al, [edx]           ; address in [edx]

; Based Addressing
    mov edx, 4
    mov al, arrayB[edx]
    mov bx, arrayW[edx]
    mov ecx,arrayD[edx]

; Scaled Indexed Addressing
    mov esi, 1
    mov arrayB[esi*2], 'S'
    mov arrayW[esi*2], 102h
    mov arrayD[esi*4], 0

; Load Effective Address (LEA)
    lea eax, arrayB         ; same as: mov eax, OFFSET arrayB
    lea ebx,[eax + LENGTHOF arrayB]
    lea ecx,[ebx + esi*8]
    lea edx, arrayD

    exit
main ENDP
END main

