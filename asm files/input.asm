TITLE Reading characters, strings, and integers (input.asm)
; Testing Following Procedures in the assembly32.lib Library:
; ReadChar:	Read a single character from standard input
; ReadString:	Read a null-terminated string from standard input
; ReadHex:	Read hexadecimal integer from standard input
; ReadInt:	Read signed decimal integer from standard input

.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

.data	
charvar	BYTE	0		;	Character variable
string	BYTE	21	DUP(0)	;	Extra byte for null char
bytecount	DWORD	0	;	Count of bytes read in string
hexvar	DWORD	0		;	Unsigned integer variable
intvar	SDWORD	0		;	Signed integer variable

prompt1	BYTE	"Enter a character (char will not appear): ",0 
prompt2	BYTE	"Enter a string (max 20 chars): ",0
prompt3	BYTE	"Enter a hexadecimal number (max 8 digits): ",0 
prompt4	BYTE	"Enter a decimal number with optional sign: ",0

.code
main PROC
     call Clrscr

; Display prompt1 
     lea edx, prompt1 
     call WriteString
; Read a character (without echo) from standard input 
     call ReadChar	; character is returned in AL 
     mov charvar, al	; save character in charvar
     call Crlf	; Write end-of-line after reading character

; Display prompt2 
     lea edx, prompt2
     call WriteString

; Read a null-terminated string from standard input
     lea edx, string	; edx = address of storage area for string 
     mov ecx, SIZEOF string ; ecx = max characters to be stored
     call ReadString	; read string from standard input 
     mov bytecount, eax	; eax = actual number of chars read

; Display prompt3 
     lea edx, prompt3 
     call WriteString

; Read a hexadecimal string and convert it to a number
     call ReadHex	; number is returned in EAX register 
     mov hexvar, eax	; save number in hexvar

; Display prompt4 
     lea edx, prompt4 
     call WriteString

; Read a signed decimal string and convert it to a number
     call ReadInt	; number is returned in EAX register 
     mov intvar, eax	; save number in intvar
     exit
main ENDP 
END main
