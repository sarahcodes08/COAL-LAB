TITLE Random Stars 
.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

.code
main PROC
    call Clrscr
    call Randomize

    mov ecx, 100              ; Loop 100 times
L1:
    ; Generate random Row (0 to 24)
    mov eax, 25
    call RandomRange
    mov dh, al                ; Move to DH for Gotoxy

    ; Generate random Column (0 to 79)
    mov eax, 80
    call RandomRange
    mov dl, al                ; Move to DL for Gotoxy

    call Gotoxy               ; Move cursor

    mov al, '*'
    call WriteChar            ; Print star

    mov eax, 100              ; Set delay to 100 milliseconds
    call Delay

    loop L1

    ; Move cursor to the bottom left before exiting
    mov dh, 24
    mov dl, 0
    call Gotoxy

    exit
main ENDP
END main
