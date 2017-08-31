class Cuadro extends Bola {
  float ang;
  float velAng;
  float accAng;
  int r, g, b;

  Cuadro(float x,float y, float velx, float vely){
    super(x, y, velx, vely);
    ang = random(2*PI);
    velAng = map(randomGaussian(), -1, 1, -0.05, 0.05);
    accAng = 0;

    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
  }

  void dibujar( ) {
    ang += velAng;
    velAng += accAng;
    accAng = map(vel.mag(), 0, 46, -0.0005, 0.0005);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(ang);
    fill(r, g, b);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, masa, masa*2);
    popMatrix();
  }
}
