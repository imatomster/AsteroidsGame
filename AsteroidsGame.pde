// Create Spaceship
Spaceship ss = new Spaceship();
// Create Star Background
Star[] starArr = new Star[200];
public void setup() 
{
  // Setup
  size(600,600);
  background(0);

  // Star Setup
  for(int i = 0; i < starArr.length; i++){
  	starArr[i] = new Star();
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

  // Trouble Shoot for smooth turn transition
  // println(ss.getMyPointDirection());
}

public void keyPressed(){
	if (key == 'a'){
		ss.turn(-20);
	}else if(key == 'd'){
		ss.turn(20);
	}else if(key  == 'w'){
		ss.accelerate(.2);
	}else if(key == 's'){
		ss.stop();
	}else if(key == TAB){
		ss.stop();
		ss.hyperSpace();
	}
}

