.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
    n DWORD 10
    counter DWORD 0
    answer DWORD 0
    zero_const DWORD 0
    left_part_first DWORD ?
    left_part_second DWORD ?
    divide_first DWORD 3
    divide_second DWORD 10

.code
main proc
BeginWhile:
    mov eax, counter
    cmp eax, n
    jnl EndWhile
    inc counter
    inc eax
    
    ; if dividing by first
    mov eax, counter
    mov edx, 0
    div divide_first
    mov left_part_first, edx

    ; if dividing by second
    mov eax, counter
    mov edx, 0
    div divide_second
    mov left_part_second, edx

    ; if left parts of first equals zero
    
    ; if left_first equal zero
    mov ebx, left_part_first
    cmp ebx, zero_const
    jne another_condition

    mov ecx, answer
    add ecx, counter
    mov answer, ecx

    jmp end_code
another_condition:
    ; if left_second equal zero
    mov ebx, left_part_second
    cmp ebx, zero_const
    jne end_code

    mov ecx, answer
    add ecx, counter
    mov answer, ecx

    jmp end_code
end_code:
    jmp BeginWhile
EndWhile:

    invoke ExitProcess, 0
main endp
end main
