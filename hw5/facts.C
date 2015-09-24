/* print square roots in C++ language.  R. Brown, 9/2010 */

#include <iostream>
#include <cmath>

using namespace std;

double factorial(int x){
	double ans=1;
	int i=1;
	while(i<(x+1)){
				ans=ans*i;
				i++;

	}
	return ans;
}

main()
{
  cout << "n\tn!" << endl << "----------------" << endl;
  int n=0;
  while(  n<=5){

  	cout<<n;
  	cout << "\t"<<factorial(n) << endl;
    n++;
}
  return 0;
}

