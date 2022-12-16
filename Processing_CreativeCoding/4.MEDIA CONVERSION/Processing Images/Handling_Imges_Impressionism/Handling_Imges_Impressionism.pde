PImage img;
PImage img2;

void setup(){
  size(800,600);
  img = loadImage("IMG_7530.JPG");
  img2 = loadImage("IMG_7641.jpg");
  img.resize(width,height);
  img2.resize(width,height);
  background(0);
}

void draw(){
  noStroke();
  rectMode(CENTER);
  for (int i = 0; i < 50; i++){
    PVector location = new PVector(random(width),random(height));
    color col = img2.get(int(location.x),int(location.y));
    fill(col,15);
    float brightness = red(col)+green(col)+blue(col);
    float angle = map(brightness,0,255*3,-PI/2,PI/2);
    float length9 = map(brightness,0,255*3,0,40);
    
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rect(0,0,length9,2);
    popMatrix();
  }
}
