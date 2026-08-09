TITLE Symbolic Constants 

; Demonstration of EQU and = directives

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data

Rows       EQU   3
Cols       EQU   3
Elements   EQU   Rows * Cols
CR         EQU   10
LF         EQU   13
PromptText EQU   <"Press any key to continue ...",CR,LF,0>


matrix     WORD  Elements DUP(0)
prompt     BYTE  PromptText

COUNT = 10h
COUNT = 100h
COUNT = 1000h
COUNT = SIZEOF matrix

.code
main PROC
	exit
main ENDP
END main
