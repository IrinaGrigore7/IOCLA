%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAX
    
power_2:
    test al, bl
    jz verifica_zero
    
    PRINT_UDEC 1, bl
    NEWLINE
    
    sub al, bl
    
verifica_zero:
    test al, al
    jz final
    
    shl bl, 1
    jmp power_2
    
final:
    leave
    ret
