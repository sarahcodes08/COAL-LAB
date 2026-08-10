.model small
.stack 100h
.data
.code
main proc
    mov dl, 'S' 
    mov ah, 2 
    INT 21h 
    ; Next line
    mov dx, 10
    mov ah, 2
    INT 21h
    ; Move to start of next line
    mov dx, 13
    mov ah, 2
    INT 21h
    
    mov dl, 'A' 
    mov ah, 2 
    INT 21h
    
    ; Next line
    mov dx, 10
    mov ah, 2
    INT 21h
    ; Move to start of next line
    mov dx, 13
    mov ah, 2
    INT 21h
     
    mov dl, 'R' 
    mov ah, 2 
    INT 21h 
    
    ; Next line
    mov dx, 10
    mov ah, 2
    INT 21h
    ; Move to start of next line
    mov dx, 13
    mov ah, 2
    INT 21h
    
    mov dl, 'A' 
    mov ah, 2 
    INT 21h
    
    ; Next line
    mov dx, 10
    mov ah, 2
    INT 21h
    ; Move to start of next line
    mov dx, 13
    mov ah, 2
    INT 21h
     
    mov dl, 'H' 
    mov ah, 2 
    INT 21h 
    
    ; Next line
    mov dx, 10
    mov ah, 2
    INT 21h
    ; Move to start of next line
    mov dx, 13
    mov ah, 2
    INT 21h
    
    mov ah, 4ch 
    INT 21h
main Endp
End main