extern printf

section .rodata
    str db "HELLO, fellow!\n" 0

section .text

f:
    endbr32

r:
    push str
    call printf
    ret

global main
main:
    call r
    xor eax, eax
    ret