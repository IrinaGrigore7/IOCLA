%include "io.inc"

section .data
    string db "Lorem ipsum dolor sit amet.", 0
    ;string db "abcd i", 0
    print_strlen db "strlen: ", 10, 0
    print_occ db "occurences of `i`:", 10, 0

    occurences dd 0
    length dd 0    
    char db 'i'

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    
    mov al, 0
    mov edi, string
    repne scasb       
    sub edi, string
    dec edi
    mov [length], edi
    

    ; TODO1: compute the length of a string

    ; TODO1: save the result in at address length

    ; print the result of strlen
    PRINT_STRING print_strlen
    
    PRINT_UDEC 4, [length]
    NEWLINE

    xor eax, eax
    mov ecx, edi
    mov al, [char]
    lea edx, [string + edi]
    mov edi, string
    xor ebx, ebx
    
find_i:
    repnz scasb
    
    cmp al, byte [edi -1]
    jnz label
    inc ebx
    
label:
    cmp edi, edx
    je print
    
    jmp find_i
 
print:
    mov [occurences], ebx
    PRINT_STRING print_occ
    PRINT_UDEC 4, [occurences]
    NEWLINE
    
    
    
    ; TODO2: compute the number of occurences

    ; TODO2: save the result in at address occurences

    ; print the number of occurences of the char

    xor eax, eax
    leave
    ret
