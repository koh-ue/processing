float x;
float y;

void setup(){
  size(800,600);
  background(0);
  frameRate(60);
  x=width/2;
  y=height/2;
}

void draw(){
  stroke(255);
  noFill();
  point(x,y);
  x+=random(-4,4);
  y+=random(-4,4);
}
