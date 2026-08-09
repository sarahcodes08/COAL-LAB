.model small
.stack 100h
.data
    prompt1 db 'Enter first number: $'
    prompt2 db 0Dh, 0Ah, 'Enter second number: $'
    resMsg  db 0Dh, 0Ah, 'The sum is: $'
    num1    db ?
    num2    db ?
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Clear Screen
    mov ah, 06h
    mov al, 00h
    mov bh, 07h
    mov cx, 0000h
    mov dh, 24d
    mov dl, 79d
    int 10h

    ; Position Cursor
    mov ah, 02h
    mov bh, 00h
    mov dh, 10d
    mov dl, 30d
    int 10h

    ; Input 1
    lea dx, prompt1
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h
    mov num1, al

    ; Reposition for Input 2
    mov ah, 02h
    mov dh, 11d
    mov dl, 30d
    int 10h

    lea dx, prompt2
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h
    mov num2, al

    ; Add and Display
    mov al, num1
    add al, num2
    add al, 30h
    mov bl, al

    mov ah, 02h
    mov dh, 12d
    mov dl, 30d
    int 10h

    lea dx, resMsg
    mov ah, 09h
    int 21h

    mov dl, bl
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main