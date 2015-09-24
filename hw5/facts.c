
#include <stdio.h>
#include <math.h>
int i;
double factorial(int x){
	double ans=1;
	
	/* Invariant: ans contains the product until the first i-1 number */
	while (i<(x+1)){
		ans=ans*i;
		i=i+1;
	}
	return ans;
}

main()
{
  i=1;
  printf("n\tn!\n----------------\n");
  int n=0;
do{
	 printf("%d\t%f\n",n, factorial(n));
	 n=n+1;

} while ( n<=5);
return 0;
   
  
}