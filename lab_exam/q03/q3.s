.text
.global score

score:
    # extern ll score(char* s);
    # rdi: char* s

    pushq %r12

    xorq %rax, %rax # rax = 0 = score
    xorq %r12, %r12 # r12 = 0 = len
    movb (%rdi), %cl # prev char
    incq %r12 # len = 1

.for:
    movb (%rdi, %r12), %dl # load byte from s[r12]
    testb %dl, %dl # check if null terminator
    je .end_for

    cmpb %dl, %cl # compare with prev char
    jge .prev_greater

    subb %cl, %dl
    movzbq %dl, %rsi
    addq %rsi, %rax # score += s[r12] - prev char
    movb (%rdi, %r12), %cl # update prev char
    incq %r12 # len++
    jmp .for

.prev_greater:
    subb %dl, %cl
    movzbq %cl, %rsi
    addq %rsi, %rax # score += prev char - s[r12]
    movb (%rdi, %r12), %cl # update prev char
    incq %r12 # len++
    jmp .for

.end_for:
    # rax = score
    popq %r12
    ret
