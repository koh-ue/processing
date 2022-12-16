int NUM = 2000;

ParticleVec5_3D[] particles = new ParticleVec5_3D[NUM];

public void settings(){
  size(800,600,"processing.opengl.PGraphics3D",P3D);
}
void setup(){
  frameRate(60);
  for (int i = 0; i < NUM; i++){
    particles[i] = new ParticleVec5_3D();
    particles[i].location.set(random(width),random(height),random(height/2));
    particles[i].gravity.set(0.0,0.0,0.0);
    particles[i].friction = 0.01;
    particles[i].radius=2.0;
  }
 background(0);
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
