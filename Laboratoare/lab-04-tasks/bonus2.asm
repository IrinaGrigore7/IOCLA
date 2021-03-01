%include "io.inc"

%define ARRAY_SIZE    10

section .data
    byte_array db 8, 19, 12, 3, 67, 10, 28, 9, 78, 102
    print_pare db "Nr. pare:", 0
    print_impare db "Nr. impare:", 0
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
    
nr_par:
    mov al, byte [byte_array + ecx - 1]
    mov bl, 2
    div bl
    cmp ah, 1
    je nr_impar
    inc edx
    jmp end
    
nr_impar:
    jmp end
    
end:
    loop nr_par
    
    PRINT_STRING print_pare
    PRINT_UDEC 4, EDX
    NEWLINE
    mov ecx, ARRAY_SIZE
    sub ecx, edx
    PRINT_STRING print_impare
    PRINT_UDEC 4, ECX
    
    ret