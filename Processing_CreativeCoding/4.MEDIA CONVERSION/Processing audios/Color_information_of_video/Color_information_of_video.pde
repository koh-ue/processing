import processing.video.*;
Movie movie;
boolean playing;

void setup(){
  size(853,480);
  frameRate(60);
  noStroke();
  movie = new Movie(this,"big_buck_bunny.mp4");
  movie.loop();
  playing = true;
}

void draw(){
  background(0);
  int skip = 10;
  for (int j = skip/2; j < height/2; j += skip){
    for (int i = skip/2; i < width/2; i += skip){
      color col = movie.get(i,j);
      float br = brightness(col);
      fill(col);
      ellipse(i*2,j*2,20*br/255,20*br/255);
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
