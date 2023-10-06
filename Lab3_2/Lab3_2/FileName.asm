.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
    a dword 1, 4, 6, 10, 15, 45, 60, 90
    b dword 2, 4, 5, 6, 7, 9

    ; Resulting array c
    c_ dword LENGTHOF a dup(0) ; Allocate memory and initialize with zeros

    current_c_position dword 0

    end_a dword (LENGTHOF a - 1)*4
    end_b dword (LENGTHOF b - 1)*4

.code
main PROC
    ; Pointers to current elements of arrays
    mov esi, OFFSET a  ; Pointer to the current element of a
    mov edi, OFFSET b  ; Pointer to the current element of b
    mov ebx, OFFSET c_ ; Pointer to the current element of c_

    add end_a, esi
    add end_b, edi

    ; Start comparing elements of arrays a and b
compareLoop:
    ; Load current elements of a and b
    mov eax, [esi]
    mov edx, [edi]

    ; Check if we have reached the end of arrays a and b
    cmp esi, end_a  ; Check if esi (a) is at the end
    jg endLoop

    cmp edi, end_b  ; Check if edi (b) is at the end
    jg addRemainingAtoC  ; Add remaining a_i to c_

    ; Compare current elements
    cmp eax, edx
    je skipElement    ; a_i == b_j, skip a and b elements
    jl addAtoC        ; a_i > b_j, add a_i to c_
    ja skipBElement   ; a_i < b_j, skip b element
    
skipElement:
    add esi, 4        ; Move to the next element in a
    add edi, 4        ; Move to the next element in b
    jmp compareLoop   ; Move to the next element and continue comparison

addAtoC:
    ; Add a_i to c_
    mov [ebx], eax    ; Save a_i to c_
    add ebx, 4        ; Move to the next element in c_
    inc current_c_position
    add esi, 4        ; Move to the next element in a
    jmp compareLoop   ; Move to the next element and continue comparison
    
skipBElement:
    add edi, 4        ; Move to the next element in b
    jmp compareLoop   ; Move to the next element and continue comparison

addRemainingAtoC:
    ; Add remaining a_i to c_
    jmp checkEndOfA   ; Jump to check if we've reached the end of array a

addAtoCLoop:
    ; Add a_i to c_
    mov eax, [esi]    ; Load current element of a
    mov [ebx], eax    ; Save a_i to c_
    add ebx, 4        ; Move to the next element in c_
    inc current_c_position
    add esi, 4        ; Move to the next element in a

checkEndOfA:
    ; Check if we have reached the end of array a
    cmp esi, end_a  ; Check if esi (a) is at the end
    jle addAtoCLoop  ; If not at the end, continue adding a_i to c_

endLoop:
    invoke ExitProcess,0

main ENDP
END main
