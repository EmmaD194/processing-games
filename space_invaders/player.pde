class Player {
  //declare variables
 
  
  int playerWidth = 20;
  int playerHeight = 10;
  int xpos;
  int ypos;
  

  //constructor
  Player( int temp_xpos, int temp_ypos) {
    
    
    xpos=temp_xpos;
    ypos=temp_ypos;
  }

  void display() {
    
    noStroke();
    fill(color1);
    rect(xpos, ypos, playerWidth, playerHeight);
  }

  void move() {
    xpos=mouseX;
    
  }

  void onScreen() {
    if (xpos<0) {
      xpos=width;
    }
    if (xpos>(width)) {
      xpos=(0);
    }
  } 


  void lastGuy() {
    println(deadAliens);
    if (deadAliens==9) {
      lastGuy=1;
    } else { 
      lastGuy=0;
    }
  }
}
