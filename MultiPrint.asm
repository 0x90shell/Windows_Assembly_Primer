.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib


.data

     HelloWorld db "Hello World!",13,10, 0
     HelloST db "We Love SecurityTube :) ", 13,10, 0


.code

start:

        mov eax, 20

     loop1:
     
        push eax
        invoke StdOut, addr HelloWorld
        pop eax

        dec eax
        jnz loop1


        mov eax, 10

     loop2:

        push eax
        invoke StdOut, addr HelloST
        pop eax

        dec eax
        jnz loop2

        

        ; Exit the program

        invoke ExitProcess, 0


end start
