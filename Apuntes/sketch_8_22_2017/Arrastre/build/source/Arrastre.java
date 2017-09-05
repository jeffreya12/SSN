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

public class Arrastre extends PApplet {

ArrayList<Bola> bolas;

public void setup(){
	
	frameRate(120);
	bolas = new ArrayList();

	for (int i = 0;i < 200; i++){
		bolas.add(new Bola(random(width), random(height), 0, 0));
	}
}

public void draw(){
	background(0);
	PVector gravedad = new PVector(0, 0.1f);
	for (Bola b : bolas){
		b.aplicarFuerza(gravedad);
		if (mousePressed){
			PVector viento = new PVector(mouseX, mouseY);
			viento.sub(b.pos);
			viento.setMag(-1);
			b.aplicarFuerza(viento);
		}
		PVector arrastre = b.vel.copy();
		arrastre.normalize();
		arrastre.mult(pow(b.vel.mag(), 2));
		arrastre.mult(-0.5f);
		b.aplicarFuerza(arrastre);
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

    masa = 20;

  }

  Bola(float x,float y){

    pos = new PVector(x,y);
    vel = PVector.random2D();
    acc = new PVector(0,0);

    masa = 20;

  }

  public void actualizar(){

    pos.add(vel);
    vel.add(acc);
    acc.mult(0);

    if(pos.x - masa/2 < 0 || pos.x + masa/2 > width){
      vel.x *= -1;
    }

    if(pos.y - masa/2 < 0 || pos.y + masa/2 > height){
      vel.y *= -1;
    }

    pos.x = constrain(pos.x, masa/2, width - masa/2);
    pos.y = constrain(pos.y, masa/2, height - masa/2);

  }

  public void aplicarFuerza(PVector fuerza){
    PVector f = PVector.div(fuerza, masa);
    acc.add(f);
  }

  public void dibujar(){
    fill(200, 90, 90, 80);
    noStroke();
    ellipse(pos.x,pos.y,masa,masa);
  }

}
  public void settings() { 	size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Arrastre" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
