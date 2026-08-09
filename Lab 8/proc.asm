TITLE Demonstrating Procedures 

.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.data
msgEAX BYTE "EAX: ", 0
msgEBX BYTE "EBX: ", 0
msgECX BYTE "ECX: ", 0

.code
main PROC
    ; Load initial unsorted values
    mov eax, 8FFFFh     ; 589823 in decimal (largest)
    mov ebx, 12         ; (smallest)
    mov ecx, 5          ; (middle)

    ; Call the sorting procedure
    call sort3

    ; --- Display the final sorted registers ---
    mov edx, OFFSET msgEAX
    call WriteString
    call WriteDec       ; Print EAX value
    call Crlf

    mov edx, OFFSET msgEBX
    call WriteString
    call WriteDec       ; Print EBX value
    call Crlf

    mov edx, OFFSET msgECX
    call WriteString
    call WriteDec       ; Print ECX value
    call Crlf

    exit
main ENDP

;-----------------------------------------------------------------
; sort3 PROC
; Sorts 3 integers in EAX, EBX, and ECX in ascending order 
; (EAX <= EBX <= ECX)
;-----------------------------------------------------------------
sort3 PROC
    cmp eax, ebx
    jle L1
    call swapAB         ; If EAX > EBX, swap them
L1: 
    cmp eax, ecx
    jle L2
    call swapAC         ; If EAX > ECX, swap them (ensures smallest is in EAX)
L2: 
    cmp ebx, ecx
    jle L3
    call swapBC         ; If EBX > ECX, swap them (ensures largest is in ECX)
L3: 
    ret
sort3 ENDP

;-----------------------------------------------------------------
; swapAB PROC
; Swaps the values of EAX and EBX using the stack
;-----------------------------------------------------------------
swapAB PROC
    push eax
    push ebx
    pop eax             ; Gets old EBX value
    pop ebx             ; Gets old EAX value
    ret
swapAB ENDP

;-----------------------------------------------------------------
; swapAC PROC
; Swaps the values of EAX and ECX using the stack
;-----------------------------------------------------------------
swapAC PROC
    push eax
    push ecx
    pop eax             ; Gets old ECX value
    pop ecx             ; Gets old EAX value
    ret
swapAC ENDP

;-----------------------------------------------------------------
; swapBC PROC
; Swaps the values of EBX and ECX using the stack
;-----------------------------------------------------------------
swapBC PROC
    push ebx
    push ecx
    pop ebx             ; Gets old ECX value
    pop ecx             ; Gets old EBX value
    ret
swapBC ENDP

END main