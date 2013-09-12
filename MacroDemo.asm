.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib


; Define my MACROs

PrintOnScreen MACRO location

        invoke StdOut, location
ENDM

.data

     EnterNumber db "Please enter a number : ",0
     NumberEnteredInText db 50 DUP(0)

.code

start:

      ; Take the user supplied number as input

      invoke StdOut, addr EnterNumber
      invoke StdIn, addr NumberEnteredInText, 49


      ; Call the Macro

      PrintOnScreen addr NumberEnteredInText


      ; Do something

      mov eax, 0
      test eax, eax

      ; Call the Macro again

      PrintOnScreen addr NumberEnteredInText


      ; Exit the program

      invoke ExitProcess, 0



end start
