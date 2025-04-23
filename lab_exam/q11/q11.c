#include<stdio.h>
#define ll long long

/**
 * ! Given an array of integers as input (you need to take this as input in your C code), find the nearest previous greater integer (i.e., nearest greater integer to the left) for each of the integers in the array. In case no such integer exists for any of the integers, the answer is –1. Write a function in x86 assembly code for the problem.
 * @param arr The array of integers
 * @param n The size of the array
 */

extern void nearest_previous_greater(ll n, ll arr[n], ll ans[n]);

// void nearest_previous_greater(ll n, ll arr[n], ll ans[n]){
//     ll stack[n];
//     ll top = -1;
//     for (ll i = 0; i < n; i++){
//         while (top != -1 && stack[top] <= arr[i]){
//             top--;
//         }
//         if (top == -1){
//             ans[i] = -1;
//         } else {
//             ans[i] = stack[top];
//         }
//         stack[++top] = arr[i];
//     }
// }

int main(){
    ll n;
    scanf("%lld", &n);
    ll arr[n], ans[n];
    for (ll i = 0; i < n; i++){
        scanf("%lld", &arr[i]);
    }
    nearest_previous_greater(n, arr, ans);
    for (ll i = 0; i < n; i++){
        printf("%lld ", ans[i]);
    }
    printf("\n");
    return 0;
}