.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.data
    min SDWORD 2147483647
    max SDWORD -2147483648
    prompt BYTE "Enter a signed integer (invalid input to stop): ", 0
    minStr BYTE "Minimum value: ", 0
    maxStr BYTE "Maximum value: ", 0

.code
main PROC
L1:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    
    jo DisplayResult ; Jump if overflow (invalid input)

    cmp eax, max
    jle CheckMin
    mov max, eax

CheckMin:
    cmp eax, min
    jge L1
    mov min, eax
    jmp L1

DisplayResult:
    mov edx, OFFSET minStr
    call WriteString
    mov eax, min
    call WriteInt
    call Crlf
    
    mov edx, OFFSET maxStr
    call WriteString
    mov eax, max
    call WriteInt
    call Crlf

    exit
main ENDP
END main