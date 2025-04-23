.global check_circular

check_circular:
    movq $1, %r8
    movq $1, %rax
    movq $10,%r9
    movq $1,%rcx

expo:
    cmp %r8,%rsi
    je middle
    imulq %r9,%rcx
    incq %r8
    jmp expo

middle:
    movq $0, %r8
    jmp loop_middle

check_prime:
    cmp %r10, %rdx
    je base_case
    movq %rdx, %rax
    pushq %rdx
    cqto
    idivq %r10
    cmp $0, %rdx
    je no_prime
    popq %rdx
    incq %r10
    jmp check_prime

loop_middle:
    cmp %r8,%rsi
    je done
    movq %rdi, %rax
    cqto
    idivq %r9
    imulq %rcx, %rdx
    addq %rax,%rdx
    movq $2,%r10
    call check_prime
    cmp $0, %rax
    je no_circular
    movq %rdx,%rdi
    incq %r8
    jmp loop_middle

no_circular:
    movq $0,%rax
    ret

base_case:
    movq $1, %rax
    ret

no_prime:
    popq %rdx
    movq $0, %rax
    ret

done:
    movq $1,%rax
    ret
    