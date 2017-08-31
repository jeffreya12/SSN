float increment = 0.01;

float zoff = 0.0;

float zincrement = 0.02;

float r, g, b;

void setup() {
  size(800, 600, P2D);
  noStroke();
  frameRate(30);
}

void draw() {

  background(0);

  float xoff = 0.0;

  for (int x = 10; x < width; x += 10) {

    xoff += increment;

    float yoff = 0.0;

    for (int y = 10; y < height; y += 10) {

      yoff += increment;

      r = randomGaussian()*20 + 244;
      g = randomGaussian()*20 + 66;
      b = randomGaussian()*20 + 101;

      float circleSize = noise(xoff,yoff,zoff)*20;
      
      float newPosX = map(noise(xoff,yoff,zoff), 0, 1, x - 50, x + 50);
      float newPosY = map(noise(xoff,yoff,zoff), 0, 1, y - 50, y + 50);

      fill(r, g, b);

      ellipse(newPosX, newPosY, circleSize, circleSize);

    }

  }

  zoff += zincrement;

}