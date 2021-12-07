global _start
section .text

_start:
        mov al, 0x1            ; copy the value of 0xaa to the al register, replacing the value currently in there
        sub al, 0x3            ; sub the value of 0xaa to the al register

        jns exit_with_10        ; jump to exit_with_10 label

        mov rax, 60             ; System call number for exit function
        mov rdi, 0              ; Parameter pass to exit function
        syscall                 ; interrupt

        exit_with_10:           ; the label for exit_with_10
        
        mov rax, 60             ; system call number for exit
        mov rdi, 10             ; Parameter pass to exit function
        syscall                 ; interrupt

section .data