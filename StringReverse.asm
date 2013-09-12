.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib


.data

        SampleString db "This is a simple string", 0
        TempString db 2 DUP(0)

.code

start:

       ; Find the strlen

       invoke szLen, addr SampleString

       ; Start a loop using conditional jmp which prints characters in reverse

 PrintNextChar:

       ; copy the char to TempString

       xor ebx, ebx
       mov bl, SampleString[eax-1]
       mov TempString, bl

       ; print it on the screen
       push eax

       invoke StdOut, addr TempString

       pop eax

       ; continue the loop till end of string

       dec eax

       jne PrintNextChar



       ; Exit the program

       invoke ExitProcess, 0


end start
