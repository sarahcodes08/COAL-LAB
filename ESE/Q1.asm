.686
.model flat, stdcall
.stack

INCLUDE Irvine32.inc

.data
     var SDWORD 0
     msg1 BYTE "value: ", 0
     msg2 BYTE "Enter your choice[0 -> Quit, 1-> Increment by 1, 2-> Decrement by 1, 3-> Add 5 to value, 4-> Subtract 5 from the value]",0

.code
main PROC
     jmp break

     Jtable DWORD case0, case1, case2, case3, case4

     case0:
          exit
     case1:
           inc var
           jmp break
     case2:
           dec var
           jmp break
     case3:
           add var, 5
           jmp break
     case4:
           sub var, 5
           jmp break
     break:

     ; display value
     mov edx, OFFSET msg1
     call WriteString

     mov eax, var
     call WriteInt
     call Crlf
     call Crlf

     ; display menu
     mov edx, OFFSET msg2
     call WriteString

     func:
            mov eax, 0
            call ReadChar
            
            cmp al, '0'
            jb out_of_range
            cmp al, '4'
            ja out_of_range
            call WriteChar
            call Crlf

            sub al, 30h
            jmp Jtable[4*eax]
     out_of_range:
            jmp func
main ENDP
END main