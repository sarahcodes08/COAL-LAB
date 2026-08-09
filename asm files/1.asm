INCLUDE Irvine32.inc

.data
    prompt BYTE "Enter a 32-bit integer: ", 0
    msgSum BYTE "The total sum in EAX is: ", 0

.code
main PROC
    ; --- Input for EAX ---
    mov  edx, OFFSET prompt
    call WriteString
    call ReadInt            ; User input goes into EAX
    push eax                ; Temporarily save EAX so we can use it for next prompt

    ; --- Input for EBX ---
    mov  edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov  ebx, eax            ; Move input to EBX

    ; --- Input for ECX ---
    mov  edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov  ecx, eax            ; Move input to ECX

    ; --- Input for EDX ---
    mov  edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov  edx, eax            ; Move input to EDX

    ; --- Restore EAX and Perform Addition ---
    pop  eax                ; Get the first input back into EAX
    
    add  eax, ebx           ; EAX = EAX + EBX
    add  eax, ecx           ; EAX = EAX + ECX
    add  eax, edx           ; EAX = EAX + EDX

    ; --- Display Result ---
    mov  edx, OFFSET msgSum
    call WriteString
    call WriteDec           ; Display final sum in EAX
    call Crlf

    exit
main ENDP
END main