TITLE Integer Data Definitions

; Examples Demonstrating Integer Data Definition

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
; ----------------- Byte Values ---------------------
byte1 BYTE 'A'
byte2 BYTE 0
byte3 BYTE 255
byte4 SBYTE -128
byte5 SBYTE +127
byte6 BYTE ?

; ----------------- Word Values ---------------------
word1 WORD 65535
word2 SWORD -32768
word3 WORD ?

; --------------- DoubleWord Values -----------------
dword1 DWORD 0FFFFFFFFh
dword2 SDWORD -2147483648

; --------------- QuadWord Value --------------------
quad1 QWORD 0123456789ABCDEFh

.code
main PROC

; No instructions to execute
  exit
main ENDP
END main