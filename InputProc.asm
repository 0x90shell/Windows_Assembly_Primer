.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

; Procedure Defination

PutText PROTO :DWORD

.data

        EnterText db "Please enter some text : ", 0
        InputText db 100 DUP(0)

.code

start:

        invoke PutText, addr EnterText
        invoke ExitProcess, 0




        PutText PROC EntryText:DWORD

        invoke StdOut, EntryText
        invoke StdIn, addr InputText, 99
        invoke StdOut, addr InputText
        ret

        PutText endp

end start
