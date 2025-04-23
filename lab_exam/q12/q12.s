.text
.global is_circular_prime

is_circular_prime:
    # rdi = n, rsi = d
    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    movq %rdi, %r12 # n
    movq %rsi, %r13 # d
    decq %r13 # d-1
    movq $0, %r14 # i
    movq $10, %r15 # base

.L1:
    cmpq %rsi, %r14
    jge .L1_end

    movq %r12, %rdi
    call is_prime
    cmpq $0, %rax
    je .L1_false
    
    movq %r12, %rax #load r12 into rax
    xorq %rdx, %rdx
    divq %r15 # rdx=n%10, rax=n/10
    movq %rax, %r12 # n=n/10
    movq %r13, %rdi
    pushq %rdx
    call raise10 # rdi=10^(d-1)
    popq %rdx
    movq %rax, %r8 # r8=10^(d-1)
    movq %rdx, %rax
    mulq %r8 # rax=(n%10)*10^(d-1)
    addq %r12, %rax # rax=n/10+10^(d-1)*(n%10)
    movq %rax, %r12 # n=n/10+10^(d-1)*(n%10)
    incq %r14
    jmp .L1
    
.L1_end:
    movq $1, %rax
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    ret
    
.L1_false:
    movq $0, %rax
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    ret

is_prime:
    # rdi = n
    pushq %rdi
    pushq %rdx
    pushq %r12
    cmpq $1, %rdi
    jle .ret_false
    cmpq $3, %rdi
    jle .ret_true
    movq $2, %r12 # i
.P1:
    movq %r12, %rax
    mulq %r12
    cmpq %rdi, %rax
    jg .ret_true
    movq %rdi, %rax
    xorq %rdx, %rdx
    divq %r12
    cmpq $0, %rdx
    je .ret_false
    incq %r12
    jmp .P1
.ret_false:
    movq $0, %rax
    popq %r12
    popq %rdx
    popq %rdi
    ret
.ret_true:
    movq $1, %rax
    popq %r12
    popq %rdx
    popq %rdi
    ret

raise10:
    # rdi = power
    pushq %rdi
    pushq %r12
    pushq %r13
    movq $1, %r12
    movq $10, %r13
.P2:
    cmpq $0, %rdi
    je .ret
    movq %r12, %rax
    mulq %r13
    movq %rax, %r12
    decq %rdi
    jmp .P2
.ret:
    movq %r12, %rax
    popq %r13
    popq %r12
    popq %rdi
    ret
