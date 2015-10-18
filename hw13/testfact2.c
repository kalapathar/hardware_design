#include<stdio.h>


int factorial(int n){
	if(n>1){
	n= n*factorial(n-1);
}
return n;
}

int main(){
	int x=factorial(10);
	printf("The factorial is %d",x);

}