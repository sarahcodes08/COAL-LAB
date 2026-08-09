.386
.model flat, stdcall
.stack 4096
INCLUDE Irvine32.inc

.data
    string BYTE "nutech", 0

.code
main PROC
    mov esi, OFFSET string
    mov ecx, LENGTHOF string - 1
L1:
    and BYTE PTR [esi], 0DFh       ; convert to upper case
    inc esi
    loop L1

    mov edx, OFFSET string
    call WriteString
    call Crlf
    exit
main ENDP
END main