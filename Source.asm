INCLUDE		Irvine32.inc
INCLUDELIB	Irvine32.lib

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
originString		BYTE	"james meegan was here on 4/29", 0
destinationString	BYTE	SIZEOF originString DUP(?)


.code
main PROC
	; YOUR CODE GOES HERE...
	; Write a procedure that copies the contents of 'originString' to
	;  'destinationString', but in reverse order.  You should use the
	;  provided initialization value for 'originString' to test, but your
	;  solution must work even if the contents or 'originString' are changed.


mov edx,offset originString				
call writestring						;Display originalString value 
call crlf

mov esi,(offset originString) + (SIZEOF originString)-2
mov edi, offset destinationString
mov ecx, SIZEOf originString

L1: mov al, [esi]
mov [edi], al
dec esi ; pointer to source string
inc edi ; pointer to target string
loop L1

mov esi, OFFSET destinationString ; offset of variable
mov ebx, 1 ; byte format
mov ecx, SIZEOF destinationString-1 ; counter
MOV EDX, offset destinationString
	CALL WriteString				;Display destinationString value which is the value of originString reversed

	INVOKE ExitProcess, 0
main ENDP

END main