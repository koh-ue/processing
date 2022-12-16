int NUM = 2000;

ParticleVec5_3D[] particles = new ParticleVec5_3D[NUM];
float noiseScale;
float noiseStrength;

public void settings(){
  size(2560,1600,"processing.opengl.PGraphics3D",P3D);
}
void setup(){
  frameRate(60);
  noiseScale=0.01;
  noiseStrength=0.1;
  for (int i = 0; i < NUM; i++){
    particles[i] = new ParticleVec5_3D();
    particles[i].location.set(random(width),random(height),random(height/2));
    particles[i].min.set(0,0,0);
    particles[i].max.set(width,height,width/2);
    particles[i].friction = 0.1;
    particles[i].radius=1.0;
    particles[i].gravity.set(0.0,0.0,0.0);
  }
 background(255);
}

void draw(){
  noStroke();
  fill(66, 151, 213,3);
  for (int i = 0; i < NUM; i++){
    PVector force = new PVector();
    force.x=cos(noise(particles[i].location.x*noiseScale,particles[i].location.y*noiseScale,particles[i].location.z*noiseScale)*PI*4.0);
    force.y=sin(noise(particles[i].location.x*noiseScale,particles[i].location.y*noiseScale,particles[i].location.z*noiseScale)*PI*4.0);
    force.mult(noiseStrength);
    particles[i].addForce(force);
    particles[i].update();
    particles[i].draw();
    particles[i].ThroughWalls();
  }
}

void mousePressed(){
  noiseSeed(round(random(1000)));
  noiseScale = 0.01;
  for (int i = 0; i < NUM; i++){
    particles[i].location.set(random(width),random(height),random(height/2));
  }
  background(255);
}
