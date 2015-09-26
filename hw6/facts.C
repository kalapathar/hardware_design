/* print square roots in C++ language.  R. Brown, 9/2010 */

#include <iostream>
#include <cmath>

using namespace std;
double ans;

double factorial(int x){
	
	for(int i=1;i<(x+1);i++){
		ans=ans*i;
	}
	return ans;
}

main()
{
 
  cout << "n\tn!" << endl << "----------------" << endl;
  for (int n=0;  n<=5;  n++){
  	ans=1;
  	cout<<n;
  	cout << "\t"<<factorial(n) << endl;
}
  return 0;
}

