Player thePlayer;
ArrayList bullets;
ArrayList bombs;
final int SCREENX=400;
final int SCREENY=400;
float distance_enemy;
int lives;
int GAP = 10;
int cols= 10;
int rows =1;
int cols_select;
int rows_select;
Alien theAliens[]; 
color color1 = color(26, 0, 255);
color color2 = color(255, 0, 213);
color color3 = color(255, 255, 0);

Timer timer;

boolean gameOn=true;
int deadAliens=0;
int lastGuy=0;


void setup() {
  size(400, 400);
  smooth();
  
  PImage normalImg, explodeImg;
  normalImg= loadImage("spacer.GIF");
  explodeImg = loadImage("exploding.GIF");
  theAliens = new Alien[10];
  init_aliens(theAliens, normalImg, explodeImg);

  lives = 5;


  //initialize the bulletArrayList
  bullets = new ArrayList();
  bombs = new ArrayList();

  thePlayer = new Player(190, 385);

  


  //starts the Timer
  timer = new Timer(350);
  timer.start();
}

void init_aliens(Alien enemies[], PImage normalImg, PImage
  explodeImg) {
  for (int i=0; i<enemies.length; i++) {

    enemies[i] = new Alien(i*(normalImg.width+GAP), 0, normalImg, 
      explodeImg);
  }
}

void draw() {
  background(0);
  //fill(0, 50);
  //rect(0, 0, width, height);

 // fill(255);
 // textSize(15);
//  text("Control the spaceship's movement along the x axis by moving your mouse", 150, 110);
//  text("Click to fire", 150, 130);
//  text("Don't get hit by the bombs!", 150, 150);

  //float c = (random(4));
 // if (c > 3) {
 //   fill(#FCFC00);
 // }
 // else {
 //   fill(#FFFFFF);
 // }
//  ellipse (random(width), random(height), 5, 5);


  thePlayer.display();
  thePlayer.move();
  thePlayer.onScreen();
  thePlayer.lastGuy();



  for (int i=0; i< cols; i++) {
    
      theAliens[i].draw();
      theAliens[i].move();
      
      
    
  }



  for (int i=0; i < bullets.size(); i++) {

    Bullet b = (Bullet) bullets.get(i);
    b.display();
    b.fire();

    if (b.finished()) {
      bullets.remove(b);
    }
    for (int k=0; k< cols; k++) {
     
        if (b.collide(theAliens[k])) {
          bullets.remove(b);
          theAliens[k].die();
          deadAliens=deadAliens+1;
        
      }
    }
  }

  for (int i=0; i < bombs.size(); i++) {

    Bomb bomb = (Bomb) bombs.get(i);
    bomb.display();
    bomb.move();
    
    if( bomb.intersect(thePlayer ) ){ // If this bomb has hit the space ship...
      if( lives > 0 ){ // If you have a life to lose...
        lives--; // You now have one less life.
        bombs.remove(bomb); // And this bomb "explodes"
      }
    }
    
    if (bomb.offScreen()) {
      bombs.remove(bomb);
    }
  }


  for (int i=0; i< cols; i++) {
    
      int cols_select=int(random(cols));
         
      if (timer.isFinished() && theAliens[cols_select].imaDeadAlien==false) {
        bombs.add(new Bomb(theAliens[cols_select].x, theAliens[cols_select].y , -5));
        timer.start();
      
    }
  }

  fill(255, 0, 0);
  textSize(12.5);
  text ("Lives = " + lives, 10, 30);



  if (lives< 1) {
    fill(0);
    rect (0, 0, width, height);
    fill(255);
    textSize(30);
    text("Game Over", 120, SCREENY/2);
  }
}
//float xpos;
//float ypos;



//end draw

void mousePressed() {
  bullets.add(new Bullet(int(random(180, 220)), 200, 200, (thePlayer.xpos + 10), 880, 10));
}
//end mousePressed
