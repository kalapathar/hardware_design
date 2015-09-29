#include<iostream>
using namespace std;

int main(){
int n;
int i;
int result=0;
cout<<"Enter a positive integer"<<endl;
cin>>n;

while (i<=n){
	result=result+i*i;
	i=i+1;
}
cout<<"The sum of the squares of the first "<<n<<" integers are "<<result<<endl;
return 0;

	
}