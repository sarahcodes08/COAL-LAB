TITLE Summing an Array of Signed Words     (File: SumArray.asm)
; Register-Indirect memory addressing is used

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
intarray SWORD 5,7,-3,100,0,-9, 10 DUP(-999)
sum      SWORD ?

.code
main PROC

    mov   esi,OFFSET   intarray ; esi = pointer to intarray
    mov   ecx,LENGTHOF intarray	; ecx = loop counter
    mov   ax,0                  ; zero the accumulator
L1:
    add   ax,[esi]              ; register esi is a pointer
    add   esi,TYPE intarray     ; point to next integer
    loop  L1                    ; repeat until ECX = 0

    mov   sum, ax
    exit
main ENDP
END main
