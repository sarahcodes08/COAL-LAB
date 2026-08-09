TITLE Copying a String                  (File: CopyStr.asm)
; Demonstrates indirect addressing, array indexing, and LOOP

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
source  BYTE  "This is the source string",0
target  BYTE  SIZEOF source DUP(0)

.code
main PROC

	mov  esi, 0		; used to index source and target
	mov  ecx, SIZEOF source		; loop counter
L1:
	mov  al, source[esi]		; get a character from source
	mov  target[esi], al		; store it in the target
	inc  esi		; increment index
	loop L1		; repeat for entire string
        call WaitMsg
	exit
main ENDP
END main
