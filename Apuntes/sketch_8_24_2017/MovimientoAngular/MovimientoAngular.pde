float ang = PI/4;
float velAng = 0;
float accAng = 0;

void setup( ) {
  size(800, 600, P3D);
}
void draw( ) {
  ang += velAng;
  velAng += accAng;
  accAng = map(mouseX, 0, width, -0.001, 0.001);
  background(0);
  rectMode(CENTER);
  noStroke();
  fill(128);

  //Segundo rectangulo
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(ang);
  rect(0, 0, 350, 200);
  popMatrix();

  //Segundo rectangulo
  pushMatrix();
  translate(200, 200);
  rotate(ang);
  rect(0,0,100,10);
  popMatrix();
}
