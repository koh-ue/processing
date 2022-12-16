float angle=0.0;

void setup(){
  size(800,600);
  frameRate(60);
  fill(0,127,255);
  noStroke();
}

void draw(){
  background(0);
  //the origin is moved to (width/2,height/2).
  translate(width/2,height/2);
  
  rotate(angle);
  stroke(0);
  rectMode(CENTER);
  rect(0,0,300,300);
  angle+=0.1;
}
