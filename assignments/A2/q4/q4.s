.text
    .global majority_element

majority_element:
    # ll majority_element(ll* arr, ll n);
    # rdi = arr, rsi = n
    # rax = return value

    pushq %rbx
    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    # ll count = 0
    xorq %r12, %r12
    # ll candidate = arr[0]
    movq (%rdi), %r13
    # ll i = 0
    xorq %r14, %r14

.loop:
    cmpq %rsi, %r14
    jge .end_loop

    # ll arr[i]
    movq (%rdi, %r14, 8), %r15
    # if count == 0
    cmpq $0, %r12
    je .set_candidate

    # arr[i] == candidate
    cmpq %r13, %r15
    jne .decrement_count

    # count++
    incq %r12
    jmp .continue_loop

.set_candidate:
    # candidate = arr[i]
    movq %r15, %r13
    # count = 1
    movq $1, %r12
    jmp .continue_loop

.decrement_count:
    # count--
    decq %r12
    jmp .continue_loop

.continue_loop:
    # i++
    incq %r14
    jmp .loop

.end_loop:
    # return candidate
    movq %r13, %rax

    popq %r15
    popq %r14
    popq %r13
    popq %r12
    popq %rbx

    ret
