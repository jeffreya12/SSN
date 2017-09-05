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

public class SpringLine extends PApplet {

ArrayList<IAgent> agents;
Particle p1;
Particle p2;
Spring s;

public void setup() {
	
	background(0);
	p1 = new Particle(width / 2 - 100, height / 2, 5, 0.1f);
	p2 = new Particle(width / 2 + 100, height / 2, 5, 0.1f);
	s = new Spring(p1, p2, 0.1f, 150);
	agents = new ArrayList();
	agents.add(p1);
	agents.add(p2);
	agents.add(s);
}

public void draw() {
	background(0);
	for(IAgent a : agents){
		a.update();
		a.draw();
	}	
}
class Particle implements IAgent {

	PVector pos;
	PVector vel;
	PVector acc;
	float mass;
	float friction;
	int c;
	boolean fixed;

	Particle (float x, float y, float mass, float friction) {
		pos = new PVector(x, y);
		vel = new PVector(0, 0);
		acc = new PVector(0, 0);		
		this.mass = mass;
		this.friction = friction;
		c = color(255, 0, 0);
		fixed = false;
	}

	public void calculateFriction(){
		PVector f = vel.copy();
		f.normalize();
		f.mult(-friction);
		applyForce(f);
	}

	public void update(){
		if(!fixed){
			calculateFriction();
			vel.add(acc);
			pos.add(vel);		
			acc.mult(0);
		}
	}

	public void draw(){
		noStroke();
		fill(c);
		ellipse(pos.x, pos.y, mass*5, mass*5);
	}

	public void applyForce(PVector force){
		PVector f = PVector.div(force, mass);
		acc.add(f);
	}

	public void fix(){
		fixed = true;
	}

	public void unfix(){
		fixed = false;
	}

}
class Spring implements IAgent {

	Particle p1;
	Particle p2;
	float k;
	float restLength;
	int c;

	Spring (Particle p1, Particle p2, float k, float restLength) {
		this.p1 = p1;
		this.p2 = p2;
		this.k = k;
		this.restLength = restLength;
		c = color (255, 255, 255);
	}

	public void update(){
		PVector springForce = PVector.sub(p2.pos, p1.pos);
		float len = springForce.mag();
		springForce.normalize();
		float displacement = len - restLength;
		springForce.mult(-k * displacement);
		springForce.div(2);
		p2.applyForce(springForce);
		springForce.mult(-1);
		p1.applyForce(springForce);
	}

	public void draw(){
		stroke(c);
		line(p1.pos.x, p1.pos.y, p2.pos.x, p2.pos.y);
	}

}
  public void settings() { 	size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SpringLine" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
