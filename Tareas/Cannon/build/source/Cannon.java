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

public class Cannon extends PApplet {

ArrayList<Bola> bolas;

public void setup(){
	
	bolas = new ArrayList();
	noCursor();
}

public void draw(){
	background(0);

	PVector mouse = new PVector (mouseX, mouseY);
  PVector centro = new PVector (width / 2, height / 2);
  PVector diff = PVector.sub(mouse, centro);
	diff.setMag(40);

	if (mousePressed){
		bolas.add(new Cuadro(width/2 + diff.x, height/2 + diff.y, 0, 0));
		bolas.get(bolas.size() - 1).aplicarFuerza(new PVector(diff.x, diff.y));
	}

	PVector gravedad = new PVector(0, 0.5f);

	for (Bola b : bolas){
		b.aplicarFuerza(gravedad);
		PVector fuerza = b.vel.copy();
		fuerza.normalize();

		if (b.pos.y > height/2){ //Arrastre del agua
			fuerza.mult(pow(b.vel.mag(), 2));
			fuerza.mult(-0.5f);
		}
		else{ //Friccion del aire
			fuerza.mult(-0.01f);
		}

		b.aplicarFuerza(fuerza);
		b.actualizar();
		b.dibujar();
	}

	//Ca\u00f1\u00f3n
	strokeWeight(1);
	stroke(255);
  fill(255);
  ellipse(mouse.x, mouse.y, 10, 10);
	strokeWeight(30);
	pushMatrix();
  translate(width / 2, height / 2);
	line(0, 0, diff.x, diff.y);
	popMatrix();

	//Agua
	rectMode(CORNER);
	fill(0, 0, 255, 50);
	noStroke();
	rect(0, height/2, width, height/2);
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

    masa = randomGaussian() * 1 + 10;

  }

  Bola(float x,float y){

    pos = new PVector(x,y);
    vel = PVector.random2D();
    acc = new PVector(0,0);

    masa = randomGaussian() * 10 + 20;

  }

  public void actualizar(){

    pos.add(vel);
    vel.add(acc);
    acc.mult(0);

    if(pos.y > height){
      vel.y *= -1;
    }
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
class Cuadro extends Bola {
  float ang;
  float velAng;
  float accAng;
  int r, g, b;

  Cuadro(float x,float y, float velx, float vely){
    super(x, y, velx, vely);
    ang = random(2*PI);
    velAng = map(randomGaussian(), -1, 1, -0.05f, 0.05f);
    accAng = 0;

    r = PApplet.parseInt(random(256));
    g = PApplet.parseInt(random(256));
    b = PApplet.parseInt(random(256));
  }

  public void dibujar( ) {
    ang += velAng;
    velAng += accAng;
    accAng = map(vel.mag(), 0, 46, -0.0005f, 0.0005f);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(ang);
    fill(r, g, b);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, masa, masa*2);
    popMatrix();
  }
}
  public void settings() { 	size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Cannon" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
