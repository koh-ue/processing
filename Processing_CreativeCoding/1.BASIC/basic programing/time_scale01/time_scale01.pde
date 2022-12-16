void setup(){
  size(800,600);
  frameRate(60);
  background(0);
  noStroke();
}

void draw(){
  float x=random(0,width);
  float y=random(0,height);
  float dist=dist(x,y,width/2,height/2);
  if (dist<height/2){
    noStroke();
    fill(10,10,240);
  }
  else{
    stroke(10,10,240);
    noFill();
  }
  ellipse(x,y,10,10);
}
