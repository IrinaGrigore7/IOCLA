%include "io.inc"
section .data

    dividend2 dd 67254
 
section .text
global CMAIN
CMAIN:
    ;write your code here
    mov dx:ax, word [dividend2]
    ;mov ax, word [dividend2]
    PRINT_DEC 2, EDX
    NEWLINE
    PRINT_DEC 2, EAX
    ret