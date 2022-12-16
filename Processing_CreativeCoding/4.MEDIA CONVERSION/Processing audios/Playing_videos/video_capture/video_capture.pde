import processing.video.*;

Capture cam;

void setup() {
  size(1300, 800);

  String[] cameras = Capture.list();
  printArray(cameras);
  if (cameras.length == 0) {
    text("There are no cameras available for capture.",200,200);
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      text(cameras[i],500,10+i);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[1]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  println(cam.available());
  image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}

void captureEvent(Capture c){
  c.read();
}
