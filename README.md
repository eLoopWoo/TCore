# TCore

```
nasm -fwin32 <name>.asm

ld <name>.obj -lmsvcrt -entry=_main -subsystem=console -o <name>.exe
```


```
nasm -f win32 -o factasm.o fact.asm

gcc -o fact.exe fact.c factasm.o

g++ -o fact.exe fact.cpp factasm.o
```
