class Asteroid extends Floater{

	private int rotSpeed;

	Asteroid(){
		// Asteroids Design
    	corners = 7;
    	xCorners = new int[] {0,-20,-24,-11,11,24,20};
    	yCorners = new int[] {-25,-16,6,23,23,6,-16};

        // Asteroids Variables
    	myColor = color(169,169,169);
    	myDirectionX = 0;
    	myDirectionY = 0;
    	myCenterX = 300;
    	myCenterY = 300;
    	myPointDirection = (int)(Math.random()*361);
	}

	public void move(){
		double dRadians =myPointDirection*(Math.PI/180);
		myDirectionX = ((2) * Math.cos(dRadians));    
    	myDirectionY = ((2) * Math.sin(dRadians));  
		super.move();
	}

	public void rotate(){

	}

	public void show(){
		super.show();
	}

	
}