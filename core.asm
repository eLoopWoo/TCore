global  _main
extern  _printf
extern  _scanf
section .text

;size_t strlen ( const char * str );
strlen:
	push ebp
	mov ebp, esp
	mov edi, [ebp + 8]
	xor eax, eax
	or ecx, 0FFFFFFFFh
	repne scasb
	add ecx, 2
	neg ecx
	xchg ecx, eax
	pop ebp
	retn

;char *	strchr (char * str, int character)
strchr:
	push ebp
	mov ebp, esp
	mov edi, [ebp + 8]
	mov eax, [ebp + 12]
	or ecx, 0FFFFFFFFh
	repne scasb
	add ecx, 2
	neg ecx
	xchg ecx, eax
	pop ebp
	retn 
	
;void * memcpy ( void * destination, const void * source, size_t num );	
memcpy:
	push ebp
	mov ebp, esp
	mov edi, [ebp + 8]
	mov edx, edi
	mov esi, [ebp + 12]
	mov ecx, [ebp + 16]
	rep movsb
	xchg eax, edx
	pop ebp
	retn 
	
;void *memset(void *str, int c, size_t n)
memset:
	push ebp
	mov ebp, esp
	mov edi, [ebp + 8]
	mov edx, edi
	mov eax, [ebp + 12]
	mov ecx, [ebp + 16]
	rep stosb
	xchg eax, edx
	pop ebp
	retn 

;int strcmp(const char *str1, const char *str2)
strcmp:
	push ebp
	mov ebp, esp
	mov edi, [ebp + 8]
	mov esi, [ebp + 12]
	push edi
	call strlen
	add esp, 4h
	xchg eax,ecx
	repe cmpsb
	test ecx, ecx
	je strcmp_success
	xor eax,eax
	jmp strcmp_exit
	strcmp_success:
	mov eax, 1
	strcmp_exit:
	pop ebp
	retn 

;char *strset(char *string, int c);
strset:
	push ebp
	mov ebp, esp
	mov edi, [ebp + 8]
	mov edx, [ebp + 12]
	push edi
	call strlen
	add esp, 4h
	xchg eax,ecx
	xchg eax,edx
	mov edx, edi
	rep stosb
	xchg eax, edx
	pop ebp
	retn 
	
_main:
	push msg
	call _printf
	add esp, 4h

	push sample_string
	call strlen
	add esp, 4h
	push strlen_msg
	call _printf
	add esp, 4h
	push eax
	push length_msg
	call _printf
	add esp, 8h

	push 'm'
	push sample_string
	call strchr
	add esp, 8h
	push eax
	push strchr_msg
	call _printf
	add esp, 4h
	pop eax
	push eax
	push length_msg
	call _printf
	add esp, 8h
	ret

msg db "~~ Tomer Eyzenberg ~~",10,0

strlen_msg db "strlen_msg: ", 10, 0
strchr_msg db "strchr_msg: ", 10, 0
memcpy_msg db "memcpy_msg: ", 10, 0
memset_msg db "memset_msg: ", 10, 0
strcmp_msg db "strcmp_msg: ", 10, 0
strset_msg db "strset_msg: ", 10, 0

length_msg db "Output = %08X", 10, 0
sample_string db "Dummy String!",10, 0
