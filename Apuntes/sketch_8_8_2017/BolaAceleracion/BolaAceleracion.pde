Bola b;

void setup(){
  size(800, 600);
  b = new Bola(width / 2, height / 2, 5, 5);
}
void draw( ) {
  background(0);
  b.dibujar();
  b.actualizar();
}
