.386 ; required parameter
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
a sdword 1
b sdword 5
y sdword ?
staff sdword ?
staff2 sdword ?
half_ans sdword ?

.code
main proc ; start function
	; y = (b^2– 2*b) / (3 * a + b)

	; square of b
	mov eax, b
	imul b
	mov staff, eax

	; b multiply by 2
	mov eax, 2
	imul b
	mov staff2, eax

	; sub b squared and 2*b
	mov eax, staff
	sub eax, staff2
	mov half_ans, eax

	; 3 multiply by a
	mov eax, 3
	imul a
	mov staff, eax

	; add 3a and b
	mov eax, staff
	add eax, b
	mov staff2, eax

	; divide half_ans by staff2
	mov eax, half_ans
	cdq
	idiv staff2
	mov y, eax

	invoke ExitProcess,0
main endp ; end of process
end main ; end main function