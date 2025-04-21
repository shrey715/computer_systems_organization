.text 
    .global is_palindrome

is_palindrome:
    movq %rdi, %rsi # *start = *str

.length: # traverse to the end of the string
    movb (%rsi), %al # load the byte at %rsi into %al
    testb %al, %al # null check
    jz .length_done # if null, jump to .length_done
    incq %rsi # increment the address in %rsi
    jmp .length 

.length_done:
    decq %rsi # decrement to the last character

.palindrome_check:
    cmpq %rdi, %rsi # compare %rdi and %rsi to determine pos
    jle .palindrome_done 

    movb (%rdi), %al # load the byte in %rdi into %al
    movb (%rsi), %ah # Load the byte in %rsi into %ah 
    cmpb %al, %ah # compare values
    jne .palindrome_fail # If %al != %ah, jump to .palindrome_fail

    incq %rdi 
    decq %rsi 
    
    jmp .palindrome_check

.palindrome_fail:
    movq $0, %rax 
    ret

.palindrome_done:
    movq $1, %rax
    ret
