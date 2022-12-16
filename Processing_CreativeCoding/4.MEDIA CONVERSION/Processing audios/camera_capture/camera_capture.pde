import processing.video.*;
Capture cam;

void setup(){
  size(800,600);
  frameRate(60);
  noStroke();
  cam = new Capture(this);
  cam.start();
}

void draw(){
  background(0);
  image(cam,0,0,width,height);
}

void captureEvent(Capture cam){
  cam.read();
}
