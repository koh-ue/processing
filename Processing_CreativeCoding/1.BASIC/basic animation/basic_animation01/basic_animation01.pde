//common variables 
int locationX;// current location
int direction;// direction of the movement

//first setup
void setup(){
  size(800,600);
  frameRate(60);
  fill(0,127,255);
  noStroke();
  
  //first location was set to be 0
  locationX=0;
  //first location was set to be -1
  direction=-1;
}

//repeated drawings
void draw(){
  //by adding a new background, the previous drawing is deleted.
  background(0);
  ellipse(locationX,height/2,20,20);
  
  // next location is set,moving 10 pixes for the curent direction.
  locationX += 10*direction;
  if (locationX<0 || locationX>width){
    direction= direction*-1;
  }
}
