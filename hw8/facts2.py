# print square roots in Python language.  R. Brown, 9/2010 

from math import sqrt


def factorial(x):
	ans=1
	for i in range(1,x+1):
		ans=ans*i
	return ans
global ans
print("n\tn!\n----------------")

for n in range(0, 6):
    print(n,"\t",factorial(n))
