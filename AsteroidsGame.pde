// Create Spaceship
Spaceship ss = new Spaceship();
// Create Star Background
Star[] starArr = new Star[200];
// Create Asteroids ArrayList
ArrayList <Asteroid> astArr = new ArrayList <Asteroid>();
// Create Bullets ArrayList
ArrayList <Bullet> bulArr = new ArrayList <Bullet>();


// Global Variables
Boolean aTurn = false;
Boolean dTurn = false;
Boolean wMove = false;
Boolean sStop = false;
Boolean qHyper = false;
Boolean spaceShoot = false;


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

  // Move SpaceShip
  if (aTurn == true){
    ss.turn(-4);
  }
  if(dTurn == true){
    ss.turn(4);
  }
  if(wMove == true){
    ss.accelerate(.07);
    ss.boost();
  }
  if(sStop == true){
    ss.stop();
  }
  if(qHyper == true){
    ss.stop();
    ss.hyperSpace();
  }
  if(spaceShoot == true){
    bulArr.add(new Bullet());
  }

  if(aTurn == true && key != 'a'){
    aTurn = false;
  }else if(dTurn == true && key != 'd'){
    dTurn = false;
  }else if(wMove == true && key != 'w'){
    wMove = false;
  }else if(sStop == true && key != 's'){
    sStop = false;
  }else if(qHyper == true && key != 'q'){
    qHyper = false;
  }else if(spaceShoot = true && key != ' '){
    spaceShoot = false;
  }


  // Asteroids
  for(int i = 0; i < astArr.size(); i++){
    astArr.get(i).move();
    astArr.get(i).show();
  }

  // Bullets
  for(int i = 0; i < bulArr.size(); i++){
      bulArr.get(i).move();
      bulArr.get(i).show();

      if(bulArr.get(i).getCenterX() < 0 || bulArr.get(i).getCenterX() > width){
        bulArr.remove(i);
        i--;
      }else if(bulArr.get(i).getCenterY() < 0 || bulArr.get(i).getCenterY() > height){
        bulArr.remove(i);
        i--;
      }
  }

  // Collisions for Asteroids %& Spaceship
  for(int i = 0; i < astArr.size(); i++){
    if(dist((float)(ss.getCenterX()), (float)(ss.getCenterY()), (float)(astArr.get(i).getCenterX()), (float)(astArr.get(i).getCenterY())) < 20){
      astArr.remove(i);
      break;
    }

    for(int a = 0; a < bulArr.size(); a ++){
      if(dist((float)(bulArr.get(a).getCenterX()), (float)(bulArr.get(a).getCenterY()), (float)(astArr.get(i).getCenterX()), (float)(astArr.get(i).getCenterY())) < 20){
        astArr.remove(i);
        bulArr.remove(a);
        break;
      }
    }
  }

  // Reset Asteroids
  if(astArr.size() == 0){
    for(int i =0 ; i < 10; i++){
      astArr.add(new Asteroid());
      astArr.get(i).accelerate(2);
    }
  }
}

public void keyPressed(){
	if (key == 'a'){
		aTurn = true;
	}
  if(key == 'd'){
		dTurn = true;;
	}
  if(key  == 'w'){
		wMove = true;
	}
  if(key == 's'){
		sStop = true;
	}
  if(key == 'q'){
		qHyper = true;
	}
  if(key == ' '){
    spaceShoot = true;
  }
}
