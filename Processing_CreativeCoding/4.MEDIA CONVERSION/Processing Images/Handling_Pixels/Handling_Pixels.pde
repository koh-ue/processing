PImage img;

void setup(){
  size(800,600);
  img = loadImage("IMG_7530.JPG");
  img.resize(width,height);
}

void draw(){
  background(0);
  image(img,0,0);
  
  //getting the data of the pixel pointed by pointer
  color col = img.get(mouseX,mouseY);
  fill(col);
  ellipse(50,50,80,80);
  stroke(255);
  line(mouseX,0,mouseX,height);
  line(0,mouseY,width,mouseY);
}
