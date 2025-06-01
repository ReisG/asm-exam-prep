section .text
global copy
copy:
    endbr32
    push ebp
    mov ebp, esp

    sub esp, 56
    mov eax, dword[ebp+8]
    mov dword[ebp - 44], eax
    mov eax, dword[ebp + 16]
    
    mov dword [ebp-48], eax
    mov eax, dword[gs:20]
    mov dword [ebp-12], eax
    xor eax, eax
    mov dword [ebp-22], 8254
    mov dword [ebp-18], 0
    mov word [ebp-14], 0
    mov dword [ebp-28], 2024
    lea eax, [ebp-22] 
    add eax, 2
    sub esp, 8
    push dword [ebp-44]
    push eax
STOP:
    xor eax, eax
    ret