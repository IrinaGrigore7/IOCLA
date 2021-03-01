%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "irina", 0

section .text
global CMAIN

toupper:
    push ebp
    mov ebp, esp

    ; TODO
    mov eax, [ebp + 8]
    
test_one_byte:
    mov bl, byte [eax]
    test bl, bl
    je out
    
    cmp bl, 109
    jle add1
    
     cmp bl, 109
     jg sub1
   
    ;mov byte [eax], bl
 
add1:
    add bl, 13
     mov byte [eax], bl
    inc eax 
   jmp test_one_byte
    
sub1:
    sub bl, 13
      mov byte [eax], bl
    inc eax
    jmp test_one_byte
    
out:
    leave
    ret

CMAIN:
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
