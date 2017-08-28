class Cuadro extends Bola {
  float ang;
  float velAng;
  float accAng;

  Cuadro(float x,float y, float velx, float vely){
    super(x, y, velx, vely);
    ang = random(2*PI);
    velAng = 0;
    accAng = 0;
  }

  void dibujar( ) {
    ang += velAng;
    velAng += accAng;
    accAng = map(vel.mag(), 0, 46, -0.0005, 0.0005);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(ang);
    fill(255, 80);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, masa, masa*2);
    popMatrix();
  }
}
