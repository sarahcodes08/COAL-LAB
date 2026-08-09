TITLE Modified Welcome Message
.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

.data
CR EQU 0Dh                            ; carriage return
LF EQU 0Ah                            ; line feed

msg BYTE "Hi! My Name is Sarah Shahzad.", CR, LF
    BYTE "I am learning assembly language.", CR, LF
    BYTE "It is so fun.", CR, LF, 0

.code
main PROC
    call Clrscr                       ; Clear the screen

    lea edx, msg               ; Load the effective address of the message into EDX
    call WriteString                  ; Print the string to the console

    exit
main ENDP
END main
