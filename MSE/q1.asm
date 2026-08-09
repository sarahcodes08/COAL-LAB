.MODEL SMALL
.STACK 100H
; VARIABLE DECLARATION
.DATA
    allocBudget DB 90
    extraFund   DB 20
    expenses    DB 25

.CODE
MAIN PROC  
    ; INITIALIZE DATA
    
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, allocBudget  
    MOV BL, extraFund    
    
    ADD AL, BL          
    ; LOAD CL with expenses
    
    MOV CL, expenses
    SUB AL, CL              ; AL=net budget
               
    ; to print in decimal we have to separate tens and unit digits
    
    MOV AH, 0      ; clear AH       
    MOV BL, 10            
    DIV BL             
    
    MOV BX, AX            
    
    MOV DL, BL            
    ADD DL, 48     ; convert ascii to decimal      
    MOV AH, 02H
    INT 21H
    
    MOV DL, BH            
    ADD DL, 48     ; convert ascii to decimal           
    MOV AH, 02H
    INT 21H
    
    ; EXIT
    MOV AH, 4CH
    INT 21H   
    
MAIN ENDP
END MAIN