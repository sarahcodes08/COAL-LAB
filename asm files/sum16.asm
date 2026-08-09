TITLE Sum of Four 16-bit Registers
.386
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.data
sum_msg BYTE "The sum of the 16-bit registers is: ", 0

.code
main PROC
    mov eax, 0
    ; 1. Load immediate values into 16-bit registers
    mov ax, 10      
    mov bx, 20      
    mov cx, 30      
    mov dx, 40
    ; 2. Add the registers together
    add ax, bx      
    add ax, cx      
    add ax, dx
    ; 3. Print the results to the screen
    lea edx, sum_msg  ; Load the address of the message into EDX
    call WriteString  ; Print "The sum of the 16-bit registers is: "
    
    call WriteDec     ; Print the decimal value inside EAX (which holds our 100)
    call Crlf         ; Print a new line
    
    exit
main ENDP
END main