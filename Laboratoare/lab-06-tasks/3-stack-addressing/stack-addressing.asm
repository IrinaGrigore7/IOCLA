%include "io.inc"

%define NUM 5

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands
    mov ecx, NUM
push_nums:

    sub esp, 4
    mov [esp], ecx

    loop push_nums
    
    sub esp, 4
    mov eax, 0
    mov [esp], eax
   
    sub esp, 4
    mov eax, "mere"
    mov [esp], eax
    
    sub esp, 4
    mov eax, "are "
    mov [esp], eax
    
    sub esp, 4
    mov eax, "Ana "
    mov [esp], eax

    PRINT_STRING [esp]
    NEWLINE

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
   xor eax, eax
    mov eax, esp; salvez pozitia base pointer-ului

label:
    cmp eax, ebp
    je label2
    PRINT_STRING "0x"
    PRINT_HEX 4, eax
    PRINT_STRING ": 0x"
    PRINT_DEC 1, [eax]
    NEWLINE
    
   inc eax
   jmp label
   
label2:
    xor eax, eax
    mov eax, esp
    mov ecx, 12

label3:
    PRINT_CHAR [eax]
    inc eax
    loop label3
    
  


    ; restore the previous value of the EBP (Base Pointer)
 ; restabilesc pozitia intitiala a stivei ( ca sa nu dea crash)
print:
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret