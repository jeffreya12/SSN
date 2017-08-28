class Bola{
  PVector pos;
  PVector vel;
  PVector acc;
  float masa;

  Bola(float x,float y, float velx, float vely){

    pos = new PVector(x,y);
    vel = new PVector(velx,vely);
    acc = new PVector(0,0);

    masa = random(20);

  }

  Bola(float x,float y){

    pos = new PVector(x,y);
    vel = PVector.random2D();
    acc = new PVector(0,0);

    masa = random(50);

  }

  void actualizar(){

    pos.add(vel);
    vel.add(acc);
    acc.mult(0);

    if(pos.x - masa/2 < 0 || pos.x + masa/2 > width){
      vel.x *= -1;
    }

    if(pos.y - masa/2 < 0 || pos.y + masa/2 > height){
      vel.y *= -1;
    }

    pos.x = constrain(pos.x, masa/2, width - masa/2);
    pos.y = constrain(pos.y, masa/2, height - masa/2);

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
