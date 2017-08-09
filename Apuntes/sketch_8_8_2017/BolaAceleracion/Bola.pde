class Bola{

  PVector pos;
  PVector vel;
  PVector acc;

  Bola(float x, float y, float velx, float vely){

    this.pos = new PVector(x, y);
    this.vel = new PVector(velx, vely);
    this.acc = new PVector(0, 0.5);

  }

  void actualizar(){

    vel.add(acc);
    pos.add(vel);

    if(pos.x - 20 < 0 || pos.x + 20> width){
      vel.x *= -1;
    }

    if(pos.y - 20 < 0 || pos.y + 20> height){
      vel.y *= -1;
    }

  }

  void dibujar( ) {
      noStroke();
      fill(255);
      ellipse(pos.x, pos.y, 40, 40);
  }

}
