.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
a db 1
b db 0
x db 0
d db 0
y_t db ?
staff db ?
staff2 db ?
staff3 db ?
half_ans db ?

y_s db ?
s_staff db ?
s_staff2 db ?
s_staff3 db ?
s_half_ans db ?

ans db ?

.code
main proc
    ; !(!a + b + c)* !d)

    ; !a
    mov al, a
    xor al, 1
    mov staff, al
    mov staff2, al

    ;!a + b
    mov al, staff
    or al, b
    mov staff2, al

    ;!a + b + x
    mov al, staff2
    or al, x
    mov staff2, al

    ;!d
    mov al, d
    xor al, 1
    mov staff, al
    mov staff3, al

    ;(!a + b + c) * !d
    mov al, staff2
    and al, staff3
    mov half_ans, al

    ;!((!a + b + c) * d)
    mov al, half_ans
    xor al, 1
    mov y_t, al

    ; a*!(b+c)+d

    ; b+c
    mov al, b
    or al, x
    mov s_staff, al

    ; !(b+c)
    mov al, s_staff
    xor al, 1
    mov s_staff2, al

    ; a*!(b+c)
    mov al, a
    and al, s_staff2
    mov s_half_ans, al

    ; a*!(b+c)+d
    mov al, s_half_ans
    or al, d ; Corrected to "or al, s_staff3"
    mov y_s, al

    ; T == S
    mov al, y_t ; Load y_t into AL
    cmp al, y_s ; Compare AL (y_t) with y_s
    sete ans ; AL = x == y

    invoke ExitProcess, 0
main endp
end main
