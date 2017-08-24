class Bola{
  // float x;
  // float y;
  //
  // float velx;
  // float vely;

  PVector pos;
  PVector vel;

  Bola(float x, float y, float velx, float vely){
    // this.x = x;
    // this.y = y;
    //
    // this.velx = velx;
    // this.vely = vely;

    pos = new PVector(x, y);
    vel = new PVector(velx, vely);

  }

  void actualizar(){
    // x += velx;
    // y += vely;
    //
    // if(x < 0 || x > width){
    //   velx *= -1;
    // }
    //
    // if(y < 0 || y > height){
    //   vely *= -1;
    // }

    pos.add(vel);

    if(pos.x < 0 || pos.x > width){
      vel.x *= -1;
    }

    if(pos.y < 0 || pos.y > height){
      vel.y *= -1;
    }

  }

  void dibujar( ) {
      noStroke();
      fill(255);
      //ellipse(x, y, 40, 40);
      ellipse(pos.x, pos.y, 40, 40);
  }

}
