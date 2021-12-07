global _start
    extern printf
    extern exit
    extern scanf

section .bss
    inputbuffer: resb 4  

section .data
    format: db '%d', 10, 0                      
    title: db 'Fib Numbers', 10,0 
    input: db 'Please enter a number: ', 0
    inputformat: db "%d"
      
section .text
_start:
        push rbp                                ; prolog 
        mov rbp, rsp                            ; prolog
        sub rsp, 8                              ; prolog

        mov rdi, input                          ; moves the function parameter in input to rdi
        push rdi
        xor rax, rax
        call printf                             ;print the input prompt

        lea rdi, [inputformat]
        lea rsi, [inputbuffer]
        push rdi
        xor rax, rax
        call scanf                              ; takes the input from the user 

        mov rdi, title                          ; function parameter that is used once\             
        push rdi                                
        xor rax, rax                            
        call printf                             
        mov rcx, [inputvar]                     ; counter                        
        mov rax, 0                              ; X variable  
        mov rbx, 1                              ; Y variable    

loop1:
        push rax                                
        push rcx                                
        mov rdi, format                         ; function parameter that is passed into the loop                     
        mov rsi, rax                            
        xor rax, rax                            
        call printf                             
        pop rcx                                 
        pop rax                                 
        mov rdx, rax                            
        mov rax, rbx                            ; the instruction that looks at if x = y                     
        add rbx, rdx                            
        dec rcx                                 ; controls the loop by decrementing the rcx by 1                            
        jne loop1                               ; keeps the loop going until condition is met
        pop rbx                                 ; epilog 
        add rsp, 8                              ; epilog 
        mov rsp, rbp                            ; epilog 
        pop rbp                                 ; epilog 
        call exit                               ; epilog 