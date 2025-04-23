.text
    .global binary_search

binary_search:
    # extern ll binary_search(ll n, ll arr[n], ll x, ll start, ll end);
    # rdi: n, rsi: arr, rdx: x, rcx: start, r8: end
    # rax: return value, 0-based index

    pushq %rdi
    pushq %rsi
    pushq %rdx
    pushq %rcx
    pushq %r8

    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    cmpq %rcx, %r8 # if start>end, not found
    jl .not_found

    movq %rcx, %r9 # mid=start
    addq %r8, %r9 # mid+=end
    sarq $1, %r9 # mid=(start+end)/2
    movq (%rsi, %r9, 8), %r10 # arr[mid]

    cmpq %r10, %rdx # arr[mid] == x?
    je .found
    jg .greater

    movq %r9, %r8 # end=mid
    subq $1, %r8 # end=mid-1
    call binary_search # search in left half
    jmp .end

.not_found:
    movq $-1, %rax # not found
    jmp .end

.found:
    movq %r9, %rax # found at mid
    jmp .end

.greater:
    movq %r9, %rcx # start=mid
    addq $1, %rcx # start=mid+1
    call binary_search # search in right half
    jmp .end

.end:
    popq %r15
    popq %r14
    popq %r13
    popq %r12

    popq %r8
    popq %rcx
    popq %rdx
    popq %rsi
    popq %rdi

    ret
