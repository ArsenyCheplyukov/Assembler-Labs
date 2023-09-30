.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
    k DWORD 1
    l DWORD 1
    m DWORD 3
    n DWORD 5
    zero_const DWORD 0
    delta_x SDWORD ?
    delta_y SDWORD ?
    state BYTE ?


.code
main proc
    ; check if bishop goes first

    ; find x delta:
    mov eax, k
    sub eax, m
    mov delta_x, eax

    ; find x delta absolute value
    mov eax, delta_x
    cmp eax, zero_const
    jg absolute_x
    mov eax, delta_x
    neg eax
    xchg eax, delta_x ; exchange two variables
absolute_x:

    ; find y delta:
    mov eax, l
    sub eax, n
    mov delta_y, eax

    ; find y delta absolute value
    mov eax, delta_y
    cmp eax, zero_const
    jg absolute_y
    mov eax, delta_y
    neg eax
    xchg eax, delta_y ; exchange two variables
absolute_y:


    ; check if bishop beats queen
    ; so need to check if coordianates delta equals by absolute value
    mov eax, delta_x
    cmp eax, delta_y
    jne bishop_not
    mov state, 1
    jmp end_code
bishop_not:

    ; check if queen beats bishop
    ; if delta x equal zero
    mov eax, delta_x
    cmp eax, zero_const
    jne another_queen_try
    mov state, 2
    jmp end_code
another_queen_try:

    ; if delta y equal zero
    mov eax, delta_y
    cmp eax, zero_const
    jne queen_is_not_beating
    mov state, 2
    jmp end_code
queen_is_not_beating:
    mov state, 0
end_code:
    

    invoke ExitProcess, 0
main endp
end main
