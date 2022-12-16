float noiseScale = 0.02;
float radian;
float r = 200;
float x, y;
float num = 0;
float noise;
float noise_r;
float rDiv = width * 0.5;

void setup(){
  fullScreen(P2D);
  frameRate(60);
  background(255);
  colorMode(HSB, 360, 100, 100);
}
void draw(){
  background(255);
  //stroke(0);
  for (int r = 10; r< 400; r += width * 0.01){
    color col = color(int(r/400 * 360), 60, 100);
    stroke(col);
    for (radian=0; radian < 2 * PI; radian += 0.01){
      //radian = radians(i / N * 360);
      x = width/2 + r * sin(num) + r * cos(radian);
      y = height/2 +r * cos(num + num) + r * sin(radian);
      noise = noise(x * noiseScale, y * noiseScale);
      noise_r = r + rDiv * noise;
      ellipse(width/2 + noise_r * cos(radian), height/2 + noise_r * sin(radian), 1, 1);
    }
  }
  num += 0.1;
  
  
  //fade the screen
  /*
  fill(0, 10);
  noStroke();
  rect(-width/2, -height/2, width, height);
  */
}
