//common variables 
float locationX;
float locationY;// current location
float verocityX;
float verocityY;// verocity of the movement
float g=9.8;

//first setup
void setup(){
  size(800,600);
  frameRate(30);
  
  fill(0,127,255);
  noStroke();
  
  //first location was set to be 0
  locationX=20;
  locationY=30;
  //first verocity was set
  verocityX=5;
  verocityY=0;
}

//repeated drawings
void draw(){
  //by adding a new background, the previous drawing is deleted.
  background(0);
  ellipse(locationX,locationY,20,20);
  
  // next location is set,moving 10 pixes for the curent direction.
  locationX += verocityX;
  verocityY = verocityY+g;
  locationY += verocityY;
  if (locationX<0 || locationX>width){
    verocityX =verocityX*-1;
  }
  if (locationY<0 || locationY>height){
    verocityY= verocityY*-1;
  }
}
