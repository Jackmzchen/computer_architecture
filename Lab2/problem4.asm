global _start
section .text

_start:
        mov rax, 0x5
        stc                         ; set carry flag so that it can be modified
        adc rax, 0x1                ; add with carry the values in rax and 0x1 with the carry flag



        mov rax, 60                 ; system call number for exit function
        mov rdi, 0                  ; Parameter pass to exit function
        syscall                     ; interrupt

section .data
