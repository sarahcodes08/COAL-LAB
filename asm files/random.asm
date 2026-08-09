TITLE Random Range (Ex4.asm)
.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

.code
main PROC
    call Clrscr
    call Randomize            ; Seed the random generator

    mov ecx, 50               ; Loop 50 times
L1:
    mov eax, 41               ; Upper limit for RandomRange (0 to 40)
    call RandomRange          ; EAX = random number 0-40
    sub eax, 20               ; Shift range down by 20 (-20 to +20)

    call WriteInt             ; Print number
    
    mov al, ' '               ; Print a space separator
    call WriteChar
    
    loop L1

    call Crlf
    exit
main ENDP
END main
