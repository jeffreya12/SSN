ArrayList<Bola> bolas;

void setup(){
  size(800, 600, P3D);
  //fullScreen();
  bolas = new ArrayList();

  for(int i = 0; i < 200; i++){
    bolas.add(new Bola(randomGaussian()*100 + width/2, randomGaussian()*10 + height/2));
  }

}

void draw( ) {

  background(0);

  for(Bola b : bolas){

    PVector pared_arriba = new PVector(b.pos.x, 0);
    PVector pared_izquierda = new PVector(0, b.pos.y);
    PVector pared_abajo = new PVector(b.pos.x, height);
    PVector pared_derecha = new PVector(width, b.pos.y);

    if(b.calcularDistancia(pared_arriba) < height/2){
      b.aplicarFuerza(new PVector(0, map(b.calcularDistancia(pared_arriba), 0, height/2, 2 * b.masa, 0)));
    }
    if(b.calcularDistancia(pared_izquierda) < width/2){
      b.aplicarFuerza(new PVector(map(b.calcularDistancia(pared_izquierda), 0, width/2, 2 * b.masa, 0), 0));
    }
    if(b.calcularDistancia(pared_abajo) < height/2){
      b.aplicarFuerza(new PVector(0, -map(b.calcularDistancia(pared_abajo), 0, height/2, 2 * b.masa, 0)));
    }
    if(b.calcularDistancia(pared_derecha) < width/2){
      b.aplicarFuerza(new PVector(-map(b.calcularDistancia(pared_derecha), 0, width/2, 2 * b.masa, 0), 0));
    }

    b.actualizar();
    b.dibujar();
  }

}
