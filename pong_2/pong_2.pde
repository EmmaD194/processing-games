final int SCREENX = 320;
final int SCREENY = 240;
final int PADDLEHEIGHT = 15;
final int PADDLEWIDTH = 50;
final int MARGIN = 10;
final int winScore = 3;

int scoreComputer= 0;
int scorePlayer = 0;
float x; float y;
int cxpos; int cypos;
boolean gameFinished = false;

Player thePlayer;
Ball theBall;
Computer theComputer;

void settings(){
size(SCREENX, SCREENY);
}
void setup(){
thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
theBall = new Ball();
theComputer = new Computer(0+MARGIN + PADDLEHEIGHT);
ellipseMode(RADIUS);
}

void draw() {
background(255, 255, 255);
text();
thePlayer.move(mouseX);
theComputer.move(cxpos);
theBall.move();
theBall.collide(thePlayer);
theBall.collide1(theComputer);
thePlayer.draw();
theBall.draw();
theComputer.draw();
}
void text(){
  PFont myFont = loadFont("Impact-18.vlw");
  textFont(myFont);
  fill(255);
  text(scoreComputer, 10, 10);
  text(scorePlayer, 300, 10);
}
 
void gameOver() {
} {
  if(scoreComputer == winScore) {
    text("The Computer won, GAME OVER!", 20, 20);
  }
  if(scorePlayer == winScore) {
    text("You won, Well done!", 20, 20);
  }
}
void gameOverPage(String text)
{
  fill(255);
  text("Game over", SCREENX/2, SCREENY/3);
  text("Click to play again", SCREENX/2, SCREENY/3 -40);
}
void mousePressed(){
 reset();
}
void reset() {
 if (y > SCREENY){
 scoreComputer = scoreComputer+1;
 if (scoreComputer == winScore) {gameOver();}
 gameFinished = true;
 x= 160; y= 120;
 }
else if (y < 0){
 scorePlayer = scorePlayer+1;
 if (scorePlayer == winScore) {gameOver();} 
 gameFinished = true;
 x=160; y=120;
 }
 }


 
