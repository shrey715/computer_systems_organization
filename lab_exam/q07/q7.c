#include<stdio.h>
#include<stdbool.h>
#define ll long long 

/**
 * ! Given a number N, check if the sum of the factorial of digits is equal to N (special number).
 * @param N The number to check.
 */

extern bool is_special(ll n);

int main(){
    ll n;
    scanf("%lld", &n);  
    if(is_special(n)){
        printf("TRUE\n");
    }else{
        printf("FALSE\n");
    }
    return 0;
}