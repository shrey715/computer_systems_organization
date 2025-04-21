#include<stdio.h>
#include<stdbool.h>
#define ll long long

/**
 * ! Given an unsorted array of N integers, check whether the elements form a consecutive sequence of distinct integers (without any duplicates or missing values).
 * 
 */

extern bool isConsecutive(ll n, ll arr[n], ll visited[n]);

// bool isConsecutive(int n, int arr[n]){
//     int min = arr[0];
//     int max = arr[0];
//     for(int i = 1; i < n; i++){
//         if(arr[i] < min){
//             min = arr[i];
//         }
//         if(arr[i] > max){
//             max = arr[i];
//         }
//     }
//     if(max - min + 1 != n){
//         return false;
//     }
//     int visited[n];
//     for(int i = 0; i < n; i++){
//         visited[i] = false;
//     }
//     for(int i = 0; i < n; i++){
//         visited[arr[i] - min] = true;
//     }
//     for(int i = 0; i < n; i++){
//         if(!visited[i]){
//             return false;
//         }
//     }
//     return true;
// }

int main(){
    ll n;
    scanf("%lld", &n);
    ll arr[n];
    ll visited[n];
    for(ll i = 0; i < n; i++){
        scanf("%lld", &arr[i]);
    }
    printf("%s\n", isConsecutive(n, arr, visited) ? "true" : "false");
    return 0;
}