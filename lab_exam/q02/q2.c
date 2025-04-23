#include<stdio.h>
#include<stdbool.h>

/**
 * ! Given a number N, check if it is a palindrome or not.? Palindromes are those numbers which read the same backward and forward. 1, 363, 1331 are palindromes while 10, 456 are not.
 * @param s the string to check
 * @return true if the string is a palindrome, false otherwise
 */

extern bool is_palindrome(char* s);

int main(){
    char s[100];
    scanf("%s", s);

    if (is_palindrome(s)) {
        printf("True\n");
    }else{
        printf("False\n");
    }
    
    return 0;
}