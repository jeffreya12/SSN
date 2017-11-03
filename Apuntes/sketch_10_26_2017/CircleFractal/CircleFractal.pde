float despX, despY = 0;

void setup( ) {
  //size(800, 600, P3D);
  fullScreen(P2D);
  background(0);
}

void draw(){
  background(0);
  despX = map(mouseX, 0, width, -10, 10);
  despY = map(mouseY, 0, height, -10, 10);
  circuloFractal(width/2, height/2, 400);
}

void circuloFractal(float x, float y, float r) {
  if (r < 1) return;
  noFill();
  stroke(255);
  ellipse(x, y, r, r);;
  //circuloFractal(x + despX, y + despY, r - 10);
  circuloFractal(x - r/2 - despX, y - despY, r / 2);
  circuloFractal(x + r/2 + despX, y + despY, r / 2);
  circuloFractal(x, y + r/2, r / 2);
}
