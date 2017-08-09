void setup( ) {
    //size(800, 600);
    fullScreen();
    background(0);
    noCursor();
}

void draw( ) {
  background(0);
  stroke(255);
  fill(255);

  PVector mouse = new PVector (mouseX, mouseY);
  PVector centro = new PVector (width / 2, height / 2);
  ellipse(mouse.x, mouse.y, 10, 10);
  ellipse(centro.x, centro.y, 10, 10);
  PVector diff = PVector.sub(mouse, centro);

  //diff.mult(2);

  diff.setMag(100);

  translate(width / 2, height / 2);
  line(0, 0, diff.x, diff.y);
}
