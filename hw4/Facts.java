/* print square roots in Java language.  R. Brown, 9/2010 */

class Facts {
	static long factorial(int x){
		int y;
		int result=1;
		for (y=1;y<(x+1);y++){
			result=result*y;
		}
return result;
	}
  public static void main(String args[]) {
    System.out.println("n\tn!");
    System.out.println("----------------");
    int n;
    for (n=0;  n<=5;  n++)
      System.out.println(n+"\t"+Facts.factorial(n));
    return;

  }
}