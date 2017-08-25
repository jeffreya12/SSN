class Bola{
  PVector pos, vel, acc;
  float masa;
  int r, g, b;

  Bola(float x,float y, float velx, float vely){
    pos = new PVector(x,y);
    vel = new PVector(velx,vely);
    acc = new PVector(0,0);
    masa = random(50);
    r = int(randomGaussian() * 50 + 142);
    g = int(randomGaussian() * 50 + 183);
    b = int(randomGaussian() * 50 + 249);
  }

  void actualizar(){
    pos.add(vel);
    vel.add(acc);
    vel.limit(5);
    acc.mult(0);
  }

  void aplicarFuerza(PVector fuerza){
    PVector f = PVector.div(fuerza, masa);
    acc.add(f);
  }

  void dibujar(){
    fill(r, g, b);
    noStroke();
    ellipse(pos.x,pos.y,masa,masa);
  }
}
