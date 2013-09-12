.386
.model flat, stdcall
option casemap :none

extrn MessageBoxA@16 : PROC
extrn ExitProcess@4 : PROC

.data
        HelloWorld db "Welcome to SecurityTube.net!", 0
        MesgTitle db "Our First MessageBox", 0
.code
start:
        mov eax, 1
        push eax
        mov eax, 0
        lea ebx, MesgTitle
        push ebx
        lea ebx, HelloWorld
        push ebx
        push eax
        call MessageBoxA@16
        push eax
        call ExitProcess@4

end start


