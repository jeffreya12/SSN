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

public class GravedadAngular extends PApplet {

ArrayList<Bola> bolas;

public void setup(){
	

	bolas = new ArrayList();

	for(int i = 0; i < 500; i++){
		bolas.add(new Cuadro(random(width), random(height), 0, 0));
	}
}

public void draw(){
	background(0);
	for (Bola b : bolas){
		for (Bola b2 : bolas) {
			if(b != b2){
				float G = 0.001f;
				PVector fg = PVector.sub(b2.pos, b.pos);
				float d = fg.magSq();
				d = constrain(d, 8, 311);
				fg.normalize();
				fg.mult(G * b.masa * b2.masa);
				fg.div(d);
				b.aplicarFuerza(fg);
			}
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

  Bola(float x,float y, float velx, float vely){

    pos = new PVector(x,y);
    vel = new PVector(velx,vely);
    acc = new PVector(0,0);

    masa = random(20);

  }

  Bola(float x,float y){

    pos = new PVector(x,y);
    vel = PVector.random2D();
    acc = new PVector(0, 0);

    masa = random(20);

  }

  public void actualizar(){

    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
    vel.limit(46);

  }

  public void aplicarFuerza(PVector fuerza){
    PVector f = PVector.div(fuerza, masa);
    acc.add(f);
  }

  public void dibujar(){
    fill(255, 80);
    noStroke();
    ellipse(pos.x,pos.y,masa,masa);
  }

}
class Cuadro extends Bola {
  float ang;
  float velAng;
  float accAng;

  Cuadro(float x,float y, float velx, float vely){
    super(x, y, velx, vely);
    ang = random(2*PI);
    velAng = 0;
    accAng = 0;
  }

  public void dibujar( ) {
    ang += velAng;
    velAng += accAng;
    accAng = map(vel.mag(), 0, 46, -0.001f, 0.001f);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(ang);
    fill(255, 80);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, masa, masa);
    popMatrix();
  }
}
  public void settings() { 	size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GravedadAngular" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
