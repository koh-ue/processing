//Equation of motion
class ParticleVec5_3D {
  PVector location;
  PVector velocity;
  PVector accerelation;
  PVector gravity;
  float mass;
  float friction;
  PVector min;
  PVector max;
  float radius; //radius of particles
  float G;
  
  //constructor
  ParticleVec5_3D(){
    radius = 4;
    mass = 1.0;
    friction = 0.01;
    G = 1.0;
    
    location = new PVector(0.0,0.0,0.0);
    velocity = new PVector(0.0,0.0,0.0);
    accerelation = new PVector(0.0,0.0,0.0);
    gravity = new PVector(0.0,0.0,0.0);
    min = new PVector(0.0,0.0,0.0);
    max = new PVector(width,height,height/2);
  }
  
  void addForce(PVector force){
    force.div(mass);
    accerelation.add(force);
  }
  
  void attract(PVector center, float _mass, float min, float max){
    //calculate the disrance
    float distance = PVector.dist(center, location);
    //ignore extreme values
    distance = constrain(distance,min,max);//ignore the values locating outside of the range from min to max
    //calculate the strength of the force
    float strength = G*(mass*_mass)/(distance*distance);
    //create the vector from a location to the center
    PVector force = PVector.sub(center, location);
    //normalize the vector
    force.normalize();
    force.mult(strength);
    addForce(force);
  }
  
  void update(){
    accerelation.add(gravity);
    velocity.add(accerelation);
    velocity.mult(1.0-friction);
    location.add(velocity);
    accerelation.set(0.0,0.0,0.0);
  }
  
  void draw(){
    pushMatrix();
    translate(location.x,location.y,location.z);
    ellipse(0,0,mass*radius*2,mass*radius*2);
    popMatrix();
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
    if (location.z > max.z){
      location.z = max.z;
      velocity.z *= -1;
    }
    if (location.z < min.z){
      location.z = min.z;
      velocity.z *= -1;
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
    if (location.z > max.z){
      location.z = min.z;
    }
    if (location.z < min.z){
      location.z = max.z;
    }
  }
}
