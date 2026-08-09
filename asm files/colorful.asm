TITLE Colorful Text (Ex2.asm)
.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

.data
    w1 BYTE "Assembly ", 0
    w2 BYTE "Language ", 0
    w3 BYTE "is ", 0
    w4 BYTE "COOL", 0

.code
main PROC
    call Clrscr

    mov eax, red + (black * 16)
    call SetTextColor
    mov edx, OFFSET w1
    call WriteString

    mov eax, green + (black * 16)
    call SetTextColor
    mov edx, OFFSET w2
    call WriteString

    mov eax, yellow + (black * 16)
    call SetTextColor
    mov edx, OFFSET w3
    call WriteString

    mov eax, lightCyan + (black * 16)
    call SetTextColor
    mov edx, OFFSET w4
    call WriteString

    call Crlf
    
    ; Reset to default terminal colors
    mov eax, lightGray + (black * 16)
    call SetTextColor

    exit
main ENDP
END main
