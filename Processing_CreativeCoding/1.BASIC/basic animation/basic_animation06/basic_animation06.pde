float angle=0.0;

void setup(){
  size(800,600);
  frameRate(60);
  fill(0,127,255);
  noStroke();
}

void draw(){
  background(0);
  
  // first lotation
  pushMatrix();//to save the 2d matrix.
  translate(width/4,height/4);
  rotate(angle);
  rectMode(CENTER);
  rect(0,0,100,100);
  popMatrix();//to apply the 2d matrix.
  
  //second lotation
  pushMatrix();
  translate(width/2,height/2);
  rotate(angle);
  rectMode(CENTER);
  rect(0,0,200,200);
  popMatrix();
  
  angle+=0.1;
}
