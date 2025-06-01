extern malloc

section .text

%define base ebp + 20

global callall
callall:
    push edi ; result array
    push esi ; function id
    push ebx ; pointer in args array

    push ebp
    mov ebp, esp

    mov ebx, dword[base]
    mov ecx, dword[ebx] ; number of functions to call
    lea ebx, [ebx + 4]

    ; creating array of result
    shl ecx, 2
    sub esp, 0xc
    mov dword[esp], ecx
    call malloc
    add esp, 0xc
    mov edi, eax

    xor esi, esi
    .L1:
        mov eax, dword[base]
        mov ecx, dword[eax]
        cmp esi, ecx
        je .L1E

        mov ecx, dword[ebx]; number of args
        neg ecx
        lea esp, [esp + ecx*4]; making arguments with size 4
        neg ecx
        and esp, -16
        add ebx, 4

        ; moving calling address to edx
        mov edx, dword[ebx]
        add ebx, 4

        ; pushing args on stack from end
        .L11:
            test ecx, ecx
            je .L11E
            
            mov eax, dword[ebx + ecx*4 - 4]
            mov dword[esp + ecx*4 - 4], eax

            dec ecx
            jmp .L11
        .L11E:
        call edx

        ; store result
        mov dword[edi + esi*4], eax

        ; clear stack
        mov esp, ebp

        ; moving ebx further
        mov eax, dword[ebx - 8]
        shr eax, 2
        add ebx, eax

        inc esi
        jmp .L1
    .L1E:

    ; saving result array pointer
    mov eax, edi

    ; clearing stack
    pop ebp
    pop ebx
    pop esi
    pop edi

    ret
    