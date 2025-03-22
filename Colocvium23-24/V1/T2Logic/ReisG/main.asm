extern io_print_dec

section .data
    a dd 1
    b dd 0
    c dd -1
    x dd 1

section .text
global main
main:
; =======================
    mov eax, dword[a]

    inc dword[a]; effect
    and eax, eax
    jz .skipb

    mov eax, dword[b]
    dec dword[b]
    test eax, eax
    jnz .cool

    .skipb:

    inc dword[c]
    mov eax, dword[c]
    test eax, eax
    jnz .cool

    mov dword[x], 0
    jmp .exit
    .cool:
    mov dword[x], 1

    .exit
; =======================
    
    mov eax, dword[x]
    call io_print_dec
    xor eax, eax
    ret