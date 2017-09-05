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

public class Globos extends PApplet {

Bola[] bolas;

PVector vel, empuje, vientoIzq;

float xoff;

int cantidadDeBolas;

PImage fondo;

public void setup(){

  

  cantidadDeBolas = 100;

  bolas = new Bola[cantidadDeBolas];

  xoff = 0.0f;

  for (int i = 0; i < cantidadDeBolas; i++){
    vel = PVector.random2D();
    vel.setMag(map(randomGaussian(), -1, 1, 0, 0.5f));
    bolas[i] = new Bola(randomGaussian()*100 + width/2, randomGaussian()*10 + height/2, vel.x, vel.y);
  }

  empuje = new PVector(0, -0.01f);
  vientoIzq = new PVector(-0.03f, 0);

  fondo = loadImage("fondo.jpg");
}

public void draw(){

  background(fondo);

  float yoff = 0;

  for (int i = 0; i < cantidadDeBolas; i++){

    PVector vientoDer = new PVector(map(noise(xoff, yoff), 0, 1, 0, 0.05f), 0);

    bolas[i].aplicarFuerza(empuje);
    bolas[i].aplicarFuerza(vientoDer);

    if(mousePressed){
      bolas[i].aplicarFuerza(vientoIzq);
    }

    bolas[i].actualizar();
    bolas[i].dibujar();

    yoff += 0.05f;
  }

  xoff += 0.01f;

}
class Bola{
  PVector pos;
  PVector vel;
  PVector acc;

  int r, g, b;

  Bola(float x,float y, float velx, float vely){

    pos = new PVector(x,y);
    vel = new PVector(velx,vely);

    acc = new PVector(0.02f,0.001f);

    acc.limit(1);

    r = PApplet.parseInt(random(256));
    g = PApplet.parseInt(random(256));
    b = PApplet.parseInt(random(256));

  }
  public void actualizar(){

    pos.add(vel);
    vel.add(acc);
    acc.mult(0);

    vel.limit(5);

    if(pos.x - 10 < 0 || pos.x + 10 > width){
      vel.x *= -0.8f;
    }

    if(pos.y - 10 < 0){
      vel.y *= -0.8f;
    }

    pos.x = constrain(pos.x, 10, width - 10);
    pos.y = constrain(pos.y, 10, height - 10);

  }

  public void aplicarFuerza(PVector fuerza){
    acc.add(fuerza);
  }

  public void dibujar(){
    noStroke();
    fill(r, g, b);
    ellipse(pos.x,pos.y,20,20);
  }

}
  public void settings() {  size(800, 600, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Globos" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
