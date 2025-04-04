.text
    .global next_higher_num

next_higher_num:
    # void next_higher_num(int* arr, int* ans, int n)
    # rdi = arr, rsi = ans, rdx = n

    pushq %rbx # save callee-saved registers
    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    pushq %rbp # save old bp
    movq %rsp, %rbp # set new bp

    # r12 = i (n-1)
    leaq -1(%rdx), %r12 

.for_loop:
    cmpq $0, %r12 # check if i >= 0
    jl .end_for_loop

.while_loop:
    cmpq %rbp, %rsp # check if stack is empty
    je .empty_stack

    movq (%rsp), %r14
    # check if top <= arr[i]
    cmpq (%rdi, %r12, 8), %r14
    jle .pop_stack # when top <= arr[i], pop it, never gonna need anyways

    jmp .found_higher

.pop_stack:
    popq %r14 # pop from stack (into r14, though value isn't used)
    jmp .while_loop

.empty_stack:
    movq $-1, (%rsi, %r12, 8) # ans[i] = -1
    jmp .push_current

.found_higher:
    movq %r14, (%rsi, %r12, 8) # ans[i] = top value

.push_current:
    movq (%rdi, %r12, 8), %r13
    pushq %r13 # push current value
    
    decq %r12
    jmp .for_loop

.end_for_loop:
    movq $0, %rax # return 0
    movq %rbp, %rsp # restore stack pointer
    popq %rbp # restore old bp
    popq %r15 # restore r15
    popq %r14 # restore r14
    popq %r13 # restore r13
    popq %r12 # restore r12
    popq %rbx # restore callee-saved registers
    ret
