TITLE Demonstrating Procedures 

.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

MAXSIZE EQU 10

.data
array   DWORD MAXSIZE DUP(?)
count   DWORD ?
prompt  BYTE "Enter a signed integer (0 to stop, max 10): ", 0
msgSum  BYTE "The sum of the array elements is: ", 0

.code
main PROC
    ; --- Step 1: Read the integers from the user ---
    push OFFSET count       ; [ebp + 12] in ReadIntArray
    push OFFSET array       ; [ebp + 8]  in ReadIntArray
    call ReadIntArray

    ; If no elements were entered (count == 0), we can still safely call ArraySum
    ; --- Step 2: Calculate the sum ---
    push count              ; [ebp + 12] in ArraySum
    push OFFSET array       ; [ebp + 8]  in ArraySum
    call ArraySum           ; Returns sum in EAX

    ; --- Step 3: Display the final sum ---
    mov edx, OFFSET msgSum
    call WriteString        ; Print the text message
    call WriteInt           ; Print the signed integer stored in EAX
    call Crlf               ; Print a new line

    exit
main ENDP

;-----------------------------------------------------------------
; ReadIntArray PROC
; Prompts user for signed integers, stores them in an array until 
; 0 is entered or MAXSIZE (10) is reached.
; Receives: [ebp + 8]  = address of the array
;           [ebp + 12] = address of the count variable
; Returns: Updates array and count memory indirectly.
;-----------------------------------------------------------------
ReadIntArray PROC
    push ebp                ; Save old EBP
    mov ebp, esp            ; Set up stack frame
    pushad                  ; Save all general-purpose registers

    mov esi, [ebp + 8]      ; ESI = array address
    mov edi, [ebp + 12]     ; EDI = count address
    mov ecx, 0              ; ECX will serve as our element counter

L_readLoop:
    cmp ecx, MAXSIZE        ; Check if we have reached the maximum size (10)
    je L_done               ; If ECX == 10, stop reading

    ; Display prompt
    mov edx, OFFSET prompt
    call WriteString

    ; Read signed integer into EAX
    call ReadInt            
    
    cmp eax, 0              ; Check if the user entered 0
    je L_done               ; If EAX == 0, stop reading

    ; Store the integer into the array
    mov [esi], eax          
    add esi, 4              ; Move to next DWORD element space
    inc ecx                 ; Increment our element counter
    jmp L_readLoop          ; Repeat loop

L_done:
    mov [edi], ecx          ; Store final count indirectly into 'count' variable
    
    popad                   ; Restore registers
    pop ebp                 ; Restore EBP
    ret 8                   ; Clean up 8 bytes of parameters from stack
ReadIntArray ENDP

;-----------------------------------------------------------------
; ArraySum PROC
; Calculate and return the sum of an array of 32-bit integers
; Receives: [ebp + 8]  = array address
;           [ebp + 12] = count of array elements
; Returns:  EAX = sum of the array elements
;-----------------------------------------------------------------
ArraySum PROC
    push ebp                ; save old value of EBP
    mov ebp, esp            ; new value of EBP
    push esi                ; save old value of ESI
    push ecx                ; save old value of ECX
    
    mov esi, [ebp+8]        ; ESI = array address
    mov ecx, [ebp+12]       ; ECX = number of array elements

    mov eax, 0              ; set the sum to 0
    jecxz L2                ; skip loop if array count is 0
L1:
    add eax, [esi]          ; add each element to sum
    add esi, 4              ; point to next array element
    loop L1
L2:
    pop ecx                 ; restore value of ECX
    pop esi                 ; restore value of ESI
    pop ebp
    ret 8                   ; sum is in EAX, cleans up 8 bytes
ArraySum ENDP

END main