%include "io.inc"

section .text
global CMAIN
CMAIN:
    ; cele doua numere se gasesc in eax si ebx
    mov eax, 1
    mov ebx, 4 

    cmp eax, ebx
    ja afisare
    push eax
    mov eax, ebx
    pop ebx
    
    

    ; TODO: aflati maximul folosind doar o instructiune de salt si push/pop

afisare:
    PRINT_DEC 4, eax ; afiseaza maximul
    NEWLINE

    ret
