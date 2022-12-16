class BULLET{
  PVector location;
  float keep;
  PVector size;
  color col;
  float speed;
  
  BULLET(){
    size = new PVector(50,40);
    col = 255;
    speed = 10;
    location = new PVector(10,mouseY);
    keep = location.y;
  }
  
  void draw(){
    fill(col);
    noStroke();
    ellipse(size.x,size.y,location.x,keep);
  }
  
  void update(){
    keep += speed;
    speed = 10;
  }
}
