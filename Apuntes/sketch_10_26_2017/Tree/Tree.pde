float angle = PI / 4;
float size = 200;
float relation = 0.6;

float desp = 0;

void setup( ) {
  //fullScreen(P2D);
  size(800, 600, P3D);
  background(0);
}

void draw( ) {
  background(0);
  stroke(250);
  desp = map(mouseX, 0, width, -10, 10);
  translate(width/2, height - 100);
  branch(size);
}

void branch(float size) {
  if(size < 0.1) return;
  line(0, 0, 0, -size);
  translate(0, -size);
  pushMatrix();
  rotate(angle + desp);
  branch(size * relation);
  popMatrix();
  pushMatrix();
  rotate(-angle - desp);
  branch(size * relation);
  popMatrix();
}
