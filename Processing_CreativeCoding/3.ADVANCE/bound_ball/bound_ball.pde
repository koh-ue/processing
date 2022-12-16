PVector force;
PVector acceleration;
PVector velocity;
PVector location;
PVector gravity;
float mass;
float friction;
PVector min;
PVector max;

void setup(){
  size(1000,800);
  frameRate(60);
  
  location=new PVector(0,0);
  velocity=new PVector(0,0);
  gravity=new PVector(0,1);
  force = new PVector(80,40);
  min = new PVector(0,0);
  max = new PVector(width,height);
  mass=1.0;
  friction=0.01;
  acceleration= force.mult(mass);
}

void draw(){
  fill(0,31);
  noStroke();
  rect(0,0,width,height);
  acceleration.add(gravity);
  velocity.add(acceleration);
  velocity.mult(1.0-friction);
  location.add(velocity);
  acceleration.set(0,0);
  fill(255);
  ellipse(location.x,location.y,20,20);
  bounceOffWalls();
}

void bounceOffWalls(){
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
