TITLE Array Input and Output array.asm
.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

.data
    array SDWORD 10 DUP(?)
    prompt BYTE "Enter a signed 32-bit integer: ", 0
    msg BYTE "The integers you entered are: ", 0

.code
main PROC
    call Clrscr
    
    ; Input Loop
    mov ecx, 10               ; Loop counter for 10 elements
    mov esi, OFFSET array     ; ESI points to array start
L1:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt              ; Read user input into EAX
    mov [esi], eax            ; Store EAX into array
    add esi, TYPE SDWORD      ; Move to next array position (4 bytes)
    loop L1

    call Crlf
    mov edx, OFFSET msg
    call WriteString
    call Crlf

    ; Output Loop
    mov ecx, 10               ; Reset loop counter
    mov esi, OFFSET array     ; Reset ESI to array start
L2:
    mov eax, [esi]            ; Read from memory into EAX
    call WriteInt             ; Print integer
    call Crlf
    add esi, TYPE SDWORD      ; Move to next array position
    loop L2

    exit
main ENDP
END main