.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.data
    buffer BYTE 51 DUP(0)
    prompt BYTE "Enter a string (max 50 chars): ", 0

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    mov edx, OFFSET buffer
    mov ecx, 50
    call ReadString

    mov esi, OFFSET buffer
L1:
    mov al, [esi]
    cmp al, 0
    je  Done
    cmp al, 'a'
    jb  Next
    cmp al, 'z'
    ja  Next
    sub BYTE PTR [esi], 32
Next:
    inc esi
    jmp L1
Done:
    mov edx, OFFSET buffer
    call WriteString
    call Crlf
    exit
main ENDP
END main