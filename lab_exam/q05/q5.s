.text 
.global unique_in_sorted

unique_in_sorted:
    # extern ll unique_in_sorted(ll* arr, ll n, ll *ans);
    # rdi = arr, rsi = n, rdx = ans

    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    movq $1, %r12 # r12 = 1
    movq $1, %rax # rax = 1
    movq (%rdi), %r13 # r13 = arr[0]
    movq %r13, (%rdx) # ans[0] = arr[0]

.loop:
    cmpq %rsi, %r12 
    jge .end # if (i >= n) break;

    movq (%rdi, %r12, 8), %r14 # r14 = arr[i]
    cmpq %r13, %r14 # if (arr[i] == arr[i-1]) continue;
    je .continue

    movq %r14, (%rdx, %rax, 8) # ans[ans++] = arr[i]
    movq %r14, %r13 # arr[i-1] = arr[i]
    incq %rax # ans++

    jmp .continue

.continue:
    incq %r12 # i++
    jmp .loop

.end:
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    ret
