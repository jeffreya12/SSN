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

public class BolaAceleracion extends PApplet {

Bola b;

public void setup(){
  
  b = new Bola(width / 2, height / 2, 5, 5);
}
public void draw( ) {
  background(0);
  b.dibujar();
  b.actualizar();
}
class Bola{

  PVector pos;
  PVector vel;
  PVector acc;

  Bola(float x, float y, float velx, float vely){

    this.pos = new PVector(x, y);
    this.vel = new PVector(velx, vely);
    this.acc = new PVector(0, 0.5f);

  }

  public void actualizar(){

    vel.add(acc);
    pos.add(vel);

    if(pos.x - 20 < 0 || pos.x + 20> width){
      vel.x *= -1;
    }

    if(pos.y - 20 < 0 || pos.y + 20> height){
      vel.y *= -1;
    }

  }

  public void dibujar( ) {
      noStroke();
      fill(255);
      ellipse(pos.x, pos.y, 40, 40);
  }

}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "BolaAceleracion" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
