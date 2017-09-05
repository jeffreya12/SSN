class Particle implements IAgent {

	PVector pos;
	PVector vel;
	PVector acc;
	float mass;
	float friction;
	color c;
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

	void calculateFriction(){
		PVector f = vel.copy();
		f.normalize();
		f.mult(-friction);
		applyForce(f);
	}

	void update(){
		if(!fixed){
			calculateFriction();
			vel.add(acc);
			pos.add(vel);		
			acc.mult(0);
		}
	}

	void draw(){
		noStroke();
		fill(c);
		ellipse(pos.x, pos.y, mass*5, mass*5);
	}

	void applyForce(PVector force){
		PVector f = PVector.div(force, mass);
		acc.add(f);
	}

	void fix(){
		fixed = true;
	}

	void unfix(){
		fixed = false;
	}

}