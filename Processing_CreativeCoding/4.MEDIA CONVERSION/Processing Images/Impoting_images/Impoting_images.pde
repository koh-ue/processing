PImage img;

void setup(){
  size(800,600);
  img = loadImage("IMG_7530.JPG");
}

void draw(){
  background(0);
  tint(0,127,255);
  image(img,0,0);
}
