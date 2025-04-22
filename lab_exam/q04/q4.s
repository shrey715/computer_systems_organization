.text
.global sum

sum:
    # extern long long sum(ll rows, ll cols, ll arr[rows][cols]);
    # rdi = rows, rsi = cols, rdx = arr

    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    movq %rdx, %rcx
    movq $3, %r8
    movq $5, %r9

    movq $0, %r12 # sum=0
    movq $0, %r13 # i=0

.outer:
    cmpq %rdi, %r13
    jge .outer_done # i>=rows, break
    movq $0, %r14 # j=0

.inner:
    cmpq %rsi, %r14
    jge .inner_done # j>=cols, break

    # arr[i][j] = arr[i*cols+j]
    movq %r13, %r15
    imulq %rsi, %r15 # i*cols
    addq %r14, %r15 # i*cols+j
    movq (%rcx, %r15, 8), %rax # arr[i][j] in rax
    
    #divisibility check
    cqto
    idivq %r8 # divisor=3
    cmpq $0, %rdx
    jne .inner_break # needs to be divisible by 3
    idivq %r9 # divisor=5
    cmpq $0, %rdx
    je .inner_break # needs to not be divisible by 5

    # add to sum
    addq (%rcx, %r15, 8), %r12 # sum += arr[i][j]

.inner_break:
    incq %r14 # j++
    jmp .inner

.inner_done:
    incq %r13 # i++
    jmp .outer

.outer_done:
    movq %r12, %rax # return sum
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    ret
