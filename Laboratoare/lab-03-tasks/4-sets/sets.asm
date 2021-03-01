%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139 
    mov ebx, 169
    mov ecx, eax
    PRINT_DEC 4, eax ; afiseaza prima multime
    NEWLINE
    PRINT_DEC 4, ebx ; afiseaza cea de-a doua multime
    NEWLINE

    or ecx, ebx 
    PRINT_STRING "reuniunea a doua multimi:  "
    PRINT_DEC 4, ecx
    NEWLINE   ; TODO1: reuniunea a doua multimi


    or ecx, 20 
    PRINT_STRING "adaugarea a doua elemente in multime: "
    PRINT_DEC 4, ecx
    NEWLINE ; TODO2: adaugarea unui element in multime

    mov ecx, eax
    and ecx, ebx
    PRINT_STRING "intersectia a doua multimi: "
    PRINT_DEC 4, ecx
    NEWLINE  ; TODO3: intersectia a doua multimi

    mov ecx, eax
    not ecx
    PRINT_STRING "complementul lui eax: "
    PRINT_DEC 4, ecx
    NEWLINE; TODO4: complementul unei multimi

    mov ecx, eax
    and ecx, 254
    PRINT_STRING "eliminare din eax: "
    PRINT_DEC 4, ecx
    NEWLINE ; TODO5: eliminarea unui element

    mov ecx, eax
    and ecx, ebx
    not ecx
    and eax, ecx
    PRINT_STRING "diferenta intre multimi: "
    PRINT_DEC 4, ecx
    NEWLINE
    ; TODO6: diferenta de multimi EAX-EBX


    xor eax, eax
    ret
