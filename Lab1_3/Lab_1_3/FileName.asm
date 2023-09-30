.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
    n DWORD 1026 ; Example number

.code
main proc
    mov eax, n          ; Load the number n into the eax register
    btr eax, 1          ; Reset bit 1 (0-based numbering)
    btr eax, 10         ; Reset bit 10
    ; eax now contains the number n with bits 1 and 10 reset
    ; Further operations with the eax register can be performed as needed

    invoke ExitProcess, 0
main endp
end main
