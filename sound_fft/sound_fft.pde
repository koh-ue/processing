import processing.video.*;
Capture cam;
float scale = 1.0;

public void setup() {
  size(800, 500, P3D)
  frameRate(60);
  blendMode(ADD);
  noFill();
  
  cam = new Capture(this, width, height);
  cam.start();
}

public void draw(){
  background();
  strokeWeight(2.0);
  float hStep = 4.0;
  float wStep = 4.0;
  
}
