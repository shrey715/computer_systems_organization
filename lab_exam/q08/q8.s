.text 
    .global wavify

wavify:
    # extern void wavify(ll n, ll arr[n], ll ans[n]);
    # rdi: n, rsi: arr, rdx: ans

    pushq %r12 
    pushq %r13
    pushq %r14
    pushq %r15
    pushq %rbx

    movq %rdi, %r12 # r12=n
    movq %rsi, %r13 # r13=arr
    
    movq $0, %r14 # i=0
.outer_loop:
    cmpq %r12, %r14
    jge .sort_done
    
    movq %r14, %r15
    addq $1, %r15 # j=i+1
.inner_loop:
    cmpq %r12, %r15
    jge .inner_done
    
    movq (%r13, %r14, 8), %rax # arr[i]
    movq (%r13, %r15, 8), %rbx # arr[j]
    cmpq %rbx, %rax 
    jle .no_swap # if arr[i]<=arr[j], no swap
    
    movq %rax, (%r13, %r15, 8) # arr[j]=arr[i]
    movq %rbx, (%r13, %r14, 8) # arr[i]=arr[j]
    
.no_swap:
    addq $1, %r15 # j++
    jmp .inner_loop
    
.inner_done:
    addq $1, %r14 # i++
    jmp .outer_loop

.sort_done:
    movq $0, %r14 # i=0
    
.wave_loop:
    cmpq %r12, %r14
    jge .wave_done
    
    leaq 1(%r14), %r15 # r15=i+1
    cmpq %r12, %r15
    jge .next_pair
    
    movq (%r13, %r14, 8), %rax # arr[i]
    movq (%r13, %r15, 8), %rbx # arr[i+1]
    
    movq %rax, (%r13, %r15, 8) # arr[i+1]=arr[i]
    movq %rbx, (%r13, %r14, 8) # arr[i]=arr[i+1]
    
.next_pair:
    addq $2, %r14 # i+=2
    jmp .wave_loop
    
.wave_done:
    popq %rbx
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    ret
