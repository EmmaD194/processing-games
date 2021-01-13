class Alien {
 
  float xpos;
  float true_xpos;
  float true_ypos;
  float ypos;
  float xspeed; 
  boolean imaDeadAlien=false;
  final int ALIEN_ALIVE=0;
  final int ALIEN_DEAD=6;
  final int FORWARD=0;
  final int BACKWARD=1;
  int x, y, direction;
  int status;
  PImage normalImg, explodeImg;



  Alien (int xpos, int ypos, PImage okImg, PImage exImg) {
    x = xpos;
    y = ypos;
    normalImg=okImg;
    explodeImg=exImg;
    status = ALIEN_ALIVE;

    direction=FORWARD;
  }





  void move() {
    if (direction==FORWARD) {
      if (x+normalImg.width<SCREENX-1)
        x++;
      else {
        direction=BACKWARD;
        y+=normalImg.height+GAP;
      }
    } else if (x>0) x--;
    else {
      direction=FORWARD;
      y+=normalImg.height+GAP;
    }
  } 


  void draw() {
    if (status==ALIEN_ALIVE)
      image(normalImg, x, y);
    else if (status!=ALIEN_DEAD) {
      image(explodeImg, x, y);
      status++;
    }
    true_xpos=xpos+30;
    true_ypos=ypos+25;
    // otherwise dead, don't draw anything
  }
  void die() {
    if (status==ALIEN_ALIVE)
      status++;
  }
}
