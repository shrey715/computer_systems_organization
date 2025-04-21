.text 
.global weird_array

weird_array:
    # extern void weird_array(ll n, ll *arr);
    # rdi=n, rsi=arr

    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    xorq %r12, %r12 # i=0

.for:
    cmpq %rdi, %r12 # r12 < n
    jge .end_for

    movq %r12, %r14 # r14 = r12
    incq %r14 # r14 = i+1
    movq %r14, (%rsi, %r12, 8) # arr[i]=i+1

    movq %r14, %rax # load i+1 into rax for division
    cqto # sign-extend rax into rdx
    movq $2, %r13 # divisor = 2
    idivq %r13  # (i+1)%2=0 
    cmpq $0, %rdx # check remainder
    jne .check_div_by_7

    movq %r14, %rax # load i+1 into rax for division
    cqto # sign-extend rax into rdx
    movq $7, %r13 # divisor = 7
    idivq %r13 # (i+1)%7=0
    cmpq $0, %rdx # check remainder
    je .set_3

    movq $-1, (%rsi, %r12, 8)
    jmp .next

.check_div_by_7:
    movq %r14, %rax # load i+1 into rax for division
    cqto # sign-extend rax into rdx
    movq $7, %r13 # divisor = 7
    idivq %r13 # (i+1)%7=0
    cmpq $0, %rdx # check remainder
    jne .next

    movq $-2, (%rsi, %r12, 8)
    jmp .next

.set_3:
    movq $-3, (%rsi, %r12, 8)

.next:
    incq %r12 # i++
    jmp .for

.end_for:
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    ret
