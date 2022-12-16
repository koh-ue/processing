import processing.video.*;
Movie movie;
boolean playing;

void setup(){
  size(853,480,P2D);
  frameRate(60);
  noStroke();
  movie = new Movie(this,"big_buck_bunny.mp4");
  movie.loop();
  playing = true;
}

void draw(){
  background(0);
  rectMode(CENTER);
  int skip = 5;
  for (int j = skip/2; j < height/2; j += skip){
    for (int i = skip/2; i < width/2; i += skip){
      color col = movie.get(i,j);
      float br = brightness(col);
      fill(col,127);
      pushMatrix();
      translate(i*2,j*2);
      float angle = map(br,0,255,0,PI);
      rotate(angle);
      rect(0,0,10*br/32,5);
      popMatrix();
    }
  }
  
}
void movieEvent(Movie m){
  m.read();
}
void mouseReleased(){
  if (playing == true){
      movie.pause();
      playing = false;
    } else {
      movie.play();
      playing = true;
    }
}
