global _start
    extern printf
    extern exit
section .data
    format: db '%d', 10, 0                      ; sets the format the result should be printed in, 10 means the newline in ascii and 0 means
    title: db 'Fib Numbers', 10,0               ; 10 represents the new line call in ascii 0 is NULL

section .text
_start:
        push rbp                                ; [prolog] push the address of rbp onto the stack
        mov rbp, rsp                            ; [prolog] copy the value in rsp to rbp
        sub rsp, 8                              ; [prolog] subtract 8 from the value in rsp
        mov rdi, title                          ; mov the contents of title to rdi
        push rdi                                ; push rdi onto the stack
        xor rax, rax                            ; clear the rax register
        call printf                             ; calls the external printf function
        mov rcx, 10                             ; copy the value of 10 into rcx
        mov rax, 0                              ; copy the value of 0 into rax
        mov rbx, 1                              ; copy the value of 1 into rbx

loop1:
        push rax                                ; push the adderess of rax onto the stack
        push rcx                                ; push the address of rcx ont othe stack
        mov rdi, format                         ; copy the content of format into rdi
        mov rsi, rax                            ; copy rax into rsi
        xor rax, rax                            ; clear the contents of rax and reset to 0
        call printf                             ; call the external printf function
        pop rcx                                 ; pops rcx off the stack
        pop rax                                 ; pops rax off the stack
        mov rdx, rax                            ; copy the value in rax to rdx
        mov rax, rbx                            ; copy the value in rbx into rax
        add rbx, rdx                            ; add the value in rdx to rbx
        dec rcx                                 ; decrements the value in rcx by 1
        jne loop1                               ; jumps back to the start of the loop if the ZF flag iis != 0
        pop rbx                                 ; [epilog] pop rbx off the stack
        add rsp, 8                              ; [epilog] add 8 back to rsp
        mov rsp, rbp                            ; [epilog] copy rbp into rsp
        pop rbp                                 ; [epilog] pop rbp off the stack
        call exit                               ; [epilog] call the exit function