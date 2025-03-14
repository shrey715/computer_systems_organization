.text
    .global findLonely

findLonely:
    # long long int findLonely(long long int *arr, int n);

    movq $0, %rax # ones
    movq $0, %rdx # twos

    movq $0, %rcx # counter
    movq %rsi, %r8
    leaq (%r8, %r8, 2), %r8
    addq $1, %r8 # n = 3 * n + 1

.loop:
    cmpq %rcx, %r8
    je .done # if counter == n, jump to .done

    xorq (%rdi, %rcx, 8), %rax # ones ^= arr[i]
    notq %rdx # twos = ~twos
    andq %rdx, %rax # ones &= ~twos

    notq %rdx # twos = ~twos
    
    xorq (%rdi, %rcx, 8), %rdx # twos ^= arr[i]
    notq %rax # ones = ~ones
    andq %rax, %rdx # twos &= ~ones

    notq %rax # ones = ~ones

    incq %rcx # counter++
    jmp .loop

.done:
    ret
