PImage img;

void setup(){
  size(800,600);
  img = loadImage("it's a small world.JPG");
  img.resize(width,height);
  background(0);
}

void draw(){
  noStroke();
  
  for (int i = 0; i < 40; i++){
    PVector location = new PVector(random(width),random(height));
    color col = img.get(int(location.x),int(location.y));
    fill(col,random(255));
    //calculate brightness
    float brightness = red(col)+green(col)+blue(col);
    //deciding the size of circles on the basis of brightness
    float diameter = map(brightness,0,255*3,0,20);
    ellipse(location.x,location.y,diameter,diameter);
  }
}
