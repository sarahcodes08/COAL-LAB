TITLE Demonstrating Procedures (ArraySum.asm)

.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.data
sum    DWORD ?
prompt BYTE "Enter a string of (max 19) digits: ", 0

.code
main PROC
    push OFFSET sum         ; Pass the address of 'sum' as a reference parameter
    call SumDigits
    
    ; Display the resulting sum
    mov eax, sum
    call WriteDec
    call Crlf
    
    exit
main ENDP

;-----------------------------------------------------------------
; SumDigits PROC
; Reads a string of characters, stores it on a local stack buffer,
; and accumulates the sum of the numerical digits.
; Receives: [ebp + 8] = address of the sum variable (reference)
; Returns: Modifies the memory at the passed address directly.
;-----------------------------------------------------------------
SumDigits PROC
    push ebp                ; Save old frame pointer
    mov ebp, esp            ; Set up new stack frame
    sub esp, 20             ; Allocate 20 bytes for local string buffer
    pushad                  ; Save all general-purpose registers

    ; Display the input prompt
    lea edx, prompt         
    call WriteString

    ; Read string from the user into the local stack buffer
    lea edx, [ebp-20]       ; EDX points to the local buffer space
    mov ecx, 20             ; Maximum characters to read (including null terminator)
    call ReadString         ; EAX now contains the number of characters read
    
    mov ecx, eax            ; Loop counter = number of characters read
    mov eax, 0              ; EAX will accumulate the sum
    mov ebx, 0              ; Clear EBX so upper bytes are zero

L1: 
    mov bl, [edx]           ; Move one character into BL
    sub bl, '0'             ; Convert ASCII character to numeric value
    cmp bl, 9               ; Check if the value is between 0 and 9
    ja L2                   ; If it's above 9 (or negative/below 0), it's not a digit -> skip
    add eax, ebx            ; Add the validated digit to the accumulator
L2: 
    inc edx                 ; Point to the next character in the buffer
    loop L1                 ; Repeat for all characters

    ; Store the final sum back into the reference parameter
    mov ebx, [ebp+8]        ; EBX = address of 'sum'
    mov [ebx], eax          ; Store accumulator value at that address

    popad                   ; Restore general-purpose registers
    mov esp, ebp            ; Clean up the 20-byte local stack space
    pop ebp                 ; Restore old frame pointer
    ret 4                   ; Clean up the 4-byte parameter address from stack and return
SumDigits ENDP

END main