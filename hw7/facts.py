# print square roots in Python language.  R. Brown, 9/2010 

from math import sqrt


def factorial(x):
	result=1
	i=1
	while (i>=1 and i<(n+1)):
		result=result*i
		i=i+1

	return result

print("n\tn!\n----------------")
n=0
while (n<6):
    print(n,"\t",factorial(n))
    n=n+1