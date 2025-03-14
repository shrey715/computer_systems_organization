#include <stdio.h>

// Function to print binary representation of a number (32-bit 2's complement)
void print_binary(int num) {
    printf("Binary (2's complement): ");
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
    
    // Logical operations
    printf("\nLogical AND (a && b): %d\n", a && b);
    printf("Logical OR (a || b): %d\n", a || b);
    printf("Logical NOT !a: %d\n", !a);
    printf("Logical NOT !b: %d\n", !b);
    
    // Bitwise operations
    printf("\nBitwise AND (a & b): %d\n", a & b);
    print_binary(a & b);
    
    printf("\nBitwise OR (a | b): %d\n", a | b);
    print_binary(a | b);
    
    printf("\nBitwise XOR (a ^ b): %d\n", a ^ b);
    print_binary(a ^ b);
    
    printf("\nBitwise NOT ~a: %d\n", ~a);
    print_binary(~a);
    
    printf("\nBitwise NOT ~b: %d\n", ~b);
    print_binary(~b);
    
    printf("\n--------------------------\n");
}

int main() {
    // Case 1: Both positive
    demonstrate_operations(5, 9);
    
    // Case 2: Both negative
    demonstrate_operations(-5, -9);
    
    // Case 3: Mixed (positive and negative)
    demonstrate_operations(5, -9);
    
    return 0;
}