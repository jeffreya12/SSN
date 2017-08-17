Bola[] bolas;

PVector vel, empuje, vientoIzq;

float xoff;

int cantidadDeBolas;

PImage fondo;

void setup(){

  size(800, 600, P3D);;

  cantidadDeBolas = 100;

  bolas = new Bola[cantidadDeBolas];

  xoff = 0.0;

  for (int i = 0; i < cantidadDeBolas; i++){
    vel = PVector.random2D();
    bolas[i] = new Bola(randomGaussian()*100 + width/2, randomGaussian()*10 + height/2, vel.x, vel.y);
  }

  empuje = new PVector(0, -0.01);
  vientoIzq = new PVector(-0.03, 0);

  fondo = loadImage("fondo.jpg");
}

void draw(){

  background(fondo);

  float yoff = 0;

  for (int i = 0; i < cantidadDeBolas; i++){

    PVector vientoDer = new PVector(map(noise(xoff, yoff), 0, 1, 0, 0.05), 0);
    
    bolas[i].aplicarFuerza(empuje);
    bolas[i].aplicarFuerza(vientoDer);

    if(mousePressed){
      bolas[i].aplicarFuerza(vientoIzq);
    }

    bolas[i].actualizar();
    bolas[i].dibujar();

    yoff += 0.05;
  }

  xoff += 0.01;

}