section .text
global tree_height_rec
tree_height_rec:
    test ecx, ecx
    jnz .skip
        xor eax, eax
        ret
    .skip:

    push ecx
    mov ecx, dword[ecx + 4]
    call tree_height_rec
    
    mov ecx, dword[esp]
    push eax

    mov ecx, dword[esp + 8]
    call tree_height_rec

    cmp eax, dword[esp]
    cmovb eax, dword[esp]

    inc eax

    ret 0x8
    