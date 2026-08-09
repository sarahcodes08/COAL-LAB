.386
.model flat, stdcall
.stack 4096
INCLUDE Irvine32.inc

.data
    arr1   DWORD 1, 2, 3, 4, 5
    arr2   DWORD 6, 7, 8, 9, 10
    sum    DWORD 5 DUP (?)

.code
main PROC
    mov esi, 0
    mov ecx, LENGTHOF arr1  ; loop counter
L1:
    mov eax, arr1[esi]      ; get arr1
    add eax, arr2[esi]      ; add arr2 in arr1
    mov sum[esi], eax       ; store sum in sum array
    call WriteDec
    mov al, ' '
    call WriteChar
    add esi, TYPE arr1      ; jump 4 bytes to move to next element
    loop L1
    call Crlf
    exit
main ENDP
END main