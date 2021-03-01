;GRIGORE IRINA-DOMNICA
;325 CB

%include "includes/io.inc"

extern getAST
extern freeAST

section .bss
    ; La aceasta adresa, scheletul stocheaza radacina arborelui
    root: resd 1

section .text
global main

string_to_number:   ;functia face conversia unui string in numar
    push ebp
    mov ebp, esp
    
    xor edx, edx
    xor eax, eax
    xor ebx, ebx
    
    mov ecx, [ebp + 8] ;este luat primul parametru de pe stiva
    mov ecx, [ecx] ;prin dereferentiere, ecx contine adresa stringului
    mov dl, [ecx] ;este mutat in dl primul caracter din string
    
    cmp dl, '-' ;pentru numere negative se trece la caracterul urmator, iar ebx devine 1
    jne convert ;daca nu are semn sar la functia de conversie
    inc ecx 
    mov dl, [ecx]
    inc ebx

convert: ;stringul este convertit in numar
    test dl, dl
    je done
    sub dl, 48
    imul eax, 10
    add eax, edx ;eax contine numarul ce va fi returnat de functie
    inc ecx
    mov dl, [ecx]
    jmp convert
 
done: ;se sare aici in momentul in care stringul a fost transformat in numar
    cmp ebx, 1 ;se verifica daca numarul are semn sau nu
    je end1
    jmp end2

end1: ;pentru numar negativ
    not eax
    add eax, 1
    leave 
    ret
    
end2: ;pentru numar pozitiv
    leave
    ret

evaluate_expr: ;functia parcurge recursiv arborele 
    push ebp
    mov ebp, esp
    
    xor ecx, ecx
    mov ebx, [ebp + 8] ;adresa de inceput a structurii
    mov ecx, [ebx]     ;adresa char*
    
    mov cx, [ecx]
    
    cmp cl, '+'
    je operation1
    cmp cl, '-'
    je minus
    cmp cl, '*'
    je operation3
    cmp cl, '/'
    je operation4
    jmp get_number
    
minus: 
    cmp ch, 0 ;se verifica daca semnul "-" reprezinta operatie sau este folosit pentru a marca un numar negativ
    je operation2
    jmp get_number
    
operation1:
    mov ebx, [ebx + 4] ;adresa copilului stang
    push ebx
    call evaluate_expr ;se apeleaza pe stanga 
    pop edx    
    push eax ;pun pe stiva numarul intors de functie
    
    mov ebx, [ebp + 8] ;adresa de inceput a structurii
    mov ebx, [ebx + 8] ;adresa copilului dreapt
    push ebx
    call evaluate_expr ;se apeleaza pe dreapta 
    pop edx
    
    pop edx ;se scoate numarul obtinut pe stanga 
    
    add eax, edx ;se aduna cele doua numere
    
    leave
    ret
    
operation2:
    mov ebx, [ebx + 4] ;adresa copilului stang
    push ebx
    call evaluate_expr ;se apeleaza pe stanga 
    pop edx    
    push eax ;pun pe stiva numarul intors de functie
    
    mov ebx, [ebp + 8] ;adresa de inceput a structurii
    mov ebx, [ebx + 8] ;adresa copilului dreapt
    push ebx
    call evaluate_expr ;se apeleaza functia pe dreapta
    pop edx
    
    pop edx ;se scoate numarul obtinut pe stanga
    xchg eax, edx ;interschimb registrele
    
    sub eax, edx ;din eax se scade edx
    
    leave
    ret

operation3:
    mov ebx, [ebx + 4] ;adresa copilului stang
    push ebx
    call evaluate_expr ;se apeleaza pe stanga
    pop edx    
    push eax ;pun pe stiva numarul intors de functie
    
    mov ebx, [ebp + 8] ;adresa de inceput a structurii
    mov ebx, [ebx + 8] ;adresa copilului drept
    push ebx
    call evaluate_expr ;se apeleaza functia pe dreapta
    pop edx
    
    pop edx ;pun in edx numarul obtinut pe stanga
    
    imul edx ;se face inmultire, iar rezultatul se salveaza in eax
    xor edx, edx
    
    leave
    ret

    
operation4:
    mov ebx, [ebx + 4] ;adresa copilului stang
    push ebx
    call evaluate_expr ;se apeleaza functia pe stanga
    pop edx    
    push eax ;pun pe stiva numarul intors de functie
    
    mov ebx, [ebp + 8] ;adresa de inceput astructurii
    mov ebx, [ebx + 8] ;adresa copilului drept
    push ebx
    call evaluate_expr ;se apeleaza functia pe dreapta
    pop edx
    
    pop edx ;pun in edx numarul intors de functie pe stanga
    cmp edx, 0
    jl negativ
    
    xchg eax, edx ;interschimb registrele, astfel incat in eax sa am deimpartitul
    mov ebx, edx ;pun in ebx impartitorul
    xor edx, edx ;0 pentru numar pozitiv
    idiv ebx ;fac impartirea, iar catul il returnez in eax
    
    leave
    ret
    
    
negativ:
    xchg eax, edx 
    mov ebx, edx
    mov edx, -1 ;-1 pentru numar negativ
    idiv ebx
    
    leave
    ret
    
    
get_number:  ;functia se apeleaza in  momentul in care, in arbore, se ajunge la frunze 
    push ebx
    call string_to_number
    pop edx
    
    leave
    ret


main:
    ; NU MODIFICATI
    push ebp
    mov ebp, esp
    
    ; Se citeste arborele si se scrie la adresa indicata mai sus
    call getAST
    mov [root], eax
    
    ; Implementati rezolvarea aici:
    push dword [root]
    call evaluate_expr
    pop edx
    PRINT_DEC 4, EAX
    
    
    ; NU MODIFICATI
    ; Se elibereaza memoria alocata pentru arbore
    push dword [root]
    call freeAST
    
    xor eax, eax
    leave
    ret