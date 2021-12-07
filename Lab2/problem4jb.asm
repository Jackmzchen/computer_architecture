global _start
section .text

_start:
        mov al, 0xaa            ; copy the value of 0xaa to the al register, replacing the value currently in there
        add al, 0xaa            ; add the value of 0xaa to the al register

        jb exit_with_10         ; jump to exit_with_10 label

        mov rax, 60             ; System call number for exit funcition
        mov rdi, 0              ; Parameter pass to exit function
        syscall                 ; interrupt

        exit_with_10:           ; the label for exit_with_10
        
        mov rax, 60             ; system call number for exit
        mov rdi, 10             ; Parameter pass to exit function
        syscall                 ; interrupt

section .data