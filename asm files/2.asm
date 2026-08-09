.model small
.stack 100h
.data
    array db 'A', 'B', 'C', 'D', 'E' ; define the array elements
    count dw 5     ;define count to print all 5 elements of array
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, array
    mov cx, count
            
L1:                ;define loop to print elements one by one      
    mov dl, [si]
    mov ah, 02h
    int 21h        ;interrupt
           
    inc si
    loop L1       

    mov ah, 4ch
    int 21h
main endp
end main