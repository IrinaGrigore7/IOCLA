%include "io.inc"

%define ARRAY_SIZE    10

section .data
    byte_array db 8, -19, 12, -3, 67, -10, 28, 9, 78, 102
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE
    xor eax, eax
    xor edx, edx
    xor ebx, ebx
    
el_poz:
    mov al, byte [byte_array + ecx - 1]
    cmp al, 0
    jl el_neg
    inc ebx
    loop el_poz
    
    cmp ecx, 0
    je return
    
el_neg:
    inc edx
    sub ecx, 1
    cmp ecx, 0
    je return 
    jmp el_poz
    
return:
    PRINT_STRING "Numere negative: "
    PRINT_UDEC 2, EDX
    NEWLINE
    PRINT_STRING "Numere pozitive: "
    PRINT_UDEC 2, EBX
    ret
    