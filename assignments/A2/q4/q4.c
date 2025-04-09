#include<stdio.h>
#define ll long long int

extern ll majority_element(ll* arr, ll n);

// ll majority_element(ll* arr, ll n){
//     ll candidate = arr[0];
//     ll count = 1;
//     for(ll i=1;i<n;i++){
//         if(count == 0){
//             candidate = arr[i];
//             count = 1;
//         } else if(arr[i] == candidate){
//             count++;
//         } else {
//             count--;
//         }
//     }    
//     return candidate;
// }

int main(){
    ll n;
    scanf("%lld", &n);
    ll arr[n];
    for(int i=0; i<n; i++){
        scanf("%lld", &arr[i]);
    }
    ll ans = majority_element(arr, n);
    printf("%lld\n", ans);
    return 0;
}
