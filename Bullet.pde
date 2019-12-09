class Bullet extends Floater{

	public Bullet(){
		myCenterX = ss.getCenterX();
		myCenterY = ss.getCenterY();
		myPointDirection = ss.getPointDirection();
		myDirectionX = 5*Math.cos(ss.getPointDirection()*(Math.PI/180)) + ss.getDirectionX();
		myDirectionY = 5*Math.sin(ss.getPointDirection()*(Math.PI/180)) + ss.getDirectionY();
	}
	
	public void move(){
		myCenterX += myDirectionX;    
    	myCenterY += myDirectionY;  
	}

	public void show(){
		fill(#D41D1D);
		ellipse((float)myCenterX, (float)myCenterY, 10, 10);
	}
	public double getPointDirection() {return myPointDirection;}
	public double getCenterX() {return myCenterX;}
    public double getCenterY() {return myCenterY;}
}