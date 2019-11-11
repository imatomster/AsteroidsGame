class Star //note that this class does NOT extend Floater
{
  //your code here
  private int x;
  private int y;
  private int c;
  private int size;

  Star(){
  	x = (int)(Math.random()*width);
  	y = (int)(Math.random()*height);
  	c = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  	size = (int)(Math.random()*5);
  }

  public void show(){
  	noStroke();
  	fill(c);
  	ellipse(x,y,size,size);
  }
}
