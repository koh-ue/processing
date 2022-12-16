//common variables 
int locationX;
int locationY;// current location
int directionX;
int directionY;// direction of the movement

//first setup
void setup(){
  size(800,600);
  frameRate(60);
  fill(0,127,255);
  noStroke();
  
  //first location was set to be 0
  locationX=10;
  locationY=20;
  //first location was set to be -1
  directionX=-1;
  directionY=-1;
}

//repeated drawings
void draw(){
  //by adding a new background, the previous drawing is deleted.
  background(0);
  ellipse(locationX,locationY,20,20);
  
  // next location is set,moving 10 pixes for the curent direction.
  locationX += 10*directionX;
  locationY += 10*directionY;
  if (locationX<0 || locationX>width){
    directionX= directionX*-1;
  }
  if (locationY<0 || locationY>height){
    directionY= directionY*-1;
  }
}
