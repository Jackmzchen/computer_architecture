extern printf
extern exit
global _start

section .text
additup:
    ;and esp, 0xFFFFFFF0                        ;this was commnented out because it was causing a seg fault
    push rbp
    mov rbp, rsp
    sub rsp, 0x20
    mov DWORD [rbp-0x14], edi ; 170
    mov DWORD [rbp-0x18],esi ; 54
    mov DWORD [rbp-0x1c], edx ; 60
    mov eax, DWORD [rbp-0x14]
    and eax, 0xa
    mov edx, eax
    mov eax, DWORD [rbp-0x18]
    and eax , 0x14
    or edx , eax
    mov eax, DWORD [rbp-0x1c]
    and eax , 0x28
    add eax, edx
    leave
    ret                                         ; this was added so that the program knows where to return back to.

_start:
    push rbp
    mov rbp,rsp
    sub rsp,0x10
    mov DWORD [rbp-0x10],0x3c; 60
    mov DWORD [rbp-0xc],0xaa ; 170
    mov DWORD [rbp-0x8],0x36 ; 54
    mov DWORD [rbp-0x4],0xc8 ; 200
    mov edx, DWORD [rbp-0x10] ; 60
    mov ecx, DWORD [rbp-0x8]
    mov eax, DWORD [rbp-0xc]
    mov esi, ecx ; 54
    mov edi,eax ; 170
    call additup
    mov DWORD [rbp-0x4], eax
    mov edx, DWORD [rbp-0x4]
    mov esi, eax
    mov rdi, format1
    mov eax, 0x0
    call printf
    mov edi,0xa
    call exit
section .data
    format1 db "My answer is >> Dec: %d Hex: %#x", 0xa, 0x0