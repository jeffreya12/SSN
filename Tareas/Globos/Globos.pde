Bola b;

void setup(){
  size(800,600);
  b = new Bola(width/2,height/2,10,0);
}

void draw(){

  background(0);

  PVector fuerza = new PVector(0.1,0.2);
  b.aplicarFuerza(fuerza);

  PVector gravedad = new PVector(0,0.5);
  b.aplicarFuerza(gravedad);

  b.actualizar();
  b.dibujar();

}
