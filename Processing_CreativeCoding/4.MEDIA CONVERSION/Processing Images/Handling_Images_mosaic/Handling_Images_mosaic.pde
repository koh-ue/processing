PImage img;

void setup(){
  size(800,600);
  img = loadImage("IMG_7530.JPG");
  img.resize(width,height);
}

void draw(){
  background(0);
  noStroke();
  
  //size of each pixel
  int step = int(map(mouseX,0,width,1,100));
  for (int i = 0; i < width; i+=step){
    for (int j = 0; j < height; j+=step){
      color col = img.get(i,j);
      fill(col);
      rect(i,j,step,step);
    }
  }
}
