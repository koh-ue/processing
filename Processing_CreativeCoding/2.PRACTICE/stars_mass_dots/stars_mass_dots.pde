int NUM=600;
float[] x= new float[NUM];
float[] y= new float[NUM];
float angle=0.0;
float[] x1= new float[NUM];
float[] y1= new float[NUM];
float[] z1= new float[NUM];{

for (int i=0; i<NUM; i++){
  x1[i]=random(40,255);
  y1[i]=random(60,255);
  z1[i]=random(50,255);
}
  
}


void setup(){
  size(800,600,P2D);
  frameRate(60);
  background(0);
  
  for(int i=0; i<NUM; i++){
    x[i]=random(-width/2,width/2);
    y[i]=random(-height/2,height/2);
  }
  for (int i=0; i<NUM; i++){
    stroke(x1[i],y1[i],z1[i]);
    noFill();
    point(x[i],y[i]);
  }
}

void draw(){
  translate(width/2,height/2);
  rotate(angle);
  angle+=0.01;
  for (int i=0; i<NUM; i++){
    stroke(x1[i],y1[i],z1[i]);
    noFill();
    point(x[i],y[i]);
  }
  blendMode(BLEND);
  noStroke();
  fill(0,3);
  rect(0,0,width,height);
  
}
