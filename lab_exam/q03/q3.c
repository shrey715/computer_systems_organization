#include<stdio.h>
#define ll long long 

/**
 * ! You are given a string s. The score of a string is defined as the sum of the absolute difference between the ASCII values of adjacent characters. Return the score of s. 
 * @param s the string to be scored
 * @return the score of the string
 */

extern ll score(char* s);

int main(){
    char s[200];
    scanf("%s", s);

    printf("%lld\n", score(s));
    
    return 0;
}