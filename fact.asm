SECTION .text
global factorial ; linux
global _factorial ; windows
factorial:
_factorial:
push ebp
mov ebp, esp
push ecx

mov ecx, [ebp+8]
mov eax, 1
mainloop:
cmp ecx, 0
jz done
mul ecx
dec ecx 
jmp mainloop
done:
pop ecx 
pop ebp 
ret