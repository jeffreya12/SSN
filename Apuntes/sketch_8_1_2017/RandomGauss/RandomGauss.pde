void setup() {
  size(800, 600);
  background(0);
}

void draw() {
  fill(255, 20);
  noStroke();
  float x = randomGaussian()*100 + width / 2;
  float y = randomGaussian()*100 + height / 2;
  //ellipse(randomGaussian()*100 + width / 2, height / 2, 20, 20); //se suma la media y se multiplica por la desviacion

  ellipse(x, y, 20, 20);

}
