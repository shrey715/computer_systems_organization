.text
    .global subarrays_with_sum_0

subarrays_with_sum_0:
    # int subarrays_with_sum_0(ll *arr, ll* pre, ll* hash, ll n)
    # rdi = arr, rsi = pre, rdx = hash, rcx = n
    
    # save callee saved registers
    pushq %rbx
    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    # cnt = 0
    xorq %r12, %r12
    
    # pre[0] = arr[0]
    movq (%rdi), %rbx
    movq %rbx, (%rsi)
    
    # hash map
    xorq %r13, %r13  # r13 = 0 (hash index)
    movq $2002, %r15 # r15 = 2002 (hash size)

.hash_init:
    cmpq %r15, %r13
    jge .hash_done

    movq $0, (%rdx, %r13, 8)
    incq %r13
    jmp .hash_init

.hash_done:
    movq (%rsi), %rbx # if(pre[0] == 0) cnt++
    cmpq $0, %rbx
    jne .skip_count_init
    incq %r12
    
.skip_count_init:
    # hash[pre[0]+1000] = 1
    movq (%rsi), %rbx # VALUE of pre[0]
    addq $1000, %rbx # pre[0] + 1000
    movq $1, (%rdx, %rbx, 8) # hash[pre[0]+1000] = 1

    movq $1, %r13 # i = 1

.loop:
    cmpq %rcx, %r13
    jge .done

    # pre[i] = pre[i-1] + arr[i]
    movq %r13, %r14
    decq %r14 # r14 = i-1
    movq (%rsi, %r14, 8), %rbx # rbx = pre[i-1]
    movq (%rdi, %r13, 8), %r14 # r14 = arr[i]
    addq %r14, %rbx # rbx = pre[i-1] + arr[i]
    movq %rbx, (%rsi, %r13, 8) # pre[i] = rbx
    
    # check pre[i] == 0, cnt++
    cmpq $0, %rbx 
    jne .not_zero
    incq %r12
    
.not_zero:
    # cnt += hash[pre[i]+1000]
    movq %rbx, %r14 # prefix sum VALUE
    addq $1000, %r14 # pre[i]+1000
    movq (%rdx, %r14, 8), %rbx # move cnt to rbx
    addq %rbx, %r12 # cnt+=rbx
    
    # hash[pre[i]+1000]++
    incq (%rdx, %r14, 8) # hash++    
    incq %r13 # i++
    jmp .loop

.done:
    movq %r12, %rax # return cnt
    
    # restore registers
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    popq %rbx

    ret
