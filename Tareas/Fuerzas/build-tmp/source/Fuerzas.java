import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Fuerzas extends PApplet {

ArrayList<Bola> bolas;

public void setup(){
  
  bolas = new ArrayList();
  frameRate(30);

  for(int i = 0; i < 100; i++){
    bolas.add(new Bola(random(100, width - 100), random(100, height - 100)));
  }

}

public void draw( ) {

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
class Bola{
  PVector pos;
  PVector vel;
  PVector acc;
  float masa;
  int r, g, b;

  Bola(float x,float y){

    pos = new PVector(x,y);
    vel = PVector.random2D();
    acc = PVector.random2D();

    masa = randomGaussian() * 10 + 40;

    r = PApplet.parseInt(random(256));
    g = PApplet.parseInt(random(256));
    b = PApplet.parseInt(random(256));

  }

  public void actualizar(){
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
  }

  public float calcularDistancia(PVector pared){
    return pos.dist(pared);
  }

  public void aplicarFuerza(PVector fuerza){
    PVector f = PVector.div(fuerza, masa);
    acc.add(f);
  }

  public void dibujar(){
    fill(r, g, b, 90);
    stroke(255);
    ellipse(pos.x,pos.y,masa,masa);
  }
}
  public void settings() {  fullScreen(P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Fuerzas" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
