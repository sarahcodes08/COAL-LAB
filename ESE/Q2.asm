.686
.model flat, stdcall
.stack


INCLUDE Irvine32.inc

.data
     CR EQU 0Dh
     LF EQU 0Ah
     msg1 BYTE "Generating 5 random integers between (0-FFFFFFFFh)", CR, LF, 0
     msg2 BYTE "Generating 5 random integers between (0-999)", CR, LF, 0
     t BYTE "Exec time in ms: ",0
     s DWORD ?

.code
main PROC
    call GetMseconds
    mov  s, eax

    call Randomize

    mov  edx, OFFSET msg1
    call WriteString

    mov  ecx,5              ; counter
    L1: mov  eax, 1000
        call Delay              ; 1 second delay
        call Random32
        call WriteHex
        call Crlf
        Loop L1
    
        call Crlf
        mov  edx, OFFSET msg2
        call WriteString


    mov  ecx,5              ; counter
    L2: mov  eax, 1000
        call Delay              ; 1 second delay
        mov  eax,1000
        call RandomRange
        call WriteDec
        call Crlf
        Loop L2

    call Crlf
    mov  edx, OFFSET t
    call WriteString
    call GetMseconds
    sub  eax, s
    call WriteDec

    exit
main ENDP
END main