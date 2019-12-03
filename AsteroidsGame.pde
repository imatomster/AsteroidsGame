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
  for(int i = 0; i < 1; i++){
    astArr.add(new Asteroid());
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

  for(int i = 0; i < astArr.size(); i++){
    astArr.get(i).rotate();
    astArr.get(i).move();
    astArr.get(i).show();
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
