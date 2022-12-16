//Equation of motion
class ParticleVec2 {
  PVector location;
  PVector velocity;
  PVector accerelation;
  PVector gravity;
  float mass;
  float friction;
  PVector min;
  PVector max;
  float radius; //radius of particles
  
  //constructor
  ParticleVec2(){
    radius = 4.0;
    mass = 1.0;
    friction = 0.01;
    
    location = new PVector(0.0,0.0);
    velocity = new PVector(0.0,0.0);
    accerelation = new PVector(0.0,0.0);
    gravity = new PVector(0.0,0.0);
    min = new PVector(0.0,0.0);
    max = new PVector(width,height);
  }
  
  void update(){
    accerelation.add(gravity);
    velocity.add(accerelation);
    velocity.mult(1.0-friction);
    location.add(velocity);
    accerelation.set(0.0,0.0);
  }
  
  void draw(){
    ellipse(location.x,location.y,mass*radius*2,mass*radius*2);
  }
  
  void BounceOffWalls(){
    if (location.x > max.x){
      location.x = max.x;
      velocity.x *= -1;
    }
    if (location.x < min.x){
      location.x = min.x;
      velocity.x *= -1;
    }
    if (location.y > max.y){
      location.y = max.y;
      velocity.y *= -1;
    }
    if (location.y < min.y){
      location.y = min.y;
      velocity.y *= -1;
    }
  }
  
  void ThroughWalls(){
    if (location.x > max.x){
      location.x = min.x;
    }
    if (location.x < min.x){
      location.x = max.x;
    }
    if (location.y > max.y){
      location.y = min.y;
    }
    if (location.y < min.y){
      location.y = max.y;
    }
  }
}
