.386
.MODEL FLAT, STDCALL
.STACK 4096
INCLUDE Irvine32.inc

.data
    word1 BYTE "Assembly ", 0
    word2 BYTE "Language ", 0
    word3 BYTE "is ", 0
    word4 BYTE "COOL", 0

.code
main PROC

    mov eax, green
    call SetTextColor
    mov edx, OFFSET word1
    call WriteString

    mov eax, lightBlue
    call SetTextColor
    mov edx, OFFSET word2
    call WriteString

    mov eax, yellow
    call SetTextColor
    mov edx, OFFSET word3
    call WriteString

    mov eax, lightRed
    call SetTextColor
    mov edx, OFFSET word4
    call WriteString

    call Crlf
    call WaitMsg 
    exit
main ENDP
END main