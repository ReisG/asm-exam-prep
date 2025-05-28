section .text
global tree_height_rec
tree_height_rec:
    test ecx, ecx
    jnz .goon
        xor eax, eax
        ret 0x0
    .goon:

    ; I dont align anything (low mem)

    push ecx
    mov ecx, dword[ecx + 4]
    call tree_height_rec

    mov ecx, dword[esp]; resolving node
    push eax

    mov ecx, dword[ecx + 8]
    call tree_height_rec

    cmp eax, dword[esp]
    cmovb eax, dword[esp]

    inc eax
    add esp, 8

    ret 0x0
