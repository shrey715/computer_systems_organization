#include<stdio.h>

extern long long int min_max_diff(long long int *arr, int n);

int main(){
    int n;
    scanf("%d", &n);

    long long int arr[n];
    for(int i=0; i<n; i++){
        scanf("%lld", &arr[i]);
    }

    long long int diff = min_max_diff(arr, n);

    printf("%lld\n", diff);
}