.MODEL SMALL
.STACK 100H
 

.DATA
    ARRAY DB 10 DUP(?)
    
    msg1  DB 13, 10, 'Enter a signed integer: $'
    msg2  DB 13, 10, 'Stored integers are: $'
    blank DB ' $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 10 
    
    LEA SI, ARRAY

;input loop    
LOOP:

    LEA DX, msg1
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H

    MOV [SI], AL
    INC SI
    LOOP LOOP

    MOV CX, 10 
    
    LEA SI, ARRAY


    LEA DX, msg2
    MOV AH, 09H
    INT 21H
;print loop
LOOP2:
    MOV DL, [SI]

    MOV AH, 02H
    INT 21H
    
    LEA DX, blank
    MOV AH, 09H
    INT 21H

    INC SI
    LOOP LOOP2

    ;exit
    MOV AH, 4CH
    INT 21H 
    
MAIN ENDP
END MAIN