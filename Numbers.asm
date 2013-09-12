.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data

        Number1 dword 0
        Number2 dword 0
        UserInput1 db 10 DUP(0)
        UserInput2 db 10 DUP(0)
        Message1 db "Please Enter the first number: ", 0
        Message2 db "Please Enter the second number : ", 0
        SumString db 10 DUP(0)
        SubString db 10 DUP(0)
        Message3 db "Sum of the 2 numbers is : ", 0
        Message4 db " and difference is : ", 0
        NumSum dword 0
        NumSub dword 0



.code

start:
        ; Take the user inputs first

        invoke StdOut, addr Message1
        invoke StdIn, addr UserInput1, 10
        invoke StdOut, addr UserInput1
        invoke StdOut, addr Message2
        invoke StdIn, addr UserInput2, 10
        invoke StdOut, addr UserInput2

        ; Remove the CRLF

        invoke StripLF, addr UserInput1
        invoke StripLF, addr UserInput2


        ; convert them to numbers from strings

        invoke atodw, addr UserInput1
        mov Number1, eax

        invoke atodw, addr UserInput2
        mov Number2, eax

        ; add the numbers

        mov eax, Number1
        add eax, Number2
        mov NumSum, eax

        ; subtract the numbers

        mov ebx, Number1
        sub ebx, Number2
        mov NumSub, ebx

        ; convert the sum and sub to strings and display it

        invoke dwtoa, NumSum, addr SumString
        invoke dwtoa, NumSub, addr SubString

        ; Print the sum and sub on the screen

        invoke StdOut, addr Message3
        invoke StdOut, addr SumString
        invoke StdOut, addr Message4
        invoke StdOut, addr SubString

        
        invoke ExitProcess, 0
        
end start
