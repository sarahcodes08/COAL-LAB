TITLE Generating random numbers and delaying execution (rand.asm)

; Testing Following Procedures in the assembly32.lib Library:
; Randomize:   Seeds the random number generator with a unique value
; Random32:    Generates 32-bit random integer between 0 and FFFFFFFFh
; RandomRange: Generates a random integer between 0 and n-1
; Delay:       Delay program execution for specified n milliseconds
; GetMseconds: Number of milliseconds that have elapsed since midnight

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data

CR  EQU     0Dh		; carriage return
LF  EQU     0Ah		; line feed

rand1   BYTE    "Generating 5 pseudo-random integers ",
                "between 0 and FFFFFFFFh", CR, LF, 0
rand2   BYTE    "Generating 5 pseudo-random integers ",
                "between 0 and 999", CR, LF, 0
time    BYTE    "Execution time in milliseconds: ",0

start   DWORD   ?   ; start execution time

.code
main PROC
; Get starting execution time
    call GetMseconds        ; EAX = number of msecs since midnight
    mov  start, eax         ; save starting execution time

; Seeds the random number generator from the time of the day
    call Randomize          ; different seed for each run

; Display message rand1
    mov  edx, OFFSET rand1
    call WriteString

; Generate 5 random integers between 0 and FFFFFFFFh.
; Put a delay between each.
    mov  ecx,5              ; loop counter
L1: mov  eax, 1000          ; 1000 milliseconds
    call Delay              ; pause for 1 second
    call Random32           ; EAX = random integer
    call WriteHex           ; display ax hexadecimal integer
    call Crlf               ; advance cursor to next line
    Loop L1

; Display message rand2
    mov  edx, OFFSET rand2
    call WriteString

; Generate 5 random integers between 0 and 999.
; Put a delay between each.
    mov  ecx,5              ; loop counter
L2: mov  eax, 1000          ; 1000 milliseconds
    call Delay              ; pause for 1 second
    mov  eax,1000           ; indicate top of range + 1
    call RandomRange        ; EAX = random integer
    call WriteDec           ; display as unsigned decimal
    call Crlf               ; advance cursor to next line
    Loop L2

; Compute and display execution time
    mov  edx, OFFSET time
    call WriteString
    call GetMseconds        ; EAX = number of msecs since midnight
    sub  eax, start         ; difference since starting time
    call WriteDec

    exit
main ENDP
END main