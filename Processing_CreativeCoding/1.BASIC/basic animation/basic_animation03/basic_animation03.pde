float angle=0.0;

void setup(){
  size(800,600);
  frameRate(60);
  fill(0,127,255);
  noStroke();
}

void draw(){
  background(0);
  rotate(angle);
  //drawing rectangles from the center point.
  rectMode(CENTER);
  rect(400,300,300,300);
  
  angle+=0.1;
}
