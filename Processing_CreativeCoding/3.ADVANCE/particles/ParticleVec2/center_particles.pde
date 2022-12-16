int NUM = 1000;
ParticleVec3[] particles = new ParticleVec3[NUM];

public void settings(){
  size(800,600,"processing.opengl.PGraphics2D",P2D);
}
void setup(){
  frameRate(60);
  for (int i = 0; i < NUM; i++){
    particles[i] = new ParticleVec3();
    particles[i].location.set(width/2,height/2);
    
    float angle = random(PI*2);
    float length = random(20);
    float posX = cos(angle)*length;
    float posY = sin(angle)*length;
    particles[i].accerelation.set(posX,posY);
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
