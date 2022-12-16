int NUM = 1;
int startP = 1;
int FRAME_RATE = 60;
int interval = 2;
//counter
int counter = 0;
//timer
int time = 0;
//cpCounter
int cpCounter = 1;
boolean TF = true;

float[] val = new float[startP];


int[] col = new int[startP];


TPendulum[][] TP = new TPendulum[startP][NUM];

void setup(){
  /*
  //setting of texts
  textSize(60);
  PFont myFont = loadFont("Krungthep-60.vlw");
  textFont(myFont);
  */
  //set views
  fullScreen(P2D);
  frameRate(FRAME_RATE);
  
  /*color and startPoint settings*/
  for (int i=0; i<startP; i++){
    val[i] = random(PI - PI/3, PI + PI/3);
  }
  for (int i=0; i<startP; i++){
    col[i] = int(random(720));
  }
  
  for(int i=0; i<startP; i++){
    for(int j=0; j<NUM; j++){
      TP[i][j] = new TPendulum(FRAME_RATE, TF, TF);
    }
  }
  for (int i=0; i<startP; i++){
    TP[i][0].init(val[i], col[i]);
  }
  
}

void draw(){
  //update background
  background(0);
  translate(width/2, height/2);
  rotate(PI);
  strokeWeight(10);
  stroke(255);
  
  for(int i=0; i<startP; i++){
    for(int j=0; j<cpCounter; j++){
      TP[i][j].update();
      TP[i][j].draw();
    }
  }
  
  
  //time keeper
  counter++;
  
  //addition
  
  if (cpCounter < NUM){//(counter % (interval * FRAME_RATE) == 0 && cpCounter < NUM){
    for(int i=0; i<startP; i++){
      TP[i][cpCounter].init(val[i], col[i]);
    }
    cpCounter++;
  }
  /*
  //display clock
  if (counter % FRAME_RATE == 0){
    time++;
  }
  fill(180);
  text(time, 600, 400);
  */
  //fade the screen
  fill(0, 10);
  noStroke();
  rect(-width/2, -height/2, width, height);
  
  //save the images
  //saveFrame("./frame/####.png");
}
