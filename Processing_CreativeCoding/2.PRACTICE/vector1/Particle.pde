class Particle{
  color col;
  float diameter;
  PVector location;
  PVector velocity;
  
  //constructor
  Particle(float _diameter){
    diameter=_diameter;
    location=new PVector(random(width),random(height));
    velocity=new PVector(random(-4,4),random(-4,4));
    col=color(random(255),random(255),random(255));
  }
  void draw(){
    fill(col);
    ellipse(location.x,location.y,diameter,diameter);
    location.add(velocity);
    
    if(location.x<0 || location.x>width){
      velocity.x=velocity.x*-1;
    }
    if(location.y<0 || location.y>height){
      velocity.y=velocity.y*-1;
    }
  }
}
