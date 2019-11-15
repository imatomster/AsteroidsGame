class Spaceship extends Floater  
{   
    // New Initializations
    private int[] boostX;
    private int[] boostY;

    Spaceship(){
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

        // Spaceship Booster
        boostX = new int[corners];
        boostY = new int[corners];
        boostX[0] = -10;
        boostY[0] = -8;
        boostX[1] = -10;
        boostY[1] = 8;
        boostX[2] = -18;
        boostY[2] = 0;

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
        fill(255,99,71);   
        stroke(255,99,71);  

        //translate the (x,y) center of the ship to the correct position
        translate((float)myCenterX, (float)myCenterY);

        //convert degrees to radians for rotate()     
        float dRadians = (float)(myPointDirection*(Math.PI/180));
        
        //rotate so that the polygon will be drawn in the correct direction
        rotate(dRadians);
        
        //draw the polygon
        beginShape();
        for (int nI = 0; nI < corners; nI++)
        {
          vertex(boostX[nI], boostY[nI]);
        }
        endShape(CLOSE);

        //"unrotate" and "untranslate" in reverse order
        rotate(-1*dRadians);
        translate(-1*(float)myCenterX, -1*(float)myCenterY);
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
    public double getMyPointDirection(){return myPointDirection;}
}
