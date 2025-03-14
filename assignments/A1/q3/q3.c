#include<stdio.h>
#include<stdbool.h>

extern bool is_palindrome(char* s);

int main(){
    char* s;
    scanf("%s", s);

    printf("%d\n", is_palindrome(s));
    
    return 0;
}