section .data
	wow dw 0x1234, 0xbeaf
	tasty dd 0x4010d0

section .bss
	beaf resd 1

section .text
global main
main:
	movsx eax, byte[wow + 3]
	sub ax, 0x4321
	xchg ah, byte[tasty + 1]
	xor eax, eax
	ret
