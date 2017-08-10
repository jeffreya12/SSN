class Bola{

  PVector pos;
  PVector vel;
  PVector acc;

  Bola(float x, float y, float velx, float vely){

    this.pos = new PVector(x, y);
    this.vel = new PVector(velx, vely);
    this.acc = new PVector(0, 0);

  }

  void actualizar(){

    vel.add(acc);
    vel.limit(5);
    pos.add(vel);

    PVector mouse = new PVector (mouseX, mouseY);
    mouse.sub(pos);
    //mouse.setMag(0.2);
    mouse.mult(0.2);
    acc = mouse;

  }

  void dibujar( ) {
      noStroke();
      fill(255);
      ellipse(pos.x, pos.y, 40, 40);
  }

}