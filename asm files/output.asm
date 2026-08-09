TITLE Writing characters, strings, and integers (output.asm)

; Testing Following Procedures in the assembly32.lib Library:

; Clrscr:	Clears the console screen
; Crlf:	        Write CR and LF characters (end-of-line)
; WriteChar:	Write a single character to standard output
; WriteString:  Write a null-terminated string to standard output
; WriteHex:	Write 32-bit integer in eax in hexadecimal format
; WriteBin:	Write 32-bit integer in eax in binary format
; WriteDec:	Write 32-bit integer in eax in unsigned decimal format
; WriteInt:	Write 32-bit integer in eax in signed decimal format

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data

CR EQU	0Dh	; carriage return
LF EQU	0Ah	; line feed 

string BYTE "Hello World",CR,LF,0

.code
main PROC
; Clear the screen
        call Clrscr	   ; Call procedure Clrscr

; Write a character to standard output
        mov al, 'A'	   ; al = 'A' (or 41h)
        call WriteChar	   ; Write character in register al 
        call Crlf	   ; Write CR and LF chars (end-of-line)

; Write a null-terminated string to standard output
        lea edx, string	   ; load effective address of string into edx
        call WriteString   ; write string whose address is in edx

; Write an integer to standard output
        mov eax,0F1A37CBFh ; eax = 0F1A37CBFh
        call WriteHex      ; Write eax in hexadecimal format
        call Crlf	   ; Write CR and LF chars (end-of-line)

        call WriteBin	   ; Write eax in binary format
        call Crlf	   ; Write CR and LF chars (end-of-line)

        call WriteDec	   ; Write eax in unsigned decimal format
        call Crlf	   ; Write CR and LF chars (end-of-line)

        call WriteInt	   ; Write eax in signed decimal format
        call Crlf	   ; Write CR and LF chars (end-of-line)

        exit
main ENDP
END main
