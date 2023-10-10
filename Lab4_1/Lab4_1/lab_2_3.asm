.model flat, c

.data
	sum DWORD 0

.code
lab_2_3 proc
	; start function by entering the stack
	push ebp
	mov ebp, esp

	mov ebx, 1

	beginWhile:
		cmp ebx, [ebp + 8]
		ja endWhile
		mov eax, 30
		mul ebx
		add sum, eax
		add ebx, 1
		jmp beginWhile
	endWhile:
	; replace answer in return point
	mov eax, sum

	pop ebp
	ret

lab_2_3 endp
end