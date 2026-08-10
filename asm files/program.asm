.model small
.stack 100h
.data
.code
main proc
    
    mov cx, 26
    mov dx, 65
    
    L1:
        mov ah, 2
        INT 21h
        add dx, 1
        
        Loop L1

    mov ah, 4ch  
    INT 21h     
    
main Endp
End main
