.model small
.stack 100h
.code
main proc
    mov ax, 5
    mov bx, 10
    mov cx, 15
    mov dx, 20

    add ax, bx
    add ax, cx
    add ax, dx           ; AX = sum of all

    ; AX now holds 50 (32h)

    mov ah, 4Ch
    int 21h
main endp
end main
