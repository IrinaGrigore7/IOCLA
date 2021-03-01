%include "io.inc"

%define ARRAY_SIZE    10

section.data
      dword_array dd 1392, 12544, 7992, 6992, 7202, 27187, 28789, 17897, 12988, 17992
      
section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE 
    xor eax, eax   
     xor edx, edx
     xor ebx, ebx
     
add_word_array_element:
    mov edx, dword [dword_array + 4*(ecx - 1)]
    mov eax, edx
    mul edx
    add ebx, eax
    loop add_word_array_element
    
    PRINT_UDEC 4, ebx
    NEWLINE
    
    leave
    ret