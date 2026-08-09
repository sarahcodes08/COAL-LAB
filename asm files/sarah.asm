TITLE Displaying a Welcoming Message  (welcome.asm) 
.686 
.MODEL flat, stdcall 
.STACK 
INCLUDE Irvine32.inc 
.data 
CR  EQU     0Dh         ; carriage return 
LF  EQU     0Ah         ; line feed 
welcome BYTE    "Welcome to COE 205",CR,LF 
        BYTE    "Computer Organization and Assembly Language",CR,LF 
        BYTE    "Enjoy this course and its lab",CR,LF,0 
.code 
main PROC
; Clear the screen 
    call Clrscr         ; Call procedure Clrscr 
; Write a null-terminated string to standard output 
    lea  edx, welcome   ; load effective address of welcome into edx 
    call WriteString    ; write string whose address is in edx 
    exit 
main ENDP 
END main 