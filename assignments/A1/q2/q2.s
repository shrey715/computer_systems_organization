.text
    .global rotate_by_2

rotate_by_2:
    # First argument (long long int *arr) is in %rdi
    # Second argument (int n) is in %rsi
    # void function - no return value
    
    cmpq $2, %rsi    
    jle .done

    cmpq $3, %rsi

    movq %rsi, %rcx # copy n to rcx
    decq %rcx # n-1
    movq (%rdi, %rcx, 8), %r8 # arr[n-1]
    decq %rcx # n-2
    movq (%rdi, %rcx, 8), %r9 # arr[n-2] 

    decq %rcx # n-3

.loop:
    movq (%rdi, %rcx, 8), %r10 # arr[i-2]
    movq %r10, 16(%rdi, %rcx, 8) # arr[i] = arr[i-2]
    decq %rcx # i--
    cmpq $0, %rcx # i > 0
    jge .loop # loop if i > 0
 
    movq %r8, 8(%rdi) # arr[0] = arr[n-2]
    movq %r9, (%rdi) # arr[1] = arr[n-1]

.done:
    ret

