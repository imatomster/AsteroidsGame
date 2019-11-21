class Asteroid extends Floater{

	private int rotSpeed;

	Asteroid(){
		// Asteroids Design
    	corners = 7;
    	xCorners = new int[] {0,-20,-24,-11,11,24,20};
    	yCorners = new int[] {-25,-16,6,23,23,6,-16};

        // Asteroids Variables
    	myColor = color(169,169,169);
    	myCenterX = 300;
    	myCenterY = 300;
    	myDirectionX = 0;
    	myDirectionY = 0;
    	myPointDirection = 0;
	}

	public void move(){
		super.move();
	}

	public void show(){
		super.show();
	}

	
}