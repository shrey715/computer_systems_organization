#include<stdio.h>

extern short unique_peaks(short* arr, int n);

// short unique_peaks(short* arr, int n){
//     int l=0;
//     int r=n-1;
//     int mid;
    
//     while(l<=r){
//         mid=l+(r-l)/2; 
        
//         if((mid == 0 || arr[mid] >= arr[mid-1]) && (mid == n-1 || arr[mid] >= arr[mid+1])){
//             return arr[mid];
//         }
//         if(mid<n-1 && arr[mid]<arr[mid+1]){
//             l=mid+1;
//         }else{
//             r=mid-1;
//         }
//     }
//     return -1;
// }

int main(){
    int n;
    scanf("%d", &n);
    short arr[n];
    for(int i=0; i<n; i++){
        scanf("%hd", &arr[i]);  
    }
    short ans = unique_peaks(arr, n);
    if(ans == -1){
        printf("No peaks found\n");
        return 0;
    }
    printf("%hd\n", ans); 
    return 0;
}