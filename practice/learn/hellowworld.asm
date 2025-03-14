section .data
    msg db 'Hello, World!', 0xA  ; 0xA is the newline character
    msg_len equ $ - msg          ; Calculate message length

section .text
    global _start

_start:
    ; write(1, msg, msg_len)
    mov rax, 1          ; syscall number for sys_write
    mov rdi, 1          ; file descriptor 1 (stdout)
    mov rsi, msg        ; message address
    mov rdx, msg_len    ; message length
    syscall             ; call kernel

    ; exit(0)
    mov rax, 60         ; syscall number for sys_exit
    mov rdi, 0          ; exit code 0
    syscall             ; call kernel