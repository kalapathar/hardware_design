/* print square roots in Java language.  R. Brown, 9/2010 */

class Facts {
	static long factorial(int x){
		int y;
		int result=1;
    y=1;
		while(y<(x+1)){
      
			result=result*y;
      y=y+1;
		}
return result;
	}
  public static void main(String args[]) {
    System.out.println("n\tn!");
    System.out.println("----------------");
    int n;
    n=0;
    while(n<=5){
      System.out.println(n+"\t"+Facts.factorial(n));
    n=n+1;
    }
    
      
    return;

  }
}