class Particle implements IAgent {

	PVector pos;
	PVector vel;
	PVector acc;
	float mass;
	float friction;
	color c;
	boolean fixed;
	float lifeSpan;
	float decay;

	Particle (float x, float y, float mass, float friction) {
		pos = new PVector(x, y);
		vel = new PVector(0, 0);
		acc = new PVector(0, 0);
		this.mass = mass;
		this.friction = friction;
		c = color(0, 255, 0);
		fixed = false;
		lifeSpan = 1000;
		decay = 1;
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
		lifeSpan -= decay;
	}

	void draw(){
		noStroke();
		fill(c, lifeSpan);
		ellipse(pos.x, pos.y, mass, mass);
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

	boolean isDead(){
		return lifeSpan <= 0;
	}

}
