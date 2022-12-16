PImage img;

void setup(){
  size(800,600);
  img = loadImage("IMG_7530.JPG");
}

void draw(){
  frameRate(10);
  background(0);
  img.filter(INVERT);
  image(img,0,0,width,height);
}
