section .text

	global _start

_start:
	mov ecx, 26
	mov bl, 'A'
	mov BYTE[char+1],0xa	;adds newline char to placeholder

L1:	mov [char], bl
	push ebx		;save registers before calling procedure
	push ecx
	call printNl
	pop ecx
	pop ebx
	inc ebx			;move to next character
	loop L1

END:
	mov eax, 1
	int 0x80

printNl:			;print 1 character, followed by newline
	mov eax, 4
	mov ebx, 1
	mov ecx, char
	mov edx, 2		;msg = char + newline, len = 2
	int 0x80
	ret

section .data

section .bss

	char resb 2
