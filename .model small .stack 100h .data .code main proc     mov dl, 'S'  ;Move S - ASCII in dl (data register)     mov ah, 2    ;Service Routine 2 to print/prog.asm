.model small
.stack 100h
.data
.code
main proc
    mov dl, 'S'  ;Move S - ASCII in dl (data register)
    mov ah, 2    ;Service Routine 2 to print/output whatever is in data register
    INT 21h      ;Interrupts are used to tell compiler that some text is coming
      
    mov ah, 4ch  ;Exiting program 
    INT 21h
main Endp
End main
