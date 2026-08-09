TITLE Setting Text Color, Dumping Memory and Registers (Output2.asm)

; Testing following Output Procedures in the assembly32.lib Library:

; Clrscr:	Clears the console screen
; SetTextColor: Set the foreground and background colors of text
; DumpMem:	Write a block of memory in hexadecimal
; DumpRegs:	Display basic registers and flags in hexadecimal
; WaitMsg:	Display a message and wait for Enter key to be pressed
; Gotoxy:	Put the cursor at a specific row/column on the console

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
CR EQU	0Dh	; carriage return
LF EQU	0Ah	; line feed 

string	BYTE	"This is a string", CR, LF, 0

.code 
main PROC
; Clear the screen after setting text color
        mov eax, yellow+(blue*16) ; yellow = 14 and blue = 1
        call SetTextColor	  ; set yellow text on blue background
        call Clrscr	          ; Call procedure Clrscr

; Call DumpMem that display a block of memory to standard output 
        mov esi, OFFSET string	  ; esi = address of memory block
        mov ecx, LENGTHOF string  ; ecx = number of elements to display
        mov ebx, TYPE BYTE	  ; ebx = type of each element
        call DumpMem	          ; write 19 bytes of string

; Call WaitMsg that displays "Press [Enter] to continue ..."
        call WaitMsg	          ; wait for [Enter] key to be pressed

; Call DumpRegs that display the basic registers and flags in hex 
        call DumpRegs	          ; write basic registers

; Call WaitMsg after locating the cursor on the console 
        mov dh, 10	          ; row 10
        mov dl, 20	          ; column 20
        call Gotoxy	          ; locate cursor
        call WaitMsg	          ; wait for [Enter] key to be pressed

        exit
main ENDP 
END main
