class Asteroid extends Floater{

	private int rotSpeed;

	Asteroid(){
		// Asteroids Design
    	corners = 5;
    	xCorners = new int[corners];
    	yCorners = new int[corners];
    	xCorners[0] = -8;
    	yCorners[0] = -8;
    	xCorners[1] = 16;
    	yCorners[1] = 0;
    	xCorners[2] = -8;
    	yCorners[2] = 8;

        // Asteroids Variables
    	myColor = color(169,169,169);
    	myCenterX = 300;
    	myCenterY = 300;
    	myDirectionX = 0;
    	myDirectionY = 0;
    	myPointDirection = 0;
	}

	public void move(){

	}

	public void show(){
		super.show();
	}

	
}