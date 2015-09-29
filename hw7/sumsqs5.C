#include<iostream>
using namespace std;

int main(){
int n;
int result=0;
cout<<"Enter a positive integer"<<endl;
cin>>n;

for (int i=0;i<=n;i++){
	result=result+i*i;
}
cout<<"The sum of the squares of the first "<<n<<" integers are "<<result<<endl;
return 0;

	
}