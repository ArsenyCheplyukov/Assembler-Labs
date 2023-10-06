.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
    ; Let's consider a table of numbers with 4 rows and 4 columns.
    ; The elements of the table are arranged in memory row by row.
    tableD DWORD 5, 10, 15, 25
        RowSize = ($ - tableD); size of a row (in bytes)
        NumberOfRows = (RowSize / TYPE tableD)
           DWORD 9, 8, 4, 17
           DWORD 30, 21, 6, 52
           DWORD 11, 33, 22, 1
    ; index of maximum element
    minimum_row DWORD 0
    minimum_col DWORD 0
    minimum_element DWORD ?
    ; index of minimum element
    maximum_row DWORD 0
    maximum_col DWORD 0
    maximum_element DWORD ?

    row_count DWORD 0

    ; staff variables
    start_matrix DWORD OFFSET tableD

.code
main PROC

    mov eax, row_count ; initialize this n element counter

    ; get started elements for minima and maxima
    mov ebx, start_matrix ; address of the beginning of the table
    mov ecx, RowSize
    mul ecx ; result in EDX:EAX 
    add ebx, eax; address of the required row
    mov esi, minimum_col
    mov edx, [ebx + esi * TYPE tableD] ; index element
    
    mov minimum_element, edx
    mov maximum_element, edx

; Loop via some n (edx register) element
IterateViaRow:
    cmp row_count, NumberOfRows
    jge StartExchanging

    ; get element for main diagonal:
    mov eax, row_count ; initialize this n element counter
    mov ebx, start_matrix ; address of the beginning of the table
    mov ecx, RowSize
    mul ecx ; result in EDX:EAX 
    add ebx, eax; address of the required row
    mov esi, row_count
    ; sub esi, 1
    mov edx, [ebx + esi * TYPE tableD] ; index element 

    cmp minimum_element, edx
    jg ChangeMinimumMain
continue_one:

    cmp maximum_element, edx
    jl ChangeGreaterMain
continue_two:

    ; get element for fake diagonal:
    mov eax, row_count ; initialize this n element counter
    mov ebx, start_matrix ; address of the beginning of the table
    mov ecx, RowSize
    mul ecx ; result in EDX:EAX 
    add ebx, eax; address of the required row

    ; get fake diagonal element as moving matrix row size and sub the row count and 1
    mov esi, NumberOfRows
    sub esi, row_count
    sub esi, 1

    mov edx, [ebx + esi * TYPE tableD] ; index element 

    cmp minimum_element, edx
    jg ChangeMinimumFake
continue_three:

    cmp maximum_element, edx
    jl ChangeGreaterFake
continue_four:

    inc row_count
    jmp IterateViaRow

ChangeMinimumMain:
    mov eax, row_count
    mov minimum_row, eax
    mov minimum_col, eax
    mov minimum_element, edx
    jmp continue_one

ChangeGreaterMain:
    mov eax, row_count
    mov maximum_row, eax
    mov maximum_col, eax
    mov maximum_element, edx
    jmp continue_two

ChangeMinimumFake:
    mov eax, row_count
    mov minimum_row, eax
    mov minimum_col, NumberOfRows
    sub minimum_col, eax
    mov minimum_element, edx
    jmp continue_three

ChangeGreaterFake:
    mov eax, row_count
    mov maximum_row, eax
    mov maximum_col, NumberOfRows
    sub maximum_col, eax
    sub maximum_col, 1
    mov maximum_element, edx
    jmp continue_four

StartExchanging:
    mov eax, maximum_row ; initialize this n element counter
    ; get started elements for minima and maxima
    mov ebx, start_matrix ; address of the beginning of the table
    mov ecx, RowSize
    mul ecx ; result in EDX:EAX 
    add ebx, eax; address of the required row
    mov esi, maximum_col
    ; Calculate the address
    lea eax, [esi * TYPE tableD]  ; Calculate esi * TYPE tableD
    lea eax, [ebx + eax]          ; Calculate ebx + esi * TYPE tableD

    ; Load minimum_element into a register (assuming it's in edx)
    mov edx, minimum_element

    ; Store the value at the address
    mov [eax], edx


    mov eax, minimum_row ; initialize this n element counter
    ; get started elements for minima and maxima
    mov ebx, start_matrix ; address of the beginning of the table
    mov ecx, RowSize
    mul ecx ; result in EDX:EAX 
    add ebx, eax; address of the required row
    mov esi, minimum_col
    ; Calculate the address
    lea eax, [esi * TYPE tableD]  ; Calculate esi * TYPE tableD
    lea eax, [ebx + eax]          ; Calculate ebx + esi * TYPE tableD

    ; Load minimum_element into a register (assuming it's in edx)
    mov edx, maximum_element

    ; Store the value at the address
    mov [eax], edx
    

EndProgram:
    INVOKE ExitProcess, 0
main ENDP
END main