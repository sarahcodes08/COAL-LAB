.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.data
    prompt BYTE "Enter test score (0-100): ", 0
    errStr BYTE "Error: Score out of range.", 0
    msg    BYTE "Your grade is: ", 0

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt

    cmp eax, 0
    jl  L_Error
    cmp eax, 100
    jg  L_Error

    mov edx, OFFSET msg
    call WriteString

    cmp eax, 90
    jae G_APlus
    cmp eax, 85
    jae G_A
    cmp eax, 80
    jae G_BPlus
    cmp eax, 75
    jae G_B
    cmp eax, 70
    jae G_CPlus
    cmp eax, 65
    jae G_C
    cmp eax, 60
    jae G_DPlus
    cmp eax, 55
    jae G_D
    jmp G_F

G_APlus: 
    mov al, 'A'
    call WriteChar
    mov al, '+'
    call WriteChar
    jmp Quit
G_A:      
    mov al, 'A'
    call WriteChar
    jmp Quit
G_BPlus:  
    mov al, 'B'
    call WriteChar
    mov al, '+'
    call WriteChar
    jmp Quit
G_B:      
    mov al, 'B'
    call WriteChar
    jmp Quit
G_CPlus:  
    mov al, 'C'
    call WriteChar
    mov al, '+'
    call WriteChar
    jmp Quit
G_C:      
    mov al, 'C'
    call WriteChar
    jmp Quit
G_DPlus:  
    mov al, 'D'
    call WriteChar
    mov al, '+'
    call WriteChar
    jmp Quit
G_D:      
    mov al, 'D'
    call WriteChar
    jmp Quit
G_F:      
    mov al, 'F'
    call WriteChar
    jmp Quit

L_Error:
    mov edx, OFFSET errStr
    call WriteString
Quit:
    call Crlf
    exit
main ENDP
END main