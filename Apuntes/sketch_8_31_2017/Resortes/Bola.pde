class Bola{
  PVector pos;
  PVector vel;
  PVector acc;
  float masa;

  Bola(float x,float y, float velx, float vely){
    pos = new PVector(x,y);
    vel = new PVector(velx,vely);
    acc = new PVector(0,0);
    masa = 50;
  }

  Bola(float x,float y){
    pos = new PVector(x,y);
    vel = PVector.random2D();
    acc = new PVector(0, 0);
    masa = random(20);
  }

  void actualizar(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void aplicarFuerza(PVector fuerza){
    PVector f = PVector.div(fuerza, masa);
    acc.add(f);
  }

  void dibujar(){
    fill(255);
    stroke(255);
    ellipse(pos.x,pos.y,masa,masa);
  }
}
