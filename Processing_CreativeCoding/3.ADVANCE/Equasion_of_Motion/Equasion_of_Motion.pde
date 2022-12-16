class ParticleVec2{
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector force;
  PVector gravity;
  float mass;
  float friction;
  PVector min;
  PVector max;
  float radius;
  
  ParticleVec2(){
    radius=4.0;
    mass=1;
    friction=0.01;
    location=new PVector(0,0);
    velocity=new PVector(0,0);
    acceleration= new PVector(0,0);
    gravity= new PVector(0,0);
    min =new PVector(0,0);
    max=new PVector(width,height);
  }
  
  void update(){
    acceleration.add(gravity);
    velocity.add(acceleration);
    velocity.mult(1.0-friction);
    location.add(velocity);
    acceleration.set(0,0);
  }
  void draw(){
    ellipse(location.x,location.y,mass*radius*2,mass*radius*2);
  }
  
  void bounceOffWall(){
    if (location.x>max.x){
      location.x=max.x;
      velocity.x*=-1;
    }
    if (location.x<min.x){
      location.x=min.x;
      velocity.x*=-1;
    }
    if (location.y>max.y){
      location.y=max.y;
      velocity.y*=-1;
    }
    if (location.y<min.y){
      location.y=min.y;
      velocity.y*=-1;
    }
  }
  void throughWall(){
    if (location.x>max.x){
      location.x=min.x;
    }
    if (location.y>max.y){
      location.y=min.y;
    }
    if (location.x<min.x){
      location.x=max.x;
    }
    if (location.y<min.y){
      location.y=max.y;
    }
  }
}
