.386
.model flat,stdcall
.stack 4096
;we start with PROC to say that this will be a precess
ExitProcess PROTO, dwExitCode:DWORD

.code

uint8_mult PROC 

;values ​​assigned to registers
mov ax, multiplicador 
mov ah, multiplicando 
mov bx, resultado
;
while. contador < 8             ;muevo contador al registro ax
    if. ah & 1 
        shl ax, contador        ;I move the AX register to the left, the amount that is on the counter
        add bx, ax              ;sum BX and AX registers
        add contador, 1         ;sum 1 to contador
        mov ax, multiplicador   ;move "multiplicador" to AX register
        shr ah, 1               ;Move to the right the register AH one position
    else.
        add contador,1          ;sum 1 to contador
        shr ah, 1               ;Move to the right the register AH one position

uint8_mult ENDP             

END uint8_mult                  ;end