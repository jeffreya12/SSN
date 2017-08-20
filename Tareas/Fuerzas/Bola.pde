class Bola{
  PVector pos;
  PVector vel;
  PVector acc;
  float masa;
  int r, g, b;

  Bola(float x,float y, float velx, float vely){

    pos = new PVector(x,y);
    vel = new PVector(velx,vely);
    acc = new PVector(0.02,0.001);

    masa = randomGaussian() * 10 + 20;

    r = int(random(256));
    g = int(random(256));
    b = int(random(256));

  }

  Bola(float x,float y){

    pos = new PVector(x,y);
    vel = PVector.random2D();
    vel.setMag(map(randomGaussian(), -1, 1, 0, 5));

    acc = new PVector(0.001,0.001);

    masa = map(randomGaussian(), -1, 1, 0, 50);

    r = int(random(256));
    g = int(random(256));
    b = int(random(256));

  }

  void actualizar(){
    pos.add(vel);
    vel.limit(20);
    vel.add(acc);
    acc.mult(0);
  }

  void aplicarFuerza(PVector fuerza){
    PVector f = PVector.div(fuerza, masa);
    acc.add(f);
  }

  void dibujar(){
    fill(r, g, b, 90);
    stroke(255);
    ellipse(pos.x,pos.y,masa,masa);
  }

  float calcularDistancia(PVector pared){
    return pos.dist(pared);
  }

}
