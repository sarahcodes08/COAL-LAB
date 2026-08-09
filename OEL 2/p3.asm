.386
.model flat, stdcall
.stack 4096
INCLUDE Irvine32.inc

.data
    string BYTE "NUTECH", 0

.code
main PROC
    mov esi, OFFSET string
    mov ecx, LENGTHOF string - 1
L1:
    or BYTE PTR [esi], 20h      ; convert to lower case
    inc esi
    loop L1

    mov edx, OFFSET string
    call WriteString
    call Crlf
    exit
main ENDP
END main