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

Boolean gameOver = false;


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

  // Collisions for Asteroids & Spaceship
  for(int i = 0; i < astArr.size(); i++){
    if(dist((float)(ss.getCenterX()), (float)(ss.getCenterY()), (float)(astArr.get(i).getCenterX()), (float)(astArr.get(i).getCenterY())) < 20){
      gameOver = true;
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


  // Game Over
  if(gameOver == true){
    gameEnd();
  }


  // Reset Asteroids
  if(astArr.size() == 0){
    for(int i =0 ; i < 10; i++){
      astArr.add(new Asteroid());
      astArr.get(i).accelerate(2);
    }
  }
}

public void gameEnd(){
  fill(255); 
  textSize(100);
  text("Game Over", width/2 - 275, height/2);
  textSize(50);
  text("Enter - Restart", width/2 - 175, height/2+75);
  ss.stop();
}


public void keyPressed(){
	if(key == 'a'){
		aTurn = true;
  }
  if(key == 'd'){
		dTurn = true;
	}
  if(key == 'w'){
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



  if(key == ENTER){
    background(255);
    gameOver = false;

    ss.restart();
    starArr = new Star[200];
    astArr = new ArrayList <Asteroid>();
    bulArr = new ArrayList <Bullet>();

    Boolean aTurn = false;
    Boolean dTurn = false;
    Boolean wMove = false;
    Boolean sStop = false;
    Boolean qHyper = false;
    Boolean spaceShoot = false;

    setup();
  }
}

public void keyReleased(){
  if (key == 'a'){
    aTurn = false;
  }
  if(key == 'd'){
    dTurn = false;;
  }
  if(key  == 'w'){
    wMove = false;
  }
  if(key == 's'){
    sStop = false;
  }
  if(key == 'q'){
    qHyper = false;
  }
  if(key == ' '){
    spaceShoot = false;
  }
}