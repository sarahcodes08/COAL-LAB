TITLE Data Transfer Examples (File: moves.asm)
; Demonstration of MOV, MOVZX, MOVSX, and XCHG
.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc
.data
var1 WORD 1000h
var2 WORD 2000h
.code
main PROC
; Demonstrating MOV and MOVZX
mov ax, 0A69Bh
movzx bx, al
movzx ecx,ah
movzx edx,ax
; Demonstrating MOVSX
movsx bx, al
movsx ecx,ah
movsx edx,ax
; Demonstrating XCHG
xchg ax,var1
xchg ax,var2
xchg ax,var1
exit
main ENDP
END main