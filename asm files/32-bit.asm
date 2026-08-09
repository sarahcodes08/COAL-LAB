TITLE Sum using 16-bit Registers
.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.CODE
main PROC
    ; --- Your original logic ---
    mov ax, 10
    mov bx, 20
    mov cx, 30
    mov dx, 40
    add ax, bx
    add ax, cx
    add ax, dx        ; AX now contains 100

    ; --- The Print Code ---
    movzx eax, ax     ; Move 16-bit AX into 32-bit EAX and clear top bits
    call WriteDec     ; Prints "100" to the console window
    call Crlf         ; Moves the cursor to a new line

    exit              ; Required to stop the program safely
main ENDP
END main