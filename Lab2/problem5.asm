global _start
section .text

_start:
        mov eax, 0H
        cpuid

        xor eax, eax

        mov eax, 2
        cpuid

        xor eax,eax


