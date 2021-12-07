extern printf
extern exit

global _start
funct1:
    push rbp
    mov rbp, rsp
    sub rsp, 0x10
    mov DWORD [rbp-0x4], edi
    mov DWORD [rbp-0x8], esi            ;changed rsi to esi due to different operand sizes
    mov DWORD [rbp-0xc], edx
    mov rdi, format2
    xor rax, rax
    call printf
    mov eax, DWORD [rbp-0x4]
    and eax, 0xa
    or edx, eax
    mov eax, DWORD [rbp-0xc]
    and eax, 0x28
    add eax, edx
    leave
    ret

funct2:
    push rbp
    mov rbp, rsp                              ;added this because the stack frame pointer was not existant
    sub rsp, 0x20
    mov QWORD [rbp-0x8], rdi
    mov QWORD [rbp-0x10], rsi
    mov QWORD [rbp-0x18], rdx
    mov QWORD [rbp-0x20], rcx                 
    mov rax, QWORD [rbp-0x10]
    mov edx, DWORD [rax]
    mov rax, QWORD [rbp-0x18]
    mov eax, DWORD [rax]
    lea ecx, [rdx+rax*1]
    mov rax, QWORD [rbp-0x18]
    mov edx, DWORD [rax]
    mov rax, QWORD [rbp-0x10]
    mov esi, DWORD [rax]
    mov rax, QWORD [rbp-0x8]
    mov rdi, rax
    xor rax, rax
    call printf
    nop
    leave
    ret

_start:
    push rbp
    mov rbp, rsp
    sub rsp, 0x20
    xor eax, eax
    mov rdi, format1                            ;used the wrong register needs to be rdi not rsi
    xor rax, rax
    call printf
    mov DWORD [rbp-0x18], 0x1248
    mov DWORD [rbp-0xc], 0x54
    mov DWORD [rbp-0x14], 0x1234
    mov DWORD [rbp-0x10], 0x2345
    mov edx, DWORD [rbp-0x10]                   ;0x2345 
    mov ecx, DWORD [rbp-0x14]                   ;0x1234
    mov eax, DWORD [rbp-0xc]                    ;0x54
    mov esi, ecx                                ;copies ecx to esi
    mov edi, eax                                ;copies eax to edi
    call funct1
    mov DWORD [rbp-0x18], eax
    lea rcx, [rbp-0x18]
    lea rdx, [rbp-0x10] 
    lea rax, [rbp-0x14]
    mov rsi, rax
    mov rdi, format3
    call funct2
    mov rdi, format4
    xor rax, rax
    call printf
    mov edi, 0x64
    call exit

section .data
    format1 db "Entered Main", 0xa, 0x0
    format2 db "Entered function1", 0xa, 0x0
    format3 db "First value: %#x + second val: %#x = %#x", 0xa, 0x0
    format4 db "Exiting program", 0xa, 0x0