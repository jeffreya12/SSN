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

public class FuerzaAtraccion extends PApplet {

Bola b;

public void setup(){
  
  b = new Bola(width/2,height/2,10,0);  
}

public void draw(){

  background(0);

  PVector fuerza = new PVector(0.1f,0.2f);
  b.aplicarFuerza(fuerza);

  PVector gravedad = new PVector(0,0.5f);
  b.aplicarFuerza(gravedad);

  b.actualizar();
  b.dibujar();

}
class Bola{
  float x;
  float y;
  float velx;
  float vely;
  PVector pos;
  PVector vel;
  PVector acc;
  
  Bola(float x,float y, float velx, float vely){
    
    pos = new PVector(x,y);
    vel = new PVector(velx,vely);

    acc = new PVector(0.02f,0.001f);
    //acc = PVector.random2D();
    acc.limit(0.1f);

  }
  public void actualizar(){
    
    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
    acc.mult(0);
    pos.x = pos.x %width;
    pos.y = pos.y %height;
    
    if(mousePressed){
      PVector mouse = new PVector(mouseX,mouseY); 
      mouse.sub(pos);
      println(mouse);
      mouse.setMag(1.5f);
      println(mouse);
      aplicarFuerza(mouse);
    }
  }

  public void aplicarFuerza(PVector fuerza){
    acc.add(fuerza);
  }
  
  public void dibujar(){
    noStroke();
    fill(255);
    ellipse(pos.x,pos.y,20,20);
  }
  
}
  public void settings() {  size(800,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FuerzaAtraccion" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
