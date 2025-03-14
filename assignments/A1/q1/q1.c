#include<stdio.h>

extern long long int findLonely(long long int *arr, int n);

int main(){
    int n;
    scanf("%d", &n);

    long long int arr[3*n+1];
    for(int i=0; i<3*n+1; i++){
        scanf("%lld", &arr[i]);
    }

    long long int lonely = findLonely(arr, n);
    printf("%lld\n", lonely);
    return 0;
}