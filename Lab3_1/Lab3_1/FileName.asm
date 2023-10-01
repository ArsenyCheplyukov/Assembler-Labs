.386 
.model flat, stdcall 
.stack 4096 

ExitProcess proto, dwExitCode: dword 

.data 
myArray DWORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
k DWORD 3
sum DWORD ? 

.code 
main PROC
    mov edi, OFFSET myArray    ; edi = address of the beginning of the array      
    mov ecx, LENGTHOF myArray  ; initialize the counter with the length of the array   
    mov ebx, 0 ; empty ebx index (here containing sum of elements untill end)

    LOOP:                          
        mov edx, 0 ; reminder of division by 3
        mov eax, [edi] ; paste current array element into eax
        div k ; divide by three
        cmp edx, 0 ; compare delemiter with 0
        jne move_to_next ; jump if not equal to zero
 
        add ebx, [edi] ; if divided by 3 add to sum register
        jmp move_to_next ; then increment element

    move_to_next: 
        add edi, TYPE myArray       ; move to the next element of the array
        loop LOOP
        ; the loop instruction by default uses ECX as a counter, which automatically
        ; decrements by one on each iteration and is compared with zero

        mov sum, ebx ; add element from register to answer

        invoke ExitProcess, 0 

    main ENDP 
END main
