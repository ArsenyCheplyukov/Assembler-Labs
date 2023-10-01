.386
.model flat, stdcall
.stack 4096

.data
	n DWORD 3 ; so find 30*n*(n+1)/2
	sum DWORD 0

ExitProcess proto, dwExitCode:dword

.code
	main proc

	mov ebx, 1

	beginWhile:
		cmp ebx, n
		ja endWhile
		mov eax, 30
		mul ebx
		add sum, eax
		add ebx, 1
		jmp beginWhile
	endWhile:

	invoke ExitProcess,0

	main endp
end main