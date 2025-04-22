.text
.global is_special

factorial:
    # rdi has the number
    # rax will hold the result
    # Base case: if n == 0, return 1
    cmpq $0, %rdi
    je .base_case
    # Recursive case: n! = n * (n-1)!
    pushq %rdi
    dec %rdi
    call factorial
    popq %rdi
    # Multiply the result with n
    imul %rdi, %rax
    ret

.base_case:
    movq $1, %rax
    ret

is_special:
    # rdi has the number
    # rax will hold the result (boolean)
    # Check if the number is less than 0
    cmpq $0, %rdi
    jl .not_special

    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    movq $0, %r14 # sum of digits' factorial
    movq $10, %r13 # divisor
    movq %rdi, %r12 # og number
    pushq %rdi # save original number

.for:
    cmpq $0, %r12
    je .end_for

    movq %r12, %rax 
    cqto 
    idivq %r13 # divide by 10
    movq %rdx, %rdi
    movq %rax, %r12 # update number
    call factorial # get factorial of digit
    addq %rax, %r14 # add to sum of factorials
    jmp .for

.end_for:
    popq %rdi # restore original number
    cmpq %r14, %rdi # compare sum of factorials with original number
    je .is_special

.not_special:
    movq $0, %rax # not special
    jmp .end

.is_special:
    movq $1, %rax # is special
    jmp .end

.end:
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    ret
