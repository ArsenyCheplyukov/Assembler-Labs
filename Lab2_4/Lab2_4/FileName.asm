.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    n DWORD 123456799 ; Example value for n
    k DWORD 1 ; Example value for k

    ; Variables to store the count of each digit (0-9)
    count0 DWORD ?
    count1 DWORD ?
    count2 DWORD ?
    count3 DWORD ?
    count4 DWORD ?
    count5 DWORD ?
    count6 DWORD ?
    count7 DWORD ?
    count8 DWORD ?
    count9 DWORD ?

    ans DWORD ? ; Variable to store the result (0 or 1)

.code
main PROC
    ; Initialize digit counts to 0
    mov count0, 0
    mov count1, 0
    mov count2, 0
    mov count3, 0
    mov count4, 0
    mov count5, 0
    mov count6, 0
    mov count7, 0
    mov count8, 0
    mov count9, 0

    ; Count occurrences of each digit in number n
    mov eax, n ; Load the number n into eax

count_digits_loop:
    ; Extract the least significant digit (remainder of division by 10)
    ; Assuming the number is in the eax register
    mov edx, 0         ; Clear edx to prepare for division
    mov ecx, 10        ; Set divisor to 10
    div ecx            ; Divide eax:edx by 10, quotient in eax, remainder in edx
    ; Now edx contains the least significant digit (remainder of division by 10)

    ; Increment the corresponding digit count based on the remainder (0-9)
    cmp edx, 0
    je digit0
    cmp edx, 1
    je digit1
    cmp edx, 2
    je digit2
    cmp edx, 3
    je digit3
    cmp edx, 4
    je digit4
    cmp edx, 5
    je digit5
    cmp edx, 6
    je digit6
    cmp edx, 7
    je digit7
    cmp edx, 8
    je digit8
    cmp edx, 9
    je digit9

digit0:
    add count0, 1
    jmp next_digit
digit1:
    add count1, 1
    jmp next_digit
digit2:
    add count2, 1
    jmp next_digit
digit3:
    add count3, 1
    jmp next_digit
digit4:
    add count4, 1
    jmp next_digit
digit5:
    add count5, 1
    jmp next_digit
digit6:
    add count6, 1
    jmp next_digit
digit7:
    add count7, 1
    jmp next_digit
digit8:
    add count8, 1
    jmp next_digit
digit9:
    add count9, 1

next_digit:
    test eax, eax ; Check if there are more digits to process
    jne count_digits_loop ; If yes, continue the loop

    ; Compare the counts of each digit with k
    mov eax, k ; Load k into eax before each comparison

    ; Check if any digit occurs more than k times
    cmp count0, eax
    jg set_result ; If count0 > k, set result to 1

    cmp count1, eax
    jg set_result ; If count1 > k, set result to 1

    cmp count2, eax
    jg set_result ; If count2 > k, set result to 1

    cmp count3, eax
    jg set_result ; If count3 > k, set result to 1

    cmp count4, eax
    jg set_result ; If count4 > k, set result to 1

    cmp count5, eax
    jg set_result ; If count5 > k, set result to 1

    cmp count6, eax
    jg set_result ; If count6 > k, set result to 1

    cmp count7, eax
    jg set_result ; If count7 > k, set result to 1

    cmp count8, eax
    jg set_result ; If count8 > k, set result to 1

    cmp count9, eax
    jg set_result ; If count9 > k, set result to 1

    ; If no digit occurs more than k times, set result to 0
    jmp exit_program

set_result:
    mov ans, 1 ; Set the result to 1 (at least one digit occurs more than k times)
    jmp exit_program

exit_program:
    ; Call the ExitProcess function with the result
    INVOKE ExitProcess, ans

main ENDP
END main
