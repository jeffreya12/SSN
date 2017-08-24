Walker w;

void setup() {
  size(800, 600);
  w = new Walker(width / 2, height / 2);
}

void draw() {
  w.dibujar();
  w.actualizar();
}
