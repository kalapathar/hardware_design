#include<iostream>
using namespace std;

int main(){
	int N;
	cout<<"Enter how many values you want to input"<<endl;
	cin>>N;
	cout<<"Enter the "<<N<<" floating point values"<<endl;
	
    float *p=new float[N];
    for(int i=0;i<N;i++){
    	float x;
    	cin>>x;
    	p[i]=x;
    }
    cout<<"In reverse order, your input is:"<<endl;
    for(int i=(N-1);i>=0;i--){
    	cout<<p[i]<<endl;
    }
    delete[] p;
}