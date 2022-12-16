import processing.video.*;
Movie movie;              //declaration of video player
boolean playing;        //playing videos or not

void setup(){
  size(853,480);
  frameRate(60);
  background(0);
  noStroke();
  
  //loading imported movie
  movie = new Movie(this, "big_buck_bunny.mp4");
  movie.loop();
  playing = true;
}

void draw(){
  image(movie,0,0,width,height);
  float percent = movie.time()/movie.duration();
  float length = map(percent, 0,1,0,width);
  fill(255,0,0);
  rect(0,height-4,length,4);
}

//when reneweralizing frames, do next codes
void movieEvent(Movie m){
  m.read();
}

void mouseClicked(){
  float _length = map(mouseX,0,width,0,movie.duration());
  if (mouseY >= height-20){
    movie.jump(_length);
  } else {
    if (playing == true){
      movie.pause();
      playing = false;
    } else {
      movie.play();
      playing = true;
    }
    
  }
}
