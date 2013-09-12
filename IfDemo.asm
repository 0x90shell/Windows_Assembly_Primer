.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib


.data
       InvalidRange db "This number is from an invalid range", 0
       Between1to25 db "This number is between 1 to 25", 0
       Between25to50 db "This number is between 25 to 50", 0
       Between50to75 db "This number is between 50 to 75", 0
       Between75to100 db "This number is between 75 to 100", 0
       UserInput db 10 DUP(0)
.code

start:
        ; take use input

        invoke StdIn, addr UserInput, 10

        ; remove the CRLF at the end

        invoke StripLF, addr UserInput


        ; convert string to number

        invoke atodw, addr UserInput


        ; use the number to play with the if/else/elseif 

        .if eax >= 1 && eax <= 25
                invoke StdOut, addr Between1to25
        .elseif eax > 25 && eax < 50
                invoke StdOut, addr Between25to50
        .elseif eax >= 50 && eax <= 75
                invoke StdOut, addr Between50to75
        .elseif eax > 75 && eax <= 100
                invoke StdOut, addr Between75to100
        .else
                invoke StdOut, addr InvalidRange
        .endif


        ; Exit the program

        invoke ExitProcess, 0


end start
