TITLE Linear Search  (search.asm)

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
; First element is at index 0
intArray    SDWORD   18,20,35,-12,66,4,-7,100,15
item        SDWORD   -12

FoundStr       BYTE    " is found at index ", 0
NotFoundStr    BYTE    " is not found", 0

.code
main PROC
    mov    ecx, LENGTHOF intArray   ; loop counter
    mov    eax, item                ; item to search
    mov    esi, -1                  ; index to intArray

L1:
    inc    esi                      ; increment index before search
    cmp    intArray[4*esi], eax     ; compare array element with item
    loopnz L1                       ; loop as long as item not found
    jne    notFound                 ; item not found

found:
    call  WriteInt                  ; write item
    mov   edx, OFFSET FoundStr
    call  WriteString               ; " is found at index "
    mov   eax, esi
    call  WriteDec                  ; Write index
    jmp   quit

notFound:
    call  WriteInt                  ; write item
    mov   edx, OFFSET NotFoundStr
    call  WriteString               ; " is not found"

quit:
    call  Crlf
    exit
main ENDP
END main
