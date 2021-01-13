int w = 10;
int h = 20;
int q = 20;//blocks width and height
int dt;// delay between each move
int currentTime;
Grid grid;
Piece piece;
Piece nextPiece;
Pieces pieces;
Score score;
int r = 0;//rotation status, from 0 to 3
int level = 1;
int nbLines = 0;

int txtSize = 20;
int textColor = color(34, 230, 190);

Boolean gameOver = false;
Boolean gameOn = false;

void setup()
{
  size(600, 480, P2D);
  textSize(20);
}

void initialize() {
  level = 1;
  nbLines = 0;
  dt = 1000;
  currentTime = millis();
  score = new Score();
  grid = new Grid();
  pieces = new Pieces();
  piece = new Piece(-1);
  nextPiece = new Piece(-1);
}

void draw()
{
  background(60);

  if(grid != null){
    grid.drawGrid();
    int now = millis();
    if (gameOn) {
      if (now - currentTime > dt) {
        currentTime = now;
        piece.oneStepDown();
      }
    }
    piece.display(false);
    score.display();
  }
  if (gameOver) {
    noStroke();
    fill(255, 60);
    rect(110, 195, 240, 2*txtSize, 3);
    fill(textColor);
    text("Game Over", 120, 220);
  }
  if (!gameOn) {
    noStroke();
    fill(255, 60);
    rect(110, 250, 255, 2*txtSize, 3);
    fill(textColor);
    text("press 'p' to start playing!", 120, 280);
  }
}

void goToNextPiece() {
  //println("-- - nextPiece - - --");
  piece = new Piece(nextPiece.kind);
  nextPiece = new Piece(-1);
  r = 0;
}

void goToNextLevel() {
  score.addLevelPoints();
  level = 1 + int(nbLines / 10);
  dt *= .8;
  //soundLevelUp();
}

void keyPressed() {
  if (key == CODED && gameOn) {
    switch(keyCode) {
    case LEFT:
    case RIGHT:
    case DOWN:
    case UP:
    case SHIFT:
      piece.inputKey(keyCode);
      break;
    }
  } else if (keyCode == 80) {// "p"
    if(!gameOn){
      initialize();
      //soundGameStart();
      gameOver = false;
      gameOn = true;
    }
  } else if (keyCode == 77) {// "m"
   
  }
}
