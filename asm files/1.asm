.model small
.stack 100h
.data
    str1 db 'Nutech', 0Dh, 0Ah, '$'
    str2 db 'University', 0Dh, 0Ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset str1
    mov ah, 09h
    int 21h

    mov dx, offset str2
    mov ah, 09h
    int 21h

    mov dx, offset str1
    mov ah, 09h
    int 21h

    mov dx, offset str2
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h
main endp               
end main