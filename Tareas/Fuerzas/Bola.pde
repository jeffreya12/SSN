class Bola{
  PVector pos;
  PVector vel;
  PVector acc;
  float masa;
  int r, g, b;

  Bola(float x,float y){

    pos = new PVector(x,y);
    vel = PVector.random2D();
    acc = PVector.random2D();

    masa = randomGaussian() * 10 + 40;

    r = int(random(256));
    g = int(random(256));
    b = int(random(256));

  }

  void actualizar(){
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
  }

  float calcularDistancia(PVector pared){
    return pos.dist(pared);
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
}
