#include<stdio.h>
#define ll long long
/**
 * ! Given a positive integer N, return an array of integers with all the integers from 1 to N. But for multiples of 2 the array should have -1 instead of the number, for multiples of 7 the array should have -2 instead of the number, and for multiples of both 2 and 7 the array should have -3 instead of the number.
 * @param N The positive integer N
 * @return An array of integers with all the integers from 1 to N, with the specified replacements for multiples of 2, 7, and both.
 */

extern void weird_array(ll n, ll *arr);

// void weird_array(ll n, ll *arr) {
//     for(ll i=0;i<n;i++){
//         arr[i]=i+1;
//         if(arr[i]%2L==0){
//             if(arr[i]%7L==0){
//                 arr[i]=-3L;
//             }
//             arr[i]=-1L;
//         }
//         if(arr[i]%7L==0){
//             arr[i]=-2L;
//         }
//     }
// }

int main(){
    ll n;
    scanf("%lld", &n);
    ll arr[n];
    weird_array(n, arr);
    for(ll i = 0; i < n; i++){
        printf("%lld ", arr[i]);
    }
    printf("\n");
    return 0;
}
