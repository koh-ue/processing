int NUM=10000;
float[] x= new float[NUM];
float[] y= new float[NUM];// locations

void setup(){
  size(800,600,P2D);///// blend mode
  frameRate(120);
  background(0);
  for(int i=0; i<NUM; i++){
    x[i]=width/2.0;
    y[i]=height/2.0;
  }
}

void draw(){
  blendMode(BLEND);//??
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  stroke(255);
  noFill();
  blendMode(ADD);//??
  for (int i=0; i<NUM; i++){
    point(x[i],y[i]);
    x[i]+=random(-4,4);
    y[i]+=random(-4,4);
  }
}
