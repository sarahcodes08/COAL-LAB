.MODEL SMALL
.STACK 100H
.DATA
    word1 DB 'Assembly '
    word2 DB 'Language '
    word3 DB 'is '
    word4 DB 'COOL'
    colors DB 0Ah, 0Ch, 0Eh, 09h ; Green, Red, Yellow, Blue
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA SI, word1
    MOV CX, 9
    MOV BL, colors[0]
    CALL PRINT_WORD

    LEA SI, word2
    MOV CX, 9
    MOV BL, colors[1]
    CALL PRINT_WORD

    LEA SI, word3
    MOV CX, 3
    MOV BL, colors[2]
    CALL PRINT_WORD

    LEA SI, word4
    MOV CX, 4
    MOV BL, colors[3]
    CALL PRINT_WORD

    MOV AH, 4CH
    INT 21H
MAIN ENDP

PRINT_WORD PROC
L1:
    LODSB
    PUSH CX
    MOV BH, 0
    MOV CX, 1
    MOV AH, 09H
    INT 10H
    
    MOV AH, 0EH ; Advance cursor
    INT 10H
    
    POP CX
    LOOP L1
    RET
PRINT_WORD ENDP
END MAIN