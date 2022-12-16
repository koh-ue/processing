color col= color(0,0,255);

public void settings(){
  size(800,600,"processing.opengl.PGraphics2D",P2D);
}

void draw(){
  background(0);
  noStroke();
  fill(col);
  ellipse(mouseX,mouseY,100,100);
}

void mousePressed(){
  col = color(255,0,0);
}

void mouseReleased(){
  col = color(0,0,255);
}
