extern printf

section .bss
    a resd 12
section .data
    b dw 0
section .text
global main
main:
    mov dword[a + ((2 * 4) + 3) * 4], 0
    xor eax, eax
    ret