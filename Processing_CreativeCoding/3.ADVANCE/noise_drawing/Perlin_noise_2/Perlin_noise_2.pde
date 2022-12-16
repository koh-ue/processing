public void settings(){
  size(800,600,"processing.opengl.PGraphics2D",P2D);
}

void setup(){
  background(255);
  stroke(1);
  int step = 10;
  float noiseScale = 0.01;
  
  for (int j = 0; j<height; j += step){
    for (int i = 0; i<width; i += step){
      float angle = noise(i*noiseScale,j*noiseScale)*PI*2.0;
      pushMatrix();
      translate(i,j);
      rotate(angle);
      line(-step/2,0,step/2,0);
      popMatrix();
    }
  }
}
