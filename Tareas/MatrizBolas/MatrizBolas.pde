float increment = 0.01;

float zoff = 0.0;

float zincrement = 0.02;

float r, g, b;

void setup() {
  size(650, 350, P2D);
  //fullScreen();
  noStroke();
  //frameRate(300);
}

void draw() {

  background(0);

  float xoff = 0.0;

  for (int x = 10; x < width; x += 10) {

    xoff += increment;

    float yoff = 0.0;

    for (int y = 10; y < height; y += 10) {

      yoff += increment;

      r = randomGaussian()*10 + 244;
      g = randomGaussian()*10 + 66;
      b = randomGaussian()*10 + 101;

      // r = monteCarlo()*50 + 244;
      // g = monteCarlo()*50 + 66;
      // b = monteCarlo()*50 + 101;

      float circleSize = noise(xoff,yoff,zoff)*20;
      //float circleSize = map(noise(xoff,yoff,zoff), 0, 1, 0, 10);
      float newPosX = map(noise(xoff,yoff,zoff), 0, 1, x - 50, x + 50);
      float newPosY = map(noise(xoff,yoff,zoff), 0, 1, y - 50, y + 50);

      fill(r, g, b);

      ellipse(newPosX, newPosY, circleSize, circleSize);

    }

  }

  zoff += zincrement;

}

float monteCarlo(){
  while(true){
    float r1 = random(1);
    float probabilidad = r1 ; //Lineal
    //float probabilidad = r1 * r1; //Exponencial
    //float probabilidad = log(r1 * 2.7182 + 1); //Logaritmica
    //float probabilidad = 0.1 / r1; //Hiperbolica
    float r2 =  random(1);

    if(r2 < probabilidad){
      return r1;
    }
  }
}