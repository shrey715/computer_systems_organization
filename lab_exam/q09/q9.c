#include<stdio.h>
#define ll long long

/**
 * ! You are given a sorted array of integers and a search value. Your task is to write an assembly language program that implements the binary search algorithm using recursion to search for the given value in the array. The program should implement a recursive binary search function to find the index of the search value in the array. If the value is found, the program should return the index. If the value is not found, the program should return -1. (0 based indexing should be followed for solution).
 * @param n: size of the array
 * @param arr: array of integers
 * @param search: value to be searched
 * @param start: starting index of the array
 * @param end: ending index of the array
 * @return: index of the search value in the array
 */

extern ll binary_search(ll n, ll arr[n], ll search, ll start, ll end);

int main(){
    ll n;
    scanf("%lld",&n);
    ll arr[n];
    for(ll i=0;i<n;i++){
        scanf("%lld",&arr[i]);
    }
    ll search;
    scanf("%lld",&search);
    ll ans = binary_search(n,arr,search,0,n-1);
    printf("%lld\n",ans);
    return 0;
}