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

public class Gravedad extends PApplet {

ArrayList<Bola> bolas;

public void setup(){
	
	
	bolas = new ArrayList();
	
	for(int i = 0; i < 100; i++){
		bolas.add(new Bola(random(width), random(height), 0, 0));
	}
}

public void draw(){
	background(0);
	for (Bola b : bolas){
		for (Bola b2 : bolas) {
			if(b != b2){
				float G = 0.1f;
				PVector fg = PVector.sub(b2.pos, b.pos);
				float d = fg.magSq();
				d = constrain(d, 10, 200);
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
    vel.limit(4);

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
    fill(255);
    noStroke();
    ellipse(pos.x,pos.y,masa,masa);
  }

}
  public void settings() { 	size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Gravedad" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
