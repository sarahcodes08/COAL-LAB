.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.data
    prompt BYTE "Enter a hex digit (0-F): ", 0
    msg    BYTE "Decimal value: ", 0
    err    BYTE "Invalid character!", 0

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    
    ; ReadChar reads one character into AL
    call ReadChar
    call WriteChar  ; Echo the character to screen
    call Crlf

    ; Logic to check ranges
    cmp al, '0'
    jb  L_Invalid
    cmp al, '9'
    jbe L_IsDigit
    
    cmp al, 'A'
    jb  L_Invalid
    cmp al, 'F'
    jbe L_IsUpper
    
    cmp al, 'a'
    jb  L_Invalid
    cmp al, 'f'
    jbe L_IsLower

L_Invalid:
    mov edx, OFFSET err
    call WriteString
    jmp L_Quit

L_IsDigit:
    sub al, '0'
    jmp L_Display

L_IsUpper:
    sub al, 'A'
    add al, 10
    jmp L_Display

L_IsLower:
    sub al, 'a'
    add al, 10

L_Display:
    movzx eax, al   ; Move 8-bit result to 32-bit EAX for printing
    mov edx, OFFSET msg
    call WriteString
    call WriteDec

L_Quit:
    call Crlf
    exit
main ENDP
END main