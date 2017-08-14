class Bola{
  float x;
  float y;
  float velx;
  float vely;
  PVector pos;
  PVector vel;
  PVector acc;

  Bola(float x,float y, float velx, float vely){

    pos = new PVector(x,y);
    vel = new PVector(velx,vely);

    acc = new PVector(0.02,0.001);
    //acc = PVector.random2D();
    acc.limit(0.1);

  }
  void actualizar(){

    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
    acc.mult(0);
    pos.x = pos.x %width;
    pos.y = pos.y %height;

    if(mousePressed){
      PVector mouse = new PVector(mouseX,mouseY);
      mouse.sub(pos);
      println(mouse);
      mouse.setMag(1.5);
      println(mouse);
      aplicarFuerza(mouse);
    }
  }

  void aplicarFuerza(PVector fuerza){
    acc.add(fuerza);
  }

  void dibujar(){
    noStroke();
    fill(255);
    ellipse(pos.x,pos.y,20,20);
  }

}
