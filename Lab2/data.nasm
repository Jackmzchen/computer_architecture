global _start 
section .text

_start:
        mov al, [mem1]                  ; copy the value in mem1 to the al register, overwriting the value that is in it
        mov ebx, [mem2]                 ; copy the value in mem2 to the ebx register, overwriting the value that is in it
        mov cx, 0x9a83                  ; copy the value 0x9a83 into the cx register, overwriting the value that is in it
        mov word [mem3], cx             ; replace the value of mem3 with the value in cx and change the type to a word
        mov rdx, [mem4]                 ; copy the value of mem4 into the rdx register, overwriting the value that is in it

        mov dl, [mem2]
        ;mov dword[mem2],dx

        mov rax, 60     ; System call number for exit function
        mov rdi, 0      ; Parameter pass to exit function
        syscall         ; interrupt

section .data
    mem1: db 0x12                       ; defines byte for the varaible mem1
    mem2: dd 0x12345678                 ; defines a double word for variable mem2
    mem3: dw 0x1234                     ; defines word for the variable mem3
    mem4: dq 0x123456789                ; defines a quadword for the variable mem4
    