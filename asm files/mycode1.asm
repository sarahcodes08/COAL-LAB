.model small
.stack 100h
.data var 'Sarah '
.code
main proc
    mov ah, 1 
    INT 21h 
    mov dl, al
    mov ah, 2
    INT 21h
    mov dl, var
    mov dl, al
    mov ah, 2
    INT 21h 
    mov ah, 4ch
    INT 21h
main Endp
End main