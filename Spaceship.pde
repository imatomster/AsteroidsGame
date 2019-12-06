class Spaceship extends Floater  
{   
    // New Initializations
    private int[] boostX;
    private int[] boostY;
    private int[] tempX;
    private int[] tempY;
    private int tempC;

    public Spaceship(){
        // Spaceship Design
    	corners = 3;
    	xCorners = new int[corners];
    	yCorners = new int[corners];
    	xCorners[0] = -8;
    	yCorners[0] = -8;
    	xCorners[1] = 16;
    	yCorners[1] = 0;
    	xCorners[2] = -8;
    	yCorners[2] = 8;

        tempX = xCorners;
        tempY = yCorners;

        // Spaceship Booster
        boostX = new int[corners];
        boostY = new int[corners];
        boostX[0] = -10;
        boostY[0] = -8;
        boostX[1] = -10;
        boostY[1] = 8;
        boostX[2] = -18;
        boostY[2] = 0;

        tempC = 255;

        // Spaceship Variables
    	myColor = 255;
    	myCenterX = 300;
    	myCenterY = 300;
    	myDirectionX = 0;
    	myDirectionY = 0;
    	myPointDirection = 0;
    }

    // From Floater "show();"
    // The same except changed array to custom "boostX & boostY" array
    public void boost(){
        // Change to Boost Variables
        myColor = color(255,99,71);
        xCorners = boostX;
        yCorners = boostY; 

        super.show();

        // Reset back to Spaceship
        xCorners = tempX;
        yCorners = tempY;
        myColor = tempC;

    }

    public void stop(){
        myDirectionX = 0;
        myDirectionY = 0;
    }

    public void hyperSpace(){
        myCenterX = (int)(Math.random()*width);
        myCenterY = (int)(Math.random()*height);
        myPointDirection = (Math.random()*361);
    }

    public double getCenterX() {return myCenterX;}
    public double getCenterY() {return myCenterY;}
    public double getPointDirection() {return myPointDirection;}
    public double getDirectionX() {return myDirectionX;}
    public double getDirectionY() {return myDirectionY;}

}
