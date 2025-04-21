#include<stdio.h>
#define ll long long

/**
 * ! Given a 2-D array of non-negative integers, find the sum of all those integers which are divisible by 3 but not divisible by 5. You may initialize a static array (so that all the elements are contiguous, regardless of row). You do not need to handle overflow. You can assume that the sum will fit in a long long integer, and that each number will fit in a long long integer.
 * @param arr The 2-D array of non-negative integers.
 * @param rows The number of rows in the array.
 * @param cols The number of columns in the array.
 * @return The sum of all integers in the array that are divisible by 3 but not divisible by 5.
 */

extern ll sum(ll rows, ll cols, ll arr[rows][cols]);

// ll sum(ll rows, ll cols, ll arr[rows][cols]){
//     ll total = 0;
//     for(ll i=0;i<rows;i++){
//         for(ll j=0;j<cols;j++){
//             if(arr[i][j]%3==0){
//                 if(arr[i][j]%5!=0){
//                     total+=arr[i][j];
//                 }
//             }
//         }
//     }
//     return total;
// }

int main(){
    ll m, n;
    scanf("%lld %lld", &m, &n);
    ll arr[m][n];
    for(ll i = 0; i < m; i++){
        for(ll j = 0; j < n; j++){
            scanf("%lld", &arr[i][j]);
        }
    }
    printf("%lld\n", sum(m, n, arr));
    return 0;
}