.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib


.data
        PrintHello db "Hello World ", 0

.code

start:
        ; Initialize CX to 20
        xor ecx, ecx

        mov cx, 20

        StartLoop:

        push ecx

        invoke StdOut, addr PrintHello

        pop ecx

        loop StartLoop

        ; Exit the program

        invoke ExitProcess, 0


end start
