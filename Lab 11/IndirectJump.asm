TITLE Demonstrating Indirect Jump (IndirectJump.asm)

; This program shows the implementation of a switch statement
; A jump table and indirect jump are used

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
value      SDWORD  0
valuestr   BYTE    "Value = ",0
prompt     BYTE    "Enter Selection [Quit=0,Inc=1,Dec=2,Add5=3,Sub5=4]: ",0

.code
main PROC
; Start at break to bypass the jump table
    jmp break

; Jump table is an array of labels (instruction addresses)
table       DWORD   case0, case1, case2, case3, case4

; Implementing a Switch Statement
case0:
    exit
case1:
    inc value
    jmp break
case2:
    dec value
    jmp break
case3:
    add value, 5
    jmp break
case4:
    sub value, 5
    jmp break

break:
; Display value
    mov  edx, OFFSET valuestr
    call WriteString
    mov  eax, value
    call WriteInt
    call Crlf

; Prompt for the user to enter his selection
    mov  edx, OFFSET prompt
    call WriteString

; Read input character and check its value
readch:
    mov  eax,0          ; clear eax before reading
    call ReadChar
    cmp  al, '0'
    jb   out_of_range   ; character < '0'
    cmp  al, '4'
    ja   out_of_range   ; character > '4'
    call WriteChar      ; echo character
    call Crlf
    sub  al, 30h        ; convert char into number
    jmp  table[4*eax]   ; Indirect jump using table

; Out of range: ignore input and read again
out_of_range:
    jmp  readch
main ENDP
END main