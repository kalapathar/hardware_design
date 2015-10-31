/* print square roots in C++ language.  R. Brown, 9/2010 */

#include <iostream>
#include <cmath>
#include <cstdlib>

using namespace std;

int main(int argc, char **argv)
{
	
	if(argc>=2){
	int max=atoi(argv[1]);
for (int n=0;  n<=max;  n++)
    cout << sqrt(n) << endl;
}else{
	cout<<"Please enter an argument"<<endl;
}
  return 0;
}

