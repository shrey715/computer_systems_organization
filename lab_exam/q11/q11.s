.text
    .global nearest_previous_greater

nearest_previous_greater:
    # extern void nearest_previous_greater(ll n, ll arr[n], ll ans[n]);
    # rdi: n, rsi: arr, rdx: ans

    pushq %rbp
    movq %rsp, %rbp

    leaq (,%rdi,8), %r10
    subq %r10, %rsp # allocate space on stack
    
    movq $-1, %r8 # top = -1
    movq $0, %r9 # i = 0

.for_loop:
    cmpq %rdi, %r9
    jge .end_for_loop # end if i >= n

    movq (%rsi,%r9,8), %r10

.while_loop:
    cmpq $-1, %r8
    je .end_while_loop

    movq (%rsp,%r8,8), %r11 # stack[top]
    cmpq %r10, %r11
    jg .end_while_loop # end if stack[top] > arr[i]

    decq %r8 # top--
    jmp .while_loop

.end_while_loop:
    cmpq $-1, %r8
    jne .else_block # top!=-1, found NPG

    movq $-1, (%rdx,%r9,8) # ans[i]=-1
    jmp .end_if

.else_block:
    # ans[i] = stack[top]
    movq (%rsp,%r8,8), %r11
    movq %r11, (%rdx,%r9,8)

.end_if:
    # stack[++top] = arr[i]
    incq %r8
    movq %r10, (%rsp,%r8,8)

    incq %r9 # i++
    jmp .for_loop

.end_for_loop:
    leave
    ret
