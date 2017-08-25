ArrayList<Bola> bolas;

void setup(){
  size(800, 600, P3D);
  bolas = new ArrayList();

  for(int i = 0; i < 100; i++){
    bolas.add(new Bola(random(width), random(height), 0, 0));
  }

}

void draw( ) {

  background(0);

  for(Bola b : bolas){
    PVector gravedad = new PVector(0, 0.07);
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(b.pos);
    mouse.setMag(-5);
    if(mousePressed){
      b.aplicarFuerza(mouse);
    }
    PVector g = PVector.mult(gravedad, b.masa);
    b.aplicarFuerza(g);
    b.actualizar();
    b.dibujar();
  }

}
