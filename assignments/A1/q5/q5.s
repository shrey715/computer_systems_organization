.text 
    .global xproduct

xproduct:
    # void xproduct(long long int* arr, long long int* ans, long long int* pre, long long int* suf, int n);
    # rdi: arr, rsi: ans, rdx: pre, rcx: suf, r8: n
    
    movq $1, (%rdx)
    movq $1, %r9  # r9 = 1 

.prefix_loop:
    cmp %r9, %r8
    je .middle # If i == n, jump to middle
    
    # Calculate pre[i] = pre[i-1] * arr[i-1]
    movq -8(%rdi, %r9, 8), %rax  # rax = arr[i-1]
    pushq %rdx
    imulq -8(%rdx, %r9, 8)  # rax = pre[i-1] * arr[i-1]
    movq $9223372036854775807, %r10  # r10 = LLONG_MAX
    idivq %r10  # rdx:rax = rax / r10
    movq %rdx, %r10  
    popq %rdx 
    movq %r10, (%rdx, %r9, 8)  # pre[i] = result
    incq %r9 
    jmp .prefix_loop 

.middle:
    # Initialize suf[n-1] = 1
    movq %r8, %r9  # r9 = n
    decq %r9  # r9 = n - 1
    movq $1, (%rcx, %r9, 8)  # suf[n-1] = 1
    decq %r9  # r9 = n - 2

.suffix_loop:
    cmp $-1, %r9 # Compare i with -1
    je .end
    
    # Calculate suf[i] = suf[i+1] * arr[i+1]
    movq 8(%rdi, %r9, 8), %rax  # rax = arr[i+1]
    pushq %rdx  
    imulq 8(%rcx, %r9, 8)  # rax = suf[i+1] * arr[i+1]
    movq $9223372036854775807, %r10  # r10 = LLONG_MAX
    idivq %r10  # rdx:rax = rax / r10
    movq %rdx, %r10  # r10 = rdx
    popq %rdx
    movq %r10, (%rcx, %r9, 8)  # suf[i] = result
    decq %r9 
    jmp .suffix_loop 

.end:
    movq $0, %r9  # r9 = 0

.loop:
    cmp %r9, %r8
    je .done # If i == n, jump to done
    movq (%rdx, %r9, 8), %rax  # rax = pre[i]
    pushq %rdx  
    imulq (%rcx, %r9, 8)  # rax = pre[i] * suf[i]
    movq $9223372036854775807, %r10  # r10 = LLONG_MAX
    idivq %r10  # rdx:rax = rax / r10, rdx = remainder
    movq %rdx, %r10  # r10 = rdx
    popq %rdx
    movq %r10, (%rsi, %r9, 8)  # ans[i] = r10
    incq %r9 # i++
    jmp .loop

.done:
    ret
