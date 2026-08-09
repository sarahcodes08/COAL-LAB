.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.data
    prompt BYTE "Enter sum threshold (>1): ", 0
    err    BYTE "Error: Sum must be > 1", 0
    res    BYTE "Smallest n is: ", 0

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    cmp eax, 1
    jbe L_Error

    mov ecx, eax 
    mov eax, 0   
    mov ebx, 0   
L1:
    inc ebx
    add eax, ebx
    cmp eax, ecx
    jbe L1

    mov edx, OFFSET res
    call WriteString
    mov eax, ebx
    call WriteDec
    jmp Quit
L_Error:
    mov edx, OFFSET err
    call WriteString
Quit:
    call Crlf
    exit
main ENDP
END main