.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.data
    strBuffer BYTE 51 DUP(0)
    prompt1   BYTE "Enter string: ", 0
    prompt2   BYTE "Enter character to blank: ", 0

.code
main PROC
    mov edx, OFFSET prompt1
    call WriteString
    mov edx, OFFSET strBuffer
    mov ecx, 50
    call ReadString

    mov edx, OFFSET prompt2
    call WriteString
    call ReadChar
    mov bl, al 

    mov esi, OFFSET strBuffer
L1:
    cmp BYTE PTR [esi], 0
    je  Done
    cmp [esi], bl
    jne Next
    mov BYTE PTR [esi], ' '
Next:
    inc esi
    jmp L1
Done:
    call Crlf
    mov edx, OFFSET strBuffer
    call WriteString
    call Crlf
    exit
main ENDP
END main