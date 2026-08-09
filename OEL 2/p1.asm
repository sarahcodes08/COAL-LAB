.386
.model flat, stdcall
.stack 4096
INCLUDE Irvine32.inc

.code
main PROC
    call Randomize
    mov ecx, 20       ; loop 20 times
L1:
    mov eax, 41       ; 0-40 range
    call RandomRange
    sub eax, 20       ; range -20 to +20
    call WriteInt     ; display sign
    mov al, ' '
    call WriteChar
    loop L1
    call Crlf
    exit
main ENDP
END main








