

/* print square roots in C language.  R. Brown, 9/2010 */

#include <stdio.h>
#include <math.h>

double factorial(int x){
	double ans=1;
	
	for(int i=1;i<(x+1);i++){
		ans=ans*i;
	}
	return ans;
}

main()
{
  
  printf("n\tn!\n----------------\n");
  for (int n=0;  n<=5;  n++)
    printf("%d\t%f\n",n, factorial(n));
  return 0;
}

