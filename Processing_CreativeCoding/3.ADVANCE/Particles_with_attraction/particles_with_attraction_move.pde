int ANUM = 20; // attractor 
int NUM = 2000;

ParticleVec5_3D[] particles = new ParticleVec5_3D[NUM];
ParticleVec5_3D[] attractors = new ParticleVec5_3D[ANUM];

public void settings(){
  size(800,600,"processing.opengl.PGraphics3D",P3D);
}
void setup(){
  frameRate(60);
  for (int i = 0; i < NUM; i++){
    particles[i] = new ParticleVec5_3D();
    particles[i].location.set(random(width),random(height),random(height/2));
    particles[i].friction = 0.001;
    particles[i].radius=1.0;
    particles[i].mass=random(2.0);
  }
  for (int i = 0; i < ANUM; i++){
    attractors[i] = new ParticleVec5_3D();
    attractors[i].location.set(random(width),random(height),random(height/2));
    attractors[i].radius=5.0;
  }
 background(0);
}

void draw(){
  fill(0,15);
  rect(0,0,width,height);
  noStroke();
  
  for (int j = 0; j < ANUM; j++){
    fill(255,0,0);
    attractors[j].draw();
    for (int i = 0; i < NUM; i++){
      particles[i].attract(attractors[j].location,50,10,800);
    }
  }
  for (int i = 0; i < NUM; i++){
    fill(255);
    particles[i].update();
    particles[i].draw();
    particles[i].ThroughWalls();
  }
}
