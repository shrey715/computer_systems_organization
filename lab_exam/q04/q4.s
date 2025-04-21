.text
.global sum

sum:
    # extern long long sum(ll rows, ll cols, ll arr[rows][cols]);
    # rdi = rows, rsi = cols, rdx = arr

    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15