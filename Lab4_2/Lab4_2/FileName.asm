.model flat, c

.data 
    k DWORD 3
    sum DWORD ? 

.code 
lab_3_1 PROC
    push ebp
    mov ebp, esp

    mov edi, [ebp + 12] ; edi = address of the beginning of the array      
    mov ecx, [ebp + 8]  ; initialize the counter with the length of the array   
    mov ebx, 0          ; empty ebx index (here containing sum of elements untill end)

    LOOP_:                          
        mov edx, 0 ; reminder of division by 3
        mov eax, [edi] ; paste current array element into eax
        div k ; divide by three
        cmp edx, 0 ; compare delemiter with 0
        jne move_to_next ; jump if not equal to zero
 
        add ebx, [edi] ; if divided by 3 add to sum register
        jmp move_to_next ; then increment element

    move_to_next: 
        add edi, 4       ; move to the next element of the array
        ; loop LOOP_
        dec ecx
        cmp ecx, 0
        jne LOOP_
        ; the loop instruction by default uses ECX as a counter, which automatically
        ; decrements by one on each iteration and is compared with zero

    mov eax, ebx ; add element from register to answer

    pop ebp
    ret

    lab_3_1 ENDP 
END
