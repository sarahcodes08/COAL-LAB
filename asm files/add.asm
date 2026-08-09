TITLE Centered Addition 
.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

.data
    prompt1 BYTE "Enter first integer: ", 0
    prompt2 BYTE "Enter second integer: ", 0
    resultMsg BYTE "The sum is: ", 0

.code
main PROC
    call Clrscr

    ; Move to approximate middle (Row 11, Col 25)
    mov dh, 11
    mov dl, 25
    call Gotoxy

    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt              ; Read first number into EAX
    mov ebx, eax              ; Save first number in EBX

    ; Next Line (Row 12, Col 25)
    mov dh, 12
    mov dl, 25
    call Gotoxy

    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt              ; Read second number into EAX
    
    add eax, ebx              ; Add EBX to EAX. Sum is now in EAX.

    ; Next Line (Row 13, Col 25)
    mov dh, 13
    mov dl, 25
    call Gotoxy

    mov edx, OFFSET resultMsg
    call WriteString
    call WriteInt             ; Display sum
    call Crlf

    exit
main ENDP
END main
