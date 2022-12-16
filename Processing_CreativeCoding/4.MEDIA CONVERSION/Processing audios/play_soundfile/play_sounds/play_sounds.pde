import processing.sound.*; //sound library
SoundFile soundfile;

void setup(){
  size(800,600);
  soundfile = new SoundFile(this, "your_melody.mp3");
  soundfile.loop();
}

void draw(){
  background(0);
}
