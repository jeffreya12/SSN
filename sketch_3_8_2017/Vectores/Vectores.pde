Bola b;

void setup( ) {
  size(800, 600, P3D);
  b = new Bola(width / 2, height / 2, 1, 1);
}

void draw(){
  background(0);
  b.dibujar();
  b.actualizar();
}
