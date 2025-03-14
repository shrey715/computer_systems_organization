#include <stdio.h>

extern void xproduct(long long int* arr, long long int* ans, long long int* pre, long long int* suf, int n);

int main() {
    int n;
    scanf("%d", &n);

    long long int arr[n];
    long long int result[n];
    long long int prefix[n];
    long long int suffix[n];

    for (int i = 0; i < n; i++) {
        scanf("%lld", &arr[i]);
    }

    xproduct(arr, result, prefix, suffix, n);

    for (int i = 0; i < n; i++) {
        printf("%lld ", result[i]);
    }
    printf("\n");

    return 0;
}