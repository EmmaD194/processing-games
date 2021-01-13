class Ball {

float dx; float dy;
int radius;
color ballColor = color(50);
Ball(){
x = random(SCREENX/4, SCREENX/2);
y = random(SCREENY/4, SCREENY/2);
dx = random(1, 2); dy = random(1, 2);
radius=5;
}
void move(){
x = x+dx; y = y+dy;
}
void draw(){
fill(ballColor);
ellipse(int(x), int(y), radius,
radius);
}


void collide(Player tp){
if(x-radius <=0) dx=-dx;
else if(x+radius>=SCREENX) dx=-dx;
if(y+radius >= tp.ypos &&
y-radius<tp.ypos+PADDLEHEIGHT &&
x >=tp.xpos && x <=
tp.xpos+PADDLEWIDTH){
dy=-dy;
}
}
void collide1(Computer tc){
if(y+radius >= tc.cypos &&
y-radius<tc.cypos+PADDLEHEIGHT &&
x >=tc.cxpos && x <=
tc.cxpos+PADDLEWIDTH){
dy=-dy;
}
}

}
