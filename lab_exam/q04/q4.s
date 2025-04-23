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
    movq %rdi, %r15 # rows
    imul %r15, %rsi # cols
    movq %rsi, %r15 # rows*cols

.loop:
    cmpq %r15, %r13 # i >= rows*cols?
    jge .done

    movq (%rcx,%r13,8), %rax # arr[i]
    cqto
    idivq %r8 # arr[i]/3
    cmpq $0, %rdx # arr[i]%3 == 0?
    jne .next

    idivq %r9 # arr[i]/5
    cmpq $0, %rdx # arr[i]%5 == 0?
    je .next

    addq (%rcx,%r13,8), %r12 # sum += arr[i]
.next:    
    incq %r13 # i++
    jmp .loop

.done:
    movq %r12, %rax # return sum
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    ret
