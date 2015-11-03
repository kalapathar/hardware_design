/* print square roots in Java language.  R. Brown, 9/2010 */

import java.io.*;

class Sqrts {

  public static void main(String args[]) {

  	if(args.length>0){
  	System.out.println("sqrt(n)");
    System.out.println("--------");
    int n;
    int max=Integer.parseInt(args[0]);
    for (n=0;  n<=max;  n++)
      System.out.println(Math.sqrt(n));
	
}else{
	System.out.println("Please Enter atleast 1 argument");
}
        return;

  }
}