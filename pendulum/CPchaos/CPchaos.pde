int NUM = 10;
int FRAME_RATE = 60;
//counter
int counter = 0;
//timer
int time = 0;
//cpCounter

Cpendulum[] CP = new Cpendulum[NUM];

void setup(){
  //setting of texts
  textSize(60);
  PFont myFont = loadFont("Krungthep-60.vlw");
  textFont(myFont);
  
  //set views
  fullScreen(P2D);
  frameRate(FRAME_RATE);
  
  for(int i=0; i<NUM; i++){
    CP[i] = new Cpendulum(FRAME_RATE);
    CP[i].init(PI * 0.99 + 0.00001 * i);
  }
  
}

void draw(){
  
  //update background
  background(0);
  translate(width/2, height/2);
  strokeWeight(1);
  stroke(255);
  
  
  
  for(int i=0; i<NUM; i++){
    CP[i].update();
    CP[i].draw();
  }
  
  
  //time keeper
  counter++;
  
  //display clock
  if (counter % FRAME_RATE == 0){
    time++;
  }
  fill(180);
  text(time, 600, 400);
}
