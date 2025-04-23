#include<stdio.h>
#include<stdbool.h>
#define ll long long

/**
 * !Given a number N and the number of digits D in it, check whether the given number is a circular prime. A circular prime is a number that remains prime under all rotations of its digits. A rotation is defined as moving the last digit to the front.
 * @param n The number to check
 * @param d The number of digits in the number
 */

extern bool is_circular_prime(ll n, ll d);

 // source: GeeksforGeeks
// bool is_prime(ll n){
//     if(n==1) return false;
//     if(n<=3) return true;
//     for(ll i=2;i*i<=n;i++){
//         if(n%i==0){
//             return false;
//         }
//     }
//     return true;
// }

// ll raise10(ll n){
//     ll ans = 1;
//     for(ll i=0;i<n;i++){
//         ans *= 10;
//     }
//     return ans;
// }

// bool is_circular_prime(ll n, ll d){
//     ll num = n;
//     for(ll i=0;i<d;i++){
//         if(!is_prime(num)){
//             return false;
//         }
//         ll last_digit = num % 10;
//         num = (num/10)+(last_digit*raise10(d-1));
//     }
//     return true;
// }

int main(){
    ll n,d;
    scanf("%lld %lld",&n,&d);
    if(is_circular_prime(n,d)){
        printf("TRUE\n");
    }else{
        printf("FALSE\n");
    }
    return 0;
}