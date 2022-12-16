int NUM=1000;
ParticleVec2[] myParticles= new ParticleVec2[NUM];
public void settings(){
  size(800,600,"processing.opengl.PGraphics2D");
}
void setup(){
  frameRate(60);

  // create particles
  for (int i=0; i<NUM; i++){
    //set up esch variable.
    myParticles[i]= new ParticleVec2();
    myParticles[i].location.set(width/2,height/2);
    myParticles[i].acceleration.set(random(-10,10),random(-10,10));
    myParticles[i].gravity.set(0,1);
    myParticles[i].friction=0.01;
  }
}
void draw(){
  fill(0,31);
  rect(0,0,width,height);
  noStroke();
  fill(255);
  for (int i=0;i<NUM; i++){
    myParticles[i].update();
    myParticles[i].draw();
    myParticles[i].bounceOffWall();
  }
}
