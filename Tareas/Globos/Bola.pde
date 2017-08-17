class Bola{
  PVector pos;
  PVector vel;
  PVector acc;

  int r, g, b;

  Bola(float x,float y, float velx, float vely){

    pos = new PVector(x,y);
    vel = new PVector(velx,vely);

    acc = new PVector(0.02,0.001);

    acc.limit(0.1);

    r = int(random(256));
    g = int(random(256));
    b = int(random(256));

  }
  void actualizar(){

    pos.add(vel);
    vel.add(acc);
    acc.mult(0);

    vel.limit(5);

    if(pos.x - 10 < 0 || pos.x + 10 > width){
      vel.x *= -0.8;
    }

    if(pos.y - 10 < 0){
      vel.y *= -0.8;
    }

    pos.x = constrain(pos.x, 10, width - 10);
    pos.y = constrain(pos.y, 10, height - 10);

  }

  void aplicarFuerza(PVector fuerza){
    acc.add(fuerza);
  }

  void dibujar(){
    noStroke();
    fill(r, g, b);
    ellipse(pos.x,pos.y,20,20);
  }

}
