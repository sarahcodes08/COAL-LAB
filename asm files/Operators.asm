TITLE Operators
; Demonstration of TYPE, LENGTHOF, SIZEOF, OFFSET, and PTR operators

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
byte1    BYTE  10,20,30,40
array1   WORD  30 DUP(?),0,0
array2   WORD  5 DUP(3 DUP(?))
array3   DWORD 01234567h,2,3,4
digitStr BYTE  '12345678',0
myArray  BYTE  10h,20h,30h,40h,50h,60h,70h,80h,90h

.code
main PROC
    ; Demonstrating TYPE operator
    mov al, TYPE byte1
    mov bl, TYPE array1
    mov cl, TYPE array3
    mov dl, TYPE digitStr

    ; Demonstrating LENGTHOF operator
    mov eax, LENGTHOF array1
    mov ebx, LENGTHOF array2
    mov ecx, LENGTHOF array3
    mov edx, LENGTHOF digitStr

    ; Demonstrating SIZEOF operator
    mov eax, SIZEOF array1
    mov ebx, SIZEOF array2
    mov ecx, SIZEOF array3
    mov edx, SIZEOF digitStr

    ; Demonstrating OFFSET operator
    mov eax, OFFSET byte1
    mov ebx, OFFSET array1
    mov ecx, OFFSET array2
    mov edx, OFFSET array3
    mov esi, OFFSET digitStr
    mov edi, OFFSET myArray
    
    ; Demonstrating PTR operator
    mov al,  BYTE  PTR array3
    mov bx,  WORD  PTR array3
    mov cx,  WORD  PTR myArray
    mov edx, DWORD PTR myArray
    
    exit
main ENDP
END main
