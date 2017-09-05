Bola peso;
PVector origen;
PVector gravedad;
float restLenght;

void setup(){
  size(800, 600);
  background(0);
  restLenght = 200;
  origen = new PVector(width / 2, 20);
  peso = new Bola(width/2, 300, 0, 0);
  gravedad = new PVector(0, 1);
}

void draw(){
  background(0);
  line(origen.x, origen.y, peso.pos.x, peso.pos.y);
  PVector fuerzaResorte = PVector.sub(peso.pos, origen);
  float largo = fuerzaResorte.mag();
  float k = 0.2;
  float desplazamiento = largo - restLenght;
  fuerzaResorte.normalize();
  fuerzaResorte.mult(-k * desplazamiento);
  peso.aplicarFuerza(fuerzaResorte);
  peso.aplicarFuerza(gravedad);

  if(mousePressed){
    peso.aplicarFuerza(new PVector(5, 0));
  }

  peso.actualizar();
  peso.dibujar();
}
