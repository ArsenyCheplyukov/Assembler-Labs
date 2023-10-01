.386 
.model flat, stdcall 
.stack 4096 

ExitProcess proto, dwExitCode: dword 

.data 
myArray DWORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
three DWORD 3
sum DWORD ? 

.code 
main PROC

mov edi, OFFSET myArray    ; edi = address of the beginning of the array      
mov ecx, LENGTHOF myArray  ; initialize the counter with the length of the array   
mov ebx, 0 

L1:                          
    mov edx, 0 
    mov eax, [edi] 
    div three 
    cmp edx, 0 
    jne move_to_next                  ; jump if not equal to zero
 
    add ebx, [edi]               
    jmp move_to_next

move_to_next: 
    add edi, TYPE myArray       ; move to the next element of the array
    loop L1  
    ; the loop instruction by default uses ECX as a counter, which automatically
    ; decrements by one on each iteration and is compared with zero

    mov sum, ebx 

    invoke ExitProcess, 0 

main ENDP 
END main
