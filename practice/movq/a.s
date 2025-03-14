# Human-readable version of the assembly
        .text
        .globl main        # Export main symbol globally

main:
        # Function prologue - set up stack frame
        pushq   %rbp       # Save old base pointer
        movq    %rsp, %rbp # Set new base pointer to current stack pointer
        
        # Function body
        movl    $12, -12(%rbp)  # Store value 12 at local variable (int x = 12)
        leaq    -12(%rbp), %rax # Get address of local var into %rax (int *p = &x)
        movq    %rax, -8(%rbp)  # Store this pointer at another local variable
        
        # Function epilogue
        movl    $0, %eax   # Set return value to 0
        popq    %rbp       # Restore saved base pointer
        ret                # Return to caller