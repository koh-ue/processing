int NUM = 1000;

ParticleVec5_3D[] particles = new ParticleVec5_3D[NUM];

public void settings(){
  size(800,600,"processing.opengl.PGraphics3D",P3D);
}
void setup(){
  frameRate(60);
  for (int i = 0; i < NUM; i++){
    particles[i] = new ParticleVec5_3D();
    particles[i].location.set(random(width),random(height),random(height/2));
    particles[i].friction = 0.02;
    particles[i].radius=0.5;
    particles[i].mass=random(1,2);
  }
  noStroke();
 background(0);
}

void draw(){
  fill(0,15); //gray scale and transparency
  rect(0,0,width,height);
  noStroke();
  fill(255);
  for (int i = 0; i<NUM; i++){
    for ( int j = 0; j < NUM; j++){
      particles[i].attract(particles[j].location, particles[j].mass,2.0,800.0);
    }
    particles[i].update();
    particles[i].ThroughWalls();
    particles[i].draw();
  }
}
