class Bomb {

  float xpos;
  float ypos;
  float yspeed;


  Bomb( float temp_xpos, float temp_ypos, float temp_yspeed) {

    xpos = temp_xpos;
    ypos = temp_ypos;
    yspeed = temp_yspeed;
  } 

  void display() {
    fill(color3);
    rect(xpos, ypos, 4, 10);
  }




  void move() {
    ypos=ypos-yspeed;
  }

  boolean offScreen() {

    if (ypos-yspeed < 0 || ypos-yspeed > 950) return true;
    else return false;
  }

  boolean intersect(Player p) { 
    if (((ypos + (10/2) >= p.ypos && ypos - (10/2) < (p.ypos + 25)) 
      && (xpos >= p.xpos && xpos <= (p.xpos + 30)) ))
    {
      return true;
    } else {
      return false;
    }
  }
}
