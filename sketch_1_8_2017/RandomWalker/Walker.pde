class Walker {
  float x;
  float y;

  Walker(float x, float y){
    this.x = x;
    this.y = y;
  }

  void dibujar( ) {
    point(x, y);
  }

  void actualizar( ) {

    float valor = random(100);

    //int valor = int(random(100));
    // if (valor == 0) x++;
    // else if (valor == 1) x--;
    // else if (valor == 2) y++;
    // else if (valor == 3) y--;
    // else if (valor == 4){
    //   x--;
    //   y++;
    // }
    // else if (valor == 5){
    //   x--;
    //   y--;
    // }
    // else if (valor == 6){
    //   x++;
    //   y++;
    // }
    // else{
    //   x++;
    //   y--;
    // }

    if (valor < 15){
      y--;
    }
    else if (valor < 30){
      y++;
    }
    else if (valor < 50){
      x--;
    }
    else {
      x++;
    }

  }
}
