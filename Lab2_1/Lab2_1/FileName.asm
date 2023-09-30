.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
    x1 SDWORD 10
    x2 SDWORD 2
    x3 SDWORD 9
    x4 SDWORD 11

.code
main proc
    ; x1 < x2 > x3 > x4

    ; Swap x1 and x2 if needed
    ; if (x1 >= x2) ? swap(x1, x2) : left_as_it_is
    mov eax, x1
    cmp eax, x2
    jl no_swap_x1_x2
    xchg eax, x2 ; exchange two variables
    mov x1, eax
no_swap_x1_x2:
    
    ; Swap x2 and x3 if needed
    mov eax, x2
    cmp eax, x3
    jg no_swap_x2_x3
    xchg eax, x3
    mov x2, eax
no_swap_x2_x3:

   ; Swap x3 and x4 if needed
    mov eax, x3
    cmp eax, x4
    jg no_swap_x3_x4
    xchg eax, x4
    mov x3, eax
no_swap_x3_x4:

    ; Swap x2 and x3 if needed
    mov eax, x2
    cmp eax, x3
    jg no_swap_x2_x3_
    xchg eax, x3
    mov x2, eax
no_swap_x2_x3_:

    invoke ExitProcess, 0
main endp
end main
