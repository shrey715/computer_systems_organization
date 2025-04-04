.text
    .global combination

combination:
    # int combination(int n, int r);
    # n in rdi, r in rsi
    # return n! / (r! * (n - r)!)

    pushq %rbp # save old bp
    movq %rsp, %rbp # set new bp
    pushq %rbx # save callee-saved registers
    pushq %r12
    pushq %r13

    movq %rdi, %r12 # r12 = n
    movq %rsi, %r13 # r13 = r

    cmpq %r12, %r13
    jle .check_base_case # jump if r <= n
    movq $0, %rax # return 0
    jmp .function_epilogue # cleanup and return

.check_base_case:
    cmpq $0, %r13
    je .return_one # jump if r == 0
    cmpq %r12, %r13
    je .return_one # jump if r == n

    # recursive call: combination(n-1, r-1)
    leaq -1(%r12), %rdi # rdi = (r12 - 1) = n-1
    leaq -1(%r13), %rsi # rsi = (r13 - 1) = r-1
    call combination 
    movq %rax, %rbx # save result in rbx

    # recursive call: combination(n-1, r)
    leaq -1(%r12), %rdi # n-1
    movq %r13, %rsi # r
    call combination        

    # combination(n-1, r-1) + combination(n-1, r)
    addq %rbx, %rax
    jmp .function_epilogue

.return_one:
    movq $1, %rax # 1

.function_epilogue:
    popq %r13 # restore callee-saved registers
    popq %r12
    popq %rbx
    movq %rbp, %rsp # rstore sp
    popq %rbp # restore bp
    ret
