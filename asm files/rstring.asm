TITLE Random Strings 
.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

.code
main PROC
    call Clrscr
    call Randomize

    mov ecx, 20               ; Outer loop: 20 strings
OuterLoop:
    push ecx                  ; Save outer loop counter to stack

    mov ecx, 10               ; Inner loop: 10 chars per string
InnerLoop:
    mov eax, 26               ; Range: 0 to 25
    call RandomRange
    add eax, 65               ; Add 65 to reach ASCII 'A' through 'Z'
    
    call WriteChar            ; Print the character
    
    loop InnerLoop            ; Decrement inner loop

    call Crlf                 ; Print newline after 10 characters
    
    pop ecx                   ; Restore outer loop counter
    loop OuterLoop            ; Decrement outer loop

    exit
main ENDP
END main
