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
Mouse mouse;
float G;

public void setup(){
	
	background(0);
	bolas = new ArrayList();
	for(int i = 0; i < 300; i++){
		bolas.add(new Bola(random(50, width - 50), random(50, height - 50), 0, 0));
	}
	mouse = new Mouse();
	G = -0.1f;
}

public void draw(){
	fill(0, 25);
	rect(0, 0, width, height);
	for (Bola b : bolas){
		for (Bola b2 : bolas) {
			if(b != b2){
				PVector fg = PVector.sub(b2.pos, b.pos);
				float d = fg.magSq();
				fg.normalize();
				fg.mult(G * b.masa * b2.masa);
				fg.div(d);
				b.aplicarFuerza(fg);
			}
		}
		mouse.actualizar(b);
		b.actualizar();
		mouse.dibujar();
		b.dibujar();
	}
}
class Bola{
  PVector pos, vel, acc;
  float masa;
  int r, g, b;

  Bola(float x,float y, float velx, float vely){
    pos = new PVector(x,y);
    vel = new PVector(velx,vely);
    acc = new PVector(0,0);
    masa = random(50);
    r = PApplet.parseInt(randomGaussian() * 50 + 142);
    g = PApplet.parseInt(randomGaussian() * 50 + 183);
    b = PApplet.parseInt(randomGaussian() * 50 + 249);
  }

  public void actualizar(){
    pos.add(vel);
    vel.add(acc);
    vel.limit(5);
    acc.mult(0);
  }

  public void aplicarFuerza(PVector fuerza){
    PVector f = PVector.div(fuerza, masa);
    acc.add(f);
  }

  public void dibujar(){
    fill(r, g, b);
    noStroke();
    ellipse(pos.x,pos.y,masa,masa);
  }
}
class Mouse extends Bola{
  Mouse(){
    super(mouseX, mouseY, 0, 0);
    super.masa = 51;
    super.r = 255;
    super.g = super.b = 0;
  }

  public void actualizar(Bola b){
    float G = 0.1f;
    PVector fg = PVector.sub(super.pos, b.pos);
    float d = fg.magSq();
    d = constrain(d, 1, 200);
    fg.normalize();
    fg.mult(G * super.masa * b.masa);
    fg.div(d);
    b.aplicarFuerza(fg);
    super.pos.x = mouseX;
    super.pos.y = mouseY;
  }
}
  public void settings() { 	size(800, 600, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Gravedad" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
