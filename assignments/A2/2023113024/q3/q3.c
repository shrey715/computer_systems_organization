#include<stdio.h>
#define ll long long int

extern void next_higher_num(ll* arr, ll* ans, ll n);

// void next_higher_num(int* arr, int* ans, int n){
//     int stack[n];
//     int stackptr = -1;

//     for(int i=n-1;i>=0;i--){
//         while(stackptr != -1 && arr[stack[stackptr]] <= arr[i]){
//             stackptr--;
//         }
//         if(stackptr == -1){
//             ans[i] = -1;
//         }else{
//             ans[i] = arr[stack[stackptr]];
//         }
//         stack[++stackptr] = i;
//     }
// }

int main(){
    ll n;
    scanf("%lld", &n);
    ll arr[n];
    ll ans[n];
    for(int i=0; i<n; i++){
        scanf("%lld", &arr[i]);
    }
    next_higher_num(arr, ans, n);
    for(int i=0; i<n; i++){
        printf("%lld ", ans[i]);
    }
    printf("\n");
    return 0;
}