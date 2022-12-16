PVector force;
PVector acceleration;
PVector velocity;
PVector location;
float mass;
float friction;//////////////////////

void setup(){
  size(800,600);
  frameRate(60);
  
  location = new PVector(0,0);
  velocity = new PVector(0,0);
  force = new PVector(12,8);
  mass=1;
  friction=0.02;///////////////////////
  acceleration = force.mult(mass);
}

void draw(){
  fill(0,31);
  rect(0,0,width,height);
  fill(255);
  noStroke();
  velocity.add(acceleration);
  velocity.mult(1.0-friction);
  location.add(velocity);
  acceleration.set(0,0);
  ellipse(location.x,location.y,20,20);
}
