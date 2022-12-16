class PLAY {
  PVector location2;
  PLAY(){
    location2 = new PVector(width/2,height/2);
  }
  void draw(){
    int i = 255;
    while(i > 0){
      fill(255,i);
      pushMatrix();
      rotate(90);
      translate(width/2,height/2);
      triangle(location2.x-20,location2.y-10,location2.x,location2.y+20,location2.x+20,location2.y-10);
      popMatrix();
      i -= 10;
    }
  }
}

class PAUSE {
  PVector location2;
  PAUSE(){
    location2 = new PVector(width/2,height/2);
  }
  void draw(){
    int i = 255;
    while(i > 0){
      fill(255,i);
      pushMatrix();
      translate(width/2-30,height/2+20);
      rect(0,0,15,60);
      popMatrix();
      pushMatrix();
      translate(width/2+15,height/2+20);
      rect(0,0,15,60);
      popMatrix();
      i -= 10;
    }
  }
}

void setup(){
  size(800,600);
  frameRate(60);
  background(0);
  
}

PLAY pp;

void draw(){
  pp.draw();
}
