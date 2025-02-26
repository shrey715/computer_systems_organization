#include<stdio.h>
#include"foo.h"

int main() {
    printf("This is a shared library test...\n");
    foo();
    return 0;
}