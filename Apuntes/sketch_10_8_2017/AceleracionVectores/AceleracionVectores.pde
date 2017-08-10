Bola b;

void setup(){
  size(800, 600);
  b = new Bola(width / 2, height / 2, 0, 0);
}
void draw( ) {
  background(0);
  b.actualizar();
  b.dibujar();
}
