TITLE Sum of Four 32-bit Registers (With Output)
.386
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc
.data
sum_msg BYTE "The sum of the 32-bit registers is: ", 0
.code
main PROC
    ; 1. Load immediate values into 32-bit registers
    mov eax, 1000   
    mov ebx, 2000   
    mov ecx, 3000   
    mov edx, 4000
    ; 2. Add the registers together
    add eax, ebx    
    add eax, ecx    
    add eax, edx
    ; 3. Print the results to the screen
    lea edx, sum_msg  ; Load the address of the message into EDX
    call WriteString  ; Print "The sum of the 32-bit registers is: "
    
    call WriteDec     ; Print the decimal value inside EAX (which holds 10000)
    call Crlf         ; Print a new line
    
    exit
main ENDP
END main