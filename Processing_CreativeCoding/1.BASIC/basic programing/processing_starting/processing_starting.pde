size(800,600);
colorMode(HSB,360,100,100,100);
background(0);
noStroke();

float diameter;
float hue, saturation, brightness, alpha;
color col;
int num = 12;
 
hue=360;
saturation=100;
brightness=20;
alpha=90;
diameter=width/num*2;

//n times loops
for (int i=0; i<num; i++){
  col=color(hue,saturation,brightness,alpha);
  fill(col);
  float x=width/num*i+diameter/4;
  ellipse(x,height/2,diameter,diameter);
  brightness += 100/num;
}
