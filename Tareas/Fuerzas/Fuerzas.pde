ArrayList<Bola> bolas;

void setup(){
  fullScreen(P2D);
  bolas = new ArrayList();
  frameRate(30);

  for(int i = 0; i < 100; i++){
    bolas.add(new Bola(random(100, width - 100), random(100, height - 100)));
  }

}

void draw( ) {

  background(0);

  for(Bola b : bolas){

    float masa = b.masa;

    PVector paredArriba = new PVector(b.pos.x, masa / 2);
    PVector paredIzquierda = new PVector(masa / 2, b.pos.y);
    PVector paredAbajo = new PVector(b.pos.x, height - masa / 2);
    PVector paredDerecha = new PVector(width - masa / 2, b.pos.y);

    if(b.calcularDistancia(paredArriba) < height / 2){
      b.aplicarFuerza(new PVector(0, map(b.calcularDistancia(paredArriba), 0, height/2, 5, 0)));
    }
    if(b.calcularDistancia(paredIzquierda) < width / 2){
      b.aplicarFuerza(new PVector(map(b.calcularDistancia(paredIzquierda), 0, width/2, 5, 0), 0));
    }
    if(b.calcularDistancia(paredAbajo) < height / 2){
      b.aplicarFuerza(new PVector(0, map(b.calcularDistancia(paredAbajo), 0, height/2, -5, 0)));
    }
    if(b.calcularDistancia(paredDerecha) < width / 2){
      b.aplicarFuerza(new PVector(map(b.calcularDistancia(paredDerecha), 0, width/2, -5, 0), 0));
    }

    b.actualizar();
    b.dibujar();
  }

}
