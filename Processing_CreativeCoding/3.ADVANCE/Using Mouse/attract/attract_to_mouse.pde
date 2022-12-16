int NUM = 30000;

ParticleVec5[] particles = new ParticleVec5[NUM];

public void settings(){
  size(displayWidth, displayHeight, "processing.opengl.PGraphics2D",P2D);
}
void setup(){
  frameRate(60);
  for (int i = 0; i < NUM; i++){
    particles[i] = new ParticleVec5();
    particles[i].location.set(random(width),random(height));
    particles[i].gravity.set(0.0,0.0);
    particles[i].friction = 0.01;
  }
}

void draw(){
  fill(0,31); //gray scale and transparency
  rect(0,0,width,height);
  noStroke();
  fill(255);
  for (int i = 0; i<NUM; i++){
    particles[i].update();
    particles[i].draw();
    particles[i].BounceOffWalls();
  }
}

void mouseDragged(){
  for (int i=0; i<NUM; i++){
   PVector mouseLoc = new PVector(mouseX,mouseY);
   particles[i].attract(mouseLoc,200,5,20);
  }
}
