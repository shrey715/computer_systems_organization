#include<stdio.h>
#include<stdbool.h>
#define ll long long

/**
 * ! Write an assembly language program to determine whether a given string of characters, consisting of parentheses (including ‘(’,’{’, and ‘[’), is balanced or not. The program should use stack operations to solve the problem. The program should take an input string and its length as arguments and return 1 if the parentheses in the string are balanced, and 0 otherwise. Using this returned value, make your C program output “BALANCED” if the string is balanced, and “NOT BALANCED” if the string is not balanced (do not print the quotes). A balanced string is defined as one where each opening parenthesis has a corresponding closing parenthesis in the correct order. For example, the string “([]){}” is balanced, while the string “{[()}]” is not balanced. You can assume input string only contains parentheses.
 * @param str The input string containing parentheses.
 * @param length The length of the input string.
 */

extern bool is_balanced(char *str, int length);
// bool is_balanced(char *str, int n) {
//     ll stack[n];
//     ll top = -1;
//     for(int i=0;i<n;i++){
//         if(str[i]=='(' || str[i]=='{' || str[i]=='['){
//             stack[++top] = str[i];
//         } else {
//             if(top == -1) return false;
//             char last = stack[top--];
//             if((str[i]==')' && last!='(') || (str[i]=='}' && last!='{') || (str[i]==']' && last!='[')){
//                 return false;
//             }
//         }
//     }
//     return true;
// }


int main() {
    ll n;
    scanf("%lld", &n);
    char str[n+1];
    scanf("%s", str);

    if (is_balanced(str, n)) {
        printf("BALANCED\n");
    } else {
        printf("NOT BALANCED\n");
    }

    return 0;
}