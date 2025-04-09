.text
    .global unique_peaks

unique_peaks:
    # short unique_peaks(short* arr, int n);
    # %rdi = arr, %esi = n
    # %ax = return value (short)

    pushq %rbx
    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    #int l=0
    xorl %r12d, %r12d
    #int r=n-1
    movl %esi, %r13d
    decl %r13d

.while:
    # Check if l<=r
    cmpl %r13d, %r12d
    jg .exit_not_found

    #int mid = l+(r-l)/2
    xorl %r14d, %r14d
    addl %r13d, %r14d
    subl %r12d, %r14d
    shrl $1, %r14d
    addl %r12d, %r14d

    #short mid_val = arr[mid]
    movslq %r14d, %rax
    movw (%rdi, %rax, 2), %r15w  # Use 2-byte indexing for shorts
    
    # First part of condition: (mid == 0 || arr[mid] > arr[mid-1])
    cmpl $0, %r14d
    je .check_second_part # If mid == 0, first part is true
    
    movl %r14d, %ebx # Save mid
    decl %ebx # mid-1
    movslq %ebx, %rbx
    movw (%rdi, %rbx, 2), %bx # arr[mid-1], using 2-byte indexing
    cmpw %bx, %r15w # arr[mid] > arr[mid-1]?
    jl .not_peak # If not greater, not a peak
    
.check_second_part:
    # Second part: (mid == n-1 || arr[mid] > arr[mid+1])
    movl %esi, %ebx
    decl %ebx # n-1
    cmpl %ebx, %r14d # mid == n-1?
    je .found_peak # If mid == n-1, second part is true
    
    movl %r14d, %ebx # Save mid
    incl %ebx # mid+1
    movslq %ebx, %rbx
    movw (%rdi, %rbx, 2), %bx # arr[mid+1], using 2-byte indexing
    cmpw %bx, %r15w # arr[mid] > arr[mid+1]?
    jl .not_peak # If not greater, not a peak
    
.found_peak:
    # Both conditions true, we found the peak
    movw %r15w, %ax # Return arr[mid]
    jmp .exit
    
.not_peak:
    # mid<n-1 && arr[mid]<arr[mid+1]
    movl %esi, %ebx
    decl %ebx # n-1
    cmpl %ebx, %r14d # mid < n-1?
    jge .go_left # If not, go left
    
    movl %r14d, %ebx # Save mid
    incl %ebx # mid+1
    movslq %ebx, %rbx
    movw (%rdi, %rbx, 2), %bx # arr[mid+1], using 2-byte indexing
    cmpw %bx, %r15w # arr[mid] < arr[mid+1]?
    jge .go_left # If not less, go left
    
    # l = mid+1
    leal 1(%r14d), %r12d
    jmp .while
    
.go_left:
    # r = mid-1
    leal -1(%r14d), %r13d
    jmp .while

.exit_not_found:
    movw $-1, %ax # Return -1 if peak not found

.exit:
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    popq %rbx
    ret
