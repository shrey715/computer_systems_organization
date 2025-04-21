.text
.global isConsecutive

isConsecutive:
    # extern bool isConsecutive(ll n, ll arr[n], ll visited[n])
    # rdi = n, rsi = arr, rdx = visited

    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    movq (%rsi), %r12 # min = arr[0]
    movq (%rsi), %r13 # max = arr[0]
    movq $0, (%rdx) # visited[0] = 0
    movq $1, %r14 # i = 1

.loop:
    cmpq %rdi, %r14 # i < n
    jge .done

    movq $0, (%rdx, %r14, 8) # visited[i] = 0
    movq (%rsi, %r14, 8), %r15 # arr[i]
    cmpq %r12, %r15 # arr[i] < min
    jl .update_min

    cmpq %r13, %r15 # arr[i] > max
    jg .update_max

    incq %r14
    jmp .loop

.update_min:
    movq %r15, %r12 # min = arr[i]
    incq %r14
    jmp .loop

.update_max:
    movq %r15, %r13 # max = arr[i]
    incq %r14
    jmp .loop

.done:
    subq %r12, %r13 # max - min
    incq %r13 # max - min + 1
    cmpq %rdi, %r13 # max - min + 1 == n
    jne .return_false

    movq $0, %r14 # i = 0
.loop_visited:
    cmpq %rdi, %r14 # i < n
    jge .check_visited

    movq (%rsi, %r14, 8), %r15 # arr[i]
    subq %r12, %r15 # arr[i] - min
    movq $1, (%rdx, %r15, 8) # visited[arr[i] - min] = 1
    incq %r14
    jmp .loop_visited

.check_visited:
    movq $0, %r14 # i = 0

.loop_check:
    cmpq %rdi, %r14 # i < n
    jge .return_true

    cmpq $0, (%rdx, %r14, 8) # visited[i] == 0
    je .return_false
    incq %r14
    jmp .loop_check

.return_true:
    movq $1, %rax # rax = 1 (true)
    jmp .end

.return_false:
    movq $0, %rax # rax = 0 (false)
    jmp .end

.end:
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    ret
