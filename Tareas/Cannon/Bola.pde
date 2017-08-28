class Bola{
  PVector pos;
  PVector vel;
  PVector acc;
  float masa;

  Bola(float x,float y, float velx, float vely){

    pos = new PVector(x,y);
    vel = new PVector(velx,vely);
    acc = new PVector(0,0);

    masa = randomGaussian() * 1 + 10;

  }

  Bola(float x,float y){

    pos = new PVector(x,y);
    vel = PVector.random2D();
    acc = new PVector(0,0);

    masa = randomGaussian() * 10 + 20;

  }

  void actualizar(){

    pos.add(vel);
    vel.add(acc);
    acc.mult(0);

    if(pos.y > height){
      vel.y *= -1;
    }
  }

  void aplicarFuerza(PVector fuerza){
    PVector f = PVector.div(fuerza, masa);
    acc.add(f);
  }

  void dibujar(){
    fill(200, 90, 90, 80);
    noStroke();
    ellipse(pos.x,pos.y,masa,masa);
  }
}
