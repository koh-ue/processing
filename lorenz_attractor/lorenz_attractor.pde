import peasy.* ;

boolean withCol = true;

int FRAME_RATE = 60;
PeasyCam cam;
int colorBand = 720;
color col = 255;


float dt = 0.01;
float[] pos = {0.1, 0, 0};
float a = 10;
float b = 28;
float c = 8.0/3.0;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  //set views
  fullScreen(P3D);
  frameRate(FRAME_RATE);
  colorMode(HSB, colorBand, 100, 100);//Hue: 0-720, Saturation: 0-100, Brightness: 0-100;
  cam = new PeasyCam(this, 500);
  background(0);
  
}

void draw() {
  
  background(0);
  float[] d = new float[3];
  d[0] = (a * (pos[1] - pos[0])) * dt;
  d[1] = (pos[0] * (b - pos[2]) - pos[1]) * dt;
  d[2] = (pos[0] * pos[1] - c * pos[2]) * dt;
  
  points.add(new PVector(pos[0], pos[1], pos[2]));
  
  for (int i = 0; i < 3; i++) {
    pos[i] = pos[i] + d[i];
  }
  
  translate(0, 0, -80);
  scale(5);
  
  strokeWeight(0.2);
  noFill();
  
  //point(pos[0], pos[1], pos[2]);
  int colorNum = 1;
  
  beginShape();
  for (PVector v : points) {
    //set color
    if (withCol == true) {
      col = color((colorNum % colorBand), 100, 100);
    } else {
      col = 255;
    }
    colorNum++;
    stroke(col);
    vertex(v.x, v.y, v.z);
  }
  endShape();
}
