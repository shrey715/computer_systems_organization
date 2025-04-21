#include<stdio.h>
#define ll long long 

/**
 * ! Given a sorted array of N integers where some elements may be repeated. The task is to process the input array and print only the unique elements present, in the same order.
 * @param arr, array of long long integers
 * @param n, size of the above array 
 */

extern ll unique_in_sorted(ll* arr, ll n, ll *ans);

int main(){
    ll n;
    scanf("%lld", &n);   
    ll arr[n];
    ll ans[n];
    for(ll i = 0; i < n; i++){
        scanf("%lld", &arr[i]);
    }
    ll m = unique_in_sorted(arr, n, ans);
    for(ll i = 0; i < m; i++){
        printf("%lld ", ans[i]);
    }
    printf("\n");
    return 0;
}
