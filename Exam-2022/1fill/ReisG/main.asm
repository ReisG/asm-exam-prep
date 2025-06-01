section .data
    j db 0x18, 0x77,    0x0, 0xe,    0xf, 0xf,    0x5d, 0xe,    0xd1, 0xf5
    f db 0xe, 0xe8,    0x9c, 0xac,    0x1f, 0xe,    0x26, 0x0,    0x80, 0x8
    o db 0x0, 0x6e,    0x8e, 0xea


section .text
global main
main:
    mov eax, 2
.l1:
    movsx ebx, byte[j + eax]
    movsx ecx, byte[j + eax + 1]
    cmp ebx, ecx
    jae .l2
    add eax, 2
    jmp .l1

.l2:
    mov cx, word[j + ecx]
    mov edx, dword[f + 7]
    rol edx, cl
    cmp edx, 0x20000002
    je .success
    mov eax, 2
    jmp .l1

.success:
    xor eax, eax
    ret
