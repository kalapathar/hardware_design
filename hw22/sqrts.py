# print square roots in Python language.  R. Brown, 9/2010 

from math import sqrt
import sys

if (len(sys.argv))>1:
  max=int(sys.argv[1])
  print("sqrt(n)\n--------")
  for n in range(0, max+1):
    print(sqrt(n))
else:
	print("Enter atleast 1 argument")
