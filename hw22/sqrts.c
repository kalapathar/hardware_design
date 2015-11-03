

/* print square roots in C language.  R. Brown, 9/2010 */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

main(int argc, char **argv)
{
	if(argc>=2){
 int n;
 int max=atoi(argv[1]);
  printf("sqrt(n)\n--------\n");
  for (n=0;  n<=max;  n++)
    printf("%f\n", sqrt(n));
}else{
	printf("Please enter at least 1 argument \n");
}

  return 0;
}

