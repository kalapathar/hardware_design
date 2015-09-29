#include<iostream>
using namespace std;

int main(){
int n;
int i;
int result=0;
cout<<"Enter a positive integer"<<endl;
cin>>n;

do{
	result=result+i*i;
	i=i+1;

}while (i<=n);
cout<<"The sum of the squares of the first "<<n<<" integers are "<<result<<endl;
return 0;

	
}