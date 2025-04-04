#include<stdio.h>

extern long long int combination(long long int n, long long int r);

// int combination(int n, int r) {
//     if (r > n) {
//         return 0;
//     }
//     if (r == 0 || r == n) {
//         return 1;
//     }
//     return combination(n - 1, r - 1) + combination(n - 1, r);
// }

int main(){
    long long int n, r;
    scanf("%lld %lld", &n, &r);
    long long int result = combination(n, r);
    printf("%lld\n", result);
    return 0;
}