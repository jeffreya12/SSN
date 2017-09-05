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

public class Direccion extends PApplet {

ArrayList<Perseguidor> perseguidores;

public void setup() {
	//size(800, 600);
	
	background(0);
	//p = new Perseguidor(random(width), random(height));	
	perseguidores = new ArrayList();	
	for(int i = 0; i < 500; i++){
		perseguidores.add(new Perseguidor(random(width), random(height)));
	}
}

public void draw() {
	background(0);
	for(Perseguidor p : perseguidores){
		p.actualizar();
		p.dibujar();
	}
}
class Perseguidor{
	PVector pos;
	PVector vel;
	PVector acc;
	float masa;

	Perseguidor(float x, float y){
		pos = new PVector(x, y);
		vel = new PVector(0,0);
		acc = new PVector(0,0);
		masa = random(2, 5);
	}

	public void actualizar(){
		PVector dir = PVector.sub(new PVector(mouseX, mouseY), pos);
		dir.setMag(0.5f);
		pos.add(vel);
		dir.div(masa);
		vel.add(dir);
		vel.limit(5);
	}

	public void dibujar(){
		strokeWeight(3);
		stroke(255);
		fill(128);
		pushMatrix();
		translate(pos.x, pos.y);
		float ang = atan(vel.y / vel.x);
		rotate(ang);
		rectMode(CENTER);
		rect(0, 0, masa*10, masa*5);
		popMatrix();
	}
}
  public void settings() { 	fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Direccion" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
