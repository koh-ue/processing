int NUM = 1000;

ParticleVec2[] particles = new ParticleVec2[NUM];

public void settings(){
  size(800,600,"processing.opengl.PGraphics2D",P2D);
}
void setup(){
  frameRate(60);
  for (int i = 0; i < NUM; i++){
    particles[i] = new ParticleVec2();
    particles[i].location.set(width/2,height/2);
    particles[i].accerelation.set(random(-10,10),random(-10,10));
    particles[i].gravity.set(0.0,0.1);
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
