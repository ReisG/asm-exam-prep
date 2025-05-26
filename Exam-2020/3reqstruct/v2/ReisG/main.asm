section .text
global f
f:
    push ebp
    mov ebp, esp
    lea esp, [esp - 0x8]

    mov eax, dword[ebp + 8]
    test eax, eax
    jne .skip
        mov eax, 42
        leave
        ret
    .skip:

    mov eax, dword[eax + 4]
    mov dword[esp], eax
    call f

    mov edx, dword[ebp + 8]
    mov cl, byte[edx]
    sar eax, cl
    movsx ecx, word[edx + 8]
    add eax, ecx

    leave
    ret