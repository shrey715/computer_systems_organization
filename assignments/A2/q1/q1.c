#include<stdio.h>
#define ll long long int

extern ll subarrays_with_sum_0(ll* arr, ll* pre, ll* hash, ll n);

// ll subarrays_with_sum_0(ll* arr, ll* pre, ll* hash, ll n){
//     ll cnt=0; 
//     pre[0] = arr[0]; 

//     for(int i=0; i<2002; i++){ 
//         hash[i] = 0; 
//     } // incq %r8

//     hash[pre[0] + 1000] = 1; 

//     for(int i=1; i<n; i++){
//         pre[i] = pre[i-1] + arr[i]; 
//         if(pre[i] == 0){
//             cnt++;
//         }
//         cnt+=hash[pre[i]+1000];
//         hash[pre[i] + 1000]++;
//     }

//     return cnt;
// }

int main(){
    ll n;
    scanf("%lld", &n);

    ll arr[n];
    for(int i = 0; i < n; i++){
        scanf("%lld", &arr[i]);
    }

    ll pre[n];
    ll hash[2002];

    ll count = subarrays_with_sum_0(arr, pre, hash, n);
    printf("%lld\n", count);
}