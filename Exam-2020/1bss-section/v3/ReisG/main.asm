section .data
    go db 0xab, 0xcd, 0xef
    funny dd 0x0400024c

section .bss
    alphabet resd 1

section .text
global main
main:
    xor eax, eax
    mov ax, word[go + 1]
    add ax, 0xaaaa
    mov al, byte[funny + 2]
    xor eax, eax
    ret