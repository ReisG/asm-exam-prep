section .text
global main:
main:
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
    and eax, 1
    mov dword[esp], eax
    call f

    ; doing assignment without branching
    mov ecx, dword[ebp + 8]
    test eax, eax
    movsx edx, dword[ecx + 2]
    cmovnz eax, edx
    movsx edx, dword[ecx]
    cmovz eax, edx

    leave
    ret