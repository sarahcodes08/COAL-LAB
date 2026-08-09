TITLE Multiple Initializers

; Examples showing multiple initializers and the DUP operator

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

; ----------------- Byte Values ----------------
.data

list1   BYTE  10, 32, 41h, 00100010b
list2   BYTE  0Ah, 20h, 'A', 22h
array1  BYTE  8 DUP(0)

greeting BYTE "Good  afternoon",0

; ----------------- Word Values ---------------------

myList  WORD   1,2,3,4	; array of words

; --------------- DoubleWord Values --------------

array2  DWORD   4 DUP(01234567h)

.code
main PROC

; No instructions to execute

	exit
main ENDP
END main
