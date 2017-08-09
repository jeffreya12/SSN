void setup() {
  fullScreen();
  background(0);
}

void draw() {

  noStroke();

  float r = randomGaussian() * 10 + 120;
  float g = randomGaussian() * 10 + 30;
  float b = randomGaussian() * 10 + 200;

  float x = randomGaussian()*40 + mouseX;
  float y = randomGaussian()*40 + mouseY;

  float circleSize = randomGaussian()*10 + 20;

  fill(b, r, g);

  if(mousePressed){
    ellipse(x, y, circleSize, circleSize);
  }

}
