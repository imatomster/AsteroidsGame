// Create Spaceship
Spaceship ss = new Spaceship();
// Create Star Background
Star[] starArr = new Star[200];
// Create Asteroids Array
ArrayList <Asteroid> astArr = new ArrayList <Asteroid>();

public void setup() 
{
  // Setup
  size(600,600);
  background(0);

  // Star Setup
  for(int i = 0; i < starArr.length; i++){
  	starArr[i] = new Star();
  }

  // Asteroid Setup
  for(int i = 0; i < 10; i++){
    astArr.add(new Asteroid());
    astArr.get(i).accelerate(2);
  }
}

public void draw() 
{
  // Reset Background
  background(0);
  for(int i = 0; i < starArr.length; i++){
  	starArr[i].show();
  }

  // Space Ship
  ss.move();
  ss.show();

  // Asteroids
  for(int i = 0; i < astArr.size(); i++){
    astArr.get(i).move();
    astArr.get(i).show();
  }

  // Collisions
  for(int i = 0; i < astArr.size(); i++){
    if(dist((float)(ss.getCenterX()), (float)(ss.getCenterY()), (float)(astArr.get(i).getCenterX()), (float)(astArr.get(i).getCenterY())) < 20){
      astArr.remove(i);
    }
  }
}

public void keyPressed(){
	if (key == 'a'){
		ss.turn(-20);
	}else if(key == 'd'){
		ss.turn(20);
	}else if(key  == 'w'){
		ss.accelerate(.5);
		ss.boost();
	}else if(key == 's'){
		ss.stop();
	}else if(key == ' '){
		ss.stop();
		ss.hyperSpace();
	}
}
