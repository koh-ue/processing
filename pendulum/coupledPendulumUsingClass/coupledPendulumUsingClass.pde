int NUM = 100;
int FRAME_RATE = 60;
int interval = 2;
//counter
int counter = 0;
//timer
int time = 0;
//cpCounter
int cpCounter = 1;

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
    CP[i] = new Cpendulum(FRAME_RATE, true, true);
  }
  
  CP[0].init();
}

void draw(){
  //update background
  //background(255);
  translate(width/2, height/2);
  strokeWeight(3);
  stroke(255);
  
  
  
  for(int i=0; i<cpCounter; i++){
    CP[i].update();
    CP[i].draw();
  }
  
  
  //time keeper
  counter++;
  
  //addition
  
  if (counter % (interval * FRAME_RATE) == 0 && cpCounter < NUM){
    CP[cpCounter].init();
    cpCounter++;
  }
  
  //display clock
  if (counter % FRAME_RATE == 0){
    time++;
  }
  fill(180);
  text(time, 600, 400);
  
  //fade the screen
  fill(0, 10);
  noStroke();
  rect(-width/2, -height/2, width, height);
}
