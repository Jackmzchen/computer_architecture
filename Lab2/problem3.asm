global _start
section .text

_start:
        mov eax, 0x48
        mov edx, [mem1]
        mov ecx, edx
        sub edx, ecx
        add [mem1], eax


        xor rax, rax
        add rax, 60
        mov rdx, 0x0
        syscall

section .data
        mem1: dw 0x12


