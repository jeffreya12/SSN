KochCurve koch;

void setup( ) {
  fullScreen(P2D);
  background(0);
  koch = new KochCurve(0, height / 2, width, height / 2);
}

void draw( ) {
  background(0);
  koch.display();
  if(mousePressed){
    koch.change();
  }
}

void keyPressed( ) {
  if(key == '\n') koch.next();
}
