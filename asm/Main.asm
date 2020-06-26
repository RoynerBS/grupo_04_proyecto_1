include C:\Irvine\Irvine32.inc
includelib C:\Irvine\Irvine32.lib
includelib C:\Irvine\Kernel32.lib
includelib C:\Irvine\user32.lib


; Program Description: 8-bit unsigned integer multiplication
; Autor: Royner Baltodano, Angello Vividea, Luis Ortiz
; Date: 23/6/2020

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

multiplicador dw 0 ;
undefined, dw is 2 bytes, code must be implemented
; that the multiplier input cannot be greater than 255,
; with .if and .while in the readint or writeint, one of the two is input. this because
; then this goes into a register of 16
multiplicando db ?;undefined, db is 1 byte.
resultado dw 0 ; result starts at 0. has 2 bytes of space
contador dw 0 ; starts at 0
string1 db "Digite el multiplicador: ", 10, 13, 0 ;message to request numbers
string2 db "Digite el multiplicando: " , 0ah, 0dh, 0 ;message to request numbers
string3 db "El resultado es: " , 0ah, 0dh, 0 ;message to result

.code


; the main of the code, we start with PROC to say that this will be a precess
main PROC 
; we start variables by giving them the respective data type
bandera db 0
string4 db "Error multiplicador o multiplicando no v�lido", 0ah, 0dh,0

; cycle, as long as flag equals 0
while. bandera == 0
    
    
; I move string1 to the EDX register, which is request data.
    mov edx, offset string1
    call writestring 
    call readint 
; if it is less than 255, the numbers entered are 1 byte.
    if. multiplicador <= 255

       mov multiplicador,al
       bandera == 1
; if it is greater than 255 then they are not 1 byte.
    if. multiplicador >255
        
        mov edx, offset string4
        call writestring

while. bandera == 1

   ; I move string1 to the EDX register, which is request data.
    mov edx, offset string1
    call writestring 
    call readint 
   ; if it is less than 255, the numbers entered are 1 byte.
    if. multiplicando <= 255
       mov multiplicando,al
       bandera == 0
   ; if it is greater than 255 then they are not 1 byte.
    if. multiplicando > 255
       mov edx, offset string4
       call writestring

; if everything is true I proceed to call the multiplication
INVOKE uint8_mult multiplicador:dw, multiplicando:db, resultado:dw, contador:dw
exit 
main ENDP

END main