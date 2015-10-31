#include<stdio.h>
#include<stdlib.h>

int main(){
	int N;
	printf("Enter how many values you want to input");
	scanf("%d",&N);
	
	printf("Enter the %d floating point values \n",N);
	
	float *p=(float*)malloc(N*sizeof(float));

	for(int i=0;i<N;i++){
		float x;
		scanf("%f",&x);
		p[i]=x;
	}
	printf("In reverse order, your input is: \n");
	for(int i=(N-1);i>=0;i--){
		printf("%f \n",p[i]);
	}

free(p);

	printf("the size of %d", sizeof(float));



}