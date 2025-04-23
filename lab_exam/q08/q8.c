#include<stdio.h>
#define ll long long

/**
 * ! Given an array of N integers, sort the array into a wave-like array and return it. In other words, arrange the elements into a sequence such that a1 >= a2 <= a3 >= a4 ......
 * @param n: size of the array
 * @param arr: array of integers
 * @param ans: array to store the result
 */

extern void wavify(ll n, ll arr[n]);

// void wavify(ll n, ll arr[n]){
//     for(ll i=0;i<n;i++){
//         for(ll j=i+1;j<n;j++){
//             if(arr[i]>arr[j]){
//                 ll temp=arr[i];
//                 arr[i]=arr[j];
//                 arr[j]=temp;
//             }
//         }
//     }
//     for(ll i=0;i<n;i+=2){
//         if(i+1<n){
//             ll temp=arr[i];
//             arr[i]=arr[i+1];
//             arr[i+1]=temp;
//         }
//     }
// }

int main(){
    ll n;
    scanf("%lld",&n);
    ll arr[n];
    for(ll i=0;i<n;i++){
        scanf("%lld",&arr[i]);
    }
    wavify(n,arr);
    for(ll i=0;i<n;i++){
        printf("%lld ",arr[i]);
    }
    printf("\n");   
    return 0;
}