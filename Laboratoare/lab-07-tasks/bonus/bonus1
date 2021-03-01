%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "ab1cdefEghGij", 0

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
    
    cmp bl, 0x61
    jl char
    cmp bl, 0x7A
    jg char
    
    sub bl, 0x20
    mov byte [eax], bl

char:
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
