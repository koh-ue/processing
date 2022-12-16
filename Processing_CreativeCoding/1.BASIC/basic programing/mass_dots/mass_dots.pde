size(800,600);
background(0);
noStroke();
int num=1000;

for (int i=0; i<num; i++){
  float x=random(0,width);
  float y=random(0,height);
  
  float dist=dist(x,y,width/2,height/2);
  
  if (dist<height/2){
    noStroke();
    fill(200,0,0);
  }
  else{
    noFill();
    stroke(200,0,0);
  }
  ellipse(x,y,10,10);
}
