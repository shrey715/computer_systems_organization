.text
    .global is_balanced

is_balanced:
    # bool is_balanced(char *str, int n);
    # rdi = str, rsi = n
    # rax = 1 if balanced, 0 if not

    pushq %rbp
    movq %rsp, %rbp
    leaq (,%rsi,8), %r10 # n bytes for str
    subq %r10, %rsp # allocate space on stack
           
    xorq %rcx, %rcx # i = 0
    xorq %r8, %r8 # top = -1 (stack will start at top = 0)
    
.loop:
    cmpq %rsi, %rcx # check if i >= n
    jge .check_empty # if done with string, check if stack is empty
    
    movzbq (%rdi,%rcx,1), %rax # load str[i] into rax
    incq %rcx # i++
    
    cmpq $'(', %rax
    je .push_char
    cmpq $'{', %rax
    je .push_char
    cmpq $'[', %rax
    je .push_char
    
    testq %r8, %r8
    jz .not_balanced # if stack empty, not balanced
    
    decq %r8 # top--
    movzbq (%rsp,%r8,1), %rdx  # get last opening bracket
    
    cmpq $')', %rax
    je .check_paren
    cmpq $'}', %rax
    je .check_curly
    cmpq $']', %rax
    je .check_square
    jmp .loop # Continue if not a bracket
    
.push_char:
    movq %rax, (%rsp,%r8,1) # push character to stack
    incq %r8 # top++
    jmp .loop
    
.check_paren:
    cmpq $'(', %rdx
    jne .not_balanced
    jmp .loop
    
.check_curly:
    cmpq $'{', %rdx
    jne .not_balanced
    jmp .loop
    
.check_square:
    cmpq $'[', %rdx
    jne .not_balanced
    jmp .loop
    
.check_empty:
    testq %r8, %r8
    jnz .not_balanced
    
    movq $1, %rax
    leave
    ret
    
.not_balanced:
    movq $0, %rax
    leave
    ret
