#include<stdio.h>

extern void rotate_by_2(long long int *arr, int n);

int main() {
    int n;
    scanf("%d", &n);
    
    long long int arr[n];

    for(int i=0; i<n; i++) {
        scanf("%lld", &arr[i]);
    }

    rotate_by_2(arr, n);
    
    for(int i=0; i<n; i++) {
        printf("%lld ", arr[i]);
    }
    printf("\n");

    return 0;
}