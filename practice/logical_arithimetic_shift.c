#include<stdio.h>

// Function to print binary representation of a number (32-bit 2's complement)
void print_binary(int num) {
    printf("Binary (2's complement): ");
    for (int i = 31; i >= 0; i--) {
        printf("%d", (num >> i) & 1);
        if (i % 8 == 0) printf(" "); // Add space every 8 bits for readability
    }
    printf("\n");
}

// Function to print binary representation of an unsigned number
void print_binary_unsigned(unsigned int num) {
    printf("Binary (unsigned): ");
    for (int i = 31; i >= 0; i--) {
        printf("%d", (num >> i) & 1);
        if (i % 8 == 0) printf(" "); // Add space every 8 bits for readability
    }
    printf("\n");
}

void demonstrate_operations(int a, int b) {
    printf("\n--- With a = %d, b = %d ---\n", a, b);
    
    printf("\na = %d\n", a);
    print_binary(a);
    
    printf("\nb = %d\n", b);
    print_binary(b);
    
    // Arithmetic right shift (signed integers)
    printf("\nArithmetic right shift (a >> 1): %d\n", a >> 1);
    print_binary(a >> 1);

    printf("\nArithmetic right shift (b >> 1): %d\n", b >> 1);
    print_binary(b >> 1);

    // Logical right shift (using unsigned cast)
    unsigned int ua = (unsigned int)a;
    unsigned int ub = (unsigned int)b;
    
    printf("\nLogical right shift ((unsigned)a >> 1): %u\n", ua >> 1);
    print_binary_unsigned(ua >> 1);

    printf("\nLogical right shift ((unsigned)b >> 1): %u\n", ub >> 1);
    print_binary_unsigned(ub >> 1);

    // Left shift (always logical)
    printf("\nLeft shift (a << 1): %d\n", a << 1);
    print_binary(a << 1);

    printf("\nLeft shift (b << 1): %d\n", b << 1);
    print_binary(b << 1);

    printf("\n--------------------------\n");
}

int main() {
    // Case 1: Positive and negative numbers
    demonstrate_operations(12, -12);
    
    // Case 2: Powers of 2
    demonstrate_operations(16, -16);
    
    return 0;
}