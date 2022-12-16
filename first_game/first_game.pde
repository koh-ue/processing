PImage pistol;
PVector location_bullet;
BULLET[] b1 = new BULLET[20];

void setup(){
  size(1000,700);
  frameRate(60);
  background(255);
  pistol = loadImage("pistol_1.jpg");
  pistol.resize(50,50);
}

void draw(){
  background(255);
  image(pistol,10,mouseY);
  for (int i = 0; i<20; i++){
    b1[i].update();
    b1[i].draw();
  }
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      
    } else if (keyCode == DOWN){
      
    }
  }
}
