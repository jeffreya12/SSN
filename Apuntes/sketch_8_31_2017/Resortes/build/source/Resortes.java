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

public class Resortes extends PApplet {

Bola peso;
PVector origen;
PVector gravedad;
float restLenght;

public void setup(){
  
  background(0);
  restLenght = 200;
  origen = new PVector(width / 2, 20);
  peso = new Bola(width/2, 300, 0, 0);
  gravedad = new PVector(0, 1);
}

public void draw(){
  background(0);
  line(origen.x, origen.y, peso.pos.x, peso.pos.y);
  PVector fuerzaResorte = PVector.sub(peso.pos, origen);
  float largo = fuerzaResorte.mag();
  float k = 0.2f;
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
class Bola{
  PVector pos;
  PVector vel;
  PVector acc;
  float masa;

  Bola(float x,float y, float velx, float vely){
    pos = new PVector(x,y);
    vel = new PVector(velx,vely);
    acc = new PVector(0,0);
    masa = 50;
  }

  Bola(float x,float y){
    pos = new PVector(x,y);
    vel = PVector.random2D();
    acc = new PVector(0, 0);
    masa = random(20);
  }

  public void actualizar(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  public void aplicarFuerza(PVector fuerza){
    PVector f = PVector.div(fuerza, masa);
    acc.add(f);
  }

  public void dibujar(){
    fill(255);
    stroke(255);
    ellipse(pos.x,pos.y,masa,masa);
  }
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Resortes" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
