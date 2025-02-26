#include<stdio.h>

int main(void)
{
#ifdef MY_MACRO
  printf("\n Macro defined \n");
#endif
  char c = -10;
  // Print the string
   printf("\n Welcome to CSO Tute [%d]\n", c);
   return 0;
}