%include "include/io.inc"

extern atoi
extern printf
extern exit

; Functions to read/free/print the image.
; The image is passed in argv[1].
extern read_image
extern free_image
; void print_image(int* image, int width, int height);
extern print_image

; Get image's width and height.
; Store them in img_[width, height] variables.
extern get_image_width
extern get_image_height

section .data
	use_str db "Use with ./tema2 <task_num> [opt_arg1] [opt_arg2]", 10, 0

section .bss
    task:       resd 1
    img:        resd 1
    img_width:  resd 1
    img_height: resd 1

section .text
global main

morse_encrypt:
    push ebp
    mov ebp, esp
    
    mov ebx, [ebp + 8] ;iau de pe stiva imaginea 
    mov eax, [ebp + 12] ;iau de pe stiva stringul care trebuie criptat
    mov ecx, [ebp + 16] ;iau de pe stiva byte_id de la care se incepe inlocuirea pixelilor
                        ;cu ecx parcurg fiecare pixel 
  
    mov ebx, [ebx]
 
    xor edx, edx ;cu edx parcurg fiecare litera din string
    
parcuregere_string: ;verific fiecare litera, fac jump la label-ul corespunzator,
                    ;adaug litera codificata in imagine, apoi trec la caracterul urmator
                    ;repet acest proces pana ajung la terminatorul de sir
    
    cmp BYTE[eax + edx], 'A'
    je char_A
    cmp BYTE[eax + edx], 'B'
    je char_B
    cmp BYTE[eax + edx], 'C'
    je char_C
    cmp BYTE[eax + edx], 'D'
    je char_D
    cmp BYTE[eax + edx], 'E'
    je char_E
    cmp BYTE[eax + edx], 'F'
    je char_F
    cmp BYTE[eax + edx], 'G'
    je char_G
    cmp BYTE[eax + edx], 'H'
    je char_H
    cmp BYTE[eax + edx], 'I'
    je char_I
    cmp BYTE[eax + edx], 'J'
    je char_J
    cmp BYTE[eax + edx], 'K'
    je char_K
    cmp BYTE[eax + edx], 'L'
    je char_L
    cmp BYTE[eax + edx], 'M'
    je char_M
    cmp BYTE[eax + edx], 'N'
    je char_N
    cmp BYTE[eax + edx], 'O'
    je char_O
    cmp BYTE[eax + edx], 'P'
    je char_P
    cmp BYTE[eax + edx], 'Q'
    je char_Q
    cmp BYTE[eax + edx], 'R'
    je char_R
    cmp BYTE[eax + edx], 'S'
    je char_S
    cmp BYTE[eax + edx], 'T'
    je char_T
    cmp BYTE[eax + edx], 'U'
    je char_U
    cmp BYTE[eax + edx], 'V'
    je char_V
    cmp BYTE[eax + edx], 'W'
    je char_W
    cmp BYTE[eax + edx], 'X'
    je char_X
    cmp BYTE[eax + edx], 'Y'
    je char_Y
    cmp BYTE[eax + edx], 'Z'
    je char_Z
    cmp BYTE[eax + edx], ','
    je virgula
    cmp BYTE[eax + edx], 0
    je out
    
    
char_A:  ;adaug in imagine litera codificata
   push '.'
   pop dword[ebx + 4*ecx]
   inc ecx
   push '-'
   pop dword[ebx + 4*ecx]
   inc ecx
   push ' '
   pop dword[ebx + 4*ecx]
   inc ecx
   
   inc edx ;trec la litera urmatoare
   jmp parcuregere_string 

char_B:
   push '-'
   pop dword[ebx + 4*ecx]
   inc ecx
   push '.'
   pop dword[ebx + 4*ecx]
   inc ecx
   push '.'
   pop dword[ebx + 4*ecx]
   inc ecx
   push '.'
   pop dword[ebx + 4*ecx]
   inc ecx
   push ' '
   pop dword[ebx + 4*ecx]
   inc ecx
   
   inc edx
   jmp parcuregere_string
    
char_C:
   push '-'
   pop dword[ebx + 4*ecx]
   inc ecx
   push '.'
   pop dword[ebx + 4*ecx]
   inc ecx
   push '-'
   pop dword[ebx + 4*ecx]
   inc ecx
   push '.'
   pop dword[ebx + 4*ecx]
   inc ecx
   push ' '
   pop dword[ebx + 4*ecx]
   inc ecx
   
   inc edx
   jmp parcuregere_string
    
char_D:
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string

char_E:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_F:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx

    inc edx
    jmp parcuregere_string
    
char_G:
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string

char_H:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx  
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx 
    
    inc edx
    jmp parcuregere_string
    
char_I:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_J:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_K:
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_L:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_M:
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_N:
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_O:

    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_P:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_Q:
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_R:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_S:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx   
    
    inc edx
    jmp parcuregere_string
    
char_T:
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_U:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx   
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string

char_V:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
 
char_W:
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx  
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_X:
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx 
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx 
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_Y:
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx 
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string
    
char_Z:
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx 
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx 
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string

virgula:
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx 
    push '.'
    pop dword[ebx + 4*ecx]
    inc ecx 
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push '-'
    pop dword[ebx + 4*ecx]
    inc ecx
    push ' '
    pop dword[ebx + 4*ecx]
    inc ecx
    
    inc edx
    jmp parcuregere_string

out:
    dec ecx
    push 0
    pop dword[ebx + 4*ecx]
    leave
    ret


main:
    ; Prologue
    ; Do not modify!
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    cmp eax, 1
    jne not_zero_param

    push use_str
    call printf
    add esp, 4

    push -1
    call exit

not_zero_param:
    ; We read the image. You can thank us later! :)
    ; You have it stored at img variable's address.
    mov eax, [ebp + 12]
    push DWORD[eax + 4]
    call read_image
    add esp, 4
    mov [img], eax

    ; We saved the image's dimensions in the variables below.
    call get_image_width
    mov [img_width], eax

    call get_image_height
    mov [img_height], eax

	


    ; Let's get the task number. It will be stored at task variable's address.
    mov eax, [ebp + 12]
    push DWORD[eax + 8]
    call atoi
    add esp, 4
    mov [task], eax

    ; There you go! Have fun! :D
    mov eax, [task]
    cmp eax, 1
    je solve_task1
    cmp eax, 2
    je solve_task2
    cmp eax, 3
    je solve_task3
    cmp eax, 4
    je solve_task4
    cmp eax, 5
    je solve_task5
    cmp eax, 6
    je solve_task6
    jmp done

solve_task1:
    ; TODO Task1
    jmp done
solve_task2:
    ; TODO Task2
    jmp done
solve_task3:
    ; TODO Task3
    
    ;obtin indicele de la care trebuie adaugat sirul in imagine 
    ;si il trimit ca parametrul functiei de criptare
    mov eax, [ebp + 12]
    push DWORD[eax + 16]
    call atoi
    add esp, 4
    push eax
    ;byte-id
    
    ;obtin sirul care trebuie adaugat in sir si il trimit ca parametru functiei
    mov eax, [ebp + 12]
    mov eax, [eax + 12]
    push eax ;STRINGUL
  
    ;trimit, de asemenea, si imaginea ca parametru, apoi apelez functia de criptare
    ;care imi codifica fiecare litera si o adauga in imagine
    push img
    call morse_encrypt
    add esp, 12
    
    
    mov eax, [img_height]
    push eax
    mov eax, [img_width]
    push eax
    mov eax, [img]
    push eax
    call print_image ;afisez imaginea dupa criptarea mesajului
    add esp, 12

    jmp done
solve_task4:
    ; TODO Task4
    jmp done
solve_task5:
    ; TODO Task5
    jmp done
solve_task6:
    ; TODO Task6
    jmp done

    ; Free the memory allocated for the image.
done:
    push DWORD[img]
    call free_image
    add esp, 4

    ; Epilogue
    ; Do not modify!
    xor eax, eax
    leave
    ret
    
