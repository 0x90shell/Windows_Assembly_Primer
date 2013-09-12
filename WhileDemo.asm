.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib


.data

      String1 db "This is string 1", 13, 10, 0
      String2 db "This is string 2", 13, 10, 0
      counter1 DWORD 0
      counter2 DWORD 0

.code

start:

        ; Print String1 for 10 times

        mov counter1, 10

        .while ( counter1 > 0 )

        dec counter1
        .continue .if counter1 < 5
        invoke StdOut, addr String1
       
        .endw


        ; Print String2 for 10 times as well

        mov counter2, 10

        .repeat

        invoke StdOut, addr String2
        dec counter2
       
        .until ( counter2 == 0)



        ; Exit the program

        invoke ExitProcess, 0


end start
