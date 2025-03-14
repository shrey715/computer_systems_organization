.text 
    .global min_max_diff

min_max_diff:
    # first argument is (long long int* arr)
    # second argument is (int n)
    # long long int min_max_diff(long long int* arr, int n)

    movq (%rdi), %r8 # r8 = arr[0]
    movq (%rdi), %r9 # r9 = arr[0]

    # r8 will store the minimum value
    # r9 will store the maximum value
    
    xorq %rcx, %rcx # cnt = 0

.loop:
    cmpq %rcx, %rsi # if cnt == n
    je .done

    movq (%rdi, %rcx, 8), %rax # rax = arr[cnt]
    cmp %r8, %rax
    jge .not_min # if arr[cnt] >= min

    movq %rax, %r8 # min = arr[cnt]

.not_min:
    cmpq %r9, %rax
    jle .not_max # if arr[cnt] <= max

    movq %rax, %r9 # max = arr[cnt]

.not_max:
    incq %rcx # cnt++
    jmp .loop

.done:
    movq %r8, %rax # rax = min
    cqto 
    movq $0x7FFFFFFFFFFFFFFF, %r10 # r10 = LLONG_MAX
    idivq %r10 # rdx:rax = min / LLONG_MAX
    movq %rdx, %r8 # r8 = min / LLONG_MAX

    movq %r9, %rax # rax = max
    cqto
    idivq %r10 # rdx:rax = max / LLONG_MAX
    movq %rdx, %r9 # r9 = max / LLONG_MAX

    subq %r8, %r9 # max - min / LLONG_MAX
    movq %r9, %rax # rax = max - min / LLONG_MAX
    cqto 
    idivq %r10 # rdx:rax = (max - min) / LLONG_MAX
    movq %rdx, %rax # rax = (max - min) / LLONG_MAX    
    ret
