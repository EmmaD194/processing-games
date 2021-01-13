class Computer {
float cxpos; float cypos;
color paddlecolor = color(75, 0, 130);
Computer(int screen_c)
{
cxpos=SCREENX/2;
cypos=screen_c;
}

void move(int e){
if(e>SCREENX-PADDLEWIDTH) cxpos = SCREENX-PADDLEWIDTH;
else cxpos=x+10;
}

void draw()
{ 
fill(paddlecolor);
rect(cxpos, cypos, PADDLEWIDTH, PADDLEHEIGHT);
}
}
