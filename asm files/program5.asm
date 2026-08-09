.386
.MODEL FLAT, STDCALL
.STACK 4096

.CODE
main PROC
    MOV EAX, 10      ; Load 10 into EAX
    MOV EBX, 20      ; Load 20 into EBX
    MOV ECX, 30      ; Load 30 into ECX
    MOV EDX, 40      ; Load 40 into EDX

    ADD EAX, EBX     ; EAX = 10 + 20 = 30
    ADD EAX, ECX     ; EAX = 30 + 30 = 60
    ADD EAX, EDX     ; EAX = 60 + 40 = 100

    RET
main ENDP
END main