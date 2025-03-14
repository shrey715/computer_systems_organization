#include<stdio.h>
#include<limits.h>

void print_binary(int num) {
    printf("Binary (2's complement): ");
    for (int i = 31; i >= 0; i--) {
        printf("%d", (num >> i) & 1);
        if (i % 8 == 0) printf(" "); // Add space every 8 bits for readability
    }
    printf("\n");
}

void print_binary_unsigned(unsigned int num) {
    printf("Binary (unsigned): ");
    for (int i = 31; i >= 0; i--) {
        printf("%d", (num >> i) & 1);
        if (i % 8 == 0) printf(" "); // Add space every 8 bits for readability
    }
    printf("\n");
}

int main(){
    int tx = INT_MAX;
    int ty = INT_MIN;

    printf("tx = %d\n", tx);
    print_binary(tx);
    
    printf("ty = %d\n", ty);
    print_binary(ty);
    
    printf("tx + 1 = %d\n", tx + 1);  // Overflow: wraps around from INT_MAX to INT_MIN
    print_binary(tx + 1);
    
    printf("ty - 1 = %d\n", ty - 1);  // Underflow: wraps around from INT_MIN to INT_MAX
    print_binary(ty - 1);

    unsigned int ux = INT_MAX;
    unsigned int uy = INT_MIN;

    printf("ux = %u\n", ux);
    print_binary_unsigned(ux);
    
    printf("uy = %u\n", uy);  // Note: INT_MIN as unsigned becomes a large positive number
    print_binary_unsigned(uy);
    
    printf("ux + 1 = %u\n", ux + 1);  // No overflow yet - unsigned can hold larger values than INT_MAX
    print_binary_unsigned(ux + 1);
    
    printf("uy - 1 = %u\n", uy - 1);  // No wraparound yet - decrementing a positive number
    print_binary_unsigned(uy - 1);

    unsigned int uz = UINT_MAX;
    unsigned int uw = 0;

    printf("uz = %u\n", uz);
    print_binary_unsigned(uz);
    
    printf("uw = %u\n", uw);
    print_binary_unsigned(uw);
    
    printf("uz + 1 = %u\n", uz + 1);  // Overflow: wraps around from UINT_MAX to 0
    print_binary_unsigned(uz + 1);
    
    printf("uw - 1 = %u\n", uw - 1);  // Underflow: wraps around from 0 to UINT_MAX
    print_binary_unsigned(uw - 1);

    printf("INT_MAX = %d\n", INT_MAX);
    print_binary(INT_MAX);
    
    printf("INT_MIN = %d\n", INT_MIN);
    print_binary(INT_MIN);
    
    printf("UINT_MAX = %u\n", UINT_MAX);
    print_binary_unsigned(UINT_MAX);
    
    printf("0 = %d\n", 0);
    print_binary(0);

    printf("INT_MAX + INT_MIN = %d\n", INT_MAX + INT_MIN);  // Result: -1
    print_binary(INT_MAX + INT_MIN);
    
    printf("INT_MAX + INT_MAX = %d\n", INT_MAX + INT_MAX);  // Overflow: results in -2
    print_binary(INT_MAX + INT_MAX);

    printf("UINT_MAX + 0 = %u\n", UINT_MAX + 0);
    print_binary_unsigned(UINT_MAX + 0);
    
    printf("UINT_MAX + UINT_MAX = %u\n", UINT_MAX + UINT_MAX);  // Overflow: results in UINT_MAX-1
    print_binary_unsigned(UINT_MAX + UINT_MAX);

    return 0;
}